#import <LastFMAPI/AMAlbumRequest.h>
#import <LastFMAPI/AMDefinitions.h>

@implementation AMAlbumRequest

-(id)initWithURL:(NSString *)url
             Key:(NSString *)key
          Secret:(NSString *)secret
{
    self = [super initWithURL:url Key:key Secret:secret];
    return self;
}

-(BOOL)GetInfo:(AMAlbumResponse *)Response
        Artist:(NSString *)Artist
         Album:(NSString *)Album
          MBID:(NSString *)MBID
   Autocorrect:(NSNumber *)Autocorrect
      Username:(NSString *)Username
          Lang:(NSString *)Lang
{
    NSDictionary *Params = [NSDictionary dictionaryWithObjectsAndKeysIngnoringNull:
                            [NSNull nullWhenNil:Artist], AM_REQ_PARAM_ARTIST,
                            [NSNull nullWhenNil:Album], AM_REQ_PARAM_ALBUM,
                            [NSNull nullWhenNil:MBID], AM_REQ_PARAM_MBID,
                            [NSNull nullWhenNil:Autocorrect], AM_REQ_PARAM_AUTOCORRECT,
                            [NSNull nullWhenNil:Username], AM_REQ_PARAM_USERNAME,
                            [NSNull nullWhenNil:Lang], AM_REQ_PARAM_LANG,
                            nil
                            ];
    
    return [self requestWithMethod:AM_MTHD_ALBUM_GETINFO Params:Params Response:Response];
}

@end