using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyStore.App.ViewModels
{
    public enum CheckoutStep : byte
    {
        Authentication = 1,
        BillingInfo = 2,
        PaymentInfo = 3
    };

    public class CheckoutViewModel
    {
        public CheckoutStep CurrentStep { get; set; }

        public bool? IsPassword { get; set; }

        [Display(Name = "Địa chỉ email")]
        [Required(ErrorMessage = "Địa chỉ email của quý khách")]
        [EmailAddress(ErrorMessage = "Địa chỉ email ko hợp lệ")]
        public string UserName { get; set; }
        public string Password { get; set; }

        [Required(ErrorMessage = "Vui lòng cho biết tên")]
        public string CustomerName { get; set; }
        [Required(ErrorMessage = "Vui lòng cho biết địa chỉ giao hàng")]
        public string OrderAddress { get; set; }

        [Required(ErrorMessage = "Vui lòng cho biết số điện thoại")]
        [RegularExpression(@"(?(^(01))^[0-9]{11}$|(?(^(09))^[0-9]{10}$|\d))", ErrorMessage = "Số điên thoại không đúng(bắt đầu là 01 là 11 số hoặc 09 là 10 số)")]
        public string PhoneNumber { get; set; }
        public string OrderDescription { get; set; }
    }
}