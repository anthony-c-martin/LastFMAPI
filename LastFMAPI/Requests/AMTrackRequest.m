#import <LastFMAPI/AMTrackRequest.h>
#import <LastFMAPI/AMDefinitions.h>

@implementation AMTrackRequest

-(id)initWithURL:(NSString *)url
             Key:(NSString *)key
          Secret:(NSString *)secret
{
    self = [super initWithURL:url Key:key Secret:secret];
    return self;
}

-(BOOL)UpdateNowPlaying:(AMTrackResponse *)Response
                 Artist:(NSString *)Artist
                  Track:(NSString *)Track
                  Album:(NSString *)Album
            TrackNumber:(NSNumber *)TrackNumber
                Context:(NSString *)Context
                   MBID:(NSString *)MBID
               Duration:(NSNumber *)Duration
            AlbumArtist:(NSString *)AlbumArtist
             SessionKey:(NSString *)SessionKey
{
    NSDictionary *Params = [NSDictionary dictionaryWithObjectsAndKeysIngnoringNull:
                            [NSNull nullWhenNil:Artist], AM_REQ_PARAM_ARTIST,
                            [NSNull nullWhenNil:Track], AM_REQ_PARAM_TRACK,
                            [NSNull nullWhenNil:Album], AM_REQ_PARAM_ALBUM,
                            [NSNull nullWhenNil:TrackNumber], AM_REQ_PARAM_TRACKNUMBER,
                            [NSNull nullWhenNil:Context], AM_REQ_PARAM_CONTEXT,
                            [NSNull nullWhenNil:MBID], AM_REQ_PARAM_MBID,
                            [NSNull nullWhenNil:Duration], AM_REQ_PARAM_DURATION,
                            [NSNull nullWhenNil:AlbumArtist], AM_REQ_PARAM_ALBUMARTIST,
                            [NSNull nullWhenNil:SessionKey], AM_REQ_PARAM_SESSIONKEY,
                            nil
                            ];

    return [self requestWithMethod:AM_MTHD_TRACK_UPDATENOWPLAYING Params:Params Response:Response];
}

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
     SessionKey:(NSString *)SessionKey
{
    NSDictionary *Params = [NSDictionary dictionaryWithObjectsAndKeysIngnoringNull:
                            [NSNull nullWhenNil:Artist], AM_REQ_PARAM_ARTIST,
                            [NSNull nullWhenNil:Track], AM_REQ_PARAM_TRACK,
                            [NSNull nullWhenNil:Timestamp], AM_REQ_PARAM_TIMESTAMP,
                            [NSNull nullWhenNil:Album], AM_REQ_PARAM_ALBUM,
                            [NSNull nullWhenNil:Context], AM_REQ_PARAM_CONTEXT,
                            [NSNull nullWhenNil:StreamId], AM_REQ_PARAM_STREAMID,
                            [NSNull nullWhenNil:ChosenByUser], AM_REQ_PARAM_CHOSENBYUSER,
                            [NSNull nullWhenNil:TrackNumber], AM_REQ_PARAM_TRACKNUMBER,
                            [NSNull nullWhenNil:MBID], AM_REQ_PARAM_MBID,
                            [NSNull nullWhenNil:AlbumArtist], AM_REQ_PARAM_ALBUMARTIST,
                            [NSNull nullWhenNil:Duration], AM_REQ_PARAM_DURATION,
                            [NSNull nullWhenNil:SessionKey], AM_REQ_PARAM_SESSIONKEY,
                            nil
                            ];
    
    return [self requestWithMethod:AM_MTHD_TRACK_SCROBBLE Params:Params Response:Response];
}

-(BOOL)GetInfo:(AMTrackResponse *)Response
          MBID:(NSString *)MBID
         Track:(NSString *)Track
        Artist:(NSString *)Artist
      Username:(NSString *)Username
   Autocorrect:(NSNumber *)Autocorrect
{
    NSDictionary *Params = [NSDictionary dictionaryWithObjectsAndKeysIngnoringNull:
                            [NSNull nullWhenNil:MBID], AM_REQ_PARAM_MBID,
                            [NSNull nullWhenNil:Track], AM_REQ_PARAM_TRACK,
                            [NSNull nullWhenNil:Artist], AM_REQ_PARAM_ARTIST,
                            [NSNull nullWhenNil:Username], AM_REQ_PARAM_USERNAME,
                            [NSNull nullWhenNil:Autocorrect], AM_REQ_PARAM_AUTOCORRECT,
                            nil
                            ];
    
    return [self requestWithMethod:AM_MTHD_TRACK_GETINFO Params:Params Response:Response];
}

@end