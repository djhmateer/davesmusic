using System;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace DavesMusic.Controllers
{
    public class BrowseController : Controller
    {
        // Browse/NewReleases
        public ActionResult NewReleases()
        {
            // if not authenticated then redirect 
            if (Session["AccessToken"] == null) {
                var client_id = "0fd1718f5ef14cb291ef114a13382d15";
                var response_type = "code";
                var scope = "user-read-private user-read-email";

                var url =
                    String.Format(
                        "https://accounts.spotify.com/authorize/?client_id={0}&response_type={1}&scope={3}&redirect_uri={2}",
                        client_id, response_type, GetRedirectUriWithServerName(), scope);

                Session["ReturnURL"] = "/Browse/NewReleases";
                return Redirect(url);
            }

            var access_token = Session["AccessToken"].ToString();
            var url2 = "https://api.spotify.com/v1/browse/new-releases";
            var sh = new SpotifyHelper();
            var result2 = sh.CallSpotifyAPIPassingToken(access_token, url2);

            // Album details didn't work here...!!!
            var meReponse = JsonConvert.DeserializeObject<AlbumDetails>(result2);
            meReponse.access_token = access_token;
            return View(meReponse);
        }

        string GetRedirectUriWithServerName() {
            return "http://" + Request.Url.Authority + "/Me/SpotifyCallback";
        }
    }
}