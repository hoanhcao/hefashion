using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using MyStore.App.Models.MyData;
using MyStore.App.ViewModels;
using MyStore.App.Utilities;

using PagedList;

namespace MyStore.App.Controllers
{
    public class ProductController : Controller
    {
        private MyStoreEntities db = new MyStoreEntities();

        #region **Private Functions**
        private int GetDefaultProductType()
        {
            var query = from q in db.Ref_Product_Type
                        where q.parent_product_type_id != null
                        orderby q.product_type_id
                        select q;
            int result = query.Select(p => p.product_type_id)
                              .FirstOrDefault();
            return result;
        }

        private string GetProductTypeName(int prodTypeID)
        {
            var query = db.Ref_Product_Type.Where(p => p.product_type_id == prodTypeID)
                                           .Select(p => p.product_type_description_vn);
            return query.SingleOrDefault();
        }

        private IList<ProductModel> GetRecommendProduct(int productId)
        {
            var products = from pro in db.Products
                           join puom in db.Unit_Of_Measure on pro.product_uom_id equals puom.UOM_id
                           where pro.product_type_id == db.Products.Where(p => p.product_id == productId)
                                                                   .Select(p => p.product_type_id)
                                                                   .FirstOrDefault()
                                && pro.product_id != productId
                           orderby pro.product_created_date descending
                           select new ProductModel()
                           {
                               Id = pro.product_id,
                               Name = pro.product_name,
                               Description = pro.product_description,
                               UOM = puom.UOM_description,
                               Price = pro.product_price,
                               Image = pro.product_image,
                               DateCreated = pro.product_created_date ?? DateTime.Now
                           };
            return products.Take(18)
                           .ToList();
        }

        #endregion

        public ActionResult ShowCart()
        {
            return View("ShoppingCart", CartHelper.GetCartDetail(this.HttpContext));
        }

        //
        // GET: /Product/
        public ActionResult Index(int? prodType, int? page)
        {
            ViewBag.DateCompare = Convert.ToInt32(this.Session[MvcApplication.Date_Compare_Session_Key]);

            int pageSize = Convert.ToInt32(this.Session[MvcApplication.PageSize_Session_Key]);
            int pageNum = page ?? 1;
            int productType = prodType ?? GetDefaultProductType();

            ViewBag.ProductTypeName = GetProductTypeName(productType);
            ViewData.Add("prodType", productType);

            var products = from pro in db.Products
                           join puom in db.Unit_Of_Measure on pro.product_uom_id equals puom.UOM_id
                           where pro.product_type_id == productType
                           orderby pro.product_created_date descending
                           select new ProductModel()
                           {
                               Id = pro.product_id,
                               Name = pro.product_name,
                               Description = pro.product_description,
                               UOM = puom.UOM_description,
                               Price = pro.product_price,
                               Image = pro.product_image,
                               DateCreated = pro.product_created_date ?? DateTime.Now
                           };

            return View(products.ToPagedList(pageNum, pageSize));
        }

        //
        // GET: /Product/Details/5
        public ActionResult Details(int id = 0)
        {
            ViewBag.DateCompare = Convert.ToInt32(this.Session[MvcApplication.Date_Compare_Session_Key]);

            var query = from pro in db.Products
                        join puom in db.Unit_Of_Measure on pro.product_uom_id equals puom.UOM_id
                        where pro.product_id == id
                        orderby pro.product_created_date descending
                        select new ProductModel()
                        {
                            Id = pro.product_id,
                            Name = pro.product_name,
                            Description = pro.product_description,
                            UOM = puom.UOM_description,
                            Price = pro.product_price,
                            Image = pro.product_image,
                            DateCreated = pro.product_created_date ?? DateTime.Now,
                            OtherDetails = pro.other_detail
                        };
            ProductModel product = query.SingleOrDefault();
            if (product == null)
            {
                return HttpNotFound();

            }
            else
            {
                ViewData.Add("RecommendProduct", GetRecommendProduct(id));
            }
            return View(product);
        }

        [HttpGet]
        public ActionResult RecommendProductPartial(int selectedId)
        {
            return PartialView("_CompletedAddToCart", GetRecommendProduct(selectedId));
        }

        public ActionResult ShoppingCartList(IList<ShoppingCartViewModel> Model)
        {
            if (Model != null)
                return PartialView("_CartTablePartial", Model);
            else
                return PartialView("_CartTablePartial", CartHelper.GetCartDetail(this.HttpContext));
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

    }
}