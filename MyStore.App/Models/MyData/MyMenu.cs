using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using MyStore.App.Models.MyData;

namespace MyStore.App.Models
{
    public class Menu
    {
        public int MenuId { get; set; }
        public string MenuDesc { get; set; }
        public List<Menu> ChildMenu { get; set; }
    }
    public static class MyMenu
    {
        public static IList<Menu> BuildMenu()
        {
            using (MyStoreEntities dbContext = new MyStoreEntities())
            {
                var query1 = from parent in dbContext.Ref_Product_Type
                             join child in dbContext.Ref_Product_Type on parent.product_type_id equals child.parent_product_type_id
                             select new
                             {
                                 ParentId = parent.product_type_id,
                                 ParentName = parent.product_type_description_vn,
                                 ChildId = (int?)child.product_type_id,
                                 ChildName = child.product_type_description_vn
                             };
                var query2 = from menu in dbContext.Ref_Product_Type
                             where menu.parent_product_type_id == null
                             select new
                             {
                                 ParentId = menu.product_type_id,
                                 ParentName = menu.product_type_description_vn,
                                 ChildId = menu.parent_product_type_id,
                                 ChildName = menu.product_type_description_vn
                             };
                var queryResult = query1.Union(query2)
                                        .ToList();
                if (queryResult != null && queryResult.Count > 0)
                {
                    IList<Menu> result = new List<Menu>();
                    foreach (var menu in queryResult)
                    {
                        Menu menuItem = null;
                        if (!result.Any(p => p.MenuId == menu.ParentId))
                        {
                            menuItem = new Menu()
                            {
                                MenuId = menu.ParentId,
                                MenuDesc = menu.ParentName
                            };
                            result.Add(menuItem);
                        }
                        else
                        {
                            menuItem = result.Where(p => p.MenuId == menu.ParentId)
                                             .SingleOrDefault();
                        }

                        if (menu.ChildId != null)
                        {
                            if (menuItem.ChildMenu == null)
                                menuItem.ChildMenu = new List<Menu>();
                            if (!menuItem.ChildMenu.Any(p => p.MenuId == (menu.ChildId ?? 0)))
                            {
                                menuItem.ChildMenu.Add(new Menu()
                                {
                                    MenuId = menu.ChildId ?? 0,
                                    MenuDesc = menu.ChildName
                                });
                            }
                        }
                    }
                    return result;
                }
                return null;
            }
        }
    }
}