using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyStore.App.ViewModels
{
    public class ProductModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string UOM { get; set; }
        public string Description { get; set; }
        public decimal? Price { get; set; }
        public string Image { get; set; }
        public DateTime DateCreated { get; set; }
        public string OtherDetails { get; set; }
    }
}