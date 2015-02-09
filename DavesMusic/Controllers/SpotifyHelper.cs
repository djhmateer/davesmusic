using System;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading;
using System.Web;

namespace DavesMusic.Controllers{
   
    public class SpotifyHelper {

        public string CallSpotifyAPIPassingToken(string access_token, string url) {
            var client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", access_token);
            var httpResponse = client.GetAsync(url);
            var result = httpResponse.Result.Content.ReadAsStringAsync().Result;
            return result;
        }

        public string CallSpotifyPutAPIPassingToken(string access_token, string url) {
            var client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", access_token);
            // **HERE** - getting doesn't seem to be working
            var httpResponse = client.PutAsync(url,null);
            var result = httpResponse.Result.Content.ReadAsStringAsync().Result;
            return result;
        }

        public string CallSpotifyAPISearch(string artistName, int offset) {
            if (!String.IsNullOrWhiteSpace(artistName)) artistName = HttpUtility.UrlEncode(artistName);
            var url = String.Format("https://api.spotify.com/v1/search?q={0}&offset={1}&limit=50&type=artist", artistName, offset);
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
            var url = String.Format("https://api.spotify.com/v1/artists/{0}/albums?country=GB&limit=50", artistCode);
            var json = CallAPI(stopWatchResult, url);
            return new APIResult {
                Json = json,
                Url = url
            };
        }

        public APIResult CallSpotifyAPIAlbum(StopWatchResult stopWatchResult, string id) {
            var url = String.Format("https://api.spotify.com/v1/albums/{0}", id);
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
                    errorCount ++;
                    if (errorCount == 10)
                        throw;
                }
            }

            if (String.IsNullOrEmpty(text)) throw new InvalidOperationException();
            return text;
        }
    }
}