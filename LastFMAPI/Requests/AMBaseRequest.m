#import <LastFMAPI/AMBaseRequest.h>
#import <CommonCrypto/CommonDigest.h>

NSString * const AM_REQ_PARAM_API_KEY = @"api_key";
NSString * const AM_REQ_PARAM_API_SIG = @"api_sig";
NSString * const AM_REQ_PARAM_METHOD = @"method";

@implementation AMBaseRequest
@synthesize URL;
@synthesize Key;
@synthesize Secret;

-(id)initWithURL:(NSString *)url
             Key:(NSString *)key
          Secret:(NSString *)secret
{
    self = [super init];
    if (self)
    {
        [self setURL:[NSURL URLWithString:url]];
        [self setKey:key];
        [self setSecret:secret];
    }
    return self;
}

-(NSString*)urlEncodeString:(NSString *)string
{
    NSString *encodedString = (__bridge_transfer NSString *)
    CFURLCreateStringByAddingPercentEscapes(NULL,
                                            (__bridge CFStringRef)string,
                                            NULL,
                                            (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                            kCFStringEncodingUTF8);
    return encodedString;
}

-(BOOL)requestWithMethod:(NSString *)Method
                  Params:(NSDictionary *)Params
                Response:(AMBaseResponse *)Response
{
    NSMutableDictionary *FullParams = [NSMutableDictionary dictionaryWithDictionary:Params];
    [FullParams setObject:[self Key] forKey:AM_REQ_PARAM_API_KEY];
    [FullParams setObject:Method forKey:AM_REQ_PARAM_METHOD];
    [FullParams setObject:[self signatureWithParams:FullParams] forKey:AM_REQ_PARAM_API_SIG];
    
    NSMutableString *ReqString = [[NSMutableString alloc] init];
    [FullParams enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop)
    {
        [ReqString appendFormat:@"&%@=%@", [self urlEncodeString:key], [self urlEncodeString:[NSString stringWithFormat:@"%@", [FullParams objectForKey:key]]]];
    }];
    
    NSData *ReqData = [ReqString dataUsingEncoding: NSUTF8StringEncoding];
    NSMutableURLRequest *Request = [[NSMutableURLRequest alloc] initWithURL: [self URL]];
    [Request setHTTPMethod:@"POST"];
    [Request setHTTPBody:ReqData];
    [Request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    
    [Response setConnection:[NSURLConnection connectionWithRequest:Request delegate:Response]];
    [Response setMethod:Method];
    
    if ([Response Connection])
    {
        return YES;
    }
    return NO;
}

-(NSString *)signatureWithParams:(NSDictionary *)Params
{
    NSMutableString *sigString = [[NSMutableString alloc] init];
    NSArray *sortedKeys = [[Params allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    [sortedKeys enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop)
    {
        [sigString appendFormat:@"%@%@", key, [Params objectForKey:key]];
    }];

    [sigString appendString:[self Secret]];
    
    const char *cstr = [sigString UTF8String];
    unsigned char result[16];
    CC_MD5(cstr, (int)strlen(cstr), result);
    
    return [[NSString stringWithFormat:
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

@end