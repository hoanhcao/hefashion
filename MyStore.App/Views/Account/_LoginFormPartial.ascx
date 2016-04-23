<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MyStore.App.Models.Authentication.LoginModel>" %>

<!--login form-->
<div class="login-form">
    <h2>Đăng nhập với:</h2>
    <% using (Html.BeginForm(new { ReturnUrl = ViewBag.ReturnUrl }))
       { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <%: Html.ValidationMessageFor(m => m.UserName) %>
    <%: Html.TextBoxFor(m => m.UserName, new { @placeholder= "Địa chỉ email"})%>

    <%: Html.ValidationMessageFor(m => m.Password) %>
    <%: Html.PasswordFor(m => m.Password,new { @placeholder= Html.DisplayNameFor(m => m.Password)}) %>
    <span>
        <%: Html.CheckBoxFor(m => m.RememberMe,new { @class = "checkbox" }) %>
        <%: Html.LabelFor(m => m.RememberMe) %>
    </span>
    <button type="submit" class="btn btn-default">Đăng nhập</button>
    <% } %>
</div>
<!--/login form-->
