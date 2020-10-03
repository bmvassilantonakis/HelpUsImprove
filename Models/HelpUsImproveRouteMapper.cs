using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DotNetNuke.Web.Api;

namespace PWGR.Modules.HelpUsImprove.Models
{
    public class HelpUsImproveRouteMapper : IServiceRouteMapper
    {
        public void RegisterRoutes(IMapRoute mapRouteManager)
        {
            mapRouteManager.MapHttpRoute("HelpUsImprove", "default", "{controller}/{action}", new[] { "PWGR.Modules.HelpUsImprove.Models" });
        }
    }
}