<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site_Admin.Master" Inherits="System.Web.Mvc.ViewPage<MyStore.App.Models.MyData.Product>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Product</legend>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Ref_Product_Type.product_type_description_vn) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Ref_Product_Type.product_type_description_vn) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.product_name) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.product_name) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Unit_Of_Measure.UOM_description) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Unit_Of_Measure.UOM_description) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.product_description) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.product_description) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.product_price) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.product_price) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.product_color) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.product_color) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.product_size) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.product_size) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.product_image) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.product_image) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.product_created_date) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.product_created_date) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.product_quantity) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.product_quantity) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.other_detail) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.other_detail) %>
        </div>
    </fieldset>
    <% using (Html.BeginForm())
       { %>
    <%: Html.AntiForgeryToken() %>
    <p>
        <input type="submit" value="Delete" />
        |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
    <% } %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
