<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site_Admin.Master" Inherits="System.Web.Mvc.ViewPage<MyStore.App.Models.MyData.Product>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <% using (Html.BeginForm("Edit", "Admin", FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>Product</legend>

        <%: Html.HiddenFor(model => model.product_id) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_type_id, "Ref_Product_Type") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("product_type_id", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.product_type_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_name) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.product_name, new { @readonly="true" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_uom_id, "Unit_Of_Measure") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("product_uom_id", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.product_uom_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_description) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.product_description) %>
            <%: Html.ValidationMessageFor(model => model.product_description) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_price) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.product_price) %>
            <%: Html.ValidationMessageFor(model => model.product_price) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_color) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.product_color) %>
            <%: Html.ValidationMessageFor(model => model.product_color) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_size) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.product_size) %>
            <%: Html.ValidationMessageFor(model => model.product_size) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_image) %>
        </div>
        <div class="editor-field">
            <input type="file" name="productImg" id="product_image" />
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_created_date) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.product_created_date, new { @class = "datefield", type = "date"  })%>
            <%: Html.ValidationMessageFor(model => model.product_created_date) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.product_quantity) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.product_quantity) %>
            <%: Html.ValidationMessageFor(model => model.product_quantity) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.other_detail) %>
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.other_detail, new {@rows="16" })%>
            <%: Html.ValidationMessageFor(model => model.other_detail) %>
        </div>

        <p>
            <input type="submit" value="Save" />
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
    <%: Scripts.Render("~/bundles/jqueryui") %>
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <%: Styles.Render("~/Content/themes/base/css") %>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#product_created_date").datepicker();
        });
    </script>
</asp:Content>
