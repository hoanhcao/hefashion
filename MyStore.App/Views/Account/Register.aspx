<%@ Page Language="C#" MasterPageFile="~/Views/Shared/SubSite.Master" Inherits="System.Web.Mvc.ViewPage<MyStore.App.Models.Authentication.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="form">
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="signup-form">
                        <!--sign up form-->
                        <h2>Tạo mới tài khoản ngay!</h2>
                        <% using (Html.BeginForm())
                           { %>
                        <%: Html.AntiForgeryToken() %>
                        <%: Html.ValidationSummary() %>
                        <%: Html.TextBoxFor(m => m.UserName,new {@placeholder="Địa chỉ email của bạn" }) %>
                        <%: Html.PasswordFor(m => m.Password,new {@placeholder="Mật khẩu đăng nhập vào trang của chúng tôi" }) %>
                        <%: Html.PasswordFor(m => m.ConfirmPassword,new {@placeholder="Nhập lại mật khẩu" }) %>
                        <button type="submit" class="btn btn-default">Đăng ký</button>
                        <% } %>
                    </div>
                    <!--/sign up form-->
                </div>
            </div>
        </div>
    </section>

</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%:Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
