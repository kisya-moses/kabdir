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
        [ActionName("FetchData")] //GET Requests
        public object DownloadTransactionsFile([FromBody] APIRequest Request)
        {
            APIResponse Response = new APIResponse();
            if (Request == null)
            {
                Response.StatusCode = "100";
                Response.StatusDescription = "BAD REQUEST";
            }
            else
            {
                Response = bll.GetAPIResponse(Request);
            }
            return Response;
        }


        [ActionName("AddVillage")]
        public APIResponse AddVillage([FromBody] Village Request)
        {
            APIResponse Response = new APIResponse();
            if (Request == null)
            {
                Response.StatusCode = "100";
                Response.StatusDescription = "BAD REQUEST";
            }
            else if (string.IsNullOrEmpty(Request.Name)|| string.IsNullOrEmpty(Request.Code)|| string.IsNullOrEmpty(Request.SubCountyID))
            {
                Response.StatusCode = "101";
                Response.StatusDescription = "Missing Request Value";
            }
            else
            {
                Response = bll.AddVillage(Request);
            }
            return Response;
        }

        [ActionName("AddDistrict")]
        public APIResponse AddDistrict([FromBody] District Request)
        {
            APIResponse Response = new APIResponse();
            if (Request == null)
            {
                Response.StatusCode = "100";
                Response.StatusDescription = "BAD REQUEST";
            }
            else if (string.IsNullOrEmpty(Request.Code) || string.IsNullOrEmpty(Request.Name) || string.IsNullOrEmpty(Request.UserID))
            {
                Response.StatusCode = "101";
                Response.StatusDescription = "Missing Request Value";
            }
            else
            {
                Response = bll.AddDistrict(Request);
            }
            return Response;
        }

        [ActionName("AddSubCounty")]
        public APIResponse AddSubCounty([FromBody] SubCounty Request)
        {
            APIResponse Response = new APIResponse();
            if (Request == null)
            {
                Response.StatusCode = "100";
                Response.StatusDescription = "BAD REQUEST";
            }
            else if (string.IsNullOrEmpty(Request.Name) || string.IsNullOrEmpty(Request.Code) || string.IsNullOrEmpty(Request.DistrictID))
            {
                Response.StatusCode = "101";
                Response.StatusDescription = "Missing Request Value";
            }
            else
            {
                Response = bll.AddSubCounty(Request);
            }
            return Response;
        }

        [ActionName("AddStreet")]
        public APIResponse AddStreet([FromBody] Street Request)
        {
            APIResponse Response = new APIResponse();
            if (Request == null)
            {
                Response.StatusCode = "100";
                Response.StatusDescription = "BAD REQUEST";
            }
            else if (string.IsNullOrEmpty(Request.Name) || string.IsNullOrEmpty(Request.Code) || string.IsNullOrEmpty(Request.TaxGradeID) || string.IsNullOrEmpty(Request.VillageID))
            {
                Response.StatusCode = "101";
                Response.StatusDescription = "Missing Request Value";
            }
            else
            {
                Response = bll.AddStreet(Request);
            }
            return Response;
        }

        [ActionName("AddUser")]
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
                string.IsNullOrEmpty(Request.SubCountyID) || 
                string.IsNullOrEmpty(Request.VillageID) || 
                string.IsNullOrEmpty(Request.StreetID) || 
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

        [ActionName("SignIn")]
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

    }
}
