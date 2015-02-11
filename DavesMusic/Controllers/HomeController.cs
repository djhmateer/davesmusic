using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace DavesMusic.Controllers {
    public class HomeController : Controller {

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

        public ActionResult SpotifyTest() {
            return View();
        }

        public ActionResult About() {
            ViewBag.Message = "Your application description page.";

            return View();
        }
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

    internal class accesstoken {
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