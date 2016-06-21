using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

// test
namespace DavesMusic.Controllers {
    public class AlbumsController : Controller {
        string connectionString = ConfigurationManager.ConnectionStrings["DavesMusicConnection2"].ConnectionString;

        [HttpPost]
        public ActionResult Details(AlbumDetailsViewModel vm, string id) {
            // id is AlbumID?
            using (var connection = new SqlConnection(connectionString))
            using (var command = new SqlCommand(null, connection)) {
                connection.Open();
                // Tracks
                foreach (var t in vm.AlbumDetails.tracks.items) {
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
                            //command.Parameters.AddWithValue("@ArtistName", vm.ArtistDetails.Name);
                            command.Parameters.AddWithValue("@ArtistName", vm.AlbumDetails.artists[0].name);

                            command.Parameters.AddWithValue("@ArtistID", vm.AlbumDetails.artists[0].id);
                            command.Parameters.AddWithValue("@TrackPreviewURL", t.preview_url);
                            //command.Parameters.AddWithValue("@AlbumName", t.album.name);
                            command.Parameters.AddWithValue("@AlbumName", vm.AlbumDetails.name);

                            //command.Parameters.AddWithValue("@AlbumID", t.album.id);
                            command.Parameters.AddWithValue("@AlbumID", vm.AlbumDetails.id);

                            //command.Parameters.AddWithValue("@AlbumImageURL", t.album.images[2].url);
                            command.Parameters.AddWithValue("@AlbumImageURL", vm.AlbumDetails.images[2].url);

                            //string dateOfAlbum = t.album.DateOfAlbumRelease;
                            string dateOfAlbum = vm.AlbumDetails.release_date;

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
            }

            // Get data again as not saved, including Checked status
            var vm2 = GetAlbumDetailsViewModel(id);

            return View(vm2);
        }


        public ActionResult Details(string id){
            var vm = GetAlbumDetailsViewModel(id);
            return View(vm);
        }

        private AlbumDetailsViewModel GetAlbumDetailsViewModel(string id){
            var spotifyHelper = new SpotifyHelper();
            var stopWatchResult = new StopWatchResult();
            var apiResult = spotifyHelper.CallSpotifyAPIAlbumDetails(stopWatchResult, id);
            ViewBag.Id = id;
            var albumDetails = JsonConvert.DeserializeObject<AlbumDetails>(apiResult.Json);

            // iterate through setting vm checked property
            using (var connection = new SqlConnection(connectionString))
            using (var command = new SqlCommand(null, connection)) {
                connection.Open();
                command.CommandText = String.Format("SELECT TrackID FROM Tracks");
                command.CommandType = CommandType.Text;

                var trackIDsSelectedInDb = new List<string>();
                using (var reader = command.ExecuteReader()) {
                    while (reader.Read()) {
                        var trackID = reader.GetString(reader.GetOrdinal("TrackID"));
                        trackIDsSelectedInDb.Add(trackID);
                    }
                }

                foreach (var trackID in trackIDsSelectedInDb) {
                    var track = albumDetails.tracks.items.FirstOrDefault(x => x.id == trackID);
                    if (track != null) {
                        track.Checked = true;
                    }
                }
            }

            var vm = new AlbumDetailsViewModel{
                APIDebugList = null,
                AlbumDetails = albumDetails,
            };
            return vm;
        }
    }

    public class AlbumDetailsViewModel {
        public List<APIDebug> APIDebugList { get; set; }
        public AlbumDetails AlbumDetails { get; set; }
    }

    public class AlbumDetails {
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
            public List<object> available_markets { get; set; }
            public int disc_number { get; set; }
            public int duration_ms { get; set; }
            public bool @explicit { get; set; }
            public ExternalUrls4 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string name { get; set; }
            //public object preview_url { get; set; }
            public string preview_url { get; set; }

            public int track_number { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
            public bool Checked { get; set; }
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

        public string album_type { get; set; }
        public List<Artist> artists { get; set; }
        public List<object> available_markets { get; set; }
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
        public DateTime releaseDateTime { get; set; }

        public string release_date_precision { get; set; }
        public Tracks tracks { get; set; }
        public string type { get; set; }
        public string uri { get; set; }
        // dave added
        public string access_token { get; set; }
    }
}