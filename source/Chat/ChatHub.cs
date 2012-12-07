using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR.Hubs;

namespace Chat
{
    [HubName("chat")]
    public class ChatHub : Hub
    {
        public void SendMessage(dynamic message)
        {
            Clients.All.receiveMessage(message);
        }
    }
}