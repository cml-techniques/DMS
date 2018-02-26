using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace CMLTechQ
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254726

        public static void RegisterBundles(BundleCollection bundles)
        {
            ConfigureIgnoreList(bundles.IgnoreList);
            bundles.Add(new ScriptBundle("~/bundles/WebFormsJs").Include(
                  "~/Scripts/WebForms/WebForms.js",
                  "~/Scripts/WebForms/WebUIValidation.js",
                  "~/Scripts/WebForms/MenuStandards.js",
                  "~/Scripts/WebForms/Focus.js",
                  "~/Scripts/WebForms/GridView.js",
                  "~/Scripts/WebForms/DetailsView.js",
                  "~/Scripts/WebForms/TreeView.js",
                  "~/Scripts/WebForms/WebParts.js"));
            bundles.Add(new ScriptBundle("~/bundles/scripts").Include(
                "~/Assets/js/jquery.min.js",
                "~/Assets/js/jquery.tabs.min.js",
                "~/Content/js/waypoints.min.js",
                "~/Assets/js/custom.js",
                "~/Assets/js/jquery.nicescroll.js",
                "~/Assets/js/jquery.carouFredSel-6.0.4-packed.js",
                "~/Assets/js/plugins.js",
                "~/Content/js/jquery.easypiechart.min.js",
                "~/Content/js/jquery.prettyPhoto.js",
                "~/Content/js/jquery.sharrre.min.js",
                "~/Content/js/jquery.elevateZoom-3.0.8.min.js",
                "~/Content/js/jquery.placeholder.js",
                "~/Content/js/script.js"));


            bundles.Add(new StyleBundle("~/Content/css").Include("~/Assets/css/Layout.min.css",
                "~/Assets/css/css.css",
                "~/AMS/css/font-awesome.min.css",
                "~/Assets/css/tab.css",
                "~/Assets/css/slider.css",
                "~/Assets/css/Telerik.css",
                "~/Assets/css/OwnStyle1.css",
                "~/Assets/css/font-awesome.min.css",
                "~/Assets/css/Navigation.css"));
        }
        public static void ConfigureIgnoreList(IgnoreList ignoreList)
        {
            if (ignoreList == null) throw new ArgumentNullException("ignoreList");

            ignoreList.Clear(); // Clear the list, then add the new patterns.

            ignoreList.Ignore("*.intellisense.js");
            ignoreList.Ignore("*-vsdoc.js");
            ignoreList.Ignore("*.debug.js", OptimizationMode.WhenEnabled);
            // ignoreList.Ignore("*.min.js", OptimizationMode.WhenDisabled);
            ignoreList.Ignore("*.min.css", OptimizationMode.WhenEnabled);
        }

    }
}