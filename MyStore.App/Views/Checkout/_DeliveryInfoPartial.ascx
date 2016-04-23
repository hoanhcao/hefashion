<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MyStore.App.ViewModels.CheckoutViewModel>" %>

<div class="step-one">
    <h2 class="heading">Bước 2: Thông Tin Giao Hàng</h2>
</div>
<%using (Html.BeginForm("DeliveryInformation", "Checkout", FormMethod.Post))%>
<%{ %>
<%:Html.AntiForgeryToken() %>
<%:Html.HiddenFor(m => m.CurrentStep, new {@value=MyStore.App.ViewModels.CheckoutStep.BillingInfo })%>

<div class="col-sm-5 clearfix">
    <div class="bill-to">
        <p>Phiếu giao hàng</p>
        <div class="form-one">
            <label>Họ & tên</label>
            <br />
            <%:Html.ValidationMessageFor(m=>m.CustomerName) %>
            <%:Html.TextBoxFor(m => m.CustomerName, new { @placeholder= "Họ tên người nhận"})%>

            <label>Địa chỉ giao hàng (Số nhà, Đường)</label>
            <br />
            <%:Html.ValidationMessageFor(m=>m.OrderAddress) %>
            <%:Html.TextBoxFor(m => m.OrderAddress, new { @placeholder="Địa chỉ giao hàng" })%>

            <label>Điện thoại di động(bắt đầu từ 01 hoặc 09)</label>
            <br />
            <%:Html.ValidationMessageFor(m=>m.PhoneNumber) %>
            <%:Html.TextBoxFor(m=>m.PhoneNumber,new { @placeholder="Số điện thoại" }) %>
            <span>Nhà mày của chúng tôi sẽ liên hệ quý khách theo số điện thoại này để xác nhận hoặc thông báo giao hàng</span>
        </div>
    </div>
</div>

<div class="col-sm-5">
    <div class="order-message">
        <p>Lời Dặn Dò Khi Giao Hàng</p>
        <%:Html.TextAreaFor(m => m.OrderDescription, new { @placeholder="Nơi để các dặn dò khi giao hàng, ví dụ: Gói hàng để tặng quà sinh nhật...", @rows="10"})%>
    </div>
    <button type="submit" class="btn btn-primary">
        Tiếp tục >>
    </button>
</div>
<%} %>