#pragma mark Error Definitions
NSInteger const AM_ERR_UNRECOGNISED_ERROR_CODE = -2;
NSInteger const AM_ERR_HTTP_REQFAILED = -1;
NSInteger const AM_ERR_ERR_NOT_EXISTS_1 = 1;
NSInteger const AM_ERR_INVALID_SERVICE = 2;
NSInteger const AM_ERR_INVALID_METHOD = 3;
NSInteger const AM_ERR_AUTHENTICATION_FAILED = 4;
NSInteger const AM_ERR_INVALID_FORMAT = 5;
NSInteger const AM_ERR_INVALID_PARAMETERS = 6;
NSInteger const AM_ERR_INVALID_RESOURCE = 7;
NSInteger const AM_ERR_OPERATION_FAILED = 8;
NSInteger const AM_ERR_INVALID_SESSION_KEY = 9;
NSInteger const AM_ERR_INVALID_API_KEY = 10;
NSInteger const AM_ERR_SERVICE_OFFLINE = 11;
NSInteger const AM_ERR_SUBSCRIBERS_ONLY = 12;
NSInteger const AM_ERR_INVALID_METHOD_SIGNATURE = 13;
NSInteger const AM_ERR_UNAUTHORISED_TOKEN = 14;
NSInteger const AM_ERR_NOT_AVAILABLE_FOR_STREAMING = 15;
NSInteger const AM_ERR_SERVICE_TEMPORARILY_UNAVAILABLE = 16;
NSInteger const AM_ERR_USER_LOGIN_REQUIRED = 17;
NSInteger const AM_ERR_TRIAL_EXPIRED = 18;
NSInteger const AM_ERR_ERR_NOT_EXISTS_19 = 19;
NSInteger const AM_ERR_NOT_ENOUGH_CONTENT = 20;
NSInteger const AM_ERR_NOT_ENOUGH_MEMBERS = 21;
NSInteger const AM_ERR_NOT_ENOUGH_FANS = 22;
NSInteger const AM_ERR_NOT_ENOUGH_NEIGHBOURS = 23;
NSInteger const AM_ERR_NO_PEAK_RADIO = 24;
NSInteger const AM_ERR_RADIO_NOT_FOUND = 25;
NSInteger const AM_ERR_API_KEY_SUSPENDED = 26;
NSInteger const AM_ERR_DEPRECATED_REQUEST = 27;
NSInteger const AM_ERR_RATE_LIMIT_EXCEEDED = 28;
NSString *const AM_ERRDOMAIN_LASTFMAPI = @"com.acm.LastFMAPI";
NSString *const AM_ERRDESC_HTTP_FAILED = @"HTTP Request Failed";
NSString *const AM_ERRDESC_UNRECOGNISED = @"Unrecognised Error";

#pragma mark Method Definitions
NSString *const AM_MTHD_ALBUM_ADDTAGS = @"album.addTags";
NSString *const AM_MTHD_ALBUM_GETBUYLINKS = @"album.getBuylinks";
NSString *const AM_MTHD_ALBUM_GETINFO = @"album.getInfo";
NSString *const AM_MTHD_ALBUM_GETSHOUTS = @"album.getShouts";
NSString *const AM_MTHD_ALBUM_GETTAGS = @"album.getTags";
NSString *const AM_MTHD_ALBUM_GETTOPTAGS = @"album.getTopTags";
NSString *const AM_MTHD_ALBUM_REMOVETAG = @"album.removeTag";
NSString *const AM_MTHD_ALBUM_SEARCH = @"album.search";
NSString *const AM_MTHD_ALBUM_SHARE = @"album.share";
NSString *const AM_MTHD_ARTIST_ADDTAGS = @"artist.addTags";
NSString *const AM_MTHD_ARTIST_GETCORRECTION = @"artist.getCorrection";
NSString *const AM_MTHD_ARTIST_GETEVENTS = @"artist.getEvents";
NSString *const AM_MTHD_ARTIST_GETINFO = @"artist.getInfo";
NSString *const AM_MTHD_ARTIST_GETPASTEVENTS = @"artist.getPastEvents";
NSString *const AM_MTHD_ARTIST_GETPODCAST = @"artist.getPodcast";
NSString *const AM_MTHD_ARTIST_GETSHOUTS = @"artist.getShouts";
NSString *const AM_MTHD_ARTIST_GETSIMILAR = @"artist.getSimilar";
NSString *const AM_MTHD_ARTIST_GETTAGS = @"artist.getTags";
NSString *const AM_MTHD_ARTIST_GETTOPALBUMS = @"artist.getTopAlbums";
NSString *const AM_MTHD_ARTIST_GETTOPFANS = @"artist.getTopFans";
NSString *const AM_MTHD_ARTIST_GETTOPTAGS = @"artist.getTopTags";
NSString *const AM_MTHD_ARTIST_GETTOPTRACKS = @"artist.getTopTracks";
NSString *const AM_MTHD_ARTIST_REMOVETAG = @"artist.removeTag";
NSString *const AM_MTHD_ARTIST_SEARCH = @"artist.search";
NSString *const AM_MTHD_ARTIST_SHARE = @"artist.share";
NSString *const AM_MTHD_ARTIST_SHOUT = @"artist.shout";
NSString *const AM_MTHD_AUTH_GETMOBILESESSION = @"auth.getMobileSession";
NSString *const AM_MTHD_AUTH_GETSESSION = @"auth.getSession";
NSString *const AM_MTHD_AUTH_GETTOKEN = @"auth.getToken";
NSString *const AM_MTHD_CHART_GETHYPEDARTISTS = @"chart.getHypedArtists";
NSString *const AM_MTHD_CHART_GETHYPEDTRACKS = @"chart.getHypedTracks";
NSString *const AM_MTHD_CHART_GETLOVEDTRACKS = @"chart.getLovedTracks";
NSString *const AM_MTHD_CHART_GETTOPARTISTS = @"chart.getTopArtists";
NSString *const AM_MTHD_CHART_GETTOPTAGS = @"chart.getTopTags";
NSString *const AM_MTHD_CHART_GETTOPTRACKS = @"chart.getTopTracks";
NSString *const AM_MTHD_EVENT_ATTEND = @"event.attend";
NSString *const AM_MTHD_EVENT_GETATTENDEES = @"event.getAttendees";
NSString *const AM_MTHD_EVENT_GETINFO = @"event.getInfo";
NSString *const AM_MTHD_EVENT_GETSHOUTS = @"event.getShouts";
NSString *const AM_MTHD_EVENT_SHARE = @"event.share";
NSString *const AM_MTHD_EVENT_SHOUT = @"event.shout";
NSString *const AM_MTHD_GEO_GETEVENTS = @"geo.getEvents";
NSString *const AM_MTHD_GEO_GETMETROARTISTCHART = @"geo.getMetroArtistChart";
NSString *const AM_MTHD_GEO_GETMETROHYPEARTISTCHART = @"geo.getMetroHypeArtistChart";
NSString *const AM_MTHD_GEO_GETMETROHYPETRACKCHART = @"geo.getMetroHypeTrackChart";
NSString *const AM_MTHD_GEO_GETMETROTRACKCHART = @"geo.getMetroTrackChart";
NSString *const AM_MTHD_GEO_GETMETROUNIQUEARTISTCHART = @"geo.getMetroUniqueArtistChart";
NSString *const AM_MTHD_GEO_GETMETROUNIQUETRACKCHART = @"geo.getMetroUniqueTrackChart";
NSString *const AM_MTHD_GEO_GETMETROWEEKLYCHARTLIST = @"geo.getMetroWeeklyChartlist";
NSString *const AM_MTHD_GEO_GETMETROS = @"geo.getMetros";
NSString *const AM_MTHD_GEO_GETTOPARTISTS = @"geo.getTopArtists";
NSString *const AM_MTHD_GEO_GETTOPTRACKS = @"geo.getTopTracks";
NSString *const AM_MTHD_GROUP_GETHYPE = @"group.getHype";
NSString *const AM_MTHD_GROUP_GETMEMBERS = @"group.getMembers";
NSString *const AM_MTHD_GROUP_GETWEEKLYALBUMCHART = @"group.getWeeklyAlbumChart";
NSString *const AM_MTHD_GROUP_GETWEEKLYARTISTCHART = @"group.getWeeklyArtistChart";
NSString *const AM_MTHD_GROUP_GETWEEKLYCHARTLIST = @"group.getWeeklyChartList";
NSString *const AM_MTHD_GROUP_GETWEEKLYTRACKCHART = @"group.getWeeklyTrackChart";
NSString *const AM_MTHD_LIBRARY_ADDALBUM = @"library.addAlbum";
NSString *const AM_MTHD_LIBRARY_ADDARTIST = @"library.addArtist";
NSString *const AM_MTHD_LIBRARY_ADDTRACK = @"library.addTrack";
NSString *const AM_MTHD_LIBRARY_GETALBUMS = @"library.getAlbums";
NSString *const AM_MTHD_LIBRARY_GETARTISTS = @"library.getArtists";
NSString *const AM_MTHD_LIBRARY_GETTRACKS = @"library.getTracks";
NSString *const AM_MTHD_LIBRARY_REMOVEALBUM = @"library.removeAlbum";
NSString *const AM_MTHD_LIBRARY_REMOVEARTIST = @"library.removeArtist";
NSString *const AM_MTHD_LIBRARY_REMOVESCROBBLE = @"library.removeScrobble";
NSString *const AM_MTHD_LIBRARY_REMOVETRACK = @"library.removeTrack";
NSString *const AM_MTHD_PLAYLIST_ADDTRACK = @"playlist.addTrack";
NSString *const AM_MTHD_PLAYLIST_CREATE = @"playlist.create";
NSString *const AM_MTHD_RADIO_GETPLAYLIST = @"radio.getPlaylist";
NSString *const AM_MTHD_RADIO_SEARCH = @"radio.search";
NSString *const AM_MTHD_RADIO_TUNE = @"radio.tune";
NSString *const AM_MTHD_TAG_GETINFO = @"tag.getInfo";
NSString *const AM_MTHD_TAG_GETSIMILAR = @"tag.getSimilar";
NSString *const AM_MTHD_TAG_GETTOPALBUMS = @"tag.getTopAlbums";
NSString *const AM_MTHD_TAG_GETTOPARTISTS = @"tag.getTopArtists";
NSString *const AM_MTHD_TAG_GETTOPTAGS = @"tag.getTopTags";
NSString *const AM_MTHD_TAG_GETTOPTRACKS = @"tag.getTopTracks";
NSString *const AM_MTHD_TAG_GETWEEKLYARTISTCHART = @"tag.getWeeklyArtistChart";
NSString *const AM_MTHD_TAG_GETWEEKLYCHARTLIST = @"tag.getWeeklyChartList";
NSString *const AM_MTHD_TAG_SEARCH = @"tag.search";
NSString *const AM_MTHD_TASTEOMETER_COMPARE = @"tasteometer.compare";
NSString *const AM_MTHD_TASTEOMETER_COMPAREGROUP = @"tasteometer.compareGroup";
NSString *const AM_MTHD_TRACK_ADDTAGS = @"track.addTags";
NSString *const AM_MTHD_TRACK_BAN = @"track.ban";
NSString *const AM_MTHD_TRACK_GETBUYLINKS = @"track.getBuylinks";
NSString *const AM_MTHD_TRACK_GETCORRECTION = @"track.getCorrection";
NSString *const AM_MTHD_TRACK_GETFINGERPRINTMETADATA = @"track.getFingerprintMetadata";
NSString *const AM_MTHD_TRACK_GETINFO = @"track.getInfo";
NSString *const AM_MTHD_TRACK_GETSHOUTS = @"track.getShouts";
NSString *const AM_MTHD_TRACK_GETSIMILAR = @"track.getSimilar";
NSString *const AM_MTHD_TRACK_GETTAGS = @"track.getTags";
NSString *const AM_MTHD_TRACK_GETTOPFANS = @"track.getTopFans";
NSString *const AM_MTHD_TRACK_GETTOPTAGS = @"track.getTopTags";
NSString *const AM_MTHD_TRACK_LOVE = @"track.love";
NSString *const AM_MTHD_TRACK_REMOVETAG = @"track.removeTag";
NSString *const AM_MTHD_TRACK_SCROBBLE = @"track.scrobble";
NSString *const AM_MTHD_TRACK_SEARCH = @"track.search";
NSString *const AM_MTHD_TRACK_SHARE = @"track.share";
NSString *const AM_MTHD_TRACK_UNBAN = @"track.unban";
NSString *const AM_MTHD_TRACK_UNLOVE = @"track.unlove";
NSString *const AM_MTHD_TRACK_UPDATENOWPLAYING = @"track.updateNowPlaying";
NSString *const AM_MTHD_USER_GETARTISTTRACKS = @"user.getArtistTracks";
NSString *const AM_MTHD_USER_GETBANNEDTRACKS = @"user.getBannedTracks";
NSString *const AM_MTHD_USER_GETEVENTS = @"user.getEvents";
NSString *const AM_MTHD_USER_GETFRIENDS = @"user.getFriends";
NSString *const AM_MTHD_USER_GETINFO = @"user.getInfo";
NSString *const AM_MTHD_USER_GETLOVEDTRACKS = @"user.getLovedTracks";
NSString *const AM_MTHD_USER_GETNEIGHBOURS = @"user.getNeighbours";
NSString *const AM_MTHD_USER_GETNEWRELEASES = @"user.getNewReleases";
NSString *const AM_MTHD_USER_GETPASTEVENTS = @"user.getPastEvents";
NSString *const AM_MTHD_USER_GETPERSONALTAGS = @"user.getPersonalTags";
NSString *const AM_MTHD_USER_GETPLAYLISTS = @"user.getPlaylists";
NSString *const AM_MTHD_USER_GETRECENTSTATIONS = @"user.getRecentStations";
NSString *const AM_MTHD_USER_GETRECENTTRACKS = @"user.getRecentTracks";
NSString *const AM_MTHD_USER_GETRECOMMENDEDARTISTS = @"user.getRecommendedArtists";
NSString *const AM_MTHD_USER_GETRECOMMENDEDEVENTS = @"user.getRecommendedEvents";
NSString *const AM_MTHD_USER_GETSHOUTS = @"user.getShouts";
NSString *const AM_MTHD_USER_GETTOPALBUMS = @"user.getTopAlbums";
NSString *const AM_MTHD_USER_GETTOPARTISTS = @"user.getTopArtists";
NSString *const AM_MTHD_USER_GETTOPTAGS = @"user.getTopTags";
NSString *const AM_MTHD_USER_GETTOPTRACKS = @"user.getTopTracks";
NSString *const AM_MTHD_USER_GETWEEKLYALBUMCHART = @"user.getWeeklyAlbumChart";
NSString *const AM_MTHD_USER_GETWEEKLYARTISTCHART = @"user.getWeeklyArtistChart";
NSString *const AM_MTHD_USER_GETWEEKLYCHARTLIST = @"user.getWeeklyChartList";
NSString *const AM_MTHD_USER_GETWEEKLYTRACKCHART = @"user.getWeeklyTrackChart";
NSString *const AM_MTHD_USER_SHOUT = @"user.shout";
NSString *const AM_MTHD_USER_SIGNUP = @"user.signUp";
NSString *const AM_MTHD_USER_TERMS = @"user.terms";
NSString *const AM_MTHD_VENUE_GETEVENTS = @"venue.getEvents";
NSString *const AM_MTHD_VENUE_GETPASTEVENTS = @"venue.getPastEvents";
NSString *const AM_MTHD_VENUE_SEARCH = @"venue.search";

#pragma mark Parameter Definitions
NSString *const AM_REQ_PARAM_TOKEN = @"token";
NSString *const AM_REQ_PARAM_USERNAME = @"username";
NSString *const AM_REQ_PARAM_PASSWORD = @"password";
NSString *const AM_REQ_PARAM_MBID = @"mbid";
NSString *const AM_REQ_PARAM_TRACK = @"track";
NSString *const AM_REQ_PARAM_ARTIST = @"artist";
NSString *const AM_REQ_PARAM_AUTOCORRECT = @"autocorrect";
NSString *const AM_REQ_PARAM_TIMESTAMP = @"timestamp";
NSString *const AM_REQ_PARAM_ALBUM = @"album";
NSString *const AM_REQ_PARAM_CONTEXT = @"context";
NSString *const AM_REQ_PARAM_STREAMID = @"streamId";
NSString *const AM_REQ_PARAM_CHOSENBYUSER = @"chosenByUser";
NSString *const AM_REQ_PARAM_TRACKNUMBER = @"trackNumber";
NSString *const AM_REQ_PARAM_ALBUMARTIST = @"albumArtist";
NSString *const AM_REQ_PARAM_DURATION = @"duration";
NSString *const AM_REQ_PARAM_SESSIONKEY = @"sk";
NSString *const AM_REQ_PARAM_LANG = @"lang";

#pragma mark XML Key Definitions
NSString *const AM_XML_KEY_TAGS = @"tags";
NSString *const AM_XML_KEY_TOPTAGS = @"toptags";
NSString *const AM_XML_KEY_TAG = @"tag";
NSString *const AM_XML_KEY_NAME = @"name";
NSString *const AM_XML_KEY_URL = @"url";
NSString *const AM_XML_KEY_MBID = @"mbid";
NSString *const AM_XML_KEY_CORRECTIONS = @"corrections";
NSString *const AM_XML_KEY_CORRECTION = @"correction";
NSString *const AM_XML_KEY_ARTIST = @"artist";
NSString *const AM_XML_KEY_TOKEN = @"token";
NSString *const AM_XML_KEY_SESSION = @"session";
NSString *const AM_XML_KEY_KEY = @"key";
NSString *const AM_XML_KEY_SUBSCRIBER = @"subscriber";
NSString *const AM_XML_KEY_OPENSEARCH_QUERY = @"opensearch:Query";
NSString *const AM_XML_KEY_SEARCHTERMS = @"searchTerms";
NSString *const AM_XML_KEY_STARTPAGE = @"startPage";
NSString *const AM_XML_KEY_OPENSEARCH_TOTALRESULTS = @"opensearch:totalResults";
NSString *const AM_XML_KEY_OPENSEARCH_STARTINDEX = @"opensearch:startIndex";
NSString *const AM_XML_KEY_OPENSEARCH_ITEMSPERPAGE = @"opensearch:itemsPerPage";
NSString *const AM_XML_KEY_ARTISTMATCHES = @"artistmatches";
NSString *const AM_XML_KEY_LISTENERS = @"listeners";
NSString *const AM_XML_KEY_STREAMABLE = @"streamable";
NSString *const AM_XML_KEY_RESULTS = @"results";
NSString *const AM_XML_KEY_LFM = @"lfm";
NSString *const AM_XML_KEY_STATUS = @"status";
NSString *const AM_XML_KEY_ERROR = @"error";
NSString *const AM_XML_KEY_TEXT = @"text";
NSString *const AM_XML_KEY_CODE = @"code";
NSString *const AM_XML_KEY_OK = @"ok";
NSString *const AM_XML_KEY_FAILED = @"failed";

#pragma mark NSDictionary AMNilAddition Extension
@implementation NSDictionary (AMNilAddition)
+(id)dictionaryWithObjectsAndKeysIngnoringNull:(id)firstObject, ...
{
    NSMutableArray* objects = [NSMutableArray array];
    NSMutableArray* keys = [NSMutableArray array];
    
    va_list args;
    va_start(args, firstObject);
    
    for (id object = firstObject; object; object = va_arg(args, id))
    {
        id key = va_arg(args, id);
        if (!key)
        {
            break;
        }
        if (![object isKindOfClass:[NSNull class]])
        {
            [objects addObject:object];
            [keys addObject:key];
        }
        
    }
    va_end(args);
    return [self dictionaryWithObjects:objects forKeys:keys];
}
@end

#pragma mark NSNull AMNilAddition Extension
@implementation NSNull (AMNilAddition)
+(id)nullWhenNil:(id)obj
{
    return (obj ? obj : [self null]);
}
@end

#pragma mark NSString AMNilAddition Extension
@implementation NSString (AMNilAddition)
+(NSString *)emptyStringIfNil:(NSString *)string {
    return string ? string : @"";
}
@end