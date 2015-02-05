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
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Search", id = UrlParameter.Optional }
            );
        }
    }
}
