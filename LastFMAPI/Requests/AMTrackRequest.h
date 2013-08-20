#import <LastFMAPI/AMBaseRequest.h>
#import <LastFMAPI/AMTrackResponse.h>

@interface AMTrackRequest : AMBaseRequest

-(id)initWithURL:(NSString *)url
             Key:(NSString *)key
          Secret:(NSString *)secret;

-(BOOL)UpdateNowPlaying:(AMTrackResponse *)Response
                 Artist:(NSString *)Artist
                  Track:(NSString *)Track
                  Album:(NSString *)Album
            TrackNumber:(NSNumber *)TrackNumber
                Context:(NSString *)Context
                   MBID:(NSString *)MBID
               Duration:(NSNumber *)Duration
            AlbumArtist:(NSString *)AlbumArtist
             SessionKey:(NSString *)SessionKey;

-(BOOL)Scrobble:(AMTrackResponse *)Response
         Artist:(NSString *)Artist
          Track:(NSString *)Track
      Timestamp:(NSNumber *)Timestamp
          Album:(NSString *)Album
        Context:(NSString *)Context
       StreamId:(NSString *)StreamId
   ChosenByUser:(NSString *)ChosenByUser
    TrackNumber:(NSNumber *)TrackNumber
           MBID:(NSString *)MBID
    AlbumArtist:(NSString *)AlbumArtist
       Duration:(NSNumber *)Duration
     SessionKey:(NSString *)SessionKey;

-(BOOL)GetInfo:(AMTrackResponse *)Response
          MBID:(NSString *)MBID
         Track:(NSString *)Track
        Artist:(NSString *)Artist
      Username:(NSString *)Username
   Autocorrect:(NSNumber *)Autocorrect;

@end