using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web.Mvc;

namespace DavesMusic.Controllers {
    public class ProfilesController : Controller {
        public ActionResult Me() {
            var returnURL = "/Profiles/Me";
            var ah = new AuthHelper();
            var result = ah.DoAuth(returnURL, this);
            if (result != null)
                return Redirect(result);

            var access_token = Session["AccessToken"].ToString();
            var url2 = "https://api.spotify.com/v1/me";
            var sh = new SpotifyHelper();
            var result2 = sh.CallSpotifyAPIPassingToken(access_token, url2);

            var meReponse = JsonConvert.DeserializeObject<MeResponse>(result2);
            // Holder UserId in session so can turn menu on and off for login
            //Session["UserId"] = meReponse.id;

            meReponse.access_token = access_token;
            //return View(meReponse);
            // Redirect to PlaylistShuffler page
            return Redirect("/Users/Playlists/" + meReponse.id);
        }

        ///v1/users/{user_id} 
        public ActionResult User(string id) {
            var returnURL = "/Profiles/User";
            var ah = new AuthHelper();
            var result = ah.DoAuth(returnURL, this);
            if (result != null)
                return Redirect(result);

            var access_token = Session["AccessToken"].ToString();
            var url2 = String.Format("https://api.spotify.com/v1/users/{0}", id);
            var sh = new SpotifyHelper();
            var result2 = sh.CallSpotifyAPIPassingToken(access_token, url2);

            var response = JsonConvert.DeserializeObject<UserDetails>(result2);
            response.access_token = access_token;
            return View(response);
        }

        private string GetRedirectUriWithServerName() {
            return "http://" + Request.Url.Authority + "/Profiles/SpotifyCallback";
        }

        public ActionResult SpotifyCallback(string code) {
            bool keepTrying = true;
            string resultContent = "";
            while (keepTrying) {
                // Have now got authorization code (which can be exchanged for an access token)
                var client_id = "0fd1718f5ef14cb291ef114a13382d15";
                var client_secret = "964e8a4a50de4dfd8247d061a8517920";

                var url = "https://accounts.spotify.com/api/token";

                // Request access and refresh tokens
                var postData = new Dictionary<string, string>{
                    {"grant_type", "authorization_code"},
                    {"code", code},
                    {"redirect_uri", GetRedirectUriWithServerName()},
                    {"client_id", client_id},
                    {"client_secret", client_secret}
                };

                HttpContent content = new FormUrlEncodedContent(postData.ToArray());

                var client = new HttpClient();
                var httpResponse = client.PostAsync(url, content);
                var result = httpResponse.Result;
                resultContent = result.Content.ReadAsStringAsync().Result;

                // Catching gateway timeouts or strange stuff from Spotify
                if (result.IsSuccessStatusCode) {
                    keepTrying = false;
                }
            }

            var obj = JsonConvert.DeserializeObject<AccessToken>(resultContent, new JsonSerializerSettings {
                TypeNameHandling = TypeNameHandling.All,
                TypeNameAssemblyFormat = System.Runtime.Serialization.Formatters.FormatterAssemblyStyle.Simple
            });
            var access_token = obj.access_token;

            // Set access token in session
            Session["AccessToken"] = access_token;

            // do a quick call to get the username of the currently logged in user so I can use it to hide or display if it is davemateer (admin)
            var url2 = "https://api.spotify.com/v1/me";
            var sh = new SpotifyHelper();
            var result2 = sh.CallSpotifyAPIPassingToken(access_token, url2);

            var meReponse = JsonConvert.DeserializeObject<MeResponse>(result2);

            Session["SpotifyUserID"] = meReponse.id;

            // Get return URL from session state
            var returnURL = Session["ReturnURL"].ToString();

            return Redirect(returnURL);
        }
    }

    public class UserDetails {
        public class ExternalUrls {
            public string spotify { get; set; }
        }

        public class Followers {
            public object href { get; set; }
            public int total { get; set; }
        }

        public class Image {
            public object height { get; set; }
            public string url { get; set; }
            public object width { get; set; }
        }

        public string display_name { get; set; }
        public ExternalUrls external_urls { get; set; }
        public Followers followers { get; set; }
        public string href { get; set; }
        public string id { get; set; }
        public List<Image> images { get; set; }
        public string type { get; set; }
        public string uri { get; set; }
        public string access_token { get; set; }
    }
}