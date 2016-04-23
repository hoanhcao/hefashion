<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site_Admin.master" Inherits="System.Web.Mvc.ViewPage<MyStore.App.Models.MyData.Product>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm("Create", "Admin", FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
    <%: Html.AntiForgeryToken()%>
    <%: Html.ValidationSummary(true)%>

    <fieldset>
        <legend>Product</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_type_id, "Ref_Product_Type")%>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("product_type_id", String.Empty)%>
            <%: Html.ValidationMessageFor(model => model.product_type_id)%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_name)%>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.product_name)%>
            <%: Html.ValidationMessageFor(model => model.product_name)%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_uom_id, "Unit_Of_Measure")%>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("product_uom_id", String.Empty)%>
            <%: Html.ValidationMessageFor(model => model.product_uom_id)%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_description)%>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.product_description)%>
            <%: Html.ValidationMessageFor(model => model.product_description)%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_price)%>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.product_price)%>
            <%: Html.ValidationMessageFor(model => model.product_price)%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_color)%>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.product_color)%>
            <%: Html.ValidationMessageFor(model => model.product_color)%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_size)%>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.product_size)%>
            <%: Html.ValidationMessageFor(model => model.product_size)%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.other_detail)%>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.other_detail)%>
            <%: Html.ValidationMessageFor(model => model.other_detail)%>
        </div>
        <div class="editor-field">
            <input type="file" name="productImg" id="productImg" />
        </div>
        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
