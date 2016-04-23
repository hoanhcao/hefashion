<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PagedList.IPagedList<MyStore.App.ViewModels.ProductModel>>" %>

<%@ Import Namespace="PagedList.Mvc" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page - My ASP.NET MVC Application
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section id="advertisement">
        <div class="container">
            <img src="<%: Url.Content("~/Images/shop/advertisement.jpg") %>" alt="" />
        </div>
    </section>

</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <!--features_items-->

    <div class="features_items">
        <h2 class="title text-center">Các loại sản phẩm thuộc <%:ViewBag.ProductTypeName %></h2>
        <% foreach (var item in Model)%>
        <%{%>
        <div class="col-sm-4">
            <div class="product-image-wrapper">
                <div class="single-products">
                    <div class="productinfo text-center">
                        <img src="<%: Url.Content(System.IO.Path.Combine("~/Images/shop/product", item.Image)) %>" alt="" />
                        <h2><%: MyStore.App.Utilities.DecimalHelper.ToString(item.Price, "#,###.#")  %></h2>
                        <p><%: item.Description %></p>
                    </div>
                    <div class="product-overlay">
                        <div class="overlay-content">
                            <h2><%: MyStore.App.Utilities.DecimalHelper.ToString(item.Price, "#,###.#") %></h2>
                            <p><%: item.Description %></p>
                            <a href="<%:Url.Action("Details", "Product", new {id = item.Id })%>" class="btn btn-default view-details">
                                <i class="fa fa-external-link"></i>
                                Chi tiết
                            </a>
                            <a id="<%: item.Id %>" href="#" class="btn btn-default add-to-cart">
                                <i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng
                            </a>
                        </div>
                    </div>
                    <% int dateDiff = Convert.ToInt32((DateTime.Now - item.DateCreated).TotalDays); %>
                    <%if (dateDiff < ViewBag.DateCompare)%>
                    <%{%>
                    <img src="<%:Url.Content("~/Images/home/new.png") %>" class="new" alt="" />
                    <%} %>
                </div>
                <div class="choose">
                    <ul class="nav nav-pills nav-justified">

                        <li>
                            <%if (User.IsInRole("Admin"))%>
                            <%{ %>
                            <a href="<%:Url.Action("Delete", "Product", new { id=item.Id })%>">
                                <i class="fa fa-plus-square"></i>
                                Delete
                            </a>
                            <%} %>
                            
                        </li>
                    </ul>
                </div>

            </div>
        </div>
        <%} %>
    </div>
    <!--features_items-->

    <%:Html.PagedListPager(Model, 
                               page=>Url.Action("Index",
                                                new {prodType=Convert.ToInt32(ViewData["prodType"]),
                                                     page})) %>
    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog" data-url="<%:Url.Action("RecommendProductPartial","Product") %>">
        <div id="modalContent" class="modal-dialog">
        </div>
    </div>
</asp:Content>
<asp:Content ID="scripSection" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%:Scripts.Render("~/bundles/jqueryui") %>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".add-to-cart").click(function (e) {
                e.preventDefault();

                var sendInfo = {
                    productId: e.target.id,
                    productQuantity: 1
                };

                $.ajax({
                    type: "POST",
                    content: "application/json; charset=utf-8",
                    url: "<%: Url.Action("AddToCart", "Cart")%>",
                    data: sendInfo,
                    success: function (data) {
                        if (data.status) {
                            var url = $("#myModal").data("url");

                            $.get(url,
                                { selectedId: sendInfo.productId },
                                function (data) {
                                    $("#modalContent").html(data);
                                    $("#myModal").modal('show');
                                });
                        } else {
                            alert("Không thể thêm vào danh sách !");
                            e.target.focus();
                        }
                    }
                });
            });
        });

    </script>
</asp:Content>
