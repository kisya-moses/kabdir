using System.Collections.Generic;

namespace PortalAPI_rest.Entities
{
    public class APIResponse
    {
        public string StatusCode { get; set; }
        public string StatusDescription { get; set; }
        public string Response { get; set; } //JSON
    }
}