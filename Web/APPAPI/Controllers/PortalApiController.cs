using System.Web.Http;
using System.Net.Http;
using PortalAPI_rest.Entities;
using PortalAPI_rest.Logic;

namespace PortalAPI_rest.Controllers
{
    public class PortalApiController : ApiController
    {

        static DatabaseHandler dh = new DatabaseHandler();
        private HttpResponseMessage httpResponseMessage;
        private BusinessLogic bll = new BusinessLogic();

        public PortalApiController()
        {
            
        }

        //[HttpGet]
        [ActionName("GetBusinesses")] //GET Requests
        public object FetchBusinesses([FromBody] Business Request)
        {
            APIResponse Response = new APIResponse();
            if (Request == null)
            {
                Response.StatusCode = "100";
                Response.StatusDescription = "BAD REQUEST";
            }
            else
            {
                Response = bll.GetBusinesses(Request);
            }
            return Response;
        }

        [ActionName("RegisterCustomer")]
        public APIResponse AddUser([FromBody] SystemUser Request)
        {
            APIResponse Response = new APIResponse();
            if (Request == null)
            {
                Response.StatusCode = "100";
                Response.StatusDescription = "BAD REQUEST";
            }
            else if (
                string.IsNullOrEmpty(Request.Email) || 
                string.IsNullOrEmpty(Request.FirstName) || 
                string.IsNullOrEmpty(Request.PhoneNumber) || 
                string.IsNullOrEmpty(Request.LastName) || 
                string.IsNullOrEmpty(Request.UserType) || 
                string.IsNullOrEmpty(Request.DateOfBirth) || 
                string.IsNullOrEmpty(Request.Gender)
                )
            {
                Response.StatusCode = "101";
                Response.StatusDescription = "Missing Request Value";
            }
            else
            {
                Response = bll.AddSytemUser(Request);
            }
            return Response;
        }

        [ActionName("AccountLogin")]
        public APIResponse Login([FromBody] Credentials Request)
        {
            APIResponse Response = new APIResponse();
            if (Request == null)
            {
                Response.StatusCode = "100";
                Response.StatusDescription = "BAD REQUEST";
            }
            else if (string.IsNullOrEmpty(Request.Password) || string.IsNullOrEmpty(Request.UserName))
            {
                Response.StatusCode = "101";
                Response.StatusDescription = "Missing Request Value";
            }
            else
            {
                Response = bll.UserLogin(Request);
            }
            return Response;
        }

        [ActionName("ResetPassword")]
        public APIResponse Login([FromBody] string EmailOrPhone)
        {
            APIResponse Response = new APIResponse();
            if (Request == null)
            {
                Response.StatusCode = "100";
                Response.StatusDescription = "BAD REQUEST";
            }
            else if (string.IsNullOrEmpty(EmailOrPhone))
            {
                Response.StatusCode = "101";
                Response.StatusDescription = "Missing Request Value";
            }
            else
            {
                Response = bll.UserReset(EmailOrPhone);
            }
            return Response;
        }

        [ActionName("FetchProducts")]
        public APIResponse Products([FromBody] Product Request)
        {
            APIResponse Response = new APIResponse();
            if (Request == null)
            {
                Response.StatusCode = "100";
                Response.StatusDescription = "BAD REQUEST";
            }
            else if (
                string.IsNullOrEmpty(Request.ProductName)|| 
                string.IsNullOrEmpty(Request.Manufacturer)|| 
                string.IsNullOrEmpty(Request.ISBN)|| 
                string.IsNullOrEmpty(Request.DeliveryAgent)||
                string.IsNullOrEmpty(Request.Description)
                )
            {
                Response.StatusCode = "101";
                Response.StatusDescription = "Missing Request Value";
            }
            else
            {
                Response = bll.UserReset(EmailOrPhone);
            }
            return Response;
        }

    }
}
