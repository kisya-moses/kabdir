namespace PortalAPI_rest.Entities
{
    public class SubCounty
    {
        public string Name { get; set; }
        public string Code { get; set; }
        public string DistrictID { get; set; }
        public string UserID { get; internal set; }
    }
}