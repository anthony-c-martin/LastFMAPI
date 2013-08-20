#import <Foundation/Foundation.h>
#import <LastFMAPI/AMBaseResponse.h>

@interface AMBaseRequest : NSObject

@property (nonatomic, retain) NSURL *URL;
@property (nonatomic, retain) NSString *Key;
@property (nonatomic, retain) NSString *Secret;

-(id)initWithURL:(NSString *)url
             Key:(NSString *)key
          Secret:(NSString *)secret;

-(BOOL)requestWithMethod:(NSString *)Method
                  Params:(NSDictionary *)Params
                Response:(AMBaseResponse *)Response;

@end