#import <Foundation/Foundation.h>

@interface AMDataObject : NSObject
@end

@interface AMImages : AMDataObject
@property (nonatomic, retain) NSString *Small;
@property (nonatomic, retain) NSString *Medium;
@property (nonatomic, retain) NSString *Large;
@property (nonatomic, retain) NSString *ExtraLarge;
@property (nonatomic, retain) NSString *Mega;
@end

@interface AMTag : AMDataObject
@property (nonatomic, retain) NSString *Name;
@property (nonatomic, retain) NSString *URL;
@end

@interface AMTags : AMDataObject
{
@private
    NSMutableArray *_Array;
}
-(void)enumerateList:(void (^)(AMTag *Tag, BOOL *stop)) block;
@end

@interface AMArtist : AMDataObject
@property (nonatomic, retain) NSString *Name;
@property (nonatomic, retain) NSString *MBID;
@property (nonatomic, retain) NSString *URL;
@end

@interface AMArtists : AMDataObject
{
@private
    NSMutableArray *_Array;
}
-(void)enumerateList:(void (^)(AMArtist *Artist, BOOL *stop)) block;
@end

@interface AMTrack : AMDataObject
@property (nonatomic, retain) NSString *Name;
@property (nonatomic, retain) NSNumber *Playcount;
@property (nonatomic, retain) NSNumber *Listeners;
@property (nonatomic, retain) NSString *MBID;
@property (nonatomic, retain) NSString *URL;
@property (nonatomic, retain) NSNumber *Streamable;
@property (nonatomic, retain) AMArtist *Artist;
@end

@interface AMTracks : AMDataObject
{
@private
    NSMutableArray *_Array;
}
-(void)enumerateList:(void (^)(AMTrack *Track, BOOL *stop)) block;
@end

@interface AMAlbumTrack : AMDataObject
@property (nonatomic, retain) NSString *Name;
@property (nonatomic, retain) NSNumber *Rank;
@property (nonatomic, retain) NSNumber *Duration;
@property (nonatomic, retain) NSString *MBID;
@property (nonatomic, retain) NSString *URL;
@property (nonatomic, retain) NSNumber *Streamable;
@property (nonatomic, retain) NSNumber *Streamable_Fulltrack;
@property (nonatomic, retain) AMArtist *Artist;
@end

@interface AMAlbumTracks : AMDataObject
{
@private
    NSMutableArray *_Array;
}
-(void)enumerateList:(void (^)(AMAlbumTrack *Track, BOOL *stop)) block;
@end

@interface AMAlbum : AMDataObject
@property (nonatomic, retain) NSString *Artist;
@property (nonatomic, retain) NSString *Name;
@property (nonatomic, retain) NSString *MBID;
@property (nonatomic, retain) NSString *URL;
@property (nonatomic, retain) AMImages *Images;
@end

@interface AMBio : AMDataObject
@property (nonatomic, retain) NSString *Published;
@property (nonatomic, retain) NSString *Summary;
@property (nonatomic, retain) NSString *Content;
@end

@interface AMStats : AMDataObject
@property (nonatomic, retain) NSNumber *Listeners;
@property (nonatomic, retain) NSNumber *Playcount;
@end

@interface AMArtistWithInfo : AMArtist
@property (nonatomic, retain) NSNumber *Streamable;
@property (nonatomic, retain) AMStats *Stats;
@property (nonatomic, retain) AMArtists *Similar;
@property (nonatomic, retain) AMTags *Tags;
@property (nonatomic, retain) AMBio *Bio;
@end

@interface AMTrackWithInfo : AMTrack
@property (nonatomic, retain) NSNumber *ID;
@property (nonatomic, retain) NSNumber *Duration;
@property (nonatomic, retain) NSNumber *Streamable_Fulltrack;
@property (nonatomic, retain) NSString *Published;
@property (nonatomic, retain) AMBio *Wiki;
@property (nonatomic, retain) AMAlbum *Album;
@property (nonatomic, retain) AMTags *Toptags;
@end

@interface AMAlbumWithInfo : AMAlbum
@property (nonatomic, retain) NSNumber *ID;
@property (nonatomic, retain) NSString *Releasedate;
@property (nonatomic, retain) NSNumber *Listeners;
@property (nonatomic, retain) NSNumber *Playcount;
@property (nonatomic, retain) AMTags *Toptags;
@property (nonatomic, retain) AMAlbumTracks *Tracks;
@end

@interface AMSession : AMDataObject
@property (nonatomic, retain) NSString *Name;
@property (nonatomic, retain) NSString *Key;
@property (nonatomic, retain) NSNumber *Subscriber;
@end

@interface AMToken : AMDataObject
@property (nonatomic, retain) NSString *Token;
@end

@interface AMSubmittedData : AMDataObject
@property (nonatomic, retain) NSString *Track;
@property (nonatomic, retain) NSNumber *Track_Corrected;
@property (nonatomic, retain) NSString *Artist;
@property (nonatomic, retain) NSNumber *Artist_Corrected;
@property (nonatomic, retain) NSString *Album;
@property (nonatomic, retain) NSNumber *Album_Corrected;
@property (nonatomic, retain) NSString *AlbumArtist;
@property (nonatomic, retain) NSNumber *AlbumArtist_Corrected;
@property (nonatomic, retain) NSString *IgnoredMessage;
@property (nonatomic, retain) NSNumber *IgnoredMessage_Code;
@end

@interface AMNowPlaying : AMSubmittedData
@end

@interface AMScrobble : AMSubmittedData
@property (nonatomic, retain) NSNumber *Timestamp;
@end

@interface AMScrobbles : AMDataObject
{
@private
    NSMutableArray *_Array;
}
@property (nonatomic, retain) NSNumber *Accepted;
@property (nonatomic, retain) NSNumber *Ignored;
-(void)enumerateList:(void (^)(AMScrobble *Scrobble, BOOL *stop)) block;
@end