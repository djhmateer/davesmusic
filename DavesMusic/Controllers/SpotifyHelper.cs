using System.Threading.Tasks;
using Newtonsoft.Json;
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

namespace DavesMusic.Controllers {

    public class SpotifyHelper {

        public string CallSpotifyAPIPassingToken(string access_token, string url) {
            var client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", access_token);
            var httpResponse = client.GetAsync(url);
            var result = httpResponse.Result.Content.ReadAsStringAsync().Result;
            return result;
        }

        string Actual(DateTime time) {
            return (DateTime.Now - time).TotalMilliseconds.ToString();
        }

        async Task<string> CallAPI(int i, string access_token, string ownerId, string playlistId) {
            int offset = 0;
            if (i == 0) offset = 0;
            if (i == 1) offset = 100;
            if (i == 2) offset = 200;

            var url = String.Format("https://api.spotify.com/v1/users/{0}/playlists/{1}?market=GB&limit=100&offset={2}", ownerId, playlistId, offset);
            Debug.WriteLine(url, i);

            var time = DateTime.Now;
            string result;
            using (var client = new HttpClient()) {
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", access_token);
                // ConfigureAwat - do not capture the current ASP.NET request context
                var response = await client.GetAsync(url).ConfigureAwait(false);

                // Not on the original context here, instead we're running on the thread pool
                response.EnsureSuccessStatusCode();
                result = await response.Content.ReadAsStringAsync().ConfigureAwait(false);
            }
            Debug.WriteLine(Actual(time), "After " + i);
            // problem is we're getting the same result back!!!!!**HERE** both time.
            return result;
        }

        public async Task<PlaylistDetails> CallSpotifyAPIPassingTokenPlaylistsAsync(string access_token, string ownerId, string playlistId) {
            // get tracks from a playlist - async if necessary
            var url = String.Format("https://api.spotify.com/v1/users/{0}/playlists/{1}", ownerId, playlistId);

            // call API synchronously once to get the total number of calls I need to do
            var apiResult = CallSpotifyAPIPassingToken(access_token, url);
            PlaylistDetails playlistDetails = JsonConvert.DeserializeObject<PlaylistDetails>(apiResult);
            int total = playlistDetails.tracks.total;

            var recordsPerPage = 100;
            var records = total;
            int numberOfTimesToLoop = (records + recordsPerPage - 1) / recordsPerPage;

            if (numberOfTimesToLoop == 1) {
                // don't need to do more calls
                return playlistDetails;
            }
            var sw = new Stopwatch();
            sw.Start();

            ServicePointManager.DefaultConnectionLimit = 5;
            int n = numberOfTimesToLoop;
            var tasks = new Task<string>[n];
            for (int i = 0; i < n; i++) {
                tasks[i] = CallAPI(i, access_token, ownerId,playlistId);
            }

            await Task.WhenAll(tasks);
            Debug.WriteLine(sw.ElapsedMilliseconds, "After all async tasks");

            // combine results
            var items = new List<PlaylistDetails.Item>();
            int total2 = 0;
            for (int i = 0; i < n; i++) {
                PlaylistDetails playlistDetails2 = JsonConvert.DeserializeObject<PlaylistDetails>(tasks[i].Result);
                foreach (var item in playlistDetails2.tracks.items) {
                    items.Add(item);
                }
                total2 = playlistDetails2.tracks.total;
            }
            var playlistDetails3 = new PlaylistDetails();
            var tracks = new PlaylistDetails.Tracks();
            tracks.items = items;
            playlistDetails3.tracks = tracks;
            playlistDetails3.tracks.total = total2;

            return playlistDetails3;
            
            //var client = new HttpClient();
            //client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", access_token);
            //HttpResponseMessage httpResponse = await client.GetAsync(url);
            //string result = await httpResponse.Content.ReadAsStringAsync();

            //// how many records?
            //var meReponse2 = JsonConvert.DeserializeObject<PlaylistDetails>(result);

            //return result;
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

        public string CallSpotifyCreatePlaylistPostAPIPassingToken(string access_token, string url, string playlistName = "A New Playlist") {
            var client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", access_token);
            var p = new Thing { name = playlistName };
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
                    //ILog log = LogManager.GetLogger(typeof(MvcApplication));
                    //log.Debug("CallAPI trap2: " + url + ex.Message);
                    Thread.Sleep(200);
                    errorCount++;
                    if (errorCount == 200) 
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