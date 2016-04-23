<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.IList<MyStore.App.ViewModels.ProductModel>>" %>

<!--recommended_items-->
<div class="recommended_items">
    <h2 class="title text-center">Các sản phẩm liên quan</h2>

    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">

        <div class="carousel-inner">
            <div class="item active">
                <%foreach (MyStore.App.ViewModels.ProductModel recommendItem in Model.Take(3))%>
                <%{ %>
                <div class="col-sm-4">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <a href="<%:Url.Action("Details", "Product", new { id=recommendItem.Id })%>">
                                    <img src="<%:Url.Content(System.IO.Path.Combine("~/Images/shop/product-recommend",recommendItem.Image)) %>" alt="" />
                                </a>
                                <h2><%:MyStore.App.Utilities.DecimalHelper.ToString(recommendItem.Price, "#,###.#") %></h2>
                                <p><%:recommendItem.Description %></p>
                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%} %>
                <%--  <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="images/home/recommend1.jpg" alt="" />
                                    <h2>$56</h2>
                                    <p>Easy Polo Black Edition</p>
                                    <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="images/home/recommend2.jpg" alt="" />
                                    <h2>$56</h2>
                                    <p>Easy Polo Black Edition</p>
                                    <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="images/home/recommend3.jpg" alt="" />
                                    <h2>$56</h2>
                                    <p>Easy Polo Black Edition</p>
                                    <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                </div>
                            </div>
                        </div>
                    </div>--%>
            </div>
            <%for (int i = 3; i < Model.Count; i += 3)%>
            <%{ %>
            <div class="item">
                <%var takeList = Model.Skip(i).Take(3); %>
                <%foreach (MyStore.App.ViewModels.ProductModel recommendItem in takeList)%>
                <%{%>
                <div class="col-sm-4">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <a href="<%:Url.Action("Details", "Product", new { id=recommendItem.Id })%>">
                                    <img src="<%:Url.Content(System.IO.Path.Combine("~/Images/shop/product-recommend",recommendItem.Image)) %>" alt="" />
                                </a>
                                <h2><%: MyStore.App.Utilities.DecimalHelper.ToString(recommendItem.Price, "#,###.#")%></h2>
                                <p><%: recommendItem.Description %></p>
                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
            <%} %>
        </div>
        <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
            <i class="fa fa-angle-left"></i>
        </a>
        <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
            <i class="fa fa-angle-right"></i>
        </a>
    </div>
</div>
<!--/recommended_items-->
