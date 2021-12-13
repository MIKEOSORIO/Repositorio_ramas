using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Optimization;

namespace PasosWeb {

    public class BundleConfig {

        public static void RegisterBundles(BundleCollection bundles) {

            //            var scriptBundle = new ScriptBundle("~/Scripts/bundle");
            //            var styleBundle = new StyleBundle("~/Content/bundle");

            //            // jQuery
            //            scriptBundle
            //                .Include("~/Scripts/jquery-3.5.1.js");

            //            // Bootstrap
            //            scriptBundle
            //                .Include("~/Scripts/bootstrap.js");

            //            // Bootstrap
            //            styleBundle
            //                .Include("~/Content/bootstrap.css");

            //            // Custom site styles
            //            styleBundle
            //                .Include("~/Content/Site.css");

            //            bundles.Add(scriptBundle);
            //            bundles.Add(styleBundle);

            //#if !DEBUG
            //            BundleTable.EnableOptimizations = true;
            //#endif

            //var scriptBundle = new ScriptBundle("~/Scripts/bundle");
            //var styleBundle = new StyleBundle("~/Content/bundle");

            //// jQuery
            //scriptBundle
            //    .Include("~/Scripts/jquery-3.1.0.js");

            //// Bootstrap
            //scriptBundle
            //    .Include("~/Scripts/bootstrap.js");

            //// Bootstrap
            //styleBundle
            //    .Include("~/Content/bootstrap.css");

            //// Custom site styles
            //styleBundle
            //    .Include("~/Content/Site.css");

            //bundles.Add(scriptBundle);
            //bundles.Add(styleBundle);

            //bundles.Add(new StyleBundle("~/Content/css").Include(
            //        "~/Content/bootstrap.css",
            //        "~/Content/site.css"));
            var scriptBundle = new ScriptBundle("~/Scripts/bundle");
            var styleBundle = new StyleBundle("~/Content/bundle");

            // jQuery
            scriptBundle
                .Include("~/Scripts/jquery-3.1.0.js");

            // Bootstrap
            scriptBundle
                .Include("~/Scripts/bootstrap.js");

            // Bootstrap
            styleBundle
                .Include("~/Content/Customize/Style.css");

            // Custom site styles
            styleBundle
                .Include("~/Content/Site.css");

            bundles.Add(scriptBundle);
            bundles.Add(styleBundle);



            //#if !DEBUG
            //            BundleTable.EnableOptimizations = true;
            //#endif
        }
    }
}