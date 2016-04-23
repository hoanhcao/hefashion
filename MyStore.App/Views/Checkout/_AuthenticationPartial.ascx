<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MyStore.App.ViewModels.CheckoutViewModel>" %>
<script type="text/javascript">
    $(document).ready(function () {
        if ($("#rdbUsePass").attr("checked")) {
            $("#Password").show();
        }
        else
            $("#Password").hide();

        $("#rdbUsePass, #rdbUnusePass").change(function () {
            //internalPassAction();
            if ($("#rdbUsePass").attr("checked")) {
                $("#Password").show();
            }
            else
                $("#Password").hide();
        });
    });
   
</script>
<div class="step-one">
    <h2 class="heading">Bước 1: Thông Tin Người Đặt Hàng</h2>
</div>
<div class="register-req">
    <p>Xin quý khách vui lòng đăng ký hoặc <b>Đăng nhập bằng tài khoản của website</b> để có thể theo dõi thông tin đơn hàng, hoặc quý khách có thể sử dụng chức năng <b>Không Cần Tài Khoản</b></p>
</div>
<%using (Html.BeginForm("AuthenticationMethod", "Checkout", FormMethod.Post))%>
<%{ %>
<%:Html.AntiForgeryToken() %>
<div class="checkout-options">
    <ul class="nav">
        <li>
            <label>
                <%:Html.RadioButtonFor(m => m.IsPassword, true, new { @checked="checked",@id="rdbUsePass" })%>
                Đăng nhập bằng tài khoản của website
            </label>
        </li>
        <li>
            <label>
                <%:Html.RadioButtonFor(m => m.IsPassword, false, new {@id="rdbUnusePass" })%>
                Không cần tài khoản của website
            </label>

        </li>

    </ul>
</div>
<!--/checkout-options-->

<div class="shopper-informations">
    <div class="row">
        <div class="col-sm-3">
            <div class="shopper-info">
                <%:Html.ValidationSummary(true) %>
                <br />
                <%:Html.ValidationMessageFor(m=>m.UserName) %>
                <%:Html.TextBoxFor(m => m.UserName, new {@placeholder=Html.DisplayNameFor(m => m.UserName)})%>
                <br />
                <%:Html.ValidationMessageFor(m=>m.Password) %>
                <%:Html.PasswordFor(m => m.Password)%>
                <%:Html.HiddenFor(p=>p.CurrentStep) %>
                <button type="submit" class="btn btn-primary">
                    Tiếp tục >>
                </button>

            </div>
        </div>
    </div>
</div>
<%} %>
