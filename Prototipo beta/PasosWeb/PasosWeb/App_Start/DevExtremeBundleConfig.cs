using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Optimization;

namespace PasosWeb {

    public class DevExtremeBundleConfig {

        public static void RegisterBundles(BundleCollection bundles) {

            var scriptBundle = new ScriptBundle("~/Scripts/DevExtremeBundle");
            var styleBundle = new StyleBundle("~/Content/DevExtremeBundle");

            // CLDR scripts
            scriptBundle
                .Include("~/Scripts/cldr.js")
                .Include("~/Scripts/cldr/event.js")
                .Include("~/Scripts/cldr/supplemental.js")
                .Include("~/Scripts/cldr/unresolved.js");

            // Globalize 1.x
            scriptBundle
                .Include("~/Scripts/globalize.js")
                .Include("~/Scripts/globalize/message.js")
                .Include("~/Scripts/globalize/number.js")
                .Include("~/Scripts/globalize/currency.js")
                .Include("~/Scripts/globalize/date.js");

            // NOTE: jQuery may already be included in the default script bundle. Check the BundleConfig.cs file​​​
            //scriptBundle
            //    .Include("~/Scripts/jquery-3.1.0.js");

            // JSZip for client side export
            //scriptBundle
            //    .Include("~/Scripts/jszip.js");

            // DevExtreme + extensions
            scriptBundle
                .Include("~/Scripts/dx.all.js")
                .Include("~/Scripts/aspnet/dx.aspnet.data.js")
                .Include("~/Scripts/aspnet/dx.aspnet.mvc.js");

            // dxVectorMap data (http://js.devexpress.com/Documentation/Guide/Data_Visualization/VectorMap/Providing_Data/#Data_for_Areas)
            //scriptBundle
            //    .Include("~/Scripts/vectormap-data/africa.js")
            //    .Include("~/Scripts/vectormap-data/canada.js")
            //    .Include("~/Scripts/vectormap-data/eurasia.js")
            //    .Include("~/Scripts/vectormap-data/europe.js")
            //    .Include("~/Scripts/vectormap-data/usa.js")
            //    .Include("~/Scripts/vectormap-data/world.js");


            // DevExtreme
            // NOTE: see the available theme list here: http://js.devexpress.com/Documentation/Guide/Themes/Predefined_Themes/                    
            styleBundle
                .Include("~/Content/dx.common.css")
                .Include("~/Content/dx.light.css");


            bundles.Add(scriptBundle);
            bundles.Add(styleBundle);
            //************
            //var styleBundle = new StyleBundle("~/Content/DevExtremeBundle");
            //var scriptBundle = new ScriptBundle("~/Scripts/DevExtremeBundle");

            //// Uncomment to use the Gantt control
            ////styleBundle.Include("~/Content/dx-gantt.css");

            //// Uncomment to use the Diagram control
            ////styleBundle.Include("~/Content/dx-diagram.css");

            //styleBundle.Include("~/Content/dx.common.css");

            //// Predefined themes: https://js.devexpress.com/DevExtreme/Guide/Themes_and_Styles/Predefined_Themes/
            //styleBundle.Include("~/Content/dx.light.css");

            //// Uncomment to use the Gantt control
            ////scriptBundle.Include("~/Scripts/dx-gantt.js");

            //// Uncomment to use the Diagram control
            ////scriptBundle.Include("~/Scripts/dx-diagram.js");

            //// NOTE: jQuery may already be included in the default script bundle. Check the BundleConfig.cs file.
            ////scriptBundle.Include("~/Scripts/jquery-3.5.1.js");

            //// Uncomment to use Globalize for localization
            //// Docs: https://docs.devexpress.com/DevExtremeAspNetMvc/400706#globalize
            ////scriptBundle.Include("~/Scripts/cldr.js");
            ////scriptBundle.Include("~/Scripts/cldr/event.js");
            ////scriptBundle.Include("~/Scripts/cldr/supplemental.js");
            ////scriptBundle.Include("~/Scripts/cldr/unresolved.js");
            ////scriptBundle.Include("~/Scripts/globalize.js");
            ////scriptBundle.Include("~/Scripts/globalize/message.js");
            ////scriptBundle.Include("~/Scripts/globalize/number.js");
            ////scriptBundle.Include("~/Scripts/globalize/currency.js");
            ////scriptBundle.Include("~/Scripts/globalize/date.js");

            //// Uncomment to enable client-side export
            ////scriptBundle.Include("~/Scripts/jszip.js");

            //scriptBundle.Include("~/Scripts/dx.all.js");

            //// Uncomment to provide geo-data for the VectorMap control
            //// Docs: https://js.devexpress.com/DevExtreme/Guide/Widgets/VectorMap/Providing_Data/#Data_for_Areas
            ////scriptBundle.Include("~/Scripts/vectormap-data/world.js");

            //scriptBundle.Include("~/Scripts/aspnet/dx.aspnet.mvc.js");
            //scriptBundle.Include("~/Scripts/aspnet/dx.aspnet.data.js");

            //bundles.Add(styleBundle);
            //bundles.Add(scriptBundle);

#if !DEBUG
            BundleTable.EnableOptimizations = true;
#endif
        }
    }
}