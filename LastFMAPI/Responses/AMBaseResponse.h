#import <Foundation/Foundation.h>

@class AMBaseResponse;

@protocol AMBaseResponseDelegate <NSObject>
-(void)Response:(AMBaseResponse *)Response Error:(NSError *)Error;
@end

@interface AMBaseResponse : NSObject <NSURLConnectionDelegate>

@property (nonatomic, retain) id<AMBaseResponseDelegate> Delegate;
@property (nonatomic, retain) NSString *Method;
@property (nonatomic, retain) NSURLConnection *Connection;

-(id)initWithDelegate:(id<AMBaseResponseDelegate>)delegate;

-(void)dealloc;

-(void)connection:(NSConnection *)Connection
 didFailWithError:(NSError *)Error;

-(NSCachedURLResponse *)connection:(NSConnection *)Connection
                 willCacheResponse:(NSCachedURLResponse *)cachedResponse;

-(void)connection:(NSConnection *)Connection
didReceiveResponse:(NSURLResponse *)response;

-(void)connection:(NSConnection *)Connection
   didReceiveData:(NSData *)data;

-(NSURLRequest *)connection:(NSConnection *)Connection
            willSendRequest:(NSURLRequest *)request
           redirectResponse:(NSURLResponse *)redirectResponse;

-(void)connectionDidFinishLoading:(NSConnection *)Connection;

-(void)responseWithError:(NSError *)Error;

@end