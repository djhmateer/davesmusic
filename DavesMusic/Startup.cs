using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DavesMusic.Startup))]
namespace DavesMusic
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
