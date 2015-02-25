using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace DavesMusic.Controllers {
    public class HomeController : Controller {
        string connectionString = ConfigurationManager.ConnectionStrings["DavesMusicConnection"].ConnectionString;

        public ActionResult Search(string artist = "", int offset = 0, string playlist = "", bool isAPost = false) {
            var spotifyHelper = new SpotifyHelper();
            var vm = new SearchViewModel();
            // Searching for a playlist
            if (playlist != "") {
                string json2 = spotifyHelper.CallSpotifyAPISearchForPlaylist(playlist);

                var result2 = JsonConvert.DeserializeObject<PlaylistsResponse>(json2);
                result2.term = playlist;
                vm.PlaylistsResponse = result2;
                return View(vm);
            }

            if (isAPost && artist == "") artist = "Muse";


            // Initial load of the page
            if (artist == "") return View();

            string json = spotifyHelper.CallSpotifyAPISearch(artist, offset);
            var result = JsonConvert.DeserializeObject<ArtistsResponse2>(json);
            result.term = artist;

            vm.ArtistsResponse2 = result;
            return View(vm);
        }

        public ActionResult SeminalAlbums() {
            var albumIDs = new List<string>();
            using (var connection = new SqlConnection(connectionString))
            using (var command = new SqlCommand(null, connection)) {
                connection.Open();
                command.CommandText = String.Format("SELECT DISTINCT AlbumID FROM Playlist");
                using (var reader = command.ExecuteReader()) {
                    while (reader.Read()) {
                        var albumID = reader.GetString(reader.GetOrdinal("AlbumID"));
                        albumIDs.Add(albumID);
                    }
                }
            }

            // now got a list of albumID's we want to call spotify to get info
            var listAlbumDetails = new List<AlbumDetails>();
            var spotifyHelper = new SpotifyHelper();
            foreach (var albumID in albumIDs) {
                var apiResult = spotifyHelper.CallSpotifyAPIAlbumDetails(null, id: albumID);
                var albumDetails = JsonConvert.DeserializeObject<AlbumDetails>(apiResult.Json);
                DateTime d;
                bool success = DateTime.TryParse(albumDetails.release_date, out d);

                if (!success) {
                    // Black crowes was just a year ie 2009   
                    int year = Int32.Parse(albumDetails.release_date);
                    d = new DateTime(year, 1, 1);
                }

                albumDetails.releaseDateTime = d;
                listAlbumDetails.Add(albumDetails);
            }

            // Pass current userID to view?
            var a = listAlbumDetails.OrderByDescending(x => x.releaseDateTime).ToList();
            return View(a);
        }

        public ActionResult SeminalSongs() {
            var vm = new List<SongsVM>();
            using (var connection = new SqlConnection(connectionString))
            using (var command = new SqlCommand(null, connection)) {
                connection.Open();
                command.CommandText = String.Format("SELECT TrackID, TrackName, ArtistName FROM Tracks");
                using (var reader = command.ExecuteReader()) {
                    while (reader.Read()) {
                        var trackID = reader.GetString(reader.GetOrdinal("TrackID"));
                        var trackName = reader.GetString(reader.GetOrdinal("TrackName"));
                        var artistName = reader.GetString(reader.GetOrdinal("ArtistName"));
                        var songsVM = new SongsVM {
                            TrackID = trackID,
                            TrackName = trackName,
                            ArtistName = artistName
                        };
                        vm.Add(songsVM);
                    }
                }
            }
            // It is possible to be on this page without logging in - user clicks via LoginRedirect to come back here
            if (Session["AccessToken"] != null){
                ViewBag.access_token = Session["AccessToken"].ToString();
   
                var access_token = Session["AccessToken"].ToString();

                // If this is the first time back to this page after logging in, need to get the UserID
                if (Session["UserID"] == null){
                    var url2 = "https://api.spotify.com/v1/me";
                    var sh = new SpotifyHelper();
                    var result2 = sh.CallSpotifyAPIPassingToken(access_token, url2);

                    var meReponse = JsonConvert.DeserializeObject<MeResponse>(result2);
                    meReponse.access_token = access_token;
                   
                    Session["UserID"] = meReponse.id;
                }
                // Grab the userID as we'll use that in our database to remember what a user has selected
                ViewBag.user_id = Session["UserID"];

                // Find out what the user has already added to their playlist
                var listTracksAlreadyAdded = new List<string>();
                var userID = Session["UserID"];
                using (var connection = new SqlConnection(connectionString))
                using (var command = new SqlCommand(null, connection)) {
                    connection.Open();
                    command.CommandText = String.Format("SELECT TrackID FROM UserPlaylists WHERE UserID = @UserID");
                    command.Parameters.AddWithValue("@UserID", userID);
                    using (var reader = command.ExecuteReader()) {
                        while (reader.Read()) {
                            var trackID = reader.GetString(reader.GetOrdinal("TrackID"));
                            listTracksAlreadyAdded.Add(trackID);
                        }
                    }
                }

                foreach (var track in vm){
                    if (listTracksAlreadyAdded.Contains(track.TrackID)){
                        track.AddedInPlaylist = true;
                    }
                }
            }
            return View(vm);
        }

        public ActionResult LoginRedirect() {
            var returnURL = "/Home/SeminalSongs";
            var ah = new AuthHelper();
            var result = ah.DoAuth(returnURL, this);
            if (result != null)
                return Redirect(result);

            return Redirect(returnURL);
        }

        public ActionResult MyPlaylist() {
            var returnURL = "/Home/MyPlaylist";
            var ah = new AuthHelper();
            var result = ah.DoAuth(returnURL, this);
            if (result != null)
                return Redirect(result);

            var access_token = Session["AccessToken"].ToString();
            var url2 = "https://api.spotify.com/v1/me";
            var sh = new SpotifyHelper();
            var result2 = sh.CallSpotifyAPIPassingToken(access_token, url2);

            var meReponse = JsonConvert.DeserializeObject<MeResponse>(result2);
            meReponse.access_token = access_token;
            //return View(meReponse);
            return View();
        }

        public String AddOrRemoveTrack(string trackId) {
            // Insert into the database 
            var userID = Session["UserID"];
            // give illusion interface is working if not logged in
            if (userID != null){
                using (var connection = new SqlConnection(connectionString))
                using (var command = new SqlCommand(null, connection)){
                    connection.Open();

                    // Is the track already in playlist?  If yes, then delete from list user's playlist
                    command.CommandText = String.Format("SELECT Count(TrackID) FROM UserPlaylists WHERE UserID = @UserID AND TrackID = @TrackID");
                    command.Parameters.AddWithValue("@UserID", userID);
                    command.Parameters.AddWithValue("@TrackID", trackId);
                    var result = command.ExecuteScalar().ToString();
                    if (result == "0")
                    {
                        command.CommandText =
                            String.Format("INSERT into UserPlaylists (UserID, TrackID) VALUES (@UserID2, @TrackID2)");
                        command.Parameters.AddWithValue("@UserID2", userID);
                        command.Parameters.AddWithValue("@TrackID2", trackId);
                        command.ExecuteNonQuery();
                    }
                    else {
                        command.CommandText =
                               String.Format("DELETE FROM UserPlaylists WHERE UserID = @UserID2 AND TrackID=@TrackID2");
                        command.Parameters.AddWithValue("@UserID2", userID);
                        command.Parameters.AddWithValue("@TrackID2", trackId);
                        command.ExecuteNonQuery();
                    }
                }
            }
            return trackId;
        }
    }

    public class SongsVM {
        public string TrackID { get; set; }
        public string TrackName { get; set; }
        public string ArtistName { get; set; }
        public bool AddedInPlaylist { get; set; }
    }

    public class MeResponse {
        public class ExternalUrls {
            public string spotify { get; set; }
        }

        public class Followers {
            public object href { get; set; }
            public int total { get; set; }
        }

        public string country { get; set; }
        public object display_name { get; set; }
        public string email { get; set; }
        public ExternalUrls external_urls { get; set; }
        public Followers followers { get; set; }
        public string href { get; set; }
        public string id { get; set; }
        public List<object> images { get; set; }
        public string product { get; set; }
        public string type { get; set; }
        public string uri { get; set; }
        // dave added
        public string access_token { get; set; }
    }

    internal class AccessToken {
        public string access_token { get; set; }
        public string token_type { get; set; }
        public int expires_in { get; set; }
        public string refresh_token { get; set; }

        public AuthenticationToken ToPOCO() {
            AuthenticationToken token = new AuthenticationToken();
            token.AccessToken = this.access_token;
            token.ExpiresOn = DateTime.Now.AddSeconds(this.expires_in);
            token.RefreshToken = this.refresh_token;
            token.TokenType = this.token_type;

            return token;
        }
    }

    public class AuthenticationToken {
        private string accessToken;

        /// <summary>
        /// An access token that can be provided in subsequent calls, for example to Spotify Web API services. 
        /// 
        /// refreshes the token automatically if it has expired
        /// </summary>
        public string AccessToken {
            get {
                if (HasExpired)
                    Refresh();

                return accessToken;
            }
            set {
                accessToken = value;
            }
        }

        /// <summary>
        /// How the access token may be used: always "Bearer". 
        /// </summary>
        public string TokenType { get; set; }

        /// <summary>
        /// The date/time that this token will become invalid
        /// </summary>
        public DateTime ExpiresOn { get; set; }

        /// <summary>
        /// A token that can be sent to the Spotify Accounts service in place of an authorization code. 
        /// (When the access code expires, send a POST request to the Accounts service /api/token endpoint, but 
        /// use this code in place of an authorization code. A new access token and a new refresh token will be returned.) 
        /// </summary>
        public string RefreshToken { get; set; }

        /// <summary>
        /// Determines if this token has expired
        /// </summary>
        public bool HasExpired { get { return DateTime.Now > ExpiresOn; } }

        /// <summary>
        /// Updates this token if it has expired
        /// </summary>
        public async void Refresh() {
            //var token = await SpotifyWebAPI.Authentication.GetAccessToken(this.RefreshToken);
            //this.accessToken = token.accessToken;
            //this.ExpiresOn = token.ExpiresOn;
            //this.RefreshToken = token.RefreshToken;
            //this.TokenType = this.TokenType;
        }
    }

    public class StopWatchResult {
        public string TimeInMs { get; set; }
        public TimeSpan ElapsedTime { get; set; }
    }

    public class APIResult {
        public string Json { get; set; }
        public string Url { get; set; }
    }

    public class SearchViewModel {
        public PlaylistsResponse PlaylistsResponse { get; set; }
        public ArtistsResponse2 ArtistsResponse2 { get; set; }
    }

    public class PlaylistsResponse {
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
            public object @public { get; set; }
            public Tracks tracks { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class Playlists {
            public string href { get; set; }
            public List<Item> items { get; set; }
            public int limit { get; set; }
            public string next { get; set; }
            public int offset { get; set; }
            public object previous { get; set; }
            public int total { get; set; }
        }

        public Playlists playlists { get; set; }
        public string term { get; set; }
    }

    public class ArtistsResponse2 {
        public class ExternalUrls {
            public string spotify { get; set; }
        }

        public class Followers {
            public object href { get; set; }
            public int total { get; set; }
        }

        public class Item {
            public ExternalUrls external_urls { get; set; }
            public Followers followers { get; set; }
            public List<object> genres { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public List<SpotifyImage> images { get; set; }
            public string name { get; set; }
            public int popularity { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class SpotifyImage {
            public int Height { get; set; }
            public string Url { get; set; }
            public int Width { get; set; }
        }

        public class Artists {
            public string href { get; set; }
            public List<Item> items { get; set; }
            public int limit { get; set; }
            public string next { get; set; }
            public int offset { get; set; }
            public object previous { get; set; }
            public int total { get; set; }
        }

        public Artists artists { get; set; }
        public string term { get; set; }
    }

    public class ArtistsResponse {
        // Overall Href of the query
        public string Href { get; set; }
        public List<Artist> Items { get; set; }
        public string Next { get; set; }
        public int Offset { get; set; }
        public string Previous { get; set; }
        public int Total { get; set; }

        public class Artist {
            public SpotifyURL External_urls { get; set; }
            public class SpotifyURL {
                public string Spotify { get; set; }
            }

            // blank very often
            //public List<Genre> Genres { get; set; }

            // API call for details of the artistName
            public string Href { get; set; }
            public string Id { get; set; }
            public List<SpotifyImage> Images { get; set; }
            public string Name { get; set; }
            public int Popularity { get; set; }
            public string Type { get; set; }
            public string Uri { get; set; }

            public class SpotifyImage {
                public int Height { get; set; }
                public string Url { get; set; }
                public int Width { get; set; }
            }
        }
    }
}