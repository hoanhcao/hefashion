<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MyStore.App.ViewModels.CheckoutViewModel>" %>

<div class="review-payment">
    <h2>Chuyển Khoản & Nhận Hàng</h2>
</div>

<div class="replay-box">
    <div class="row">
        <div class="col-sm-4">
            <form>
                <div class="blank-arrow">
                    <label>Ngân Hàng</label>
                </div>

                <input type="text" disabled="disabled" value="Vietcombank" />
                <div class="blank-arrow">
                    <label>Mã Tài Khoản</label>
                </div>

                <input type="text" disabled="disabled" value="0123456789" />
                <div class="blank-arrow">
                    <label>Chủ Tài Khoản</label>
                </div>

                <input type="text" disabled="disabled" value="Cao Van Hoanh" />

                <div class="blank-arrow">
                    <label>Chi Nhánh</label>
                </div>

                <input type="text" disabled="disabled" value="Thành phố Hồ Chí Minh" />
            </form>
        </div>

        <div class="col-sm-8">
            <div class="text-area" style="margin-top: 0px">
                <div class="blank-arrow">
                    <label>Ghi Chú</label>
                </div>
                <br />
                <span>Chúng tôi sẽ chuyển hàng ngay sau khi nhận được tiền. Đảm bảo trong vòng 2 ngày, hàng sẽ gửi đến cho quý khách.
                    Uy tín, chất lượng và cẩn trọng.
                </span>
                <a class="btn btn-primary" href="<%:Url.Action("CreateOrder", "Checkout") %>">Kết Thúc & Tạo Đơn Hàng</a>
            </div>
        </div>
    </div>
</div>
