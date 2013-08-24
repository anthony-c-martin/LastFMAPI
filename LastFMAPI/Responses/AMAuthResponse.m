#import <LastFMAPI/AMAuthResponse.h>
#import <LastFMAPI/AMDefinitions.h>
#import <LastFMAPI/AMXMLTools.h>

@implementation AMAuthResponse

+(id)AuthResponseWithDelegate:(id<AMAuthResponseDelegate>)delegate
{
    AMAuthResponse *handle = [AMAuthResponse alloc];
    return [handle initWithDelegate:delegate];
}

-(id)initWithDelegate:(id<AMAuthResponseDelegate>)delegate
{
    self = [super initWithDelegate:delegate];
    return self;
}

-(void)responseWithData:(GDataXMLElement *)Data
{
    if ([self Method] == AM_MTHD_AUTH_GETMOBILESESSION) [self GetMobileSession:Data];
    else if ([self Method] == AM_MTHD_AUTH_GETSESSION) [self GetSession:Data];
    else if ([self Method] == AM_MTHD_AUTH_GETTOKEN) [self GetToken:Data];
}

-(void)GetMobileSession:(GDataXMLElement *)Data
{
    AMSession *session = [[AMSession alloc] initFromNode:Data];
    if ([[self Delegate] respondsToSelector:@selector(AuthResponse:GetMobileSession:)])
    {
        [[self Delegate] AuthResponse:self GetMobileSession:session];
    }
}

-(void)GetSession:(GDataXMLElement *)Data
{
    AMSession *session = [[AMSession alloc] initFromNode:Data];
    if ([[self Delegate] respondsToSelector:@selector(AuthResponse:GetSession:)])
    {
        [[self Delegate] AuthResponse:self GetSession:session];
    }
}

-(void)GetToken:(GDataXMLElement *)Data
{
    AMToken *token = [[AMToken alloc] initFromNode:Data];
    if ([[self Delegate] respondsToSelector:@selector(AuthResponse:GetToken:)])
    {
        [[self Delegate] AuthResponse:self GetToken:token];
    }
}

@end