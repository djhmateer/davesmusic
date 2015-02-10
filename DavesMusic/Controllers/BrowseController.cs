using System.Collections.Generic;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace DavesMusic.Controllers {
    public class BrowseController : Controller {

        // Browse/NewReleases
        public ActionResult NewReleases() {
            var returnURL = "/Browse/NewReleases";
            var ah = new AuthHelper();
            var result = ah.DoAuth(returnURL, this);
            if (result != null)
                return Redirect(result);

            var access_token = Session["AccessToken"].ToString();
            var url2 = "https://api.spotify.com/v1/browse/new-releases?country=GB";
            var sh = new SpotifyHelper();
            var result2 = sh.CallSpotifyAPIPassingToken(access_token, url2);

            var meReponse = JsonConvert.DeserializeObject<NewReleaseDetails>(result2);
            meReponse.access_token = access_token;
            return View(meReponse);
        }

        public ActionResult FeaturedPlaylists() {
            var returnURL = "/Browse/FeaturedPlaylists";
            var helper = new AuthHelper();
            var helperResult = helper.DoAuth(returnURL, this);
            if (helperResult != null)
                return Redirect(helperResult);

            var access_token = Session["AccessToken"].ToString();
            var url = "https://api.spotify.com/v1/browse/featured-playlists?country=GB";
            var sh = new SpotifyHelper();
            var result = sh.CallSpotifyAPIPassingToken(access_token, url);

            var meReponse = JsonConvert.DeserializeObject<FeaturedPlaylists>(result);
            meReponse.access_token = access_token;
            return View(meReponse);
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