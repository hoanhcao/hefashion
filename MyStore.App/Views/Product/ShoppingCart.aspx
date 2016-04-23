<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SubSite.Master" Inherits="System.Web.Mvc.ViewPage<System.Collections.Generic.IList<MyStore.App.ViewModels.ShoppingCartViewModel>>" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Giỏ hàng của bạn
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Begin Cart Items --%>
    <section id="cart_items">
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li>
                        <a href="<%:Url.Action("Index", "Product") %>">Home</a>
                    </li>
                    <li class="active">Giỏ hàng
                    </li>
                </ol>
            </div>

            <div class="table-responsive cart_info" id="cartResult">
                <%:Html.Partial("_CartTablePartial", Model) %>
            </div>
        </div>
    </section>
    <%-- End Cart Items --%>
    <%if (Model != null && Model.Count > 0)%>
    <%{ %>
    <%-- Begin Do Action --%>
    <section id="do_action">
        <div class="container">
            <div class="heading">
                <h3>Bạn có muốn tính tiền hay không?</h3>
                <p>Quý khách vui lòng kiểm tra bảng thanh toán bên dưới và click vào <b>Thanh Toán</b>, sau đó làm theo các bước hướng dẫn để nhận hàng</p>
            </div>
            <div class="row">
                <%--<div class="col-sm-6">
                    <div class="chose_area">
                        <ul class="user_option">
                            <li>
                                <input type="checkbox">
                                <label>Use Coupon Code</label>
                            </li>
                            <li>
                                <input type="checkbox">
                                <label>Use Gift Voucher</label>
                            </li>
                            <li>
                                <input type="checkbox">
                                <label>Estimate Shipping & Taxes</label>
                            </li>
                        </ul>
                        <ul class="user_info">
                            <li class="single_field">
                                <label>Country:</label>
                                <select>
                                    <option>United States</option>
                                    <option>Bangladesh</option>
                                    <option>UK</option>
                                    <option>India</option>
                                    <option>Pakistan</option>
                                    <option>Ucrane</option>
                                    <option>Canada</option>
                                    <option>Dubai</option>
                                </select>

                            </li>
                            <li class="single_field">
                                <label>Region / State:</label>
                                <select>
                                    <option>Select</option>
                                    <option>Dhaka</option>
                                    <option>London</option>
                                    <option>Dillih</option>
                                    <option>Lahore</option>
                                    <option>Alaska</option>
                                    <option>Canada</option>
                                    <option>Dubai</option>
                                </select>

                            </li>
                            <li class="single_field zip-field">
                                <label>Zip Code:</label>
                                <input type="text">
                            </li>
                        </ul>
                        <a class="btn btn-default update" href="#">Get Quotes</a>
                        <a class="btn btn-default check_out" href="#">Continue</a>
                    </div>
                </div>
                --%>
                <div class="col-sm-6">
                    <div class="total_area">
                        <%--<ul>
                            <li>Tổng cộng tiền hàng <span><%:Model.Sum(p=>p.TotalAmount).ToString("#,###.#") %> VND</span></li>
                            <li>Chi phí vận chuyển <span>Free</span></li>
                            <li>Tổng cộng <span><%:Model.Sum(p=>p.TotalAmount).ToString("#,###.#") %> VND</span></li>
                        </ul>--%>
                        <a class="btn btn-default check_out" href="<%:Url.Action("Index", "Checkout") %>">Thanh toán</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%-- End Do Action --%>
    <%} %>
</asp:Content>

<asp:Content ID="featureContent" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="scriptContent" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
