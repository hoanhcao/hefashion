using MyStore.App.ViewModels;
using MyStore.App.Models.MyData;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyStore.App.Utilities
{
    public class CartHelper
    {
        public static IList<ShoppingCartViewModel> GetCartDetail(ViewModels.ShoppingCart cart)
        {
            //ViewModels.ShoppingCart cart = ViewModels.ShoppingCart.GetCart(this.HttpContext);
            using (MyStoreEntities db = new MyStoreEntities())
            {
                foreach (var item in cart.CartDetails)
                {
                    var query = db.Products.Where(p => p.product_id == item.ProductId).Select(p => new { p.product_description, p.product_image, p.product_name, p.product_price }).Single();
                    if (query != null)
                    {
                        item.ProductDescription = query.product_description;
                        item.ProductImage = query.product_image;
                        item.Price = query.product_price ?? 1;
                        item.ProductName = query.product_name;
                    }
                }
            }

            return cart.CartDetails;
        }

        public static IList<ShoppingCartViewModel> GetCartDetail(HttpContextBase baseContext)
        {
            ViewModels.ShoppingCart cart = ViewModels.ShoppingCart.GetCart(baseContext);
            return GetCartDetail(cart);
        }

        public static void EmptyCart(HttpContextBase baseContext)
        {
            baseContext.Session[ViewModels.ShoppingCart.CartSessionKey] = null;
        }
    }
}