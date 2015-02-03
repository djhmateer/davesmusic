using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace DavesMusic.Controllers {
    public class HomeController : Controller {
       
        public ActionResult Search(string artist = "", int offset = 0) {
            // First call with no parameters
            if (artist == "") {
                ViewBag.InitialArtist = "muse";
                return View();
            }

            var spotifyHelper = new SpotifyHelper();
            var stopWatchResult = new StopWatchResult();
            string json = spotifyHelper.CallSpotifyAPISearch(artist, offset, stopWatchResult);
            ViewBag.APITime = stopWatchResult.TimeInMs;

            var jsonNoArtistsRootElement = JObject.Parse(json)["artists"].ToString();
            var result = JsonConvert.DeserializeObject<ArtistsResponse>(jsonNoArtistsRootElement);

            ViewBag.ArtistSearchedFor = artist;

            ViewBag.ShowPrevious = false;
            if (offset >= 50) {
                ViewBag.OffsetPrevious = offset - 50;
                ViewBag.ShowPrevious = true;
            }

            ViewBag.ShowNext = false;
            if (offset + 50 < result.Total) {
                ViewBag.OffsetNext = offset + 50;
                ViewBag.ShowNext = true;
            }

            return View(result);
        }

        public ActionResult SpotifyTest() {
            return View();
        }

       

        //public ActionResult NewReleases(string access_token) {
        //    // needs oAuth
        //    var url = "https://api.spotify.com/v1/browse/new-releases";
        //    var result = CallSpotifyAPIPassingToken(access_token, url);

        //    var newReleases = JsonConvert.DeserializeObject(result);

        //    return View(newReleases);
        //}


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