using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CSP1.Startup))]
namespace CSP1
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
