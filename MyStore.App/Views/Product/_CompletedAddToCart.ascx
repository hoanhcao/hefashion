<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.IList<MyStore.App.ViewModels.ProductModel>>" %>


<div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4>Đã thêm vào giỏ hàng</h4>
    </div>
    <div class="modal-body">
        <p>Hello world</p>
        <%:Html.Partial("_RecommendItemsPartial",Model) %>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    </div>
</div>
