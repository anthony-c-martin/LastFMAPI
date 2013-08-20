#import <LastFMAPI/AMBaseRequest.h>
#import <LastFMAPI/AMAuthResponse.h>

@interface AMAuthRequest : AMBaseRequest

-(id)initWithURL:(NSString *)url
             Key:(NSString *)key
          Secret:(NSString *)secret;

-(BOOL)GetToken:(AMAuthResponse *)Response;

-(BOOL)GetSession:(AMAuthResponse *)Response
            Token:(NSString *)token;

-(BOOL)GetMobileSession:(AMAuthResponse *)Response
               Username:(NSString *)username
               Password:(NSString *)password;

@end