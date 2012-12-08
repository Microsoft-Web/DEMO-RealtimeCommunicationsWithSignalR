using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR.Hubs;

namespace SignalRHitCount
{
    public class HitCounter : Hub
    {
        static int _hitCount;

        public void RecordHit()
        {
            _hitCount += 1;
            Clients.All.onHitRecorded(_hitCount);
        }

        public override System.Threading.Tasks.Task OnDisconnected()
        {
            _hitCount -= 1;
            Clients.All.onHitRecorded(_hitCount);

            return base.OnDisconnected();
        }
    }
}