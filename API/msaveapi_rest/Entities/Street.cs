namespace PortalAPI_rest.Entities
{
    public class Street
    {
        public string Name { get; set; }
        public string Code { get; set; }
        public string VillageID { get; set; }
        public string TaxGradeID { get; set; }
        public string UserID { get; internal set; }
    }
}