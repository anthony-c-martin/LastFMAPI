#import <LastFMAPI/AMTrackResponse.h>
#import <LastFMAPI/AMDefinitions.h>
#import <LastFMAPI/AMXMLTools.h>

@implementation AMTrackResponse

+(id)TrackResponseWithDelegate:(id<AMTrackResponseDelegate>)delegate
{
    AMTrackResponse *handle = [AMTrackResponse alloc];
    return [handle initWithDelegate:delegate];
}

-(id)initWithDelegate:(id<AMTrackResponseDelegate>)delegate
{
    self = [super initWithDelegate:delegate];
    return self;
}

-(void)responseWithData:(GDataXMLElement *)Data
{
    if ([self Method] == AM_MTHD_TRACK_UPDATENOWPLAYING) [self UpdateNowPlaying:Data];
    else if ([self Method] == AM_MTHD_TRACK_SCROBBLE) [self Scrobble:Data];
    else if ([self Method] == AM_MTHD_TRACK_GETINFO) [self GetInfo:Data];
}

-(void)UpdateNowPlaying:(GDataXMLElement *)Data
{
    AMNowPlaying *nowPlaying = [[AMNowPlaying alloc] initFromNode:Data];
    if ([[self Delegate] respondsToSelector:@selector(TrackResponse:UpdateNowPlaying:)])
    {
        [[self Delegate] TrackResponse:self UpdateNowPlaying:nowPlaying];
    }
}

-(void)Scrobble:(GDataXMLElement *)Data
{
    AMScrobbles *scrobbles = [[AMScrobbles alloc] initFromNode:Data];
    if ([[self Delegate] respondsToSelector:@selector(TrackResponse:Scrobble:)])
    {
        [[self Delegate] TrackResponse:self Scrobble:scrobbles];
    }
}

-(void)GetInfo:(GDataXMLElement *)Data
{
    AMTrackWithInfo *trackInfo = [[AMTrackWithInfo alloc] initFromNode:Data];
    if ([[self Delegate] respondsToSelector:@selector(TrackResponse:GetInfo:)])
    {
        [[self Delegate] TrackResponse:self GetInfo:trackInfo];
    }
}

@end
