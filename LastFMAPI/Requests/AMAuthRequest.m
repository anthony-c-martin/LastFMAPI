#import <LastFMAPI/AMAuthRequest.h>
#import <LastFMAPI/AMDefinitions.h>

@implementation AMAuthRequest

-(id)initWithURL:(NSString *)url
             Key:(NSString *)key
          Secret:(NSString *)secret
{
    self = [super initWithURL:url Key:key Secret:secret];
    return self;
}

-(BOOL)GetToken:(AMAuthResponse *)Response
{
    NSDictionary *Params = [NSDictionary dictionaryWithObjectsAndKeysIngnoringNull:nil];
    
    return [self requestWithMethod:AM_MTHD_AUTH_GETTOKEN Params:Params Response:Response];
}

-(BOOL)GetSession:(AMAuthResponse *)Response
            Token:(NSString *)token
{
    NSDictionary *Params = [NSDictionary dictionaryWithObjectsAndKeysIngnoringNull:
                            [NSString emptyStringIfNil:token], AM_REQ_PARAM_TOKEN,
                            nil
                            ];
    
    return [self requestWithMethod:AM_MTHD_AUTH_GETSESSION Params:Params Response:Response];
}

-(BOOL)GetMobileSession:(AMAuthResponse *)Response
               Username:(NSString *)username
               Password:(NSString *)password
{
    NSDictionary *Params = [NSDictionary dictionaryWithObjectsAndKeysIngnoringNull:
                            [NSNull nullWhenNil:username], AM_REQ_PARAM_USERNAME,
                            [NSNull nullWhenNil:password], AM_REQ_PARAM_PASSWORD,
                            nil
                            ];
    
    return [self requestWithMethod:AM_MTHD_AUTH_GETMOBILESESSION Params:Params Response:Response];
}

@end