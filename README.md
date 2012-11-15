DEMO-RealtimeCommunicationsWithSignalR
======================================
<a name="outline" />
## Outline ##
This demo shows how to use SignalR to build a highly interactive web application, and how to use Service Bus backplane to scale SignalR hub to multiple service instances. The demo starts with a single page web application that allows a user to play virtual firworks. Then we'll extend the applications so that all users can share the same canvas and play fireworks together over the Internet.

>**Note:** Under code folder there are folders for complete code of each phase. **Firework** is the starting project. **Firework-SignalR** is after SignalR is enabled. And **Firework-End** is the final project with Service Bus backplane.

<a name="demo-preparation" />
## Demo Preparation ##
- This demo uses pre-release of ASP.NET SignalR library. You'll need to create a local NuGet source and points it to **code\Assets\SingalRAlpha10-24**. You should set up the source before you attempt to open and compile the solution.
- The order of adding NuGet package references is important for this project. The correct order should be: jQuery 1.8.2, Windows Azure Service Bus 1.8.0, and then Microsoft ASP.NET SignalR Service Bus Library (alpha).

<a name="enabling-signalr" />
## Enabling SignalR ##
1. Open **Firework.Web**. 
1. Add a reference to **jQuery 1.8.2** NuGet package.
1. Add a reference to **Microsoft ASP.NET SignalR** Nuget package.
2. Add **FireworkHub.cs** from **code\Assets** to the project.
3. Open **Views\Home\Index.cshtml**.
4. Add references to SignalR javascript libraries:
    
    ````HTML
<script src="~/Scripts/jquery.signalR-1.0.0-alpha1-121025.js"></script>
<script src="~/signalr/hubs" type="text/javascript"></script>
````

5. Replace

    ````JavaScript
fireworks.push(firework);
````
with

    ````JavaScript
hub.server.add(fireworkType.value, firework.BaseX, firework.BaseY, fireworkColor.value);
````
    > **Note:** Instead of adding the firework to local array, we ask server to broadcast the add operation.

6. Replace

    ````JavaScript
setTimeout(updateCanvas, 50); //Start rendering routine.
````
with

    ````JavaScript
hub = $.signalR.fireworkHub;
$.signalR.hub.stateChanged(connectionStateChanged);
hub.on("addFirework",function (firework) {
    if (firework.Type == 1)
        fireworks.push(new SimpleFirework(firework.X, firework.Y, firework.Color));
    else
        fireworks.push(new ComplexFirework(firework.X, firework.Y, firework.Color));
});
$.signalR.hub.start().done(function()
{
        enableUI = true;
        setTimeout(updateCanvas, 50);
});
````
7. Change

    ````JavaScript
var enableUI = true; 
````
to

    ````JavaScript
var enableUI = false; 
````
    > **Note:** This locks up the canvas till client is connected.

<a name="scaling-signalr" />
## Scaling SignalR ##
1. Open **Firework.Web**.
1. Add a refernce to **Windows Azure Service Bus** NuGet package.
1.  Add a reference to **Microsoft ASP.NET SignalR Service Bus Libraries**.
2. Add **Global.asax.cs** from **code\Assets** folder, replace the existing file.

    > **Note:** The new code constains standard code to initialize Service Bus backplane.
3. Open **Web.config** and enter your Service Bus connection string as value of **Microsoft.ServiceBus.ConnectionString**.

<a name="appendix" />

<a name="optional-play-online" />
## (Optional) Play Online ##
Invite audience to play at http://firework.cloudapp.net/ using their Windows Phone, Surface, Windows 8 PC, iPhone, or iPad. This deployment contains 2 instances and should be good to hold up for several hundereds of concurrent fireworks. Note some mobile devices may have a hard time rendering all the sparks when there are many fireworks playing at the same time.

## Appendix ##
Currently, Windows Auzre osFamily 3 doesn't have WebSockets enabled by default. To work around that, you can use a startup task to enable WebSockets on the host machine. This is unnecessary to a successful demo as SignalR automatically falls back to other means of connection. Read <http://haishibai.blogspot.com/2012/11/play-fireworks-together-process-of.html> for more details.

