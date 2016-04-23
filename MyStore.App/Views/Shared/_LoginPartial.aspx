<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<ul class="nav navbar-nav">
    <li>
        <a href="<%:Url.Action("Index","Cart") %>">
            <i class="fa fa-shopping-cart"></i>Giỏ hàng
        </a>
    </li>
    <%if (Request.IsAuthenticated)%>
    <%{ %>
    <li class="btn-group">
        <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
            Xin chào, <%:User.Identity.Name %> !
			<span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><%: Html.ActionLink("Thay đổi mật khẩu", "Manage", "Account", routeValues: null, htmlAttributes: new { @class = "username", title = "Manage" }) %></li>
            <li>
                <% using (Html.BeginForm("LogOff", "Account", FormMethod.Post, new { id = "logoutForm" }))
                   { %>
                <%: Html.AntiForgeryToken() %>
                <a href="javascript:document.getElementById('logoutForm').submit()">Đăng xuất</a>
                <% } %>
            </li>
        </ul>
    </li>

    <% }
      else
      { %>

    <li>
        <a href="<%:Url.Action("Register","Account") %>" id="registerLink">
            <i class="fa fa-lock"></i>Đăng ký
        </a>
    </li>
    <li>
        <a href="<%:Url.Action("Login", "Account", new { returnUrl=HttpContext.Current.Request.RawUrl })%>" id="loginLink">
            <i class="fa fa-registered"></i>Đăng nhập
        </a>
    </li>
    <% } %>
</ul>
