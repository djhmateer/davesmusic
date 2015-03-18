using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Script.Serialization;
using Newtonsoft.Json;

namespace DavesMusic.Controllers {

    public class SpotifyHelper {

        public string CallSpotifyAPIPassingToken(string access_token, string url) {
            var client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", access_token);
            var httpResponse = client.GetAsync(url);
            var result = httpResponse.Result.Content.ReadAsStringAsync().Result;
            return result;
        }

        public string CallSpotifyPostAPIPassingToken(string access_token, string url) {
            var client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", access_token);
            var httpResponse = client.PostAsync(url, null);
            var result = httpResponse.Result.Content.ReadAsStringAsync().Result;
            return result;
        }

        public string CallSpotifyPutAPIPassingToken(string access_token, string url) {
            var client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", access_token);
            var httpResponse = client.PutAsync(url, null);
            var result = httpResponse.Result.Content.ReadAsStringAsync().Result;
            return result;
        }

        public class Thing {
            public string name { get; set; }
        }

        public string CallSpotifyCreatePlaylistPostAPIPassingToken(string access_token, string url) {
            var client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", access_token);
            var p = new Thing { name = "A New Playlist" };
            var serializer = new JavaScriptSerializer();
            var jsonString = serializer.Serialize(p);
            var stringContent = new StringContent(jsonString, Encoding.UTF8, "application/json");

            var httpResponse = client.PostAsync(url, stringContent);
            var result = httpResponse.Result.Content.ReadAsStringAsync().Result;

            return result;
        }

        public string CallSpotifyAPIArtistSearch(string searchTerm) {
            if (!String.IsNullOrWhiteSpace(searchTerm)) searchTerm = HttpUtility.UrlEncode(searchTerm);
            // add a wildcard to aid searching eg que* for queen
            var url = String.Format("https://api.spotify.com/v1/search?q={0}&limit=50&type=artist", searchTerm);
            var text = CallAPI(null, url);
            return text;
        }

        public string CallSpotifyAPITrackSearch(string searchTerm) {
            if (!String.IsNullOrWhiteSpace(searchTerm)) searchTerm = HttpUtility.UrlEncode(searchTerm);
            var url = String.Format("https://api.spotify.com/v1/search?q={0}&limit=3&type=track", searchTerm);
            var text = CallAPI(null, url);
            return text;
        }
        


        public string CallSpotifyAPISearchForPlaylist(string playlist) {
            if (!String.IsNullOrWhiteSpace(playlist)) playlist = HttpUtility.UrlEncode(playlist);
            var url = String.Format("https://api.spotify.com/v1/search?q={0}&limit=50&type=playlist", playlist);
            var text = CallAPI(null, url);
            return text;
        }

        public string CallSpotifyAPIArtist(string artistCode, StopWatchResult stopWatchResult) {
            var url = String.Format("https://api.spotify.com/v1/artists/{0}", artistCode);
            var json = CallAPI(stopWatchResult, url);
            return json;
        }

        public APIResult CallSpotifyAPIArtistTopTracks(StopWatchResult stopWatchResult, string artistCode) {
            var url = String.Format("https://api.spotify.com/v1/artists/{0}/top-tracks?country=GB", artistCode);
            var json = CallAPI(stopWatchResult, url);
            return new APIResult {
                Json = json,
                Url = url
            };
        }

        public APIResult CallSpotifyAPIArtistAlbums(StopWatchResult stopWatchResult, string artistCode) {
            var url = String.Format("https://api.spotify.com/v1/artists/{0}/albums?country=GB&album_type=album&limit=50", artistCode);
            var json = CallAPI(stopWatchResult, url);
            return new APIResult {
                Json = json,
                Url = url
            };
        }

        public APIResult CallSpotifyAPIArtistsSingles(string artistID) {
            var url = String.Format("https://api.spotify.com/v1/artists/{0}/albums?country=GB&album_type=single&limit=5", artistID);
            var json = CallAPI(null, url);
            return new APIResult {
                Json = json,
                Url = url
            };
        }
        

        public APIResult CallSpotifyAPIAlbumDetails(StopWatchResult stopWatchResult, string id) {
            var url = String.Format("https://api.spotify.com/v1/albums/{0}", id);
            var json = CallAPI(stopWatchResult, url);
            return new APIResult {
                Json = json,
                Url = url
            };
        }
        public List<MultipleAlbums.Album> CallSpotifyAPIMultipleAlbumDetails2(StopWatchResult stopWatchResult,IEnumerable<ArtistAlbums.Item> albums = null) {
            // can only send 20 at a time, so have to chunck if more
            //http://stackoverflow.com/a/17974/26086
            var recordsPerPage = 20;
            var records = albums.Count();
            int numberOfTimesToLoop = (records + recordsPerPage - 1) / recordsPerPage;

            int chunckUpTo = 0;
            var masterListAlbums = new List<MultipleAlbums.Album>();
            for (int i = 0; i < numberOfTimesToLoop; i++) {
                var csvStringOfAlbumIDs = "";
                foreach (var album in albums.Skip(chunckUpTo).Take(20)) {
                    csvStringOfAlbumIDs += album.id + ",";
                }
                csvStringOfAlbumIDs = csvStringOfAlbumIDs.TrimEnd(',');
                var url = String.Format("https://api.spotify.com/v1/albums/?ids={0}", csvStringOfAlbumIDs);
                var json = CallAPI(stopWatchResult, url);
                MultipleAlbums multiAlbumDetails3 = JsonConvert.DeserializeObject<MultipleAlbums>(json);
                // map to list
                foreach (var albumx in multiAlbumDetails3.albums) {
                    masterListAlbums.Add(albumx);
                }
                chunckUpTo += 20;
            }
            return masterListAlbums;
        }

        public APIResult CallSpotifyAPIMultipleAlbumDetails(StopWatchResult stopWatchResult, string csvListOfAlbums) {
            var url = String.Format("https://api.spotify.com/v1/albums/?ids={0}", csvListOfAlbums);
            var json = CallAPI(stopWatchResult, url);
            return new APIResult {
                Json = json,
                Url = url
            };
        }

        public APIResult CallSpotifyAPIArtistRelated(StopWatchResult stopWatchResult, string id) {
            var url = String.Format("https://api.spotify.com/v1/artists/{0}/related-artists", id);
            var json = CallAPI(stopWatchResult, url);
            return new APIResult {
                Json = json,
                Url = url
            };
        }

        public APIResult CallEchonestAPIArtistBiography(StopWatchResult stopWatchResult, string id) {
            var echonestAPIKey = "OMO6U4I5XEGVXYCCN ";
            //http://developer.echonest.com/api/v4/artist/biographies?api_key=FILDTEOIK2HBORODV&id=spotify:artist:4Z8W4fKeB5YxbusRsdQVPb
            var url = String.Format("http://developer.echonest.com/api/v4/artist/biographies?api_key={0}&id=spotify:artist:{1}",
                echonestAPIKey, id);
            var json = CallAPI(stopWatchResult, url);
            return new APIResult {
                Json = json,
                Url = url.Replace(echonestAPIKey, "SECRET")
            };
        }

        public static string CallAPI(StopWatchResult stopWatchResult = null, string url = "") {
            var stopWatch = new Stopwatch();
            stopWatch.Start();

            int errorCount = 0;
            string text = null;
            bool done = false;
            while (!done) {
                try {
                    var request = (HttpWebRequest)WebRequest.Create(url);
                    request.Accept = "application/json";

                    var response = (HttpWebResponse)request.GetResponse();

                    using (var sr = new StreamReader(response.GetResponseStream())) {
                        text = sr.ReadToEnd();
                    }

                    done = true;
                }
                catch (WebException ex) {
                    Debug.WriteLine("Exception: " + ex.Message);
                    Thread.Sleep(100);
                    errorCount++;
                    if (errorCount == 10)
                        throw;
                }
            }

            stopWatch.Stop();
            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:0}", ts.TotalMilliseconds);
            if (stopWatchResult != null) {
                stopWatchResult.ElapsedTime = ts;
                stopWatchResult.TimeInMs = elapsedTime;
            }

            if (String.IsNullOrEmpty(text)) throw new InvalidOperationException();
            return text;
        }
    }
}