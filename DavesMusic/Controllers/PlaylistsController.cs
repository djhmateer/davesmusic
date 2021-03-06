﻿using System.Data.SqlClient;
using System.Linq;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.Mvc;

namespace DavesMusic.Controllers {
    public class PlaylistsController : Controller {
        string connectionString = ConfigurationManager.ConnectionStrings["DavesMusicConnection2"].ConnectionString;

        public ActionResult Details(string id, string userId) {
            var returnURL = "/Playlists/Details/" + id + "/" + userId;
            var ah = new AuthHelper();
            var result = ah.DoAuth(returnURL, this);
            if (result != null)
                return Redirect(result);

            var access_token = Session["AccessToken"].ToString();
            var url2 = String.Format("https://api.spotify.com/v1/users/{0}/playlists/{1}", userId, id);
            var sh = new SpotifyHelper();
            var result2 = sh.CallSpotifyAPIPassingToken(access_token, url2);

            var meReponse = JsonConvert.DeserializeObject<PlaylistDetails>(result2);
            meReponse.access_token = access_token;
            return View(meReponse);
        }

        ///v1/users/{owner_id}/playlists/{playlist_id}/followers
        public ActionResult Follow(string ownerId, string playlistId) {
            var returnURL = "/Playlists/Follow/" + ownerId + "/" + playlistId;
            var ah = new AuthHelper();
            var result = ah.DoAuth(returnURL, this);
            if (result != null)
                return Redirect(result);

            var access_token = Session["AccessToken"].ToString();
            var url2 = String.Format("https://api.spotify.com/v1/users/{0}/playlists/{1}/followers", ownerId, playlistId);
            var sh = new SpotifyHelper();
            var result2 = sh.CallSpotifyPutAPIPassingToken(access_token, url2);

            return Redirect("/Profiles/Me");
        }

        //eg /v1/users/davemateer/playlists
        public ActionResult Create() {
            var returnURL = "/Playlists/Create";

            var ah = new AuthHelper();
            var result = ah.DoAuth(returnURL, this);
            if (result != null)
                return Redirect(result);

            var sh = new SpotifyHelper();
            var access_token = Session["AccessToken"].ToString();

            // Get the current users id eg davemateer
            var url7 = "https://api.spotify.com/v1/me";
            var result7 = sh.CallSpotifyAPIPassingToken(access_token, url7);

            var meReponse7 = JsonConvert.DeserializeObject<MeResponse>(result7);
            string userId = meReponse7.id;

            // Does the playlist exist already for this user?
            var url4 = String.Format("https://api.spotify.com/v1/users/{0}/playlists", userId);
            var result4 = sh.CallSpotifyAPIPassingToken(access_token, url4);
            var meReponse = JsonConvert.DeserializeObject<PlaylistSummaryViewModel>(result4);
            var currentPlaylistID = "";
            foreach (var thing in meReponse.items) {
                if (thing.name == "DTM - Playlist") {
                    currentPlaylistID = thing.id;
                }
            }

            // If not playlist create one
            if (currentPlaylistID == "") {
                var url2 = String.Format("https://api.spotify.com/v1/users/{0}/playlists", userId);
                var result2 = sh.CallSpotifyCreatePlaylistPostAPIPassingToken(access_token, url2);
                var playlistReturn = JsonConvert.DeserializeObject<CreatePlaylistReturn>(result2);
                currentPlaylistID = playlistReturn.id;
            }

            // Get trackID's from database to add to Spotify (the app saves the trackID's to the db before we send to spotify)
            var listOfTrackIDs = new List<String>();
            using (var connection = new SqlConnection(connectionString))
            using (var command = new SqlCommand(null, connection)) {
                connection.Open();
                command.CommandText = String.Format("SELECT TrackID FROM UserPlaylists WHERE UserID = @UserID");
                command.Parameters.AddWithValue("@UserID", userId);
                command.CommandType = System.Data.CommandType.Text;
                using (var reader = command.ExecuteReader()) {
                    while (reader.Read()) {
                        var trackID = reader.GetString(reader.GetOrdinal("TrackID"));
                        listOfTrackIDs.Add(trackID);
                    }
                }
            }

            if (listOfTrackIDs.Count > 100) {
                string csvOfUris = "";

                // Get first 100 tracks and put into a csv string
                var first100 = listOfTrackIDs.Take(100);
                foreach (var trackID in first100) {
                    csvOfUris += "spotify:track:" + trackID + ",";
                }
                csvOfUris = csvOfUris.TrimEnd(',');

                var url3 = String.Format("https://api.spotify.com/v1/users/{0}/playlists/{1}/tracks?uris={2}", userId,currentPlaylistID, csvOfUris);

                // this will replace
                var result3 = sh.CallSpotifyPutAPIPassingToken(access_token, url3);

                var recordsPerPage = 100;
                var records = listOfTrackIDs.Count;
                int numberOfTimesToLoop = (records + recordsPerPage - 1) / recordsPerPage;

                // 1 as we've already done the first loop (0 based)
                for (int i = 1; i < numberOfTimesToLoop; i++) {
                    var stuff = listOfTrackIDs.Skip(100 * i).Take(100);
                    csvOfUris = "";
                    foreach (var trackID in stuff) {
                        csvOfUris += "spotify:track:" + trackID + ",";
                    }
                    csvOfUris = csvOfUris.TrimEnd(',');

                    // this will add
                    url3 = String.Format("https://api.spotify.com/v1/users/{0}/playlists/{1}/tracks?uris={2}", userId, currentPlaylistID, csvOfUris);
                    var result5 = sh.CallSpotifyPostAPIPassingToken(access_token, url3);
                }

               
            }
            else {
                string csvOfUris = "";

                var first100 = listOfTrackIDs;
                foreach (var trackID in first100) {
                    csvOfUris += "spotify:track:" + trackID + ",";
                }
                csvOfUris = csvOfUris.TrimEnd(',');

                var url3 = String.Format("https://api.spotify.com/v1/users/{0}/playlists/{1}/tracks?uris={2}", userId,
                    currentPlaylistID, csvOfUris);

                // this will replace
                var result3 = sh.CallSpotifyPutAPIPassingToken(access_token, url3);
            }

            return Redirect("/");
        }
    }

    public class CreatePlaylistReturn {

        public class ExternalUrls {
            public string spotify { get; set; }
        }

        public class Followers {
            public object href { get; set; }
            public int total { get; set; }
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
            public List<object> items { get; set; }
            public int limit { get; set; }
            public object next { get; set; }
            public int offset { get; set; }
            public object previous { get; set; }
            public int total { get; set; }
        }

        public bool collaborative { get; set; }
        public object description { get; set; }
        public ExternalUrls external_urls { get; set; }
        public Followers followers { get; set; }
        public string href { get; set; }
        public string id { get; set; }
        public List<object> images { get; set; }
        public string name { get; set; }
        public Owner owner { get; set; }
        public bool @public { get; set; }
        public string snapshot_id { get; set; }
        public Tracks tracks { get; set; }
        public string type { get; set; }
        public string uri { get; set; }
    }

    public class PlaylistDetails {
        public class ExternalUrls {
            public string spotify { get; set; }
        }

        public class Followers {
            public object href { get; set; }
            public int total { get; set; }
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

        public class ExternalUrls3 {
            public string spotify { get; set; }
        }

        public class AddedBy {
            public ExternalUrls3 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class ExternalUrls4 {
            public string spotify { get; set; }
        }

        public class Image2 {
            public int height { get; set; }
            public string url { get; set; }
            public int width { get; set; }
        }

        public class Album {
            public string album_type { get; set; }
            public List<object> available_markets { get; set; }
            public ExternalUrls4 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public List<Image2> images { get; set; }
            public string name { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class ExternalUrls5 {
            public string spotify { get; set; }
        }

        public class Artist {
            public ExternalUrls5 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string name { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class ExternalIds {
            public string isrc { get; set; }
        }

        public class ExternalUrls6 {
            public string spotify { get; set; }
        }

        public class Track {
            public Album album { get; set; }
            public List<Artist> artists { get; set; }
            public List<object> available_markets { get; set; }
            public int disc_number { get; set; }
            public int duration_ms { get; set; }
            public bool @explicit { get; set; }
            public ExternalIds external_ids { get; set; }
            public ExternalUrls6 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public bool is_playable { get; set; }
            public string name { get; set; }
            public int popularity { get; set; }
            public string preview_url { get; set; }
            public int track_number { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class Item {
            public string added_at { get; set; }
            public AddedBy added_by { get; set; }
            public Track track { get; set; }
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

        public bool collaborative { get; set; }
        public string description { get; set; }
        public ExternalUrls external_urls { get; set; }
        public Followers followers { get; set; }
        public string href { get; set; }
        public string id { get; set; }
        public List<Image> images { get; set; }
        public string name { get; set; }
        public Owner owner { get; set; }
        public bool @public { get; set; }
        public string snapshot_id { get; set; }
        public Tracks tracks { get; set; }
        public string type { get; set; }
        public string uri { get; set; }
        public string access_token { get; set; }
    }

    public class PlaylistTracks {
        public string href { get; set; }
        public List<Item> items { get; set; }
        public int limit { get; set; }
        public string next { get; set; }
        public int offset { get; set; }
        public object previous { get; set; }
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

        public class Artist {
            public External_Urls3 external_urls { get; set; }
            public string href { get; set; }
            public string id { get; set; }
            public string name { get; set; }
            public string type { get; set; }
            public string uri { get; set; }
        }

        public class External_Urls3 {
            public string spotify { get; set; }
        }

    }

}