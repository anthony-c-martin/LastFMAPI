#import <LastFMAPI/AMBaseResponse.h>
#import <LastFMAPI/AMDataObjects.h>

@class AMAuthResponse;

@protocol AMAuthResponseDelegate <AMBaseResponseDelegate>
@optional
-(void)AuthResponse:(AMAuthResponse *)Response GetToken:(AMToken *)Token;
-(void)AuthResponse:(AMAuthResponse *)Response GetSession:(AMSession *)Session;
-(void)AuthResponse:(AMAuthResponse *)Response GetMobileSession:(AMSession *)MobileSession;
@end

@interface AMAuthResponse : AMBaseResponse

@property (nonatomic, assign) id<AMAuthResponseDelegate> Delegate;

+(id)AuthResponseWithDelegate:(id<AMAuthResponseDelegate>)delegate;

-(id)initWithDelegate:(id<AMAuthResponseDelegate>)delegate;

@end