using System.Web.Mvc;
using System.Web.Routing;

namespace DavesMusic {
    public class RouteConfig {
        public static void RegisterRoutes(RouteCollection routes) {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Playlists",
                url: "Playlists/Details/{id}/{userId}",
                defaults: new { controller = "Playlists", action = "Details", id = UrlParameter.Optional, userId = UrlParameter.Optional }
            );

            routes.MapRoute(
               name: "Playlists2",
               url: "Playlists/Follow/{ownerId}/{playlistId}",
               defaults: new { controller = "Playlists", action = "Follow" }
           );


            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "TopTracks", id = UrlParameter.Optional }
                //defaults: new { controller = "Home", action = "SpeedTest", id = UrlParameter.Optional }
            );
        }
    }
}
