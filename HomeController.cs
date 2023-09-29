﻿using OLXPROJECT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OLXPROJECT.Controllers
{
    public class HomeController : Controller
    {
        AddlistRepo add = new AddlistRepo();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Addlist()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Addlists()
        {
            var productlist = add.GetAddlists();
            return View(productlist);
        }
        


    }
}