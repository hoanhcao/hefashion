<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ICollection<Microsoft.Web.WebPages.OAuth.AuthenticationClientData>>" %>

<% if (Model.Count == 0)
   { %>
<div class="message-info">
    <p>
        There are no external authentication services configured. See <a href="http://go.microsoft.com/fwlink/?LinkId=252166">this article</a>
        for details on setting up this ASP.NET application to support logging in via external services.
    </p>
</div>
<% }
   else
   {
       using (Html.BeginForm("ExternalLogin", "Account", new { ReturnUrl = ViewBag.ReturnUrl }, FormMethod.Post, new { id = "externalLoginForm" }))
       { %>
<%: Html.AntiForgeryToken() %>
<ul id="socialLoginList" class="nav navbar-nav">
    <% foreach (Microsoft.Web.WebPages.OAuth.AuthenticationClientData p in Model) %>
    <% { %>
    <li>
        <%-- 
        <a href="#" onclick="$('externalLoginForm').append('<input type='hidden' name='provider' value='<%:p.AuthenticationClient.ProviderName %>' />').submit()">
            <i class="fa fa-facebook"></i>
        </a>
        --%>
        <button type="submit" class="btn btn-info" name="provider" value="<%: p.AuthenticationClient.ProviderName %>" title="Log in using your <%: p.DisplayName %> account">
            <i class="fa fa-facebook"></i>
            <%: p.DisplayName%>
        </button>
    </li>
    <% } %>
</ul>
<% }
   } %>
