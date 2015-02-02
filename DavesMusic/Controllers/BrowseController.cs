using System;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace DavesMusic.Controllers
{
    public class BrowseController : Controller
    {
        string redirect_uri = "http://dmusic.azurewebsites.net/Me/SpotifyCallback";
        //string redirect_uri = "http://localhost:64550/Me/SpotifyCallback";

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
                        client_id, response_type, redirect_uri, scope);

                Session["ReturnURL"] = "/Me/Index";
                return Redirect(url);
            }

            var access_token = Session["AccessToken"].ToString();
            var url2 = "https://api.spotify.com/v1/me";
            var sh = new SpotifyHelper();
            var result2 = sh.CallSpotifyAPIPassingToken(access_token, url2);

            var meReponse = JsonConvert.DeserializeObject<MeResponse>(result2);
            meReponse.access_token = access_token;
            return View(meReponse);
        }
    }
}