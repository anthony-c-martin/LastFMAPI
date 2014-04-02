#import <LastFMAPI/AMBaseResponse.h>
#import <LastFMAPI/AMDataObjects.h>

@class AMAlbumResponse;

@protocol AMAlbumResponseDelegate <AMBaseResponseDelegate>
@optional
-(void)AlbumResponse:(AMAlbumResponse *)Response GetInfo:(AMAlbumWithInfo *)AlbumInfo;
@end

@interface AMAlbumResponse : AMBaseResponse

@property (nonatomic, retain) id<AMAlbumResponseDelegate> Delegate;

+(id)AlbumResponseWithDelegate:(id<AMAlbumResponseDelegate>)delegate;

-(id)initWithDelegate:(id<AMAlbumResponseDelegate>)delegate;

@end