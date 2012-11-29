using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Firework.Web.Controllers
{
    public class HomeController : Controller
    {
        ////
        //// GET: /Home/

        //public ActionResult Index()
        //{
        //    return View();
        //}
        public ActionResult Index(int type = 0, int color = 1)
        {
            ViewBag.FireworkType = type;
            ViewBag.FireworkColorIndex = color;
            return View();
        }
    }
}
