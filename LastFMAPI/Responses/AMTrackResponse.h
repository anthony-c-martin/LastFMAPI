#import <LastFMAPI/AMBaseResponse.h>
#import <LastFMAPI/AMDataObjects.h>

@class AMTrackResponse;

@protocol AMTrackResponseDelegate <AMBaseResponseDelegate>
@optional
-(void)TrackResponse:(AMTrackResponse *)Response UpdateNowPlaying:(AMNowPlaying *)NowPlaying;
-(void)TrackResponse:(AMTrackResponse *)Response Scrobble:(AMScrobbles *)Scrobbles;
-(void)TrackResponse:(AMTrackResponse *)Response GetInfo:(AMTrackWithInfo *)Track;
@end

@interface AMTrackResponse : AMBaseResponse

@property (nonatomic, retain) id<AMTrackResponseDelegate> Delegate;

+(id)TrackResponseWithDelegate:(id<AMTrackResponseDelegate>)delegate;

-(id)initWithDelegate:(id<AMTrackResponseDelegate>)delegate;

@end