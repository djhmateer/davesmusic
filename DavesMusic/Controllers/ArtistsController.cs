using System.Data;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Mvc;

namespace DavesMusic.Controllers {
    public class ArtistsController : Controller {
        string connectionString = ConfigurationManager.ConnectionStrings["DavesMusicConnection"].ConnectionString;

        [HttpPost]
        public ActionResult Details(ArtistDetailsViewModel vm, string id){
            var sh = new SpotifyHelper();
            using (var connection = new SqlConnection(connectionString))
            using (var command = new SqlCommand(null, connection)) {
                connection.Open();
                // Iterate through vm and save the checked albums id's to db
                foreach (var album in vm.ArtistAlbums.items) {
                    if (album.Checked) {
                        // Is it already there in the database?
                        command.CommandText = String.Format("SELECT COUNT(*) FROM Playlist WHERE AlbumID = '{0}'", album.id);
                        command.CommandType = CommandType.Text;
                        var result = command.ExecuteScalar().ToString();
                        if (result == "0") {
                            // Get all the tracks from this album

                            var result2 = sh.CallSpotifyAPIAlbumDetails(null, album.id);
                            var albumDetails = JsonConvert.DeserializeObject<AlbumDetails>(result2.Json);
                            // Insert each track into the database
                            foreach (var track in albumDetails.tracks.items){
                                command.CommandText = String.Format("INSERT INTO Playlist (AlbumID, TrackID, TrackName, AlbumName) VALUES ('{0}', '{1}', @TrackName,'{2}')", album.id, track.id, album.name);
                                command.Parameters.Clear();
                                command.Parameters.AddWithValue("@TrackName", track.name);

                                command.CommandType = CommandType.Text;
                                command.ExecuteNonQuery(); 
                            }
                        }
                    }
                    else {
                        // If its been unchecked and is there in the database?
                        command.CommandText = String.Format("SELECT COUNT(*) FROM Playlist WHERE AlbumID = '{0}'", album.id);
                        command.CommandType = CommandType.Text;
                        var result = command.ExecuteScalar().ToString();
                        if (result != "0") {
                            command.CommandText = String.Format("DELETE FROM Playlist WHERE AlbumID = '{0}'", album.id);
                            command.CommandType = CommandType.Text;
                            command.ExecuteNonQuery();
                        }
                    }
                }
            }

            // Get data again as not saved, including Checked status
            var vm2 = GetArtistDetailsViewModel(id);

            return View(vm2);
        }

        [HttpGet]
        public ActionResult Details(string id) {
            var vm = GetArtistDetailsViewModel(id);
            return View(vm);
        }

        private ArtistDetailsViewModel GetArtistDetailsViewModel(string id) {
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
            ArtistAlbums artistAlbums = JsonConvert.DeserializeObject<ArtistAlbums>(apiResult.Json);
            // set Checked status of ArtistAlbums
            // Iterate through records in db, setting vm checked property
            using (var connection = new SqlConnection(connectionString))
            using (var command = new SqlCommand(null, connection)) {
                connection.Open();
                command.CommandText = String.Format("SELECT AlbumID FROM Playlist");
                command.CommandType = CommandType.Text;

                var albumIDs = new List<string>();
                using (var reader = command.ExecuteReader()) {
                    while (reader.Read()) {
                        var albumID = reader.GetString(reader.GetOrdinal("AlbumID"));
                        albumIDs.Add(albumID);
                    }
                }

                foreach (var albumID in albumIDs) {
                    // Is this album in the current search list?
                    var album = artistAlbums.items.FirstOrDefault(x => x.id == albumID);
                    if (album != null) {
                        album.Checked = true;
                    }
                }
            }

            apiDebug = new APIDebug {
                APITime = String.Format("{0:0}", stopWatchResult.ElapsedTime.TotalMilliseconds),
                APIURL = apiResult.Url
            };
            apiDebugList.Add(apiDebug);

            // Artist's related Artists - top 7
            apiResult = apiHelper.CallSpotifyAPIArtistRelated(stopWatchResult, id);
            var artistRelated = JsonConvert.DeserializeObject<ArtistRelated>(apiResult.Json);
            var y = artistRelated.artists.Take(7).ToList();
            artistRelated.artists = y;
            apiDebug = new APIDebug {
                APITime = String.Format("{0:0}", stopWatchResult.ElapsedTime.TotalMilliseconds),
                APIURL = apiResult.Url
            };
            apiDebugList.Add(apiDebug);

            // Biography (Echonest)
            apiResult = apiHelper.CallEchonestAPIArtistBiography(stopWatchResult, id);
            var artistBiography = JsonConvert.DeserializeObject<ArtistBiography>(apiResult.Json);
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
            return vm;
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

            public bool Checked { get; set; }
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