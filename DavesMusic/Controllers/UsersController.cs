using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace DavesMusic.Controllers {

    public class Thing {
            public string href { get; set; }
            public Item[] items { get; set; }
            public int limit { get; set; }
            public string next { get; set; }
            public int offset { get; set; }
            public string previous { get; set; }
            public int total { get; set; }

        public class Item {
            public DateTime added_at { get; set; }
            public Added_By added_by { get; set; }
            public bool is_local { get; set; }
            public Track track { get; set; }
        }

        public class Added_By {
            public External_Urls external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class External_Urls {
            public string spotify { get; set; }
        }

        public class Track {
            public Album album { get; set; }
            public Artist[] artists { get; set; }
            public string[] available_markets { get; set; }
            public int disc_number { get; set; }
            public int duration_ms { get; set; }
            public bool _explicit { get; set; }
            public External_Ids external_ids { get; set; }
            public External_Urls2 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string name { get; set; }
            public int popularity { get; set; }
            public string preview_url { get; set; }
            public int track_number { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
            public Linked_From linked_from { get; set; }
        }

        public class Album {
            public string album_type { get; set; }
            public string[] available_markets { get; set; }
            public External_Urls1 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public Image[] images { get; set; }
            public string name { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class External_Urls1 {
            public string spotify { get; set; }
        }

        public class Image {
            public int height { get; set; }
            public string url { get; set; }
            public int width { get; set; }
        }

        public class External_Ids {
            public string isrc { get; set; }
        }

        public class External_Urls2 {
            public string spotify { get; set; }
        }

        public class Linked_From {
            public External_Urls3 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class External_Urls3 {
            public string spotify { get; set; }
        }

        public class Artist {
            public External_Urls4 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string name { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class External_Urls4 {
            public string spotify { get; set; }
        }

    }

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
        public ActionResult Playlists(PlaylistSummaryViewModel vm, string id) {
            ServicePointManager.DefaultConnectionLimit = 5;

            var userId = id;
            var access_token = Session["AccessToken"].ToString();
            var sh = new SpotifyHelper();

            // Create/Update playlist in Spotify
            // like /Playlists/Follow

            // Does the playlist exist already for this user?
            var url4 = String.Format("https://api.spotify.com/v1/users/{0}/playlists", userId);
            var result4 = sh.CallSpotifyAPIPassingToken(access_token, url4);
            var meReponse = JsonConvert.DeserializeObject<PlaylistSummaryViewModel>(result4);
            var currentPlaylistID = "";
            var shuffler = meReponse.items.FirstOrDefault(x => x.name == "Shuffler");
            if (shuffler != null) currentPlaylistID = shuffler.id;

            // If not playlist create one
            if (currentPlaylistID == "") {
                var url2 = String.Format("https://api.spotify.com/v1/users/{0}/playlists", userId);
                var result2 = sh.CallSpotifyCreatePlaylistPostAPIPassingToken(access_token, url2, "Shuffler");
                var playlistReturn = JsonConvert.DeserializeObject<CreatePlaylistReturn>(result2);
                currentPlaylistID = playlistReturn.id;
            }

            // Go through each Checked playlist and add to Shuffler list
            var listOfTrackIDs = new List<String>();
            
            foreach (var playlist in vm.items) {
                var ownerId = playlist.owner.id;
                var playlistId = playlist.id;
                if (playlist.Checked) {
                    // Get the details of the playlist ie the tracks - default return limit is 100 ***HERE***
                    var url2 = String.Format("https://api.spotify.com/v1/users/{0}/playlists/{1}", ownerId, playlistId);
                    var result2 = sh.CallSpotifyAPIPassingToken(access_token, url2);
                    //var result22 = sh.CallSpotifyAPIPassingTokenPlaylistsAsync(access_token, url2);
                    //result22.Wait();
                    //var result2 = result22.Result;
                    var meReponse2 = JsonConvert.DeserializeObject<PlaylistDetails>(result2);
                    // add tracks to list
                    foreach (var item in meReponse2.tracks.items) {
                        listOfTrackIDs.Add(item.track.id);
                    }

                    // are there more playlist tracks to come from Spotify?
                    if (meReponse2.tracks.total > 100) {
                        var recordsPerPage = 100;
                        var total = meReponse2.tracks.total;
                        int numberOfTimesToLoop = (total + recordsPerPage - 1) / recordsPerPage;
                        int offset = 100;
                        for (int i = 0; i < numberOfTimesToLoop; i++) {
                            // used to be no: tracks
                            var url5 = String.Format("https://api.spotify.com/v1/users/{0}/playlists/{1}/tracks?limit=100&offset={2}", ownerId, playlistId, offset);
                            offset += 100;
                            var result5 = sh.CallSpotifyAPIPassingToken(access_token, url5);
                            //Task<string> t = sh.CallSpotifyAPIAsyncPassingToken(access_token, url5);

                            var meReponse5 = JsonConvert.DeserializeObject<Thing>(result5);
                            foreach (var item in meReponse5.items) {
                                listOfTrackIDs.Add(item.track.id);
                            }
                        }
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