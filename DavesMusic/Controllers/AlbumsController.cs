using System.Diagnostics;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace DavesMusic.Controllers
{
    public class AlbumsController : Controller {
        public ActionResult Details(string id) {
            var spotifyHelper = new SpotifyHelper();
            var stopWatchResult = new StopWatchResult();
            var apiResult = spotifyHelper.CallSpotifyAPIAlbumDetails(stopWatchResult, id);
            ViewBag.Id = id;
            var albumDetails = JsonConvert.DeserializeObject<AlbumDetails>(apiResult.Json);

            var apiDebugList = new List<APIDebug>();
            var apiDebug = new APIDebug {
                APITime = String.Format("{0:0}", stopWatchResult.ElapsedTime.TotalMilliseconds),
                APIURL = apiResult.Url
            };
            apiDebugList.Add(apiDebug);


            var vm = new AlbumDetailsViewModel {
                APIDebugList = apiDebugList,
                AlbumDetails = albumDetails,
            };
            return View(vm);
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
            public object preview_url { get; set; }
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