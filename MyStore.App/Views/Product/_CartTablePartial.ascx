<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ICollection<MyStore.App.ViewModels.ShoppingCartViewModel>>" %>

<table class="table table-condensed">
    <thead>
        <tr class="cart_menu">
            <td class="image">Sản phẩm</td>
            <td class="description"></td>
            <td class="price">Giá</td>
            <td class="quantity">Số lượng</td>
            <td class="total">Tổng tiền</td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <%if (Model == null || Model.Count == 0)%>
        <%{ %>
        <tr>
            <td colspan="6" class="text-center">Quý khách chưa có bất kỳ sản phẩm nào trong giỏ hàng
            </td>
        </tr>
        <%} %>
        <%else%>
        <%{ %>
        <%foreach (var item in Model)%>
        <%{ %>
        <tr>

            <td class="cart_product">
                <a href="<%:Url.Action("Details", "Product", new { id = item.ProductId })%>">
                    <img src="<%:Url.Content(System.IO.Path.Combine("~/Images/cart", item.ProductImage)) %>" alt="">
                </a>
            </td>
            <td class="cart_description">
                <h4><a href="<%:Url.Action("Details", "Product", new {id=item.ProductId}) %>"><%:item.ProductDescription %></a></h4>
                <p>Mã hàng: <%:item.ProductName %></p>
            </td>
            <td class="cart_price">
                <p><%:item.Price %></p>
            </td>
            <td class="cart_quantity">
                <div class="cart_quantity_button">
                    <a class="cart_quantity_up" href="<%:Url.Action("PlusQuantity", "Cart", new { product_Id=item.ProductId })%>">+</a>
                    <input class="cart_quantity_input" type="text" name="quantity" value="<%:item.TotalQuantity %>" autocomplete="off" size="2" readonly="true">
                    <a class="cart_quantity_down" href="<%:Url.Action("MinusQuantity", "Cart", new { product_Id=item.ProductId })%>">-</a>
                </div>
            </td>
            <td class="cart_total">
                <p class="cart_total_price"><%:item.TotalAmount.ToString("#,###.#") %></p>
            </td>
            <td class="cart_delete">
                <a class="cart_quantity_delete" title="Xóa khỏi giỏ" href="<%:Url.Action("Remove", "Cart", new { id=item.ProductId })%>">
                    <i class="fa fa-times"></i>
                </a>
            </td>
        </tr>
        <%} %>
        <tr>
            <td colspan="4">&nbsp;</td>
            <td colspan="2">
                <table class="table table-condensed total-result">
						<tr>
							<td>Tổng cộng tiền hàng</td>
							<td><%:Model.Sum(p=>p.TotalAmount).ToString("#,###.#") %> VND</td>
						</tr>
						<tr>
							<td>Thuế VAT</td>
							<td>0 VND</td>
						</tr>
						<tr class="shipping-cost">
							<td>Chi phí vận chuyển</td>
							<td>Free</td>
						</tr>
						<tr>
							<td>Tổng cộng</td>
							<td><span><%:Model.Sum(p=>p.TotalAmount).ToString("#,###.#") %> VND</span></td>
						</tr>
					</table>
            </td>
        </tr>
        <%} %>
    </tbody>
</table>
