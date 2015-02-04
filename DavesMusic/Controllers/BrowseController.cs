using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace DavesMusic.Controllers {
    public class BrowseController : Controller {
        // Browse/NewReleases
        public ActionResult NewReleases() {
            var returnURL = "/Browse/NewReleases";
            ActionResult redirect;
            if (DoAuth(returnURL, out redirect))
                return redirect;

            var access_token = Session["AccessToken"].ToString();
            var url2 = "https://api.spotify.com/v1/browse/new-releases?country=GB";
            var sh = new SpotifyHelper();
            var result2 = sh.CallSpotifyAPIPassingToken(access_token, url2);

            var meReponse = JsonConvert.DeserializeObject<NewReleaseDetails>(result2);
            meReponse.access_token = access_token;
            return View(meReponse);
        }

        private bool DoAuth(string returnURL, out ActionResult redirect) {
            if (Session["AccessToken"] == null) {
                var client_id = "0fd1718f5ef14cb291ef114a13382d15";
                var response_type = "code";
                var scope = "user-read-private user-read-email";

                var url =
                    String.Format(
                        "https://accounts.spotify.com/authorize/?client_id={0}&response_type={1}&scope={3}&redirect_uri={2}",
                        client_id, response_type, GetRedirectUriWithServerName(), scope);

                Session["ReturnURL"] = returnURL;
                redirect = Redirect(url);
                return true;
            }
            redirect = null;
            return false;
        }

        // Browse/FeaturedPlaylists
        public ActionResult FeaturedPlaylists() {
            var returnURL = "/Browse/FeaturedPlaylists";
            ActionResult redirect;
            if (DoAuth(returnURL, out redirect))
                return redirect;

            var access_token = Session["AccessToken"].ToString();
            var url = "https://api.spotify.com/v1/browse/featured-playlists?country=GB";
            var sh = new SpotifyHelper();
            var result = sh.CallSpotifyAPIPassingToken(access_token, url);

            var meReponse = JsonConvert.DeserializeObject<FeaturedPlaylists>(result);
            meReponse.access_token = access_token;
            return View(meReponse);
        }

        string GetRedirectUriWithServerName() {
            return "http://" + Request.Url.Authority + "/Me/SpotifyCallback";
        }
    }

    public class FeaturedPlaylists {
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
            public object next { get; set; }
            public int offset { get; set; }
            public object previous { get; set; }
            public int total { get; set; }
        }

        public string message { get; set; }
        public Playlists playlists { get; set; }
        public string access_token { get; set; }

    }

    public class NewReleaseDetails {
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
        }

        public class Albums {
            public string href { get; set; }
            public List<Item> items { get; set; }
            public int limit { get; set; }
            public string next { get; set; }
            public int offset { get; set; }
            public object previous { get; set; }
            public int total { get; set; }
        }

        public Albums albums { get; set; }
        public string access_token { get; set; }
    }
}