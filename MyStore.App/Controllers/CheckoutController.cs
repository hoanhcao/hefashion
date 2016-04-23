using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using WebMatrix.WebData;

using MyStore.App.ViewModels;
using MyStore.App.Models;
using MyStore.App.Models.MyData;
using MyStore.App.Utilities;

namespace MyStore.App.Controllers
{
    public class CheckoutController : Controller
    {
        private static readonly string CHECKOUT_SESSION_KEY = "CHECKOUT";

        private void ModelErrorClear(ModelStateDictionary modelState)
        {
            foreach (var item in modelState.Values)
            {
                item.Errors.Clear();
            }
        }

        //
        // GET: /Checkout/
        public ActionResult Index()
        {
            CheckoutViewModel checkoutObj = this.Session[CHECKOUT_SESSION_KEY] as CheckoutViewModel;
            if (checkoutObj == null)
            {
                checkoutObj = new ViewModels.CheckoutViewModel();
                if (!Request.IsAuthenticated)
                {
                    checkoutObj.CurrentStep = ViewModels.CheckoutStep.Authentication;
                }
                else
                {
                    checkoutObj.CurrentStep = ViewModels.CheckoutStep.BillingInfo;
                    checkoutObj.IsPassword = true;
                    checkoutObj.UserName = User.Identity.Name;

                    this.Session[CHECKOUT_SESSION_KEY] = checkoutObj;

                }

            }
            return View("Index", checkoutObj);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AuthenticationMethod(CheckoutViewModel viewModel)
        {
            if (ModelState.IsValidField("UserName"))
            {
                if (viewModel.IsPassword ?? true)
                {
                    if (string.IsNullOrEmpty(viewModel.Password))
                    {
                        ModelState.AddModelError("Password", "Vui lòng nhập Password");
                    }
                    else
                    {
                        if (WebSecurity.Login(viewModel.UserName, viewModel.Password))
                        {
                            viewModel.CurrentStep = CheckoutStep.BillingInfo;
                        }
                        else
                            ModelState.AddModelError("Password", "Password không đúng");
                    }
                }
                else
                {
                    viewModel.CurrentStep = CheckoutStep.BillingInfo;
                }

                ModelErrorClear(ModelState);
            }
            this.Session[CHECKOUT_SESSION_KEY] = viewModel;

            return View("Index", viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeliveryInformation(CheckoutViewModel viewModel)
        {
            if (ModelState.IsValidField("CustomerName") &&
                ModelState.IsValidField("OrderAddress") &&
                ModelState.IsValidField("PhoneNumber"))
            {
                ModelErrorClear(ModelState);

                CheckoutViewModel model = this.Session[CHECKOUT_SESSION_KEY] as CheckoutViewModel;
                if (model != null)
                {
                    model.CurrentStep = CheckoutStep.PaymentInfo;
                    model.CustomerName = viewModel.CustomerName;
                    model.OrderAddress = viewModel.OrderAddress;
                    model.PhoneNumber = viewModel.PhoneNumber;
                    model.OrderDescription = viewModel.OrderDescription;

                    this.Session[CHECKOUT_SESSION_KEY] = model;

                    return View("Index", model);
                }
                else
                    return Index();

            }

            viewModel.CurrentStep = CheckoutStep.BillingInfo;
            return View("Index", viewModel);
        }

        public ActionResult CreateOrder()
        {
            CheckoutViewModel model = this.Session[CHECKOUT_SESSION_KEY] as CheckoutViewModel;
            if (model == null)
            {
                return RedirectToAction("ShowCart", "Product");
            }
            else
            {
                if (model.CurrentStep != CheckoutStep.PaymentInfo)
                {
                    return Index();
                }
                else
                {
                    using (MyStoreEntities db = new MyStoreEntities())
                    {
                        Order newOrder = new Order();
                        newOrder.Order_Status_Codes = db.Order_Status_Codes.Where(p => p.order_status_description == "New").SingleOrDefault();
                        newOrder.date_order_placed = DateTime.Now;

                        if (model.IsPassword ?? true)
                            newOrder.user_id = WebSecurity.CurrentUserId;
                        else
                            newOrder.email_address = model.UserName;
                        newOrder.receipter_name = model.CustomerName;
                        newOrder.order_address = model.OrderAddress;
                        newOrder.phone_number = model.PhoneNumber;
                        newOrder.order_description = model.OrderDescription;
                        var cartDetailsList = CartHelper.GetCartDetail(this.HttpContext);
                        if (cartDetailsList != null)
                        {
                            foreach (var item in cartDetailsList)
                            {
                                Order_Items newItem = new Order_Items();
                                var inventory = db.Products.Where(p => p.product_id == item.ProductId)
                                                           .Select(p => p.product_quantity)
                                                           .SingleOrDefault();
                                if (inventory < item.TotalQuantity)
                                    newItem.Ref_Order_Item_Status_Codes = db.Ref_Order_Item_Status_Codes.Where(p => p.order_item_status_description == "Out Of Stock")
                                                                                                        .SingleOrDefault();
                                else
                                    newItem.Ref_Order_Item_Status_Codes = db.Ref_Order_Item_Status_Codes.Where(p => p.order_item_status_description == "Normal")
                                                                                                        .SingleOrDefault();
                                newItem.product_id = item.ProductId;
                                newItem.order_item_quantity = item.TotalQuantity;
                                newItem.order_item_amount = item.TotalAmount;
                                newOrder.Order_Items.Add(newItem);
                            }
                        }

                        db.Orders.Add(newOrder);
                        db.SaveChanges();
                    }
                    this.Session[CHECKOUT_SESSION_KEY] = null;
                    Utilities.CartHelper.EmptyCart(this.HttpContext);
                    return RedirectToAction("Index", "Product");
                }
            }
        }
    }
}
