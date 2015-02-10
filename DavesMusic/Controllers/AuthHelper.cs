using System;
using System.Web.Mvc;

namespace DavesMusic.Controllers{
    public class AuthHelper {
        public string DoAuth(string returnURL, Controller controller) {
            if (controller.Session["AccessToken"] == null) {
                var client_id = "0fd1718f5ef14cb291ef114a13382d15";
                var response_type = "code";
                var scope = "user-read-private user-read-email playlist-modify-public ";

                var xx = "http://" + controller.Request.Url.Authority + "/Profiles/SpotifyCallback";
                var url =
                    String.Format(
                        "https://accounts.spotify.com/authorize/?client_id={0}&response_type={1}&scope={3}&redirect_uri={2}",
                        client_id, response_type, xx, scope);

                controller.Session["ReturnURL"] = returnURL;
                return url;
            }
            return null;
        }
    }
}