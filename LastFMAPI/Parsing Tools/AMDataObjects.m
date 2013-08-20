#import <LastFMAPI/AMDataObjects.h>
#import <LastFMAPI/AMXMLTools.h>

@implementation AMDataObject
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}
@end

@implementation AMImages
@synthesize Small;
@synthesize Medium;
@synthesize Large;
@synthesize ExtraLarge;
@synthesize Mega;
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        [AMXMLTools enumerateNodes:Node Key:@"image" Block:^(TBXMLElement *Element, BOOL *stop)
         {
             NSString *sizeVal = [AMXMLTools getTextAttribute:@"size" Node:Element];
             if ([sizeVal isEqualToString:@"small"])
                 [self setSmall:[TBXML textForElement:Element]];
             else if ([sizeVal isEqualToString:@"medium"])
                 [self setMedium:[TBXML textForElement:Element]];
             else if ([sizeVal isEqualToString:@"large"])
                 [self setLarge:[TBXML textForElement:Element]];
             else if ([sizeVal isEqualToString:@"extralarge"])
                 [self setExtraLarge:[TBXML textForElement:Element]];
             else if ([sizeVal isEqualToString:@"mega"])
                 [self setMega:[TBXML textForElement:Element]];
         }];
    }
    return self;
}
@end

@implementation AMTag
@synthesize Name;
@synthesize URL;
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        self.Name = [AMXMLTools getTextValue:@"name" Node:Node];
        self.URL = [AMXMLTools getTextValue:@"url" Node:Node];
    }
    return self;
}
@end

@implementation AMTags

-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        _Array = [[NSMutableArray alloc] init];
        [AMXMLTools enumerateNodes:Node Key:@"tag" Block:^(TBXMLElement *Element, BOOL *stop)
        {
            AMTag *foundElement = [[AMTag alloc] initFromNode:Element];
            [_Array addObject:foundElement];
        }];
    }
    return self;
}

-(void)enumerateList:(void (^)(AMTag *Tag, BOOL *stop)) block
{
    [_Array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
    {
        block((AMTag *)obj, stop);
    }];
}
@end

@implementation AMArtist
@synthesize Name;
@synthesize MBID;
@synthesize URL;
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        self.Name = [AMXMLTools getTextValue:@"name" Node:Node];
        self.MBID = [AMXMLTools getTextValue:@"mbid" Node:Node];
        self.URL = [AMXMLTools getTextValue:@"url" Node:Node];
    }
    return self;
}
@end

@implementation AMArtists
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        _Array = [[NSMutableArray alloc] init];
        [AMXMLTools enumerateNodes:Node Key:@"artist" Block:^(TBXMLElement *Element, BOOL *stop)
         {
             AMArtist *foundElement = [[AMArtist alloc] initFromNode:Element];
             [_Array addObject:foundElement];
         }];
    }
    return self;
}

-(void)enumerateList:(void (^)(AMArtist *Artist, BOOL *stop)) block
{
    [_Array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         block((AMArtist *)obj, stop);
     }];
}
@end

@implementation AMTrack
@synthesize Name;
@synthesize Playcount;
@synthesize Listeners;
@synthesize MBID;
@synthesize URL;
@synthesize Streamable;
@synthesize Artist;
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        self.Name = [AMXMLTools getTextValue:@"name" Node:Node];
        self.Playcount = [AMXMLTools getIntValue:@"playcount" Node:Node];
        self.Listeners = [AMXMLTools getIntValue:@"listeners" Node:Node];
        self.MBID = [AMXMLTools getTextValue:@"mbid" Node:Node];
        self.URL = [AMXMLTools getTextValue:@"url" Node:Node];
        self.Streamable = [AMXMLTools getIntValue:@"streamable" Node:Node];
        self.Artist = [[AMArtist alloc] initFromNode:[TBXML childElementNamed:@"artist" parentElement:Node]];
    }
    return self;
}
@end

@implementation AMTracks
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        _Array = [[NSMutableArray alloc] init];
        [AMXMLTools enumerateNodes:Node Key:@"track" Block:^(TBXMLElement *Element, BOOL *stop)
         {
             AMTrack *foundElement = [[AMTrack alloc] initFromNode:Element];
             [_Array addObject:foundElement];
         }];
    }
    return self;
}

-(void)enumerateList:(void (^)(AMTrack *Track, BOOL *stop)) block
{
    [_Array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         block((AMTrack *)obj, stop);
     }];
}
@end

@implementation AMAlbumTrack
@synthesize Name;
@synthesize Rank;
@synthesize Duration;
@synthesize MBID;
@synthesize URL;
@synthesize Streamable;
@synthesize Streamable_Fulltrack;
@synthesize Artist;
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        self.Name = [AMXMLTools getTextValue:@"name" Node:Node];
        self.Rank = [AMXMLTools getIntAttribute:@"rank" Node:Node];
        self.Duration = [AMXMLTools getIntValue:@"duration" Node:Node];
        self.MBID = [AMXMLTools getTextValue:@"mbid" Node:Node];
        self.URL = [AMXMLTools getTextValue:@"url" Node:Node];
        self.Streamable = [AMXMLTools getIntValue:@"streamable" Node:Node];
        self.Streamable_Fulltrack = [AMXMLTools getIntAttribute:@"fulltrack" Node:[TBXML childElementNamed:@"streamable" parentElement:Node]];
        self.Artist = [[AMArtist alloc] initFromNode:[TBXML childElementNamed:@"artist" parentElement:Node]];
    }
    return self;
}
@end

@implementation AMAlbumTracks
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        _Array = [[NSMutableArray alloc] init];
        [AMXMLTools enumerateNodes:Node Key:@"track" Block:^(TBXMLElement *Element, BOOL *stop)
         {
             AMAlbumTrack *foundElement = [[AMAlbumTrack alloc] initFromNode:Element];
             [_Array addObject:foundElement];
         }];
    }
    return self;
}

-(void)enumerateList:(void (^)(AMAlbumTrack *Track, BOOL *stop)) block
{
    [_Array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         block((AMAlbumTrack *)obj, stop);
     }];
}
@end

@implementation AMAlbum
@synthesize Artist;
@synthesize Name;
@synthesize MBID;
@synthesize URL;
@synthesize Images;
-(id)initFromNode:(TBXMLElement *)Node;
{
    self = [super init];
    if (self)
    {
        NSString *NameEntry = [AMXMLTools getTextValue:@"name" Node:Node];
        if (NameEntry) self.Name = NameEntry;
        else self.Name = [AMXMLTools getTextValue:@"title" Node:Node];
        
        self.Artist = [AMXMLTools getTextValue:@"artist" Node:Node];
        self.Name = [AMXMLTools getTextValue:@"name" Node:Node];
        self.MBID = [AMXMLTools getTextValue:@"mbid" Node:Node];
        self.URL = [AMXMLTools getTextValue:@"url" Node:Node];
        self.Images = [[AMImages alloc] initFromNode:Node];
    }
    return self;
}
@end

@implementation AMBio
@synthesize Published;
@synthesize Summary;
@synthesize Content;
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        self.Published = [AMXMLTools getTextValue:@"published" Node:Node];
        self.Summary = [AMXMLTools getTextValue:@"summary" Node:Node];
        self.Content = [AMXMLTools getTextValue:@"content" Node:Node];
    }
    return self;
}
@end

@implementation AMStats
@synthesize Listeners;
@synthesize Playcount;
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        self.Listeners = [AMXMLTools getIntValue:@"listeners" Node:Node];
        self.Playcount = [AMXMLTools getIntValue:@"playcount" Node:Node];
    }
    return self;
}
@end

@implementation AMArtistWithInfo
@synthesize Streamable;
@synthesize Stats;
@synthesize Similar;
@synthesize Tags;
@synthesize Bio;
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super initFromNode:Node];
    if (self)
    {
        self.Streamable = [AMXMLTools getIntValue:@"streamable" Node:Node];
        self.Stats = [[AMStats alloc] initFromNode:[TBXML childElementNamed:@"stats" parentElement:Node]];
        self.Similar = [[AMArtists alloc] initFromNode:[TBXML childElementNamed:@"similar" parentElement:Node]];
        self.Tags = [[AMTags alloc] initFromNode:[TBXML childElementNamed:@"tags" parentElement:Node]];
        self.Bio = [[AMBio alloc] initFromNode:[TBXML childElementNamed:@"bio" parentElement:Node]];
    }
    return self;
}
@end

@implementation AMTrackWithInfo
@synthesize ID;
@synthesize Duration;
@synthesize Streamable_Fulltrack;
@synthesize Wiki;
@synthesize Album;
@synthesize Toptags;
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super initFromNode:Node];
    if (self)
    {
        self.ID = [AMXMLTools getIntValue:@"id" Node:Node];
        self.Duration = [AMXMLTools getIntValue:@"duration" Node:Node];
        self.Streamable_Fulltrack = [AMXMLTools getIntAttribute:@"fulltrack" Node:[TBXML childElementNamed:@"streamable" parentElement:Node]];
        self.Wiki = [[AMBio alloc] initFromNode:[TBXML childElementNamed:@"wiki" parentElement:Node]];
        self.Album = [[AMAlbum alloc] initFromNode:[TBXML childElementNamed:@"album" parentElement:Node]];
        self.Toptags = [[AMTags alloc] initFromNode:[TBXML childElementNamed:@"toptags" parentElement:Node]];
    }
    return self;
}
@end

@implementation AMAlbumWithInfo
@synthesize ID;
@synthesize Releasedate;
@synthesize Listeners;
@synthesize Playcount;
@synthesize Toptags;
@synthesize Tracks;
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super initFromNode:Node];
    if (self)
    {
        self.ID = [AMXMLTools getIntValue:@"id" Node:Node];
        self.Releasedate = [AMXMLTools getTextValue:@"releasedate" Node:Node];
        self.Listeners = [AMXMLTools getIntValue:@"listeners" Node:Node];
        self.Playcount = [AMXMLTools getIntValue:@"playcount" Node:Node];
        self.Toptags = [[AMTags alloc] initFromNode:[TBXML childElementNamed:@"toptags" parentElement:Node]];
        self.Tracks = [[AMAlbumTracks alloc] initFromNode:[TBXML childElementNamed:@"tracks" parentElement:Node]];
    }
    return self;
}
@end

@implementation AMSession
@synthesize Name;
@synthesize Key;
@synthesize Subscriber;
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        TBXMLElement *sessionNode = [TBXML childElementNamed:@"session" parentElement:Node];
        self.Name = [AMXMLTools getTextValue:@"name" Node:sessionNode];
        self.Key = [AMXMLTools getTextValue:@"key" Node:sessionNode];
        self.Subscriber = [AMXMLTools getIntValue:@"subscriber" Node:sessionNode];
    }
    return self;
}
@end

@implementation AMToken
@synthesize Token;
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        self.Token = [AMXMLTools getTextValue:@"token" Node:Node];
    }
    return self;
}
@end

@implementation AMSubmittedData
@synthesize Track;
@synthesize Track_Corrected;
@synthesize Artist;
@synthesize Artist_Corrected;
@synthesize Album;
@synthesize Album_Corrected;
@synthesize AlbumArtist;
@synthesize AlbumArtist_Corrected;
@synthesize IgnoredMessage;
@synthesize IgnoredMessage_Code;
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        self.Track = [AMXMLTools getTextValue:@"track" Node:Node];
        self.Track_Corrected = [AMXMLTools getIntAttribute:@"corrected" Node:[TBXML childElementNamed:@"track" parentElement:Node]];
        self.Artist = [AMXMLTools getTextValue:@"artist" Node:Node];
        self.Artist_Corrected = [AMXMLTools getIntAttribute:@"corrected" Node:[TBXML childElementNamed:@"artist" parentElement:Node]];
        self.Album = [AMXMLTools getTextValue:@"album" Node:Node];
        self.Album_Corrected = [AMXMLTools getIntAttribute:@"corrected" Node:[TBXML childElementNamed:@"album" parentElement:Node]];
        self.AlbumArtist = [AMXMLTools getTextValue:@"albumArtist" Node:Node];
        self.AlbumArtist_Corrected = [AMXMLTools getIntAttribute:@"corrected" Node:[TBXML childElementNamed:@"albumArtist" parentElement:Node]];
        self.IgnoredMessage = [AMXMLTools getTextValue:@"ignoredMessage" Node:Node];
        self.IgnoredMessage_Code = [AMXMLTools getIntAttribute:@"code" Node:[TBXML childElementNamed:@"ignoredMessage" parentElement:Node]];
    }
    return self;
}
@end

@implementation AMNowPlaying
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super initFromNode:Node];
    if (self)
    {
        
    }
    return self;
}
@end

@implementation AMScrobble
@synthesize Timestamp;
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super initFromNode:Node];
    if (self)
    {
        self.Timestamp = [AMXMLTools getIntValue:@"timestamp" Node:Node];
    }
    return self;
}
@end

@implementation AMScrobbles
@synthesize Accepted;
@synthesize Ignored;
-(id)initFromNode:(TBXMLElement *)Node
{
    self = [super init];
    if (self)
    {
        _Array = [[NSMutableArray alloc] init];
        [AMXMLTools enumerateNodes:Node Key:@"scrobble" Block:^(TBXMLElement *Element, BOOL *stop)
         {
             AMScrobble *foundElement = [[AMScrobble alloc] initFromNode:Element];
             [_Array addObject:foundElement];
         }];
        self.Accepted = [AMXMLTools getIntAttribute:@"accepted" Node:Node];
        self.Ignored = [AMXMLTools getIntAttribute:@"ignored" Node:Node];
    }
    return self;
}

-(void)enumerateList:(void (^)(AMScrobble *Scrobble, BOOL *stop)) block
{
    [_Array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         block((AMScrobble *)obj, stop);
     }];
}
@end