using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;
using Newtonsoft.Json;
using StackExchange.Profiling;

namespace DavesMusic.Controllers {

    public class Thing {
        public string href { get; set; }
        public Item[] items { get; set; }
        public int limit { get; set; }
        public string next { get; set; }
        public int offset { get; set; }
        public string previous { get; set; }
        public int total { get; set; }

        public class Item {
            public DateTime added_at { get; set; }
            public Added_By added_by { get; set; }
            public bool is_local { get; set; }
            public Track track { get; set; }
        }

        public class Added_By {
            public External_Urls external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class External_Urls {
            public string spotify { get; set; }
        }

        public class Track {
            public Album album { get; set; }
            public Artist[] artists { get; set; }
            public string[] available_markets { get; set; }
            public int disc_number { get; set; }
            public int duration_ms { get; set; }
            public bool _explicit { get; set; }
            public External_Ids external_ids { get; set; }
            public External_Urls2 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string name { get; set; }
            public int popularity { get; set; }
            public string preview_url { get; set; }
            public int track_number { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
            public Linked_From linked_from { get; set; }
        }

        public class Album {
            public string album_type { get; set; }
            public string[] available_markets { get; set; }
            public External_Urls1 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public Image[] images { get; set; }
            public string name { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class External_Urls1 {
            public string spotify { get; set; }
        }

        public class Image {
            public int height { get; set; }
            public string url { get; set; }
            public int width { get; set; }
        }

        public class External_Ids {
            public string isrc { get; set; }
        }

        public class External_Urls2 {
            public string spotify { get; set; }
        }

        public class Linked_From {
            public External_Urls3 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class External_Urls3 {
            public string spotify { get; set; }
        }

        public class Artist {
            public External_Urls4 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string name { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class External_Urls4 {
            public string spotify { get; set; }
        }

    }

    public class UsersController : Controller {
        string connectionString = ConfigurationManager.ConnectionStrings["DavesMusicConnection2"].ConnectionString;
        MiniProfiler profiler = MiniProfiler.Current;

        public ActionResult Playlists(string id) {
            var returnURL = "/Users/Playlists";
            var ah = new AuthHelper();
            var result = ah.DoAuth(returnURL, this);
            if (result != null)
                return Redirect(result);

            var vm = GetPlaylistDetailsViewModel(id);
            return View(vm);
        }

        private PlaylistSummaryViewModel GetPlaylistDetailsViewModel(string id) {
            var access_token = Session["AccessToken"].ToString();

            // 50 at a time
            var url2 = String.Format("https://api.spotify.com/v1/users/{0}/playlists?limit=50", id);
            var sh = new SpotifyHelper();
            string json;
            using (profiler.Step("Get Users Playlist Details (50 at the moment)")){
                json = sh.CallSpotifyAPIPassingToken(access_token, url2);
            }

            var vm = JsonConvert.DeserializeObject<PlaylistSummaryViewModel>(json);
            vm.access_token = access_token;
            return vm;
        }

        [HttpPost]
        public async Task<ActionResult> Playlists(PlaylistSummaryViewModel vm, string id) {
            ServicePointManager.DefaultConnectionLimit = 5;

            var userId = id;
            var access_token = Session["AccessToken"].ToString();
            var sh = new SpotifyHelper();

            // Create/Update playlist in Spotify
            // like /Playlists/Follow

            // Does the playlist exist already for this user?
            var url4 = String.Format("https://api.spotify.com/v1/users/{0}/playlists", userId);
            string result4;
            using (profiler.Step("POST - Does the Shuffler playlist exist already for this user")) {
                result4 = sh.CallSpotifyAPIPassingToken(access_token, url4);
            }
            var meReponse = JsonConvert.DeserializeObject<PlaylistSummaryViewModel>(result4);
            var currentPlaylistID = "";
            var shuffler = meReponse.items.FirstOrDefault(x => x.name == "Shuffler");
            if (shuffler != null) currentPlaylistID = shuffler.id;

            // If not playlist create one
            if (currentPlaylistID == "") {
                var url2 = String.Format("https://api.spotify.com/v1/users/{0}/playlists", userId);
                string result2;
                using (profiler.Step("POST - Creating Shuffler playlist")){
                    result2 = sh.CallSpotifyCreatePlaylistPostAPIPassingToken(access_token, url2, "Shuffler");
                }
                var playlistReturn = JsonConvert.DeserializeObject<CreatePlaylistReturn>(result2);
                currentPlaylistID = playlistReturn.id;
            }

            // Go through each Checked playlist and add to Shuffler list
            var listOfTrackIDs = new List<String>();

            foreach (var playlist in vm.items) {
                var ownerId = playlist.owner.id;
                var playlistId = playlist.id;
                if (playlist.Checked) {
                    // Get the details of the playlist ie the tracks 
                    PlaylistTracks result22;
                    using (profiler.Step("POST - Async.. Get details of the playlist ie the tracks.. 50 at a time")){
                        result22 = await sh.CallSpotifyAPIPassingTokenPlaylistsAsync(access_token, ownerId, playlistId);
                    }
                    // add tracks to list
                    foreach (var item in result22.items) {
                        listOfTrackIDs.Add(item.track.id);
                    }
                }
            }

            // Get first 100 tracks and put into a csv string
            //string csvOfUris = "";
            //var first100 = listOfTrackIDs.Take(100);
            //foreach (var trackID in listOfTrackIDs) {
            //    csvOfUris += "spotify:track:" + trackID + ",";
            //}
            //csvOfUris = csvOfUris.TrimEnd(',');

            //var url3 = String.Format("https://api.spotify.com/v1/users/{0}/playlists/{1}/tracks?uris={2}", userId, currentPlaylistID, csvOfUris);

            // this will replace
            //var result3 = sh.CallSpotifyPutAPIPassingToken(access_token, url3);
            var result3 = await sh.CallSpotifyPutAPIPassingTokenSendTracksAsync(access_token, userId, currentPlaylistID, listOfTrackIDs);


            // Get data again as not saved, including Checked status
            var vm2 = GetPlaylistDetailsViewModel(id);
            return View(vm2);
        }


    }

    public class PlaylistSummaryViewModel {
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
            public bool @public { get; set; }
            public Tracks tracks { get; set; }
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
        public string access_token { get; set; }
    }
}