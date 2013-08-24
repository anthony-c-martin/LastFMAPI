#import <LastFMAPI/AMBaseResponse.h>
#import <LastFMAPI/AMDefinitions.h>
#import <LastFMAPI/GDataXMLNode.h>
#import <LastFMAPI/AMXMLTools.h>

@interface AMBaseResponse ()
@property (nonatomic, retain) GDataXMLDocument *XMLDoc;
@property (nonatomic, retain) NSMutableData *Data;
@property (nonatomic, assign) BOOL isCancelled;
@end

@implementation AMBaseResponse
@synthesize Delegate;
@synthesize Data;
@synthesize Connection;
@synthesize Method;

-(id)initWithDelegate:(id<AMBaseResponseDelegate>)delegate
{
    self = [super init];
    if (self)
    {
        [self setDelegate:delegate];
        [self setData:[[NSMutableData alloc] init]];
        [self setIsCancelled:NO];
    }
    return self;
}

-(void)dealloc
{
    @synchronized(self)
    {
        [self setIsCancelled:YES];
        if ([self Connection])
        {
            [[self Connection] cancel];
            [self setConnection:nil];
        }
    }
}

-(void)connection:(NSConnection *)Connection
 didFailWithError:(NSError *)Error
{
    [self setConnection:nil];
    [self setData:nil];
    [self responseWithError:[self generateError:AM_ERR_HTTP_REQFAILED Description:AM_ERRDESC_HTTP_FAILED]];
}

-(void)connection:(NSConnection *)Connection
didReceiveResponse:(NSURLResponse *)response
{
    [[self Data] setLength:0];
}

-(void)connection:(NSConnection *)Connection
   didReceiveData:(NSData *)data
{
    [[self Data] appendData:data];
}

-(NSCachedURLResponse *)connection:(NSConnection *)Connection
                 willCacheResponse:(NSCachedURLResponse *)cachedResponse
{
    return nil;
}

-(NSURLRequest *)connection:(NSConnection *)Connection
            willSendRequest:(NSURLRequest *)request
           redirectResponse:(NSURLResponse *)redirectResponse
{
    return request;
}

-(void)connectionDidFinishLoading:(NSConnection *)Connection
{
    @synchronized(self)
    {
        if ([self isCancelled])
        {
            return;
        }
    }
    [self setConnection:nil];
    NSError *Error = nil;
    GDataXMLElement *nodeVal = [self loadFromResponse:&Error];
    
    if (Error)
    {
        [self responseWithError:Error];
    }
    else
    {
        [self responseWithData:nodeVal];
    }
}

-(NSError *)generateError:(NSInteger)Code
              Description:(NSString *)Description
{
    NSMutableDictionary *UserInfo = [[NSMutableDictionary alloc] init];
    [UserInfo setValue:Description forKey:NSLocalizedDescriptionKey];
    
    NSError *Error = [[NSError alloc] initWithDomain:AM_ERRDOMAIN_LASTFMAPI code:Code userInfo:UserInfo];
    return Error;
}

-(GDataXMLElement *)loadFromResponse:(NSError **)Error
{
    NSError *localError = nil;

    [self setXMLDoc:[[GDataXMLDocument alloc] initWithData:[self Data] options:0 error:Error]];
    if (*Error)
    {
        return nil;
    }
    
    GDataXMLElement *rootNode = [[self XMLDoc] rootElement];
    
    NSString *status = [AMXMLTools getTextAttribute:AM_XML_KEY_STATUS Node:rootNode];
    
    if ([status isEqualToString:AM_XML_KEY_OK])
    {
        return rootNode;
    }
    else if ([status isEqualToString:AM_XML_KEY_FAILED])
    {
        GDataXMLElement *errorNode = [AMXMLTools getFirstChild:rootNode Named:AM_XML_KEY_ERROR];
        if (errorNode)
        {
            NSNumber *ErrorCode = [AMXMLTools getIntAttribute:AM_XML_KEY_CODE Node:errorNode];
            NSString *ErrorDescription = [AMXMLTools getTextValue:errorNode];
            localError = [self generateError:[ErrorCode integerValue] Description:ErrorDescription];
            if (Error) *Error = localError;
            return nil;
        }
    }
    
    localError = [self generateError:AM_ERR_UNRECOGNISED_ERROR_CODE Description:AM_ERRDESC_UNRECOGNISED];
    if (Error) *Error = localError;
    return nil;
}

-(void)responseWithError:(NSError *)Error
{
    [[self Delegate] Response:self Error:Error];
}

-(void)responseWithData:(GDataXMLElement *)Data
{
    
}

@end