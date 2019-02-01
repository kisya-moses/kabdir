<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebPortal.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="PageData" runat="server">
    <div class="row">
        <div id="content" class="col-sm-12">
            <div class="swiper-viewport">
                <div id="slideshow0" class="swiper-container">
                    <div class="swiper-wrapper">
                        <asp:Repeater ID="AllQuestions" runat="server">
                            <ItemTemplate>
                                <div class="swiper-slide text-center">
                                    <a href="index.php?route=product/product&amp;path=57&amp;product_id=49">
                                        <img src="http://localhost:8001/opencart/image/cache/catalog/demo/banners/iPhone6-1140x380.jpg"
                                            alt="iPhone 6" class="img-responsive" />
                                    </a>
                                </div>
                                <div class="swiper-slide text-center">
                                    <a href="product?product_id=<%#Eval("ImageID").ToString()%>">
                                        <img src="<%#Eval("ImagePath").ToString().Replace("~/","") %>"
                                            alt="image" class="img-responsive" />
                                    </a>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="swiper-pagination slideshow0"></div>
                <div class="swiper-pager">
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
            </div>
            <script type="text/javascript">
                    <!--
    $('#slideshow0').swiper({
        mode: 'horizontal',
        slidesPerView: 1,
        pagination: '.slideshow0',
        paginationClickable: true,
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        spaceBetween: 30,
        autoplay: 2500,
        autoplayDisableOnInteraction: true,
        loop: true
    });
    -->
            </script>
            <h3>Featured</h3>
            <div class="row">
                <%--                <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="product-thumb transition">
                        <div class="image">
                            <a href="http://localhost:8001/opencart/index.php?route=product/product&amp;product_id=43">
                                <img src="http://localhost:8001/opencart/image/cache/catalog/demo/macbook_1-200x200.jpg" alt="MacBook" title="MacBook" class="img-responsive" /></a>
                        </div>
                        <div class="caption">
                            <h4><a href="http://localhost:8001/opencart/index.php?route=product/product&amp;product_id=43">MacBook</a></h4>
                            <p>
                                Intel Core 2 Duo processor
	
		Powered by an Intel Core 2 Duo processor at speeds up to 2.1..
                            </p>
                            <p class="price">
                                $602.00
                              <span class="price-tax">Ex Tax: $500.00</span>
                            </p>
                        </div>
                        <div class="button-group">
                            <button type="button" onclick="cart.add('43');"><i class="fa fa-shopping-cart"></i><span class="hidden-xs hidden-sm hidden-md">Add to Cart</span></button>
                            <button type="button" data-toggle="tooltip" title="Add to Wish List" onclick="wishlist.add('43');"><i class="fa fa-heart"></i></button>
                            <button type="button" data-toggle="tooltip" title="Compare this Product" onclick="compare.add('43');"><i class="fa fa-exchange"></i></button>
                        </div>
                    </div>
                </div>
                <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="product-thumb transition">
                        <div class="image">
                            <a href="http://localhost:8001/opencart/index.php?route=product/product&amp;product_id=40">
                                <img src="http://localhost:8001/opencart/image/cache/catalog/demo/iphone_1-200x200.jpg" alt="iPhone" title="iPhone" class="img-responsive" /></a>
                        </div>
                        <div class="caption">
                            <h4><a href="http://localhost:8001/opencart/index.php?route=product/product&amp;product_id=40">iPhone</a></h4>
                            <p>
                                iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a nam..
                            </p>
                            <p class="price">
                                $123.20
                              <span class="price-tax">Ex Tax: $101.00</span>
                            </p>
                        </div>
                        <div class="button-group">
                            <button type="button" onclick="cart.add('40');"><i class="fa fa-shopping-cart"></i><span class="hidden-xs hidden-sm hidden-md">Add to Cart</span></button>
                            <button type="button" data-toggle="tooltip" title="Add to Wish List" onclick="wishlist.add('40');"><i class="fa fa-heart"></i></button>
                            <button type="button" data-toggle="tooltip" title="Compare this Product" onclick="compare.add('40');"><i class="fa fa-exchange"></i></button>
                        </div>
                    </div>
                </div>
                <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="product-thumb transition">
                        <div class="image">
                            <a href="http://localhost:8001/opencart/index.php?route=product/product&amp;product_id=42">
                                <img src="http://localhost:8001/opencart/image/cache/catalog/demo/apple_cinema_30-200x200.jpg" alt="Apple Cinema 30&quot;" title="Apple Cinema 30&quot;" class="img-responsive" /></a>
                        </div>
                        <div class="caption">
                            <h4><a href="http://localhost:8001/opencart/index.php?route=product/product&amp;product_id=42">Apple Cinema 30&quot;</a></h4>
                            <p>
                                The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed sp..
                            </p>
                            <p class="price">
                                <span class="price-new">$110.00</span> <span class="price-old">$122.00</span>
                                <span class="price-tax">Ex Tax: $90.00</span>
                            </p>
                        </div>
                        <div class="button-group">
                            <button type="button" onclick="cart.add('42');"><i class="fa fa-shopping-cart"></i><span class="hidden-xs hidden-sm hidden-md">Add to Cart</span></button>
                            <button type="button" data-toggle="tooltip" title="Add to Wish List" onclick="wishlist.add('42');"><i class="fa fa-heart"></i></button>
                            <button type="button" data-toggle="tooltip" title="Compare this Product" onclick="compare.add('42');"><i class="fa fa-exchange"></i></button>
                        </div>
                    </div>
                </div>--%>


                <asp:Repeater ID="DisplayProducts" runat="server">
                    <ItemTemplate>
                        <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="product-thumb transition">
                                <div class="image">
                                    <a href="product?product_id=<%#Eval("ProductID").ToString()%>">
                                        <img src="<%#Eval("ProductImage").ToString()%>" alt="<%#Eval("ProductName").ToString()%>" title="<%#Eval("ProductName").ToString()%>" class="img-responsive" /></a>
                                </div>
                                <div class="caption">
                                    <h4><a href="product?product_id=<%#Eval("ProductID").ToString()%>"><%#Eval("ProductName").ToString()%></a></h4>
                                    <p>
                                        <%#Eval("ProductDescription").ToString()%>
                                    </p>
                                    <p class="price">
                                        <span class="price-new"><%#Eval("NewProductPrice").ToString()%></span>
                                        <span class="price-old"><%#Eval("OldProductPrice").ToString()%></span>
                                        <span class="price-tax"><%#Eval("ProductTax").ToString()%></span>
                                    </p>
                                </div>
                                <div class="button-group">
                                    <button type="button" onclick="cart.add('<%#Eval("ProductID").ToString()%>');">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span class="hidden-xs hidden-sm hidden-md">Add to Cart</span>
                                    </button>
                                        <%--                                    
                                            <button type="button" data-toggle="tooltip" title="Add to Wish List" onclick="wishlist.add('30');"><i class="fa fa-heart"></i></button>
                                        --%>
                                    <button type="button" data-toggle="tooltip" title="Compare this Product" onclick="compare.add('<%#Eval("ProductID").ToString()%>');"><i class="fa fa-exchange"></i></button>
                                </div>
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="swiper-viewport">
                <div id="carousel0" class="swiper-container">
                    <div class="swiper-wrapper">
                        <asp:Repeater ID="ServiceProviders" runat="server">
                            <ItemTemplate>
                                <div class="swiper-slide text-center">
                                    <img src="<%#Eval("ServiceProviderImage").ToString()%>" alt="<%#Eval("ProviderName").ToString()%>" class="img-responsive" />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="swiper-pagination carousel0"></div>
                <div class="swiper-pager">
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
            </div>
            <script type="text/javascript"><!--
    $('#carousel0').swiper({
        mode: 'horizontal',
        slidesPerView: 5,
        pagination: '.carousel0',
        paginationClickable: true,
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        autoplay: 2500,
        loop: true
    });
    --></script>
        </div>
    </div>
</asp:Content>
