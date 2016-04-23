using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using MyStore.App.Models.MyData;

namespace MyStore.App.Controllers
{
    public class AdminController : Controller
    {
        private MyStoreEntities db = new MyStoreEntities();
        #region **Private Functions**

        private string SaveProductPhoto(HttpPostedFileBase photo, int? updatePhotoId = null)
        {
            if (photo == null || photo.ContentLength == 0) return string.Empty;

            int maxProductId = 0;
            if (updatePhotoId != null &&
                !updatePhotoId.HasValue)
            {
                maxProductId = updatePhotoId != null && updatePhotoId.HasValue ? updatePhotoId.Value : db.Products.Max(p => p.product_id);
                maxProductId += 1;
            }
            else
                maxProductId = updatePhotoId.Value;

            string fileName = string.Format("product{0}{1}", maxProductId, System.IO.Path.GetExtension(photo.FileName));
            //Save original image
            string filePath = Server.MapPath("~/Images/shop/product_original");
            photo.SaveAs(System.IO.Path.Combine(filePath, fileName));

            using (System.Drawing.Image photoImage = System.Drawing.Bitmap.FromStream(photo.InputStream))
            {
                //Save index image
                using (System.Drawing.Bitmap photoIndex = new System.Drawing.Bitmap(photoImage, 268, 249))
                {
                    filePath = Server.MapPath("~/Images/shop/product");
                    photoIndex.Save(System.IO.Path.Combine(filePath, fileName));
                }
                //Save detail image
                using (System.Drawing.Bitmap photoIndex = new System.Drawing.Bitmap(photoImage, 268, 249))
                {
                    filePath = Server.MapPath("~/Images/shop/product-details");
                    photoIndex.Save(System.IO.Path.Combine(filePath, fileName));
                }
                //Save recommend image
                using (System.Drawing.Bitmap photoIndex = new System.Drawing.Bitmap(photoImage, 268, 249))
                {
                    filePath = Server.MapPath("~/Images/shop/product-recommend");
                    photoIndex.Save(System.IO.Path.Combine(filePath, fileName));
                }

                //Save cart image
                using (System.Drawing.Bitmap photoIndex = new System.Drawing.Bitmap(photoImage, 110, 110))
                {
                    filePath = Server.MapPath("~/Images/cart");
                    photoIndex.Save(System.IO.Path.Combine(filePath, fileName));
                }
            }

            return fileName;
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        #endregion

        //
        // GET: /Admin/

        [Authorize(Roles = "Admin")]
        public ActionResult Index()
        {
            var products = db.Products.Include("Ref_Product_Type").Include("Unit_Of_Measure");
            return View(products.ToList());
        }

        //
        // GET: /Admin/Create

        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.product_type_id = new SelectList(db.Ref_Product_Type, "product_type_id", "product_type_description_vn");
            ViewBag.product_uom_id = new SelectList(db.Unit_Of_Measure, "UOM_id", "UOM_description");
            return View("CreateProduct");
        }

        //
        // POST: /Admin/Create

        //
        // POST: /Product/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Product product)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    HttpPostedFileBase photo = Request.Files["productImg"];
                    product.product_image = SaveProductPhoto(photo);
                    product.product_created_date = DateTime.Now;

                    db.Products.Add(product);
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    throw ex;
                }

                return RedirectToAction("Index");
            }
            ViewBag.product_type_id = new SelectList(db.Ref_Product_Type, "product_type_id", "product_type_description_vn", product.product_type_id);
            ViewBag.product_uom_id = new SelectList(db.Unit_Of_Measure, "UOM_id", "UOM_description", product.product_uom_id);
            return View(product);
        }

        //
        // GET: /Admin/Edit/5

        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int id = 0)
        {
            Product product = db.Products.Single(p => p.product_id == id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.product_type_id = new SelectList(db.Ref_Product_Type, "product_type_id", "product_type_description_vn", product.product_type_id);
            ViewBag.product_uom_id = new SelectList(db.Unit_Of_Measure, "UOM_id", "UOM_description", product.product_uom_id);
            return View("EditProduct", product);
        }

        //
        // POST: /Admin/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                HttpPostedFileBase photo = Request.Files["productImg"];
                string strImage = SaveProductPhoto(photo, product.product_id);
                if (!string.IsNullOrEmpty(strImage))
                    product.product_image = strImage;

                db.Products.Attach(product);
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.product_type_id = new SelectList(db.Ref_Product_Type, "product_type_id", "product_type_description_vn", product.product_type_id);
            ViewBag.product_uom_id = new SelectList(db.Unit_Of_Measure, "UOM_id", "UOM_description", product.product_uom_id);
            return View(product);
        }

        //
        // GET: /Admin/Delete/5

        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int id = 0)
        {
            Product product = db.Products.Single(p => p.product_id == id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View("DeleteProduct", product);
        }

        //
        // POST: /Admin/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Single(p => p.product_id == id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}