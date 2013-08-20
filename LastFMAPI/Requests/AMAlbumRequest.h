#import <LastFMAPI/AMBaseRequest.h>
#import <LastFMAPI/AMAlbumResponse.h>

@interface AMAlbumRequest : AMBaseRequest

-(id)initWithURL:(NSString *)url
             Key:(NSString *)key
          Secret:(NSString *)secret;

-(BOOL)GetInfo:(AMAlbumResponse *)Response
        Artist:(NSString *)Artist
         Album:(NSString *)Album
          MBID:(NSString *)MBID
   Autocorrect:(NSNumber *)Autocorrect
      Username:(NSString *)Username
          Lang:(NSString *)Lang;

@end