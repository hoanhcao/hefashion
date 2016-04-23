using MyStore.App.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyStore.App.Controllers
{
    public class CartController : Controller
    {
        /// <summary>
        /// Add a product to Cart
        /// </summary>
        /// <param name="proId">product's Id</param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult AddToCart(int productId, double? productQuantity)
        {
            try
            {
                ViewModels.ShoppingCart cart = ViewModels.ShoppingCart.GetCart(this.HttpContext);
                bool result = cart.AddToCart(productId, productQuantity ?? 1);
                cart.SaveChanges(this.HttpContext);

                if (result)
                {
                    return Json(new { status = true });
                }
                else
                {
                    return Json(new { status = false });
                }
            }
            catch (Exception)
            {
                return Json(new { status = false });
            }

        }

        //
        // GET: /Cart/
        public ActionResult Index()
        {
            return RedirectToAction("ShowCart", "Product");
        }

        public ActionResult PlusQuantity(int product_Id)
        {
            ViewModels.ShoppingCart cart = ViewModels.ShoppingCart.GetCart(this.HttpContext);
            double count = cart.GetCount(product_Id);
            if (count <= 50)
            {
                bool result = cart.AddToCart(product_Id, 1);
                cart.SaveChanges(this.HttpContext);
            }
            return Index();
        }

        public ActionResult MinusQuantity(int product_Id)
        {
            ViewModels.ShoppingCart cart = ViewModels.ShoppingCart.GetCart(this.HttpContext);
            double count = cart.GetCount(product_Id);
            if (count >= 2)
            {
                bool result = cart.AddToCart(product_Id, -1);
                cart.SaveChanges(this.HttpContext);
            }
            return Index();

        }

        //
        // GET: /Cart/Delete/5

        public ActionResult Remove(int id)
        {
            ViewModels.ShoppingCart cart = ViewModels.ShoppingCart.GetCart(this.HttpContext);
            bool result = cart.RemoveFromCart(id);
            cart.SaveChanges(this.HttpContext);

            return Index();
        }

        //
        // POST: /Cart/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
