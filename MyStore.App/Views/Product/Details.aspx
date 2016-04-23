<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<MyStore.App.ViewModels.ProductModel>" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Chi Tiết - Sản Phẩm
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <!--product-details-->
    <div class="product-details">
        <div class="col-sm-5">
            <div class="view-product">
                <img id="<%:Model.Name %>" src="<%:Url.Content(System.IO.Path.Combine("~/Images/shop/product-details",Model.Image)) %>" alt="" data-zoom-image="<%:Url.Content(System.IO.Path.Combine("~/Images/shop/product_original", Model.Image)) %>" />
                <h3>Rê chuột để xem chi tiết</h3>
            </div>
        </div>
        <div class="col-sm-7">
            <div class="product-information">
                <!--/product-information-->
                <%int dateDiff = Convert.ToInt32((DateTime.Now - Model.DateCreated).TotalDays); %>
                <%if (dateDiff < ViewBag.DateCompare)%>
                <%{%>
                <img src="<%:Url.Content("~/Images/shop/new.jpg") %>" class="newarrival" alt="" />
                <%}%>
                <h2><%:Model.Description %></h2>

                <p>Mã hàng: <%:Model.Name %></p>
                <p><b>Đơn vị:</b> <%:Model.UOM%></p>

                <img src="<%:Url.Content("~/Images/shop/rating.png") %>" alt="" />
                <span>
                    <span><%:MyStore.App.Utilities.DecimalHelper.ToString(Model.Price, "#,###.#") %> VND</span>
                    <label>Thêm:</label>
                    <input type="text" value="1" id="txtQuantity" />
                    <button type="button" class="btn btn-default cart">
                        <i class="fa fa-shopping-cart"></i>
                        vào giỏ hàng
                    </button>
                </span>
                <p><b>Trạng thái:</b> Còn hàng</p>
                <%--
                <p><b>Nha:</b> E-SHOPPER</p>
                <a href="">
                    <img src="images/product-details/share.png" class="share img-responsive" alt="" />
                </a>
                --%>
            </div>
            <!--/product-information-->
        </div>
    </div>
    <!--/product-details-->

    <!--category-tab-->
    <div class="category-tab shop-details-tab ">
        <div class="col-sm-12">
            <ul class="nav nav-tabs">
                <%--
                <li class="active"><a href="#details" data-toggle="tab">Details</a></li>
                <li><a href="#companyprofile" data-toggle="tab">Company Profile</a></li>
                <li><a href="#tag" data-toggle="tab">Tag</a></li>
                --%>
                <li><a href="#reviews" data-toggle="tab">Nhận xét</a></li>
            </ul>
        </div>
        <div class="tab-content">
            <%--

            <div class="tab-pane fade" id="details">
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery1.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery2.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery3.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery4.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" id="companyprofile">
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery1.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery3.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery2.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery4.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" id="tag">
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery1.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery2.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery3.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery4.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            --%>
            <div class="tab-pane fade  active in" id="reviews">
                <div class="col-sm-12">
                    <ul>
                        <%--<li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
                        <li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>--%>
                        <li><a href=""><i class="fa fa-calendar-o"></i><%:Model.DateCreated.ToString("dd MMM yyyy") %></a></li>
                    </ul>
                    <p><%:Model.OtherDetails %></p>
                    <%--<p><b>Write Your Review</b></p>

                    <form action="#">
                        <span>
                            <input type="text" placeholder="Your Name" />
                            <input type="email" placeholder="Email Address" />
                        </span>
                        <textarea name=""></textarea>
                        <b>Rating: </b>
                        <img src="images/product-details/rating.png" alt="" />
                        <button type="button" class="btn btn-default pull-right">
                            Submit
                        </button>
                    </form>--%>
                </div>
            </div>

        </div>
    </div>
    <!--/category-tab-->
    <%IList<MyStore.App.ViewModels.ProductModel> recommendItems = ViewData["RecommendProduct"] as IList<MyStore.App.ViewModels.ProductModel>; %>
    <%:Html.Partial("_RecommendItemsPartial",  recommendItems)%>
</asp:Content>

<asp:Content ID="scriptContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%:Scripts.Render( "~/Scripts/jquery.elevateZoom.js") %>
    <%:Scripts.Render("http://transtatic.com/js/numericInput.min.js") %>
    <script>
        $(document).ready(function () {
            $("<%:"#"+ Model.Name %>").elevateZoom();
            $("#txtQuantity").numericInput({ allowFloat: true });

            $(".cart").click(function (e) {
                e.preventDefault();

                var sendInfo = {
                    productId: <%:Model.Id%>,
                    productQuantity:$("#txtQuantity").val()
                };

                $.ajax({
                    type: "POST",
                    content: "application/json; charset=utf-8",
                    url: "<%: Url.Action("AddToCart", "Cart")%>",
                    data: sendInfo,
                    success: function (message, quantity) {
                        if (message) {
                            alert("Sản phẩm đã được thêm vào giỏ !");
                            history.pushState({}, "", this.href);
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
