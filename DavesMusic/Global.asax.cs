using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using log4net;

namespace DavesMusic
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            log4net.Config.XmlConfigurator.Configure();

            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        void Application_Error(Object sender, EventArgs e) {
#if DEBUG
            Console.WriteLine("Error not handled as in Debug");
#else
   var exception = Server.GetLastError();

            if (exception == null)
                return;
            ILog log = LogManager.GetLogger(typeof(MvcApplication));
            log.Error(exception.Message);
            log.Error(Request.RawUrl);
            log.Error(exception.StackTrace);

            // Clear the error
            Server.ClearError();

            // Redirect to a landing page
            Response.Redirect("/home/error");
#endif
        }
    }
}
