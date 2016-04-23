<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<div class="left-sidebar">

    <h2>Category</h2>
    <div class="panel-group category-products" id="accordian">
        <!--category-productsr-->
        <%IList<MyStore.App.Models.Menu> myMenu = this.Session[MyStore.App.MvcApplication.Menu_Session_Key] as List<MyStore.App.Models.Menu>; %>
        <%foreach (var menuItem in myMenu)
          {%>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <%if (menuItem.ChildMenu == null)%>
                    <%{%>
                    <a href="<%: Url.Action("Index", "Product", new { prodType=menuItem.MenuId }) %>"><%: menuItem.MenuDesc %></a>
                    <%} %>
                    <%else%>
                    <%{ %>
                    <a data-toggle="collapse" data-parent="#accordian" href="<%:string.Format("menu{0}", menuItem.MenuId) %><%:string.Format("#menu{0}", menuItem.MenuId) %>">
                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                        <%:menuItem.MenuDesc %>
                    </a>
                    <%} %>
                    
                </h4>
            </div>
            <%if (menuItem.ChildMenu != null &&
                  menuItem.ChildMenu.Count != 0)
              {%>
            <div id="<%:string.Format("menu{0}", menuItem.MenuId) %>" class="panel-collapse collapse">
                <div class="panel-body">
                    <ul>
                        <%foreach (var subMenu in menuItem.ChildMenu)
                          {%>
                        <li>
                            <a href="<%: Url.Action("Index", "Product", new { prodType=subMenu.MenuId }) %>">
                                <%:subMenu.MenuDesc %> 
                            </a>
                        </li>
                        <%} %>
                    </ul>
                </div>
            </div>
            <%} %>
        </div>
        <% } %>

        <!--price-range-->
        <div class="price-range">
            <h2>Phân loại theo giá</h2>
            <div class="well">
                <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2"><br />
                <b>$ 0</b> <b class="pull-right">$ 600</b>
            </div>

        </div>
        <!--/price-range-->

        <!--shipping-->
        <div class="shipping text-center">
            <img src="<%: Url.Content("~/Images/home/shipping.jpg") %>" alt="" />
        </div>
        <!--/shipping-->

    </div>
</div>
