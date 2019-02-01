using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;

namespace WebPortal
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkID=303951
        public static void RegisterBundles(BundleCollection bundles)
        {
            /*
            <script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
            <script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
            <script src="view/javascript/jquery/datetimepicker/moment/moment.min.js" type="text/javascript"></script>
            <script src="view/javascript/jquery/datetimepicker/moment/moment-with-locales.min.js" type="text/javascript"></script>
            <script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
            <script src="view/javascript/common.js" type="text/javascript"></script>

             */
            bundles.Add(new ScriptBundle("~/bundles/js").Include(
                            "~/js/jquery-3.3.1.min.js",
                            "~/js/bootstrap.js",
                            "~/js/datetimepicker/moment/moment.min.js",
                            "~/js/datetimepicker/moment/moment-with-locales.min.js",
                            "~/js/datetimepicker/bootstrap-datetimepicker.min.js",
                            "~/js/swiper/js/swiper.jquery.js",
                            "~/js/common.js",
                            "~/js/select2.min.js",
                            "~/js/dropzone.js"
                            ));

            /***    
            *    <link href="view/stylesheet/bootstrap.css" type="text/css" rel="stylesheet" />
            *    <link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
            *    <link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
            *    <link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="screen" />
            *    
            ***/
            bundles.Add(new StyleBundle("~/bundles/css").Include(
                "~/css/bootstrap.css",
                "~/css/font-awesome/css/font-awesome.min.css",
                "~/js/datetimepicker/bootstrap-datetimepicker.min.css",
                "~/css/bstylesheet.css",
                "~/css/select2.full.min.css",
                "~/css/dropzone.css"
                ));
            /***
             *     <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
             *     <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
             *     <link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
             *     <link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
             *     <link href="catalog/view/javascript/jquery/swiper/css/swiper.min.css" type="text/css" rel="stylesheet" media="screen" />
             *     <link href="catalog/view/javascript/jquery/swiper/css/opencart.css" type="text/css" rel="stylesheet" media="screen" />
             *     
             ***/
            bundles.Add(new StyleBundle("~/bundles/frontend/css").Include(
                "~/css/bootstrap.css",
                "~/css/font-awesome/css/font-awesome.min.css",
                "~/css/fstylesheet.css",
                "~/js/swiper/css/swiper.min.css",
                "~/js/swiper/css/opencart.css"
                ));

        }

    }
}