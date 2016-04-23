using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyStore.App.ViewModels
{

    public partial class ShoppingCart
    {
        public const string CartSessionKey = "CartId";

        public string ShoppingCartId { get; set; }
        public IList<ShoppingCartViewModel> CartDetails { get; private set; }

        #region Public Func
        public static ShoppingCart GetCart(HttpContextBase context)
        {
            var cart = new ShoppingCart();
            cart.ShoppingCartId = cart.GetCartId(context);
            cart.CartDetails = cart.GetCartDetails(context);
            return cart;
        }
        public void SaveChanges(HttpContextBase context)
        {
            if (string.IsNullOrEmpty(ShoppingCartId)) return;

            context.Session[ShoppingCartId] = CartDetails;
        }
        // Helper method to simplify shopping cart calls
        public static ShoppingCart GetCart(Controller controller)
        {
            return GetCart(controller.HttpContext);
        }
        public bool AddToCart(int productId, double productQuan)
        {
            if (CartDetails == null) return false;
            var item = CartDetails.Where(p => p.ProductId == productId)
                                  .SingleOrDefault();
            if (item == null)
            {
                item = new ShoppingCartViewModel();
                item.ProductId = productId;
                item.TotalQuantity = productQuan;
                this.CartDetails.Add(item);
            }
            else
                item.TotalQuantity += productQuan;
            return true;
        }
        public bool RemoveFromCart(int productId)
        {
            if (CartDetails == null) return false;
            var item = CartDetails.Where(p => p.ProductId == productId)
                                  .SingleOrDefault();
            if (item != null)
            {
                CartDetails.Remove(item);
            }
            return true;
        }

        public double GetCount(int productId)
        {
            // Get the count of each item in the cart and sum them up
            double? count = (from cartItems in CartDetails
                             where cartItems.ProductId == productId
                             select (double?)cartItems.TotalQuantity).Sum();
            // Return 0 if all entries are null
            return count ?? 0;
        }
        #endregion

        #region Private Functions

        // We're using HttpContextBase to allow access to cookies.
        private string GetCartId(HttpContextBase context)
        {
            if (context.Session[CartSessionKey] == null)
            {
                if (!string.IsNullOrWhiteSpace(context.User.Identity.Name))
                {
                    context.Session[CartSessionKey] =
                        context.User.Identity.Name;
                }
                else
                {
                    // Generate a new random GUID using System.Guid class
                    Guid tempCartId = Guid.NewGuid();
                    // Send tempCartId back to client as a cookie
                    context.Session[CartSessionKey] = tempCartId.ToString();
                }
            }
            return context.Session[CartSessionKey].ToString();
        }

        // We're using HttpContextBase to allow access to cookies.
        private IList<ShoppingCartViewModel> GetCartDetails(HttpContextBase context)
        {
            if (string.IsNullOrEmpty(ShoppingCartId)) return null;

            if (context.Session[ShoppingCartId] != null)
            {
                return context.Session[ShoppingCartId] as List<ShoppingCartViewModel>;
            }
            else
                return new List<ShoppingCartViewModel>();
        }

        #endregion
        /*
        public int RemoveFromCart(int id)
        {
            // Get the cart
            var cartItem = storeDB.Carts.Single(
                cart => cart.CartId == ShoppingCartId
                && cart.RecordId == id);

            int itemCount = 0;

            if (cartItem != null)
            {
                if (cartItem.Count > 1)
                {
                    cartItem.Count--;
                    itemCount = cartItem.Count;
                }
                else
                {
                    storeDB.Carts.Remove(cartItem);
                }
                // Save changes
                storeDB.SaveChanges();
            }
            return itemCount;
        }
        public void EmptyCart()
        {
            var cartItems = storeDB.Carts.Where(
                cart => cart.CartId == ShoppingCartId);

            foreach (var cartItem in cartItems)
            {
                storeDB.Carts.Remove(cartItem);
            }
            // Save changes
            storeDB.SaveChanges();
        }
        public List<Cart> GetCartItems()
        {
            return storeDB.Carts.Where(
                cart => cart.CartId == ShoppingCartId).ToList();
        }
    
        public decimal GetTotal()
        {
            // Multiply album price by count of that album to get 
            // the current price for each of those albums in the cart
            // sum all album price totals to get the cart total
            decimal? total = (from cartItems in storeDB.Carts
                              where cartItems.CartId == ShoppingCartId
                              select (int?)cartItems.Count *
                              cartItems.Album.Price).Sum();

            return total ?? decimal.Zero;
        }
        public int CreateOrder(Order order)
        {
            decimal orderTotal = 0;

            var cartItems = GetCartItems();
            // Iterate over the items in the cart, 
            // adding the order details for each
            foreach (var item in cartItems)
            {
                var orderDetail = new OrderDetail
                {
                    AlbumId = item.AlbumId,
                    OrderId = order.OrderId,
                    UnitPrice = item.Album.Price,
                    Quantity = item.Count
                };
                // Set the order total of the shopping cart
                orderTotal += (item.Count * item.Album.Price);

                storeDB.OrderDetails.Add(orderDetail);

            }
            // Set the order's total to the orderTotal count
            order.Total = orderTotal;

            // Save the order
            storeDB.SaveChanges();
            // Empty the shopping cart
            EmptyCart();
            // Return the OrderId as the confirmation number
            return order.OrderId;
        }
        
         */
    }

    public class ShoppingCartViewModel
    {
        public int ProductId { get; set; }
        public string ProductDescription { get; set; }
        public string ProductImage { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public double TotalQuantity { get; set; }
        public decimal TotalAmount { get { return (Price * ((decimal)TotalQuantity)); } }
    }
}