<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site_Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MyStore.App.Models.Product>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            <%: Html.DisplayName("Product Type") %>
        </th>
        <th>
            <%: Html.DisplayName("Product Name") %>
        </th>
        <th>
            <%: Html.DisplayName("UOM") %>
        </th>
        <th>
            <%: Html.DisplayName("Description") %>
        </th>
        <th>
            <%: Html.DisplayName("Price") %>
        </th>
        <th>
            <%: Html.DisplayName("Create Date") %>
        </th>
        <th>
            <%: Html.DisplayName("Quantity") %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Ref_Product_Type.product_type_description_vn) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.product_name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Unit_Of_Measure.UOM_description) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.product_description) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.product_price) %>
        </td>
        
        <td>
            <%: Html.DisplayFor(modelItem => item.product_created_date) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.product_quantity) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.product_id }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.product_id }) %>
        </td>
        
    </tr>
<% } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
