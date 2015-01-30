using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace DavesMusic.Controllers
{
    public class ArtistController : Controller {
        public ActionResult Details(string id) {
            var apiHelper = new SpotifyHelper();
            var stopWatchResult = new StopWatchResult();
            string json = apiHelper.CallSpotifyAPIArtist(stopWatchResult: stopWatchResult,
                artistCode: id);
            ViewBag.Id = id;
            var artistDetails = JsonConvert.DeserializeObject<ArtistDetails>(json);

            var apiDebugList = new List<APIDebug>();
            var apiDebug = new APIDebug {
                APITime = String.Format("{0:0}", stopWatchResult.ElapsedTime.TotalMilliseconds),
                APIURL = artistDetails.Href
            };
            apiDebugList.Add(apiDebug);

            var apiResult = apiHelper.CallSpotifyAPIArtistTopTracks(stopWatchResult, id);
            var artistTopTracks = JsonConvert.DeserializeObject<ArtistTopTracks>(apiResult.Json);
            apiDebug = new APIDebug {
                APITime = String.Format("{0:0}", stopWatchResult.ElapsedTime.TotalMilliseconds),
                APIURL = apiResult.Url
            };
            apiDebugList.Add(apiDebug);

            // Only want top 5 tracks in toptracks
            var tracks = artistTopTracks.tracks;
            var top5 = tracks.OrderByDescending(x => x.popularity).Take(5);
            artistTopTracks.tracks = top5.ToList();


            // All Artists albums - possibly more than 50!
            apiResult = apiHelper.CallSpotifyAPIArtistAlbums(stopWatchResult, id);
            var artistAlbums = JsonConvert.DeserializeObject<ArtistAlbums>(apiResult.Json);
            apiDebug = new APIDebug {
                APITime = String.Format("{0:0}", stopWatchResult.ElapsedTime.TotalMilliseconds),
                APIURL = apiResult.Url
            };
            apiDebugList.Add(apiDebug);

            // Artist's related Artists - top 7
            apiResult = apiHelper.CallSpotifyAPIArtistRelated(stopWatchResult, id);
            ArtistRelated artistRelated = JsonConvert.DeserializeObject<ArtistRelated>(apiResult.Json);
            var y = artistRelated.artists.Take(7).ToList();
            artistRelated.artists = y;
            apiDebug = new APIDebug {
                APITime = String.Format("{0:0}", stopWatchResult.ElapsedTime.TotalMilliseconds),
                APIURL = apiResult.Url
            };
            apiDebugList.Add(apiDebug);

            // Biography (Echonest)
            apiResult = apiHelper.CallEchonestAPIArtistBiography(stopWatchResult, id);
            ArtistBiography artistBiography = JsonConvert.DeserializeObject<ArtistBiography>(apiResult.Json);
            if (artistBiography != null) {
                // Just get last.fm and Wikipedia entries
                if (artistBiography.response.biographies != null) {
                    var a = artistBiography.response.biographies.SingleOrDefault(x => x.url.Contains("wikipedia"));
                    artistBiography.response.biographies.Clear();
                    artistBiography.response.biographies.Add(a);
                }
            }
            apiDebug = new APIDebug {
                APITime = String.Format("{0:0}", stopWatchResult.ElapsedTime.TotalMilliseconds),
                APIURL = apiResult.Url
            };
            apiDebugList.Add(apiDebug);

            var vm = new ArtistDetailsViewModel {
                APIDebugList = apiDebugList,
                ArtistDetails = artistDetails,
                ArtistTopTracks = artistTopTracks,
                ArtistAlbums = artistAlbums,
                ArtistRelated = artistRelated,
                ArtistBiography = artistBiography
            };
            return View(vm);
        }
    }

    public class ArtistBiography {
        public class Status {
            public string version { get; set; }
            public int code { get; set; }
            public string message { get; set; }
        }

        public class License {
            public string type { get; set; }
            public string attribution { get; set; }
            //public string __invalid_name__attribution-url { get; set; }
            public string url { get; set; }
            public string version { get; set; }
        }

        public class Biography {
            public string text { get; set; }
            public string site { get; set; }
            public string url { get; set; }
            public License license { get; set; }
            public bool truncated { get; set; }
        }

        public class Response {
            public Status status { get; set; }
            public int start { get; set; }
            public int total { get; set; }
            public List<Biography> biographies { get; set; }
        }

        public Response response { get; set; }
    }

    public class ArtistRelated {
        public class ExternalUrls {
            public string spotify { get; set; }
        }

        public class Followers {
            public object href { get; set; }
            public int total { get; set; }
        }

        public class Image {
            public int height { get; set; }
            public string url { get; set; }
            public int width { get; set; }
        }

        public class Artist {
            public ExternalUrls external_urls { get; set; }
            public Followers followers { get; set; }
            public List<object> genres { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public List<Image> images { get; set; }
            public string name { get; set; }
            public int popularity { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public List<Artist> artists { get; set; }
    }

    public class ArtistAlbums {
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

        public string href { get; set; }
        public List<Item> items { get; set; }
        public int limit { get; set; }
        public string next { get; set; }
        public int offset { get; set; }
        public object previous { get; set; }
        public int total { get; set; }
    }


    public class APIDebug {
        public string APITime { get; set; }
        public string APIURL { get; set; }
    }

    public class ArtistDetailsViewModel {
        public List<APIDebug> APIDebugList { get; set; }
        public ArtistDetails ArtistDetails { get; set; }
        public ArtistTopTracks ArtistTopTracks { get; set; }
        public ArtistAlbums ArtistAlbums { get; set; }
        public ArtistRelated ArtistRelated { get; set; }
        public ArtistBiography ArtistBiography { get; set; }

    }

    public class ArtistTopTracks {
        public List<Track> tracks { get; set; }
        public class Track {
            public Album album { get; set; }
            public List<Artist> artists { get; set; }
            public List<string> available_markets { get; set; }
            public int disc_number { get; set; }
            public int duration_ms { get; set; }
            public bool @explicit { get; set; }
            public ExternalIds external_ids { get; set; }
            public ExternalUrls3 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string name { get; set; }
            public int popularity { get; set; }
            public string preview_url { get; set; }
            public int track_number { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }
        public class ExternalUrls {
            public string spotify { get; set; }
        }

        public class Image {
            public int height { get; set; }
            public string url { get; set; }
            public int width { get; set; }
        }

        public class Album {
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

        public class ExternalUrls2 {
            public string spotify { get; set; }
        }

        public class Artist {
            public ExternalUrls2 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string name { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class ExternalIds {
            public string isrc { get; set; }
        }

        public class ExternalUrls3 {
            public string spotify { get; set; }
        }
    }

    public class ArtistDetails {
        public class ExternalUrls {
            public string Spotify { get; set; }
        }
        public ExternalUrls external_urls { get; set; }

        public class Followers {
            public object href { get; set; }
            public int Total { get; set; }
        }
        public Followers followers { get; set; }
        public string Href { get; set; }
        public string Id { get; set; }
        public class Image {
            public int Height { get; set; }
            public string URL { get; set; }
            public int Width { get; set; }
        }
        public List<Image> Images { get; set; }

        public string Name { get; set; }
        public int Popularity { get; set; }
        public string Type { get; set; }
        public string Uri { get; set; }
    }
}