using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;
using Microsoft.AspNet.SignalR.ServiceBus;
using Microsoft.AspNet.SignalR;
using System.Configuration;
using Microsoft.WindowsAzure.ServiceRuntime;

namespace Firework.Web
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    public class MvcApplication : System.Web.HttpApplication
    {
        private string topicPathPrefix = "firework";

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            GlobalHost.DependencyResolver.UseServiceBus(
                           ConfigurationManager.AppSettings["Microsoft.ServiceBus.ConnectionString"], partitionCount: 5, nodeCount: getRoleInstanceCount(), nodeId: getRoleInstanceNumber(), topicPrefix: topicPathPrefix);
        }

        private int getRoleInstanceCount()
        {
            return RoleEnvironment.CurrentRoleInstance.Role.Instances.Count;
        }
        private int getRoleInstanceNumber()
        {
            
            var roleInstanceId = RoleEnvironment.CurrentRoleInstance.Id;
            var li1 = roleInstanceId.LastIndexOf(".");
            var li2 = roleInstanceId.LastIndexOf("_");
            var roleInstanceNo = roleInstanceId.Substring(Math.Max(li1, li2) + 1);
            return Int32.Parse(roleInstanceNo);
        }

    }
}