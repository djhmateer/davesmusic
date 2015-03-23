using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace DavesMusic.Controllers {
    public class UsersController : Controller {
        string connectionString = ConfigurationManager.ConnectionStrings["DavesMusicConnection2"].ConnectionString;

        public ActionResult Playlists(string id) {
            var returnURL = "/Users/Playlists";
            var ah = new AuthHelper();
            var result = ah.DoAuth(returnURL, this);
            if (result != null)
                return Redirect(result);

            var vm = GetPlaylistDetailsViewModel(id);
            return View(vm);
        }

        private PlaylistSummaryViewModel GetPlaylistDetailsViewModel(string id) {
            var access_token = Session["AccessToken"].ToString();

            // 50 at a time
            var url2 = String.Format("https://api.spotify.com/v1/users/{0}/playlists?limit=50", id);
            var sh = new SpotifyHelper();
            var result2 = sh.CallSpotifyAPIPassingToken(access_token, url2);

            var vm = JsonConvert.DeserializeObject<PlaylistSummaryViewModel>(result2);
            vm.access_token = access_token;
            return vm;
        }


        [HttpPost]
        public ActionResult Playlists(PlaylistSummaryViewModel vm, string id){
            var userId = id;

            // Create/Update playlist in Spotify
            // like /Playlists/Follow

            var access_token = Session["AccessToken"].ToString();

            var sh = new SpotifyHelper();
            // Does the playlist exist already for this user?
            var url4 = String.Format("https://api.spotify.com/v1/users/{0}/playlists", userId);
            var result4 = sh.CallSpotifyAPIPassingToken(access_token, url4);
            var meReponse = JsonConvert.DeserializeObject<PlaylistSummaryViewModel>(result4);
            var currentPlaylistID = "";
            foreach (var thing in meReponse.items) {
                if (thing.name == "Shuffler") {
                    currentPlaylistID = thing.id;
                }
            }

            // If not playlist create one
            if (currentPlaylistID == "") {
                var url2 = String.Format("https://api.spotify.com/v1/users/{0}/playlists", userId);
                var result2 = sh.CallSpotifyCreatePlaylistPostAPIPassingToken(access_token, url2, "Shuffler");
                var playlistReturn = JsonConvert.DeserializeObject<CreatePlaylistReturn>(result2);
                currentPlaylistID = playlistReturn.id;
            }

            // Go through each Checked playlist and add to Shuffler list
            var listOfTrackIDs = new List<String>();
            foreach (var playlist in vm.items){
                var ownerId = playlist.owner.id;
                var playlistId = playlist.id;
                if (playlist.Checked){
                    // Get the details of the playlist ie the tracks - default limit is 100
                    var url2 = String.Format("https://api.spotify.com/v1/users/{0}/playlists/{1}", ownerId, playlistId);
                    var result2 = sh.CallSpotifyAPIPassingToken(access_token, url2);
                    var meReponse2 = JsonConvert.DeserializeObject<PlaylistDetails>(result2);
                    // add tracks to list
                    foreach (var item in meReponse2.tracks.items) {
                        listOfTrackIDs.Add(item.track.id);
                    }
                }
            }

            // Get first 100 tracks and put into a csv string
            string csvOfUris = "";
            var first100 = listOfTrackIDs.Take(100);
            foreach (var trackID in first100) {
                csvOfUris += "spotify:track:" + trackID + ",";
            }
            csvOfUris = csvOfUris.TrimEnd(',');

            var url3 = String.Format("https://api.spotify.com/v1/users/{0}/playlists/{1}/tracks?uris={2}", userId,
                currentPlaylistID, csvOfUris);

            // this will replace
            var result3 = sh.CallSpotifyPutAPIPassingToken(access_token, url3);



            //var url2 = String.Format("https://api.spotify.com/v1/users/{0}/playlists/{1}/followers", ownerId, playlistId);
            //var result2 = sh.CallSpotifyPutAPIPassingToken(access_token, url2);

            // id is ArtistID
            //using (var connection = new SqlConnection(connectionString))
            //using (var command = new SqlCommand(null, connection)) {
            //    connection.Open();

            //    // Tracks
            //    foreach (var t in vm.ArtistTopTracks.tracks) {
            //        if (t.Checked) {
            //            // Is it already there in the database?
            //            command.CommandText = String.Format("SELECT COUNT(*) FROM Tracks WHERE TrackID = '{0}'", t.id);
            //            command.CommandType = CommandType.Text;
            //            var result = command.ExecuteScalar().ToString();
            //            if (result == "0") {
            //                // Add track to db
            //                command.CommandText =
            //                 "INSERT INTO Tracks (TrackID, TrackName, ArtistName, ArtistID, TrackPreviewURL, AlbumName," +
            //                 "AlbumID, AlbumImageURL, AlbumDate) " +
            //                 "VALUES (@TrackID, @TrackName,@ArtistName,@ArtistID,@TrackPreviewURL, @AlbumName, @AlbumID," +
            //                 "@AlbumImageURL, @AlbumDate)";
            //                command.Parameters.Clear();
            //                command.Parameters.AddWithValue("@TrackID", t.id);
            //                command.Parameters.AddWithValue("@TrackName", t.name);
            //                command.Parameters.AddWithValue("@ArtistName", vm.ArtistDetails.Name);
            //                command.Parameters.AddWithValue("@ArtistID", vm.ArtistDetails.Id);
            //                command.Parameters.AddWithValue("@TrackPreviewURL", t.preview_url);
            //                command.Parameters.AddWithValue("@AlbumName", t.album.name);
            //                command.Parameters.AddWithValue("@AlbumID", t.album.id);
            //                command.Parameters.AddWithValue("@AlbumImageURL", t.album.images[2].url);
            //                string dateOfAlbum = t.album.DateOfAlbumRelease;
            //                DateTime d;
            //                // Maybe its in 2000/01/01
            //                bool r = DateTime.TryParse(dateOfAlbum, out d);
            //                if (!r) {
            //                    // Maybe its in the format 2000
            //                    int year;
            //                    if (Int32.TryParse(dateOfAlbum, out year)) {
            //                        if (DateTime.TryParse(year + "/1/1", out d)) { }
            //                        else {
            //                            d = new DateTime(1900, 1, 1);
            //                        }
            //                    }
            //                }

            //                command.Parameters.AddWithValue("@AlbumDate", d);
            //                command.CommandType = CommandType.Text;
            //                command.ExecuteNonQuery();
            //            }
            //        }
            //        else {
            //            // If its been unchecked and is there in the database?
            //            command.CommandText = String.Format("SELECT COUNT(*) FROM Tracks WHERE TrackID = '{0}'", t.id);

            //            command.CommandType = CommandType.Text;
            //            var result = command.ExecuteScalar().ToString();
            //            if (result != "0") {
            //                command.CommandText = String.Format("DELETE FROM Tracks WHERE TrackID = '{0}'", t.id);
            //                command.CommandType = CommandType.Text;
            //                command.ExecuteNonQuery();
            //            }
            //        }
            //    }


            //    // Singles
            //    foreach (var t in vm.ArtistSingles.items) {
            //        if (t.Checked) {
            //            // Is it already there in the database?
            //            command.CommandText = String.Format("SELECT COUNT(*) FROM Tracks WHERE TrackID = '{0}'", t.id);
            //            command.CommandType = CommandType.Text;
            //            var result = command.ExecuteScalar().ToString();
            //            if (result == "0") {
            //                // Add track to db
            //                command.CommandText =
            //                 "INSERT INTO Tracks (TrackID, TrackName, ArtistName, ArtistID, TrackPreviewURL, AlbumName," +
            //                 "AlbumID, AlbumImageURL, AlbumDate) " +
            //                 "VALUES (@TrackID, @TrackName,@ArtistName,@ArtistID,@TrackPreviewURL, @AlbumName, @AlbumID," +
            //                 "@AlbumImageURL, @AlbumDate)";
            //                command.Parameters.Clear();
            //                command.Parameters.AddWithValue("@TrackID", t.id);
            //                command.Parameters.AddWithValue("@TrackName", t.name);
            //                command.Parameters.AddWithValue("@ArtistName", vm.ArtistDetails.Name);
            //                command.Parameters.AddWithValue("@ArtistID", vm.ArtistDetails.Id);

            //                //command.Parameters.AddWithValue("@TrackPreviewURL", t.preview_url);
            //                command.Parameters.AddWithValue("@TrackPreviewURL", "");

            //                ////command.Parameters.AddWithValue("@AlbumName", t.album.name);
            //                command.Parameters.AddWithValue("@AlbumName", "");

            //                ////command.Parameters.AddWithValue("@AlbumID", t.album.id);
            //                command.Parameters.AddWithValue("@AlbumID", "");

            //                command.Parameters.AddWithValue("@AlbumImageURL", t.images[2].url);
            //                //string dateOfAlbum = t.album.DateOfAlbumRelease;
            //                //DateTime d;
            //                //// Maybe its in 2000/01/01
            //                //bool r = DateTime.TryParse(dateOfAlbum, out d);
            //                //if (!r) {
            //                //    // Maybe its in the format 2000
            //                //    int year;
            //                //    if (Int32.TryParse(dateOfAlbum, out year)) {
            //                //        if (DateTime.TryParse(year + "/1/1", out d)) { }
            //                //        else {
            //                //            d = new DateTime(1900, 1, 1);
            //                //        }
            //                //    }
            //                //}

            //                ////command.Parameters.AddWithValue("@AlbumDate", d);
            //                command.Parameters.AddWithValue("@AlbumDate", new DateTime(1900, 1, 1));

            //                command.CommandType = CommandType.Text;
            //                command.ExecuteNonQuery();
            //            }
            //        }
            //        else {
            //            // If its been unchecked and is there in the database?
            //            command.CommandText = String.Format("SELECT COUNT(*) FROM Tracks WHERE TrackID = '{0}'", t.id);

            //            command.CommandType = CommandType.Text;
            //            var result = command.ExecuteScalar().ToString();
            //            if (result != "0") {
            //                command.CommandText = String.Format("DELETE FROM Tracks WHERE TrackID = '{0}'", t.id);
            //                command.CommandType = CommandType.Text;
            //                command.ExecuteNonQuery();
            //            }
            //        }
            //    }

            //}

            //// Get data again as not saved, including Checked status
            var vm2 = GetPlaylistDetailsViewModel(id);
            return View(vm2);
        }


    }

    public class PlaylistSummaryViewModel {
        public class ExternalUrls {
            public string spotify { get; set; }
        }

        public class Image {
            public int? height { get; set; }
            public string url { get; set; }
            public int? width { get; set; }
        }

        public class ExternalUrls2 {
            public string spotify { get; set; }
        }

        public class Owner {
            public ExternalUrls2 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class Tracks {
            public string href { get; set; }
            public int total { get; set; }
        }

        public class Item {
            public bool collaborative { get; set; }
            public ExternalUrls external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public List<Image> images { get; set; }
            public string name { get; set; }
            public Owner owner { get; set; }
            public bool @public { get; set; }
            public Tracks tracks { get; set; }
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
        public string access_token { get; set; }
    }
}