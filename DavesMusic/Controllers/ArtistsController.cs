using System.Data;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Mvc;

namespace DavesMusic.Controllers {
    public class ArtistsController : Controller {
        string connectionString = ConfigurationManager.ConnectionStrings["DavesMusicConnection2"].ConnectionString;

        [HttpPost]
        public ActionResult Details(ArtistDetailsViewModel vm, string id) {
            var sh = new SpotifyHelper();
            using (var connection = new SqlConnection(connectionString))
            using (var command = new SqlCommand(null, connection)) {
                connection.Open();
                // Tracks
                foreach (var t in vm.ArtistTopTracks.tracks) {
                    if (t.Checked) {
                        // Is it already there in the database?
                        command.CommandText = String.Format("SELECT COUNT(*) FROM Tracks WHERE TrackID = '{0}'", t.id);
                        command.CommandType = CommandType.Text;
                        var result = command.ExecuteScalar().ToString();
                        if (result == "0") {
                            // Add track to db
                            command.CommandText =
                             "INSERT INTO Tracks (TrackID, TrackName, ArtistName, ArtistID, TrackPreviewURL, AlbumName," +
                             "AlbumID, AlbumImageURL, AlbumDate) " +
                             "VALUES (@TrackID, @TrackName,@ArtistName,@ArtistID,@TrackPreviewURL, @AlbumName, @AlbumID," +
                             "@AlbumImageURL, @AlbumDate)";
                            command.Parameters.Clear();
                            command.Parameters.AddWithValue("@TrackID", t.id);
                            command.Parameters.AddWithValue("@TrackName", t.name);
                            command.Parameters.AddWithValue("@ArtistName", vm.ArtistDetails.Name);
                            command.Parameters.AddWithValue("@ArtistID", vm.ArtistDetails.Id);
                            command.Parameters.AddWithValue("@TrackPreviewURL", t.preview_url);
                            command.Parameters.AddWithValue("@AlbumName", t.album.name);
                            command.Parameters.AddWithValue("@AlbumID", t.album.id);
                            command.Parameters.AddWithValue("@AlbumImageURL", t.album.images[2].url);
                            string dateOfAlbum = t.album.DateOfAlbumRelease;
                            DateTime d;
                            // Maybe its in 2000/01/01
                            bool r = DateTime.TryParse(dateOfAlbum, out d);
                            if (!r) {
                                // Maybe its in the format 2000
                                int year;
                                if (Int32.TryParse(dateOfAlbum, out year)) {
                                    if (DateTime.TryParse(year + "/1/1", out d)) { }
                                    else {
                                        d = new DateTime(1900, 1, 1);
                                    }
                                }
                            }

                            command.Parameters.AddWithValue("@AlbumDate", d);
                            command.CommandType = CommandType.Text;
                            command.ExecuteNonQuery();
                        }
                    }
                    else {
                        // If its been unchecked and is there in the database?
                        //command.CommandText = String.Format("SELECT COUNT(*) FROM Playlist WHERE TrackID = '{0}'", t.id);
                        command.CommandText = String.Format("SELECT COUNT(*) FROM Tracks WHERE TrackID = '{0}'", t.id);

                        command.CommandType = CommandType.Text;
                        var result = command.ExecuteScalar().ToString();
                        if (result != "0") {
                            command.CommandText = String.Format("DELETE FROM Tracks WHERE TrackID = '{0}'", t.id);
                            command.CommandType = CommandType.Text;
                            command.ExecuteNonQuery();
                        }
                    }
                }

                // Albums - Iterate through vm and save the checked albums id's to db
                //foreach (var album in vm.ArtistAlbums.items) {
                foreach (var album in vm.ArtistAlbums) {
                    if (album.Checked) {
                        // Is it already there in the database?
                        command.CommandText = String.Format("SELECT COUNT(*) FROM Playlist WHERE AlbumID = '{0}'", album.id);
                        command.CommandType = CommandType.Text;
                        var result = command.ExecuteScalar().ToString();
                        if (result == "0") {
                            // Get all the tracks from this album

                            var result2 = sh.CallSpotifyAPIAlbumDetails(null, album.id);
                            var albumDetails = JsonConvert.DeserializeObject<AlbumDetails>(result2.Json);
                            // Insert each track into the database
                            foreach (var track in albumDetails.tracks.items) {
                                command.CommandText = String.Format("INSERT INTO Playlist (AlbumID, TrackID, TrackName, AlbumName) VALUES ('{0}', '{1}', @TrackName,'{2}')", album.id, track.id, album.name);
                                command.Parameters.Clear();
                                command.Parameters.AddWithValue("@TrackName", track.name);

                                command.CommandType = CommandType.Text;
                                command.ExecuteNonQuery();
                            }
                        }
                    }
                    else {
                        // If its been unchecked and is there in the database?
                        command.CommandText = String.Format("SELECT COUNT(*) FROM Playlist WHERE AlbumID = '{0}'", album.id);
                        command.CommandType = CommandType.Text;
                        var result = command.ExecuteScalar().ToString();
                        if (result != "0") {
                            command.CommandText = String.Format("DELETE FROM Playlist WHERE AlbumID = '{0}'", album.id);
                            command.CommandType = CommandType.Text;
                            command.ExecuteNonQuery();
                        }
                    }
                }
            }

            // Get data again as not saved, including Checked status
            var vm2 = GetArtistDetailsViewModel(id);

            return View(vm2);
        }

        [HttpGet]
        public ActionResult Details(string id) {
            var vm = GetArtistDetailsViewModel(id);
            return View(vm);
        }

        private ArtistDetailsViewModel GetArtistDetailsViewModel(string id) {
            var apiHelper = new SpotifyHelper();
            // 1. Get the Artist's details
            var stopWatchResult = new StopWatchResult();
            string json = apiHelper.CallSpotifyAPIArtist(stopWatchResult: stopWatchResult, artistCode: id);
            ViewBag.Id = id;
            var artistDetails = JsonConvert.DeserializeObject<ArtistDetails>(json);

            var apiDebugList = new List<APIDebug>();
            var apiDebug = new APIDebug {
                APITime = String.Format("{0:0}", stopWatchResult.ElapsedTime.TotalMilliseconds),
                APIURL = artistDetails.Href,
                APITimeSpan = stopWatchResult.ElapsedTime
            };
            apiDebugList.Add(apiDebug);



            // 4. All Artists albums - possibly more than 50!
            var sh = new SpotifyHelper();
            var apiResult = apiHelper.CallSpotifyAPIArtistAlbums(stopWatchResult, id);
            var artistAlbums = JsonConvert.DeserializeObject<ArtistAlbums>(apiResult.Json);

            // Want studio albums only - get rid of live albums and put into another bucket to display too
            IEnumerable<ArtistAlbums.Item> studioAlbums = artistAlbums.items.Where(x => !x.name.ToLower().Contains("live from"));
            studioAlbums = studioAlbums.Where(x => !x.name.ToLower().Contains("live at"));
            studioAlbums = studioAlbums.Where(x => !x.name.ToLower().Contains("(live"));
            studioAlbums = studioAlbums.Where(x => !x.name.ToLower().Contains("live in"));
            studioAlbums = studioAlbums.Where(x => !x.name.ToLower().Contains("greatest hits"));

            // 4.5 Get full album information (20 at a time)
            //var csvStringOfAlbumIDs = "";
            ////foreach (var album in studioAlbums.Take(20)) {
            //foreach (var album in studioAlbums) {
            //    csvStringOfAlbumIDs += album.id + ",";
            //}
            //csvStringOfAlbumIDs = csvStringOfAlbumIDs.TrimEnd(',');

            List<MultipleAlbums.Album> multiAlbumDetails3 = sh.CallSpotifyAPIMultipleAlbumDetails2(stopWatchResult, studioAlbums);
            //var apiDebug3 = new APIDebug {
            //    APITime = String.Format("{0:0}", stopWatchResult.ElapsedTime.TotalMilliseconds),
            //    APIURL = apiResult3.Url,
            //    APITimeSpan = stopWatchResult.ElapsedTime
            //};
            //apiDebugList.Add(apiDebug3);
            //var multiAlbumDetails3 = JsonConvert.DeserializeObject<MultipleAlbums>(apiResult3.Json);

            // set Checked status of ArtistAlbums
            // Iterate through records in db, setting vm checked property
            using (var connection = new SqlConnection(connectionString))
            using (var command = new SqlCommand(null, connection)) {
                connection.Open();
                command.CommandText = String.Format("SELECT AlbumID FROM Playlist");
                command.CommandType = CommandType.Text;

                var albumIDs = new List<string>();
                using (var reader = command.ExecuteReader()) {
                    while (reader.Read()) {
                        var albumID = reader.GetString(reader.GetOrdinal("AlbumID"));
                        albumIDs.Add(albumID);
                    }
                }

                foreach (var albumID in albumIDs) {
                    // Is this album in the current search list?
                    var album = multiAlbumDetails3.FirstOrDefault(x => x.id == albumID);

                    if (album != null) {
                        album.Checked = true;
                    }
                }
            }

            apiDebug = new APIDebug {
                APITime = String.Format("{0:0}", stopWatchResult.ElapsedTime.TotalMilliseconds),
                APIURL = apiResult.Url,
                APITimeSpan = stopWatchResult.ElapsedTime
            };
            apiDebugList.Add(apiDebug);




            // 2. Artists Top Tracks
            apiResult = apiHelper.CallSpotifyAPIArtistTopTracks(stopWatchResult, id);
            var artistTopTracks = JsonConvert.DeserializeObject<ArtistTopTracks>(apiResult.Json);
            apiDebug = new APIDebug {
                APITime = String.Format("{0:0}", stopWatchResult.ElapsedTime.TotalMilliseconds),
                APIURL = apiResult.Url,
                APITimeSpan = stopWatchResult.ElapsedTime
            };
            apiDebugList.Add(apiDebug);

            var tracks = artistTopTracks.tracks;
            var distinctTop10 = new List<ArtistTopTracks.Track>();
            List<ArtistTopTracks.Track> top10 = tracks.OrderByDescending(x => x.popularity).Take(10).ToList();

            // problem is that some tracks are related to their "Greatest Hits compilation" / not original album
            // eg Black Crowes - Twice as Hard (#2) related to Greatest Hits 1990-1999
            // take the track name, and find the earliest album it is on..

            IList<string> top10trackNames = top10.Select(x => x.name).ToList();
            var top10trackNamesDistinct = top10trackNames.Distinct(StringComparer.CurrentCultureIgnoreCase);

            foreach (var trackName in top10trackNamesDistinct) {
                var track = top10.FirstOrDefault(x => x.name == trackName);
                distinctTop10.Add(track);
            }

            var dictionaryOfNameAndAlbumID = new Dictionary<string, string>();
            // find track name in the earliest album
            foreach (var trackName in top10trackNamesDistinct) {
                MultipleAlbums.Album originalAlbum = null;

                var xxx = multiAlbumDetails3.Select(x => x.tracks.items.Where(yy => yy.name == trackName));
                // Descending so last one, is the earliest one
                var listOfTrackName = new List<string>();
                foreach (var album in multiAlbumDetails3.OrderByDescending(al => al.release_date)) {
                    foreach (var track in album.tracks.items) {
                        if (track.name.ToLower() == trackName.ToLower()) {
                            originalAlbum = album;
                        }
                        listOfTrackName.Add(track.name);
                    }
                }
                // take off anything like (Remastered 2011)??

                if (originalAlbum == null){
                    // Eminem - guts over fear.. on album Shadyyxv (a compilation)
                    var asdf = distinctTop10.SingleOrDefault(x => x.name == trackName);
                    dictionaryOfNameAndAlbumID.Add(trackName, asdf.album.id);
                }
                else{
                    dictionaryOfNameAndAlbumID.Add(trackName, originalAlbum.id);
                }
            }

            // Wire up new album if needed
            foreach (var track in distinctTop10) {
                var trackName = track.name;
                var originalAlbumID = dictionaryOfNameAndAlbumID[trackName];
                track.album.id = originalAlbumID;
            }

            // Iterate through records in db, setting vm checked property for Admin - add to playlist
            using (var connection = new SqlConnection(connectionString))
            using (var command = new SqlCommand(null, connection)) {
                connection.Open();
                command.CommandText = String.Format("SELECT TrackID FROM Tracks");
                command.CommandType = CommandType.Text;

                var trackIDs = new List<string>();
                using (var reader = command.ExecuteReader()) {
                    while (reader.Read()) {
                        var trackID = reader.GetString(reader.GetOrdinal("TrackID"));
                        trackIDs.Add(trackID);
                    }
                }

                foreach (var trackID in trackIDs) {
                    // Is this track in the current search list?
                    var track = distinctTop10.FirstOrDefault(x => x.id == trackID);
                    if (track != null) {
                        track.Checked = true;
                    }
                }
            }
            //artistTopTracks.tracks = deDupedTop10.ToList();

            // 3. Top10 tracks and get the date that this track/album was released - using GetMultipleAlbums
            var csvStringOfAlbumIDs = "";
            var listOfAlbumIDs = new List<string>();
            //studioAlbums

            foreach (var track in distinctTop10) {
                if (listOfAlbumIDs.Contains(track.album.id)) { }
                else {
                    csvStringOfAlbumIDs += track.album.id + ",";
                    listOfAlbumIDs.Add(track.album.id);
                }
            }
            csvStringOfAlbumIDs = csvStringOfAlbumIDs.TrimEnd(',');

            var apiResult2 = sh.CallSpotifyAPIMultipleAlbumDetails(stopWatchResult, csvStringOfAlbumIDs);
            apiDebug = new APIDebug {
                APITime = String.Format("{0:0}", stopWatchResult.ElapsedTime.TotalMilliseconds),
                APIURL = apiResult2.Url,
                APITimeSpan = stopWatchResult.ElapsedTime
            };
            apiDebugList.Add(apiDebug);

            var multiAlbumDetails = JsonConvert.DeserializeObject<MultipleAlbums>(apiResult2.Json);
            foreach (var album in multiAlbumDetails.albums) {
                // get all associated albums in top10
                var albumInTop10s = distinctTop10.Where(x => x.album.id == album.id);

                foreach (var album2 in albumInTop10s) {
                    album2.album.DateOfAlbumRelease = album.release_date;
                    album2.album.name = album.name;
                    album2.album.uri = album.uri;

                    //images
                    var images = new List<ArtistTopTracks.Image>();
                    foreach (var image in album.images) {
                        var att = new ArtistTopTracks.Image();
                        att.height = image.height;
                        att.width = image.width;
                        att.url = image.url;
                        images.Add(att);
                    }

                    album2.album.images = images;
                    //album2.album.DateOfAlbumRelease = "1999";
                }
            }

            artistTopTracks.tracks = distinctTop10.ToList();


            // 5. Artist's related Artists - top 7
            apiResult = apiHelper.CallSpotifyAPIArtistRelated(stopWatchResult, id);
            var artistRelated = JsonConvert.DeserializeObject<ArtistRelated>(apiResult.Json);
            var y = artistRelated.artists.Take(7).ToList();
            artistRelated.artists = y;
            apiDebug = new APIDebug {
                APITime = String.Format("{0:0}", stopWatchResult.ElapsedTime.TotalMilliseconds),
                APIURL = apiResult.Url,
                APITimeSpan = stopWatchResult.ElapsedTime
            };
            apiDebugList.Add(apiDebug);

            // 6. Biography (Echonest)
            apiResult = apiHelper.CallEchonestAPIArtistBiography(stopWatchResult, id);
            var artistBiography = JsonConvert.DeserializeObject<ArtistBiography>(apiResult.Json);
            if (artistBiography != null) {
                // Just get last.fm and Wikipedia entries
                if (artistBiography.response.biographies != null) {
                    var a = artistBiography.response.biographies.SingleOrDefault(x => x.url.Contains("wikipedia"));
                    artistBiography.response.biographies.Clear();
                    artistBiography.response.biographies.Add(a);
                }
            }
            apiDebug = new APIDebug {
                APITime = String.Format("{0:0}", stopWatchResult.ElapsedTime.TotalMilliseconds),
                APIURL = apiResult.Url,
                APITimeSpan = stopWatchResult.ElapsedTime

            };
            apiDebugList.Add(apiDebug);

            // Get total time in API calls
            var ts = new TimeSpan();
            foreach (var apiDebug2 in apiDebugList) {
                ts = ts + apiDebug2.APITimeSpan;
            }
            var vm = new ArtistDetailsViewModel {
                APIDebugList = apiDebugList,
                ArtistDetails = artistDetails,
                ArtistTopTracks = artistTopTracks,
                //ArtistAlbums = artistAlbums,
                //ArtistAlbums = multiAlbumDetails3,
                ArtistAlbums = multiAlbumDetails3,

                ArtistRelated = artistRelated,
                ArtistBiography = artistBiography,
                TotalTimeInMSOfAPICalls = String.Format("{0:0}", ts.TotalMilliseconds)
            };
            return vm;
        }
    }


    public class MultipleAlbums {
        public class ExternalUrls {
            public string spotify { get; set; }
        }

        public class Artist {
            public ExternalUrls external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string name { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class Copyright {
            public string text { get; set; }
            public string type { get; set; }
        }

        public class ExternalIds {
            public string upc { get; set; }
        }

        public class ExternalUrls2 {
            public string spotify { get; set; }
        }

        public class Image {
            public int height { get; set; }
            public string url { get; set; }
            public int width { get; set; }
        }

        public class ExternalUrls3 {
            public string spotify { get; set; }
        }

        public class Artist2 {
            public ExternalUrls3 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string name { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class ExternalUrls4 {
            public string spotify { get; set; }
        }

        public class Item {
            public List<Artist2> artists { get; set; }
            public List<string> available_markets { get; set; }
            public int disc_number { get; set; }
            public int duration_ms { get; set; }
            public bool @explicit { get; set; }
            public ExternalUrls4 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string name { get; set; }
            public string preview_url { get; set; }
            public int track_number { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class Tracks {
            public string href { get; set; }
            public List<Item> items { get; set; }
            public int limit { get; set; }
            public object next { get; set; }
            public int offset { get; set; }
            public object previous { get; set; }
            public int total { get; set; }
        }

        public class Album {
            public string album_type { get; set; }
            public List<Artist> artists { get; set; }
            public List<string> available_markets { get; set; }
            public List<Copyright> copyrights { get; set; }
            public ExternalIds external_ids { get; set; }
            public ExternalUrls2 external_urls { get; set; }
            public List<object> genres { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public List<Image> images { get; set; }
            public string name { get; set; }
            public int popularity { get; set; }
            public string release_date { get; set; }
            public string release_date_precision { get; set; }
            public Tracks tracks { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
            public bool Checked { get; set; }
        }

        public List<Album> albums { get; set; }
    }


    public class ArtistBiography {
        public class Status {
            public string version { get; set; }
            public int code { get; set; }
            public string message { get; set; }
        }

        public class License {
            public string type { get; set; }
            public string attribution { get; set; }
            //public string __invalid_name__attribution-url { get; set; }
            public string url { get; set; }
            public string version { get; set; }
        }

        public class Biography {
            public string text { get; set; }
            public string site { get; set; }
            public string url { get; set; }
            public License license { get; set; }
            public bool truncated { get; set; }
        }

        public class Response {
            public Status status { get; set; }
            public int start { get; set; }
            public int total { get; set; }
            public List<Biography> biographies { get; set; }
        }

        public Response response { get; set; }
    }

    public class ArtistRelated {
        public class ExternalUrls {
            public string spotify { get; set; }
        }

        public class Followers {
            public object href { get; set; }
            public int total { get; set; }
        }

        public class Image {
            public int height { get; set; }
            public string url { get; set; }
            public int width { get; set; }
        }

        public class Artist {
            public ExternalUrls external_urls { get; set; }
            public Followers followers { get; set; }
            public List<object> genres { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public List<Image> images { get; set; }
            public string name { get; set; }
            public int popularity { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public List<Artist> artists { get; set; }
    }

    public class ArtistAlbums {
        public class ExternalUrls {
            public string spotify { get; set; }
        }

        public class Image {
            public int height { get; set; }
            public string url { get; set; }
            public int width { get; set; }
        }

        public class Item {
            public string album_type { get; set; }
            public List<string> available_markets { get; set; }
            public ExternalUrls external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public List<Image> images { get; set; }
            public string name { get; set; }
            public string type { get; set; }
            public string uri { get; set; }

            public bool Checked { get; set; }
        }

        public string href { get; set; }
        public List<Item> items { get; set; }
        public int limit { get; set; }
        public string next { get; set; }
        public int offset { get; set; }
        public object previous { get; set; }
        public int total { get; set; }
    }

    public class APIDebug {
        public string APITime { get; set; }
        public string APIURL { get; set; }
        public TimeSpan APITimeSpan { get; set; }
    }

    public class ArtistDetailsViewModel {
        public List<APIDebug> APIDebugList { get; set; }
        public ArtistDetails ArtistDetails { get; set; }
        public ArtistTopTracks ArtistTopTracks { get; set; }
        //public MultipleAlbums ArtistAlbums { get; set; }
        public List<MultipleAlbums.Album> ArtistAlbums { get; set; }
        public ArtistRelated ArtistRelated { get; set; }
        public ArtistBiography ArtistBiography { get; set; }
        public string TotalTimeInMSOfAPICalls { get; set; }
    }

    public class ArtistTopTracks {
        public List<Track> tracks { get; set; }
        public class Track {
            public Album album { get; set; }
            public List<Artist> artists { get; set; }
            public List<string> available_markets { get; set; }
            public int disc_number { get; set; }
            public int duration_ms { get; set; }
            public bool @explicit { get; set; }
            public ExternalIds external_ids { get; set; }
            public ExternalUrls3 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string name { get; set; }
            public int popularity { get; set; }
            public string preview_url { get; set; }
            public int track_number { get; set; }
            public string type { get; set; }
            public string uri { get; set; }

            public bool Checked { get; set; }
        }
        public class ExternalUrls {
            public string spotify { get; set; }
        }

        public class Image {
            public int height { get; set; }
            public string url { get; set; }
            public int width { get; set; }
        }

        public class Album {
            public string album_type { get; set; }
            public List<string> available_markets { get; set; }
            public ExternalUrls external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public List<Image> images { get; set; }
            public string name { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
            public string DateOfAlbumRelease { get; set; }
        }

        public class ExternalUrls2 {
            public string spotify { get; set; }
        }

        public class Artist {
            public ExternalUrls2 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string name { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class ExternalIds {
            public string isrc { get; set; }
        }

        public class ExternalUrls3 {
            public string spotify { get; set; }
        }
    }

    public class ArtistDetails {
        public class ExternalUrls {
            public string Spotify { get; set; }
        }
        public ExternalUrls external_urls { get; set; }

        public class Followers {
            public object href { get; set; }
            public int Total { get; set; }
        }
        public Followers followers { get; set; }
        public string Href { get; set; }
        public string Id { get; set; }
        public class Image {
            public int Height { get; set; }
            public string URL { get; set; }
            public int Width { get; set; }
        }
        public List<Image> Images { get; set; }

        public string Name { get; set; }
        public int Popularity { get; set; }
        public string Type { get; set; }
        public string Uri { get; set; }
    }
}