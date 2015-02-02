using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web.Mvc;

namespace DavesMusic.Controllers
{
    public class MeController : Controller
    {
        string redirect_uri = "http://dmusic.azurewebsites.net/Me/SpotifyCallback";
        //string redirect_uri = "http://localhost:64550/Me/SpotifyCallback";

        // Me/Index - should get the details of the currently logged in user
        public ActionResult Index()
        {
            // if not authenticated then redirect 
            if (Session["AccessToken"] == null){
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

        public ActionResult SpotifyCallback(string code) {
            // Have now code authorization code (which can be exchanged for an access token)
            var client_id = "0fd1718f5ef14cb291ef114a13382d15";
            var client_secret = "ea47c397921c42ffbd04c53d33685205";

            var url = "https://accounts.spotify.com/api/token";

            // Request access and refresh tokens
            var postData = new Dictionary<string, string>{
                {"grant_type", "authorization_code"},
                {"code", code},
                {"redirect_uri", redirect_uri},
                {"client_id", client_id},
                {"client_secret", client_secret}
            };

            HttpContent content = new FormUrlEncodedContent(postData.ToArray());

            var client = new HttpClient();
            var httpResponse = client.PostAsync(url, content);
            var result = httpResponse.Result;
            var resultContent = result.Content.ReadAsStringAsync().Result;


            var obj = JsonConvert.DeserializeObject<accesstoken>(resultContent, new JsonSerializerSettings {
                TypeNameHandling = TypeNameHandling.All,
                TypeNameAssemblyFormat = System.Runtime.Serialization.Formatters.FormatterAssemblyStyle.Simple
            });
            var access_token = obj.access_token;

            // Set access token in session
            Session["AccessToken"] = access_token;
            // Get return URL from session state
            var returnURL = Session["ReturnURL"].ToString();

            return Redirect(returnURL);
           
        }

       

    }
}