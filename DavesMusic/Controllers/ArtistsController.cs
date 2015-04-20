using Dapper;
using Newtonsoft.Json;
using StackExchange.Profiling;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace DavesMusic.Controllers {
    public class ArtistsController : Controller {
        MiniProfiler profiler = MiniProfiler.Current;
        string connectionString = ConfigurationManager.ConnectionStrings["DavesMusicConnection2"].ConnectionString;

        [HttpPost]
        public ActionResult Details(ArtistDetailsViewModel vm, string id) {
            // id is ArtistID
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


                // Singles
                if (vm.ArtistSingles != null)
                foreach (var t in vm.ArtistSingles.items) {
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

                            //command.Parameters.AddWithValue("@TrackPreviewURL", t.preview_url);
                            command.Parameters.AddWithValue("@TrackPreviewURL", "");

                            ////command.Parameters.AddWithValue("@AlbumName", t.album.name);
                            command.Parameters.AddWithValue("@AlbumName", "");

                            ////command.Parameters.AddWithValue("@AlbumID", t.album.id);
                            command.Parameters.AddWithValue("@AlbumID", "");

                            command.Parameters.AddWithValue("@AlbumImageURL", t.images[2].url);
                            //string dateOfAlbum = t.album.DateOfAlbumRelease;
                            //DateTime d;
                            //// Maybe its in 2000/01/01
                            //bool r = DateTime.TryParse(dateOfAlbum, out d);
                            //if (!r) {
                            //    // Maybe its in the format 2000
                            //    int year;
                            //    if (Int32.TryParse(dateOfAlbum, out year)) {
                            //        if (DateTime.TryParse(year + "/1/1", out d)) { }
                            //        else {
                            //            d = new DateTime(1900, 1, 1);
                            //        }
                            //    }
                            //}

                            ////command.Parameters.AddWithValue("@AlbumDate", d);
                            command.Parameters.AddWithValue("@AlbumDate", new DateTime(1900, 1, 1));

                            command.CommandType = CommandType.Text;
                            command.ExecuteNonQuery();
                        }
                    }
                    else {
                        // If its been unchecked and is there in the database?
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

            }

            // Get data again as not saved, including Checked status
            var vm2 = GetArtistDetailsViewModel(id);

            return View(vm2);
        }

        string Actual(DateTime time) {
            return (DateTime.Now - time).TotalMilliseconds.ToString();
        }

        async Task<string> CallAPI(int i, string artistID) {
            int offset = 0;
            if (i == 0) offset = 0;
            if (i == 1) offset = 50;
            if (i == 2) offset = 100;

            var url = String.Format("https://api.spotify.com/v1/artists/{0}/albums?country=GB&album_type=album&offset={1}&limit=50", artistID, offset);

            var time = DateTime.Now;
            string result;
            using (var client = new HttpClient()) {
                // ConfigureAwat - do not capture the current ASP.NET request context
                var response = await client.GetAsync(url).ConfigureAwait(false);

                // Not on the original context here, instead we're running on the thread pool
                response.EnsureSuccessStatusCode();
                result = await response.Content.ReadAsStringAsync().ConfigureAwait(false);
            }
            Debug.WriteLine(Actual(time), "After " + i);
            return result;
        }

        public async Task<ActionResult> Details2(string id) {
            // get all albums async
            var artistID = id;
            var sh = new SpotifyHelper();

            // call API synchronously once to get the total number of calls I need to do
            var apiResult = sh.CallSpotifyAPIArtistAlbums(null, artistID);
            ArtistAlbums artistAlbums = JsonConvert.DeserializeObject<ArtistAlbums>(apiResult.Json);
            int total = artistAlbums.total;

            var recordsPerPage = 50;
            var records = total;
            int numberOfTimesToLoop = (records + recordsPerPage - 1) / recordsPerPage;

            if (numberOfTimesToLoop == 1) {
                // don't need to do more calls
                return View(artistAlbums);
            }
            var sw = new Stopwatch();
            sw.Start();

            ServicePointManager.DefaultConnectionLimit = 5;
            int n = numberOfTimesToLoop;
            var tasks = new Task<string>[n];
            for (int i = 0; i < n; i++) {
                tasks[i] = CallAPI(i, artistID);
            }

            await Task.WhenAll(tasks);
            Debug.WriteLine(sw.ElapsedMilliseconds, "After all async tasks");

            // combine results
            var itemsList = new List<ArtistAlbums.Item>();
            int total2 = 0;
            for (int i = 0; i < n; i++) {
                ArtistAlbums albums = JsonConvert.DeserializeObject<ArtistAlbums>(tasks[i].Result);
                foreach (var item in albums.items) {
                    itemsList.Add(item);
                }
                total2 = albums.total;
            }
            var albums2 = new ArtistAlbums();
            albums2.items = itemsList;
            albums2.total = total2;

            return View(albums2);
        }

        [HttpGet]
        public ActionResult Details(string id) {
            var vm = GetArtistDetailsViewModel(id);
            return View(vm);
        }

        private ArtistDetailsViewModel GetArtistDetailsViewModel(string id) {
            string artistID = id;
            var sh = new SpotifyHelper();

            // 1. Getting Artist details from Spotify
            string json;
            using (profiler.Step("1. Getting Artist details from Spotify")) {
                json = sh.CallSpotifyAPIArtist(artistID, null);
            }
            ViewBag.Id = artistID;
            var artistDetails = JsonConvert.DeserializeObject<ArtistDetails>(json);

            // 2. All Artists albums - possibly more than 50!
            APIResult apiResult;
            using (profiler.Step("2. All Artists albums - possibly more than 50!")) {
                apiResult = sh.CallSpotifyAPIArtistAlbums(null, artistID);
            }
            var artistAlbums = JsonConvert.DeserializeObject<ArtistAlbums>(apiResult.Json);

            // Want studio albums only - get rid of live albums and put into another bucket to display too
            IEnumerable<ArtistAlbums.Item> studioAlbums = artistAlbums.items.Where(x => !x.name.ToLower().Contains("live from"));
            studioAlbums = studioAlbums.Where(x => !x.name.ToLower().Contains("live at"));
            studioAlbums = studioAlbums.Where(x => !x.name.ToLower().Contains("(live"));
            studioAlbums = studioAlbums.Where(x => !x.name.ToLower().Contains("live in"));
            studioAlbums = studioAlbums.Where(x => !x.name.ToLower().Contains("greatest hits"));

            // get rid of any dupes - eg Phil Collins has many albums called Tarzan....could use DistinctBy
            studioAlbums = studioAlbums.GroupBy(x => x.name).Select(yy => yy.First());

            //Queen
            //if contains   (Deluxe
            //  or Deluxe
            // take start of the string before that…
            // and check another album exists
            var deluxeAlbums = studioAlbums.Where(x => x.name.ToLower().Contains("(deluxe"));
            // check another album exists
            foreach (var deluxeAlbum in deluxeAlbums) {
                var name = deluxeAlbum.name;
                //var firstBit = name.Substring(0)
                string[] res = name.Split(new string[] { "(Deluxe" }, StringSplitOptions.None);
                var firstBit = res[0];

                // does another album exist with this name but not the deluxe?
                var anohterAlbum = studioAlbums.FirstOrDefault(x => x.name.ToLower().Trim() == firstBit.ToLower().Trim());
                if (anohterAlbum != null) {
                    studioAlbums = studioAlbums.Where(x => x.id != anohterAlbum.id);
                }

                // does another album exist with this name but stuff in brackets
                // eg Queen (Deluxe Edition..) and Queen (2011 Remaster)
                var anohterAlbum2 = studioAlbums.FirstOrDefault(x => x.name.ToLower().Trim().Contains(firstBit.ToLower().Trim() + " ("));
                if (anohterAlbum2 != null) {
                    studioAlbums = studioAlbums.Where(x => x.id != anohterAlbum2.id);
                }
            }

            List<MultipleAlbums.Album> multiAlbumDetails3 = null;
            // The exponents - have no albums (even before filtering)
            if (studioAlbums.Count() > 0) {
                multiAlbumDetails3 = sh.CallSpotifyAPIMultipleAlbumDetails2(null, studioAlbums);
            }

            // 3. Artists Top Tracks
            using (profiler.Step("3. Artists Top Tracks")) {
                apiResult = sh.CallSpotifyAPIArtistTopTracks(null, artistID);
            }
            var artistTopTracks = JsonConvert.DeserializeObject<ArtistTopTracks>(apiResult.Json);

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

            var dictionaryOfNameAndAlbumIDAndNewTrackID = new Dictionary<string, Thing2>();
            // find track name in the earliest album
            foreach (var trackName in top10trackNamesDistinct) {
                MultipleAlbums.Album originalAlbum = null;

                // if there are any remaining albums for this artist (eg Brian May)
                if (multiAlbumDetails3 != null) {
                    var xxx = multiAlbumDetails3.Select(x => x.tracks.items.Where(yy => yy.name == trackName));
                    // Descending so last one, is the earliest one
                    var listOfTrackName = new List<Thing2>();
                    foreach (var album in multiAlbumDetails3.OrderByDescending(al => al.release_date)) {
                        foreach (var track in album.tracks.items) {
                            if (track.name.ToLower() == trackName.ToLower()) {
                                originalAlbum = album;
                            }
                            var t2 = new Thing2 {
                                AlbumID = album.id,
                                TrackID = track.id
                            };
                            listOfTrackName.Add(t2);
                        }
                    }
                }

                if (originalAlbum == null) {
                    // Eminem - guts over fear.. on album Shadyyxv (a compilation)
                    var asdf = distinctTop10.SingleOrDefault(x => x.name == trackName);
                    var t2 = new Thing2 {
                        AlbumID = asdf.album.id,
                        TrackID = asdf.id
                    };
                    dictionaryOfNameAndAlbumIDAndNewTrackID.Add(trackName, t2);
                }
                else {
                    // add the albums trackID rather than whatever it is at the moment (compilation perhaps)
                    // want the last one added to the list
                    var t2 = new Thing2 {
                        AlbumID = originalAlbum.id,
                        TrackID = originalAlbum.tracks.items.FirstOrDefault(x => x.name.ToLower() == trackName.ToLower()).id
                    };
                    dictionaryOfNameAndAlbumIDAndNewTrackID.Add(trackName, t2);
                }
            }

            // Wire up new album if needed
            foreach (var track in distinctTop10) {
                var trackName = track.name;
                track.album.id = dictionaryOfNameAndAlbumIDAndNewTrackID[trackName].AlbumID;
                track.id = dictionaryOfNameAndAlbumIDAndNewTrackID[trackName].TrackID;
            }

            // Iterate through records in db, setting vm checked property for Admin - add to playlist
            var trackIDsTemp = new List<string>();
            using (IDbConnection db = DBHelper.GetOpenConnection()) {
                trackIDsTemp = db.Query<string>("SELECT TrackID FROM Tracks").ToList();
            }

            foreach (var trackID in trackIDsTemp) {
                // Is this track in the current search list?
                var track = distinctTop10.FirstOrDefault(x => x.id == trackID);
                if (track != null) {
                    track.Checked = true;
                }
            }

            // 4. Artists top tracks and get the date that this track/album was released - using GetMultipleAlbums
            var csvStringOfAlbumIDs = "";
            var listOfAlbumIDs = new List<string>();
            foreach (var track in distinctTop10) {
                if (listOfAlbumIDs.Contains(track.album.id)) { }
                else {
                    csvStringOfAlbumIDs += track.album.id + ",";
                    listOfAlbumIDs.Add(track.album.id);
                }
            }
            csvStringOfAlbumIDs = csvStringOfAlbumIDs.TrimEnd(',');
            APIResult apiResult2;
            if (csvStringOfAlbumIDs.Length > 0) {
                using (profiler.Step("4. Artists top tracks and get the date that this track/album was released - using GetMultipleAlbums")) {
                    apiResult2 = sh.CallSpotifyAPIMultipleAlbumDetails(null, csvStringOfAlbumIDs);
                }
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
                    }
                }
            }

            artistTopTracks.tracks = distinctTop10.ToList();

            // 5. Artist's related Artists - top 15
            using (profiler.Step("5. Artist's related Artists - top 15")) {
                apiResult = sh.CallSpotifyAPIArtistRelated(null, artistID);
            }
            var artistRelated = JsonConvert.DeserializeObject<ArtistRelated>(apiResult.Json);
            var y = artistRelated.artists.Take(15).ToList();
            artistRelated.artists = y;


            using (profiler.Step("6. Biography (Echonest)")) {
                apiResult = sh.CallEchonestAPIArtistBiography(null, artistID);
            }
            var artistBiography = JsonConvert.DeserializeObject<ArtistBiography>(apiResult.Json);
            if (artistBiography != null) {
                // Just get last.fm and Wikipedia entries
                if (artistBiography.response.biographies != null) {
                    var a = artistBiography.response.biographies.SingleOrDefault(x => x.url.Contains("wikipedia"));
                    artistBiography.response.biographies.Clear();
                    artistBiography.response.biographies.Add(a);
                }
            }

            // 7. Artists singles
            using (profiler.Step("7. Artists singles")) {
                apiResult = sh.CallSpotifyAPIArtistsSingles(artistID);
            }
            var artistSingles = JsonConvert.DeserializeObject<ArtistAlbums>(apiResult.Json);

            // Iterate through records in db, setting vm checked property for Admin - add to playlist
            //using (IDbConnection db = DBHelper.GetOpenConnection()) {
            //    listTracksAlreadyAdded = db.Query<string>("SELECT TrackID FROM UserPlaylists WHERE UserID = @UserID", new { @UserID = userID }).ToList();
            //}

            //using (var connection = new SqlConnection(connectionString))
            //using (var command = new SqlCommand(null, connection)) {
            //    connection.Open();
            //    command.CommandText = String.Format("SELECT TrackID FROM Tracks");
            //    command.CommandType = CommandType.Text;

            //    var trackIDs = new List<string>();
            //    using (var reader = command.ExecuteReader()) {
            //        while (reader.Read()) {
            //            var trackID = reader.GetString(reader.GetOrdinal("TrackID"));
            //            trackIDs.Add(trackID);
            //        }
            //    }

            // use the query I did above
            foreach (var trackID in trackIDsTemp) {
                // Is this track in the current artist Singles list?
                var track = artistSingles.items.FirstOrDefault(x => x.id == trackID);
                if (track != null) {
                    track.Checked = true;
                }
            }
            //}

            var vm = new ArtistDetailsViewModel {
                ArtistDetails = artistDetails,
                ArtistTopTracks = artistTopTracks,
                ArtistAlbums = multiAlbumDetails3,

                ArtistRelated = artistRelated,
                ArtistBiography = artistBiography,
                ArtistSingles = artistSingles
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
        public ArtistAlbums ArtistSingles { get; set; }

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

    class Thing2 {
        public string AlbumID { get; set; }
        public string TrackID { get; set; }
    }
}