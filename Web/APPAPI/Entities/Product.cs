namespace PortalAPI_rest.Entities
{
    public class Product
    {
        public string DeliveryAgent { get; set; }
        public string Description { get;  set; }
        public string ISBN { get; internal set; }
        public string Manufacturer { get; set; }
        public string ProductName { get;  set; }
    }
}