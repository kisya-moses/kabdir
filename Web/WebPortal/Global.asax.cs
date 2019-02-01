using System;
using System.Security.Principal;
using System.Web;
using System.Web.Management;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;

namespace WebPortal
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup

            //bool INSTALLED = CheckInstalled();
            //string [] LICENCED = ValidateLicence("1234500JT");
            //if (LICENCED[0]=="TRUE")
            //{
            //    Session["LICENCE_KEY"] = LICENCED[1];
            //}
            //if (!INSTALLED)
            //{
            //    CreateDeafultAdmin();
            //}
            //RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        private bool CheckInstalled()
        {
            throw new NotImplementedException();
        }

        private bool ValidateLicenceData()
        {
            throw new NotImplementedException();
        }

        private void CreateDeafultAdmin()
        {
            throw new NotImplementedException();
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            if (HttpContext.Current.User != null)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    if (HttpContext.Current.User.Identity is FormsIdentity)
                    {
                        FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
                        FormsAuthenticationTicket ticket = id.Ticket;
                        string userData = ticket.UserData;
                        string[] roles = userData.Split(',');
                        HttpContext.Current.User = new GenericPrincipal(id, roles);
                    }
                }
            }
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
            var ex = Server.GetLastError();
            var httpException = ex as HttpException ?? ex.InnerException as HttpException;
            if (httpException == null) return;

            if (httpException.WebEventCode == WebEventCodes.RuntimeErrorPostTooLarge)
            {
                //handle the error
                Response.Write("FILE TOO LARGE"); //for example
            }
            else if(!Request.Url.PathAndQuery.Contains("Login"))
            {
                //Response.Write("SYSTEM ERROR: REFAT 001");
                //Session.Clear();
                Response.Redirect("~/Default");
            }
        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }

    }
}
