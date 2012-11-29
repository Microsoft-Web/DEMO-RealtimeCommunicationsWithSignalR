using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hosting.AspNet;
using Microsoft.AspNet.SignalR.ServiceBus;

[assembly: PreApplicationStartMethod(typeof(Chat.RegisterHubs), "Start")]

namespace Chat
{
    public static class RegisterHubs
    {
        public static void Start()
        {
            GlobalHost.DependencyResolver.UseWindowsAzureServiceBus(
                "Endpoint=sb://NAMESPACE.servicebus.windows.net/;SharedSecretIssuer=owner;SharedSecretValue=KEY",
                1);

            // Register the default hubs route: ~/signalr/hubs
            RouteTable.Routes.MapHubs();            
        }
    }
}
