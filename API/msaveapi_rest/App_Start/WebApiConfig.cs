using System.Web.Http;

namespace PortalAPI_rest
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services
            // Configure Web API to use only bearer token authentication.

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "PagasusPortalAPIGetFile",
                routeTemplate: "{controller}/{action}/{vendorcode}/{vendorpassword}/{requestid}/{id}",
                defaults: new
                {
                    controller = "PortalAPI",
                    action = "GetFile",
                    vendorcode = "MTN",
                    vendorpassword = "1234",
                    requestid = "",
                    id = RouteParameter.Optional
                }
            );

            config.Routes.MapHttpRoute(
                name: "PagasusPortalAPIInitiateFetchTransactions",
                routeTemplate: "{controller}/{action}/{vendorcode}/{vendorpassword}/{startdate}/{enddate}/{digitalsignature}/{phonenumber}",
                defaults: new
                {
                    controller = "PortalAPI",
                    action = "FetchData",
                }
            );
            config.IncludeErrorDetailPolicy = IncludeErrorDetailPolicy.Never;

        }
    }
}
