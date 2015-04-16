using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;
using AutoMapper;
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
        MiniProfiler mp = MiniProfiler.Current;
        SpotifyHelper sh = new SpotifyHelper();

        public async Task<ActionResult> Playlists(string id, bool doAsync = true) {
            var returnURL = "/Users/Playlists";
            var ah = new AuthHelper();
            var result = ah.DoAuth(returnURL, this);
            if (result != null)
                return Redirect(result);

            var vm = await GetPlaylistDetailsViewModel(id, doAsync);
            return View(vm);
        }

        private async Task<PlaylistSummaryViewModel> GetPlaylistDetailsViewModel(string id, bool doAsync = true) {
            ServicePointManager.DefaultConnectionLimit = 5;
            var access_token = Session["AccessToken"].ToString();

            var url = String.Format("https://api.spotify.com/v1/users/{0}/playlists?limit=50", id);
            string json;
            using (mp.Step("Get Users Playlists first 50")) {
                json = sh.CallSpotifyAPIPassingToken(access_token, url);
            }
            var vm = JsonConvert.DeserializeObject<PlaylistSummaryViewModel>(json);

            var recordsPerPage = 50;

            if (vm.total > recordsPerPage) {
                var totalRecords = vm.total;
                int numberOfTimesToLoop = (totalRecords + recordsPerPage - 1) / recordsPerPage;

                // we've already done the first query to get the total, do skip that
                numberOfTimesToLoop -= 1;
                if (doAsync) {
                    using (mp.Step("Async " + numberOfTimesToLoop + " queries"))
                    using (mp.CustomTiming("http", "overall")) {
                        var tasks = new Task<string>[numberOfTimesToLoop];
                        int offset = 0;
                        for (int i = 0; i < numberOfTimesToLoop; i++) {
                            // start offset at 50
                            offset += recordsPerPage;
                            url = String.Format("https://api.spotify.com/v1/users/{0}/playlists?limit={2}&offset={1}", id,
                                offset, recordsPerPage);
                            tasks[i] = sh.CallSpotifyAPIPassingTokenAsync(access_token, url);
                        }
                        // at this point all tasks will be running at the same time
                        await Task.WhenAll(tasks);
                    }

                    for (int i = 0; i < numberOfTimesToLoop - 1; i++) {
                        var vm2 = JsonConvert.DeserializeObject<PlaylistSummaryViewModel>(json);
                        // merge with vm
                        vm.items = vm.items.Union(vm2.items).ToList();
                    }
                }
                else {
                    for (int i = 1; i < numberOfTimesToLoop; i++) {
                        int offset = i * recordsPerPage;
                        url = String.Format("https://api.spotify.com/v1/users/{0}/playlists?limit={2}&offset={1}", id, offset, recordsPerPage);
                        using (mp.Step("Get Users Playlists - " + i)) {
                            json = sh.CallSpotifyAPIPassingToken(access_token, url);
                        }

                        var vm2 = JsonConvert.DeserializeObject<PlaylistSummaryViewModel>(json);
                        // merge with vm
                        vm.items = vm.items.Union(vm2.items).ToList();
                    }
                }
            }
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
            using (mp.Step("POST - Does the Shuffler playlist exist already for this user")) {
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
                using (mp.Step("POST - Creating Shuffler playlist")) {
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
                    using (mp.Step("POST - Async.. Get details of the playlist ie the tracks.. 50 at a time")) {
                        result22 = await sh.CallSpotifyAPIPassingTokenPlaylistsAsync(access_token, ownerId, playlistId);
                    }
                    // add tracks to list
                    foreach (var item in result22.items) {
                        // catching a track in a playlist with no id
                        if (item.track != null)
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
            var vm2 = await GetPlaylistDetailsViewModel(id);
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