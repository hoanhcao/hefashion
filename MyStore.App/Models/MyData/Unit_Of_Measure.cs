//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyStore.App.Models.MyData
{
    using System;
    using System.Collections.Generic;
    
    public partial class Unit_Of_Measure
    {
        public Unit_Of_Measure()
        {
            this.Products = new HashSet<Product>();
        }
    
        public int UOM_id { get; set; }
        public string UOM_description { get; set; }
    
        public virtual ICollection<Product> Products { get; set; }
    }
}