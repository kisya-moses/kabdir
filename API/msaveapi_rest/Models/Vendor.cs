using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Models
{
    public class Vendor
    {
        public string PhoneNumber { get; set; }
        public string DigitalSignature { get; set; }
        public string Password { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string VendorCode { get; set; }
    }
}