<%@ page import="vn.edu.hcmuaf.fit.model.ProductModel" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.APIConstants" %>
<%@page import="java.util.Date" %>
<%@page import="java.sql.Timestamp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="../../common/web/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="css/rate_review.css">
    <title> Sản phẩm | Phone Care </title>
</head>

<body>
<%
    List<ProductModel> pro = (List<ProductModel>) request.getAttribute("pro");
    List<RateReviewModel> listRate = (List<RateReviewModel>) request.getAttribute("listRate");

%>
<%
    ProductModel product = (ProductModel) request.getAttribute("product");
    InventoriesModel inventories = (InventoriesModel) request.getAttribute("inventoriesList");
    DiscountModel discount = (DiscountModel) request.getAttribute("discount");
    Date serverTime = new Date();
    Timestamp timestamp = new Timestamp(serverTime.getTime());
    Timestamp dateStart = Timestamp.valueOf(discount.getDateStart());
    Timestamp dateEnd = Timestamp.valueOf(discount.getDateEnd());
    int priceSale= (int) Math.ceil(product.getPrice() * discount.getPercentDiscount() / 100);
%>

<%@include file="../../common/web/header.jsp" %>

<!--  detail product -->
<main class="">

    <div id="product" class="productDetail-page">
        <!--  menu header seo -->
        <div class="breadcrumb-shop">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pd5">
                        <ol class="breadcrumb breadcrumb-arrows">
                            <li>
                                <a href="index.html">
                                    <span>Trang chủ</span>
                                </a>
                            </li>
                            <li>
                                <a href="product.jsp">
                                    <span>Iphone</span>
                                </a>
                            </li>
                            <li>
                                <a href="service.html">
                                    <span>Thay màn hình</span>
                                </a>
                            </li>
                            <li class="acitve" style="color:#F28102">
                                <span>Thay Màn hình Iphone X</span>
                                </span>
                                <meta itemprop="position" content="3">
                            </li>

                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <!-- detail product chính -->
        <div class="container">
            <div class="row product-detail-wrapper">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="row product-detail-main pr_style_01">
                        <div class="col-md-7 col-sm-12 col-xs-12">
                            <div class="product-gallery">
                                <div class="product-gallery__thumbs-container hidden-sm hidden-xs">
                                    <div class="product-gallery__thumbs thumb-fix">

                                        <div class="product-gallery__thumb " id="imgg1">
                                            <a class="product-gallery__thumb-placeholder" href="javascript:void(0);"
                                               data-image="images/product/<%=!product.getListImage().isEmpty()?product.getListImage().get(0).getUrl():""%>"
                                               data-zoom-image="images/product/<%=!product.getListImage().isEmpty()?product.getListImage().get(0).getUrl():""%>">
                                                <img src="images/product/<%=!product.getListImage().isEmpty()?product.getListImage().get(0).getUrl():""%>"
                                                     data-image="images/product/<%=!product.getListImage().isEmpty()?product.getListImage().get(0).getUrl():""%>"
                                                     alt=""
                                                     grape="">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-image-detail box__product-gallery scroll hidden-xs">
                                    <ul id="sliderproduct" class="site-box-content slide_product">
                                        <%
                                            for (int image = 0; image < product.getListImage().size(); image++) {
                                        %>
                                        <li class="product-gallery-item gallery-item current " id="imgg1a">
                                            <img class="product-image-feature "
                                                 src="images/product/<%=!product.getListImage().isEmpty()?product.getListImage().get(image).getUrl():""%>"
                                                 alt=""
                                                 grape="">
                                        </li>
                                        <%
                                            }%>
                                    </ul>
                                    <div class="product-image__button">
                                        <div id="product-zoom-in" class="product-zoom icon-pr-fix" aria-label="Zoom in"
                                             title="Zoom in">
                        <span class="zoom-in" aria-hidden="true">
                          <svg version="1.1" xmlns="http://www.w3.org/2000/svg"
                               x="0px" y="0px" viewBox="0 0 36 36" style="enable-background:new 0 0 36 36; width:
                            30px; height: 30px;" xml:space="preserve">
                            <polyline points="6,14 9,11 14,16 16,14 11,9 14,6 6,6">
                            </polyline>
                            <polyline points="22,6 25,9 20,14 22,16 27,11 30,14 30,6">
                            </polyline>
                            <polyline points="30,22 27,25 22,20 20,22 25,27 22,30 30,30">
                            </polyline>
                            <polyline points="14,30 11,27 16,22 14,20 9,25 6,22 6,30">
                            </polyline>
                          </svg>
                        </span>
                                        </div>
                                        <div class="gallery-index icon-pr-fix"><span class="current">1</span>
                                            / <span class="total">8</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="product-gallery-slide">
                                <div class="owl-carousel owl-theme owl-product-gallery-slide">
                                    <div class=" item">
                                        <div class="product-gallery__thumb ">
                                            <a class=" product-gallery__thumb-placeholder" href="javascript:void(0);"
                                               data-image="images/product/<%=!product.getListImage().isEmpty()?product.getListImage().get(0).getUrl():""%>"
                                               data-zoom-image="images/sanpham/2.jpg">
                                                <img src="images/product/<%=!product.getListImage().isEmpty()?product.getListImage().get(0).getUrl():""%>"
                                                     data-image="images/product/<%=!product.getListImage().isEmpty()?product.getListImage().get(0).getUrl():""%>"
                                                     alt=""
                                                     grape="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="product-gallery__thumb ">
                                            <a class=" product-gallery__thumb-placeholder" href="javascript:void(0);"
                                               data-image="images/product/<%=!product.getListImage().isEmpty()?product.getListImage().get(0).getUrl():""%>"
                                               data-zoom-image="images/product/<%=!product.getListImage().isEmpty()?product.getListImage().get(0).getUrl():""%>">
                                                <img src="images/product/<%=!product.getListImage().isEmpty()?product.getListImage().get(0).getUrl():""%>"
                                                     data-image="images/product/<%=!product.getListImage().isEmpty()?product.getListImage().get(0).getUrl():""%>"
                                                     alt=""
                                                     grape="">
                                            </a>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-12 col-xs-12
                product-content-desc" id="detail-product">
                            <div class="product-content-desc-1">
                                <div class="product-title">
                                    <h1><%=product.getName()%>
                                    </h1>
                                    <p>Server time: <%=serverTime.toString()%>
                                    </p>
                                    <p>Server time: <%=timestamp.toString()%>
                                    </p>
                                    <p>date start: <%=dateStart.toString()%>
                                    </p>
                                    <p>date end: <%=dateEnd.toString()%>
                                    </p>
                                    <%-- <span id="pro_sku">ID: <%=product.getId()%></span>--%>
                                    <span id="pro_sku">SL: <%= inventories.getQuantity()%></span>
                                </div>
                                <% if (discount == null || (dateEnd.getTime() < timestamp.getTime() && dateStart.getTime() > timestamp.getTime()) ) {%>
                                <div class="product-price" id="price-preview">
                                    <span class="pro-price"><%=product.getPrice()%>₫</span>
                                </div>
                                <%} else {%>
                                <div class="product-price" id="price-preview">
                                    <span class="pro-price"><%=priceSale%>₫</span>
                                    <span class=""
                                          style="text-decoration: line-through;"><%=product.getPrice()%>₫</span>

                                    <span class="pro-sale" style="background-color: #ff6600;color: white;border: dashed;border-radius: 8px; "> -<%=discount.getPercentDiscount()%>%</span>
                                </div>
                                <%}%>
                                <div class="product-price" id="delivery">
                                    <span>Giao đến: </span>
                                    <span class="address">Q. 3, P. 01, Hồ Chí Minh</span>
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-primary"
                                            data-toggle="modal" data-target="#modalGetAddress">
                                        Đổi địa chỉ
                                    </button>
                                </div>

                                <form id="add-item-form" action="" method="post" class="variants clearfix">
                                    <div class="select clearfix">
                                        <div class="selector-wrapper"><label for="product-select-option-0">Màu
                                            sắc</label><span class="custom-dropdown custom-dropdown--white"><select
                                                class="single-option-selector
                            custom-dropdown__select
                            custom-dropdown__select--white" data-option="option1" id="product-select-option-0">
                            <option value="Nâu">Tím</option>
                            <option value="Xanh">Xanh</option>
                          </select></span></div>
                                        <div class="selector-wrapper"><label for="product-select-option-1">Kích
                                            thước</label><span class="custom-dropdown custom-dropdown--white"><select
                                                class="single-option-selector
                            custom-dropdown__select
                            custom-dropdown__select--white" data-option="option2" id="product-select-option-1">
                            <option value="36">36</option>
                            <option value="37">37</option>
                            <option value="38">38</option>
                            <option value="35">35</option>
                          </select></span></div>
                                        <select id="product-select" name="id" style="display:none;">

                                            <option value="1040377813">Tím / 36 - 4,800,000₫</option>
                                            <option value="1040377814">Tím / 37 - 4,800,000₫</option>
                                            <option value="1040377815">Tím / 38 - 4,800,000₫</option>
                                            <option value="1040409049">Xanh / 35 - 4,800,000₫</option>
                                            <option value="1040409050">Xanh / 36 - 4,800,000₫</option>
                                            <option value="1040409053">Xanh / 37 - 4,800,000₫</option>
                                            <option value="1040409054">Xanh / 38 - 4,800,000₫</option>
                                        </select>
                                    </div>
                                    <div class="select-swatch clearfix">

                                        <div id="variant-swatch-1" class="swatch clearfix" data-option="option2"
                                             data-option-index="1">

                                            <div class="select-swap">
                                                <div data-value="Zin" class="n-sd swatch-element Zin">
                                                    <input class="variant-1" id="swatch-1-Zin" type="radio"
                                                           name="option2" value="Zin"
                                                           data-vhandle="Zin" checked="">
                                                    <label for="swatch-1-Zin" class="sd">
                                                        <span>Zin</span>
                                                    </label>
                                                </div>
                                                <!--                                                <div data-value="L" class="n-sd swatch-element L">-->
                                                <!--                                                    <input class="variant-1" id="swatch-1-L" type="radio" name="option2"-->
                                                <!--                                                           value="L"-->
                                                <!--                                                           data-vhandle="L">-->

                                                <!--                                                    <label for="swatch-1-L">-->
                                                <!--                                                        <span>L</span>-->
                                                <!--                                                    </label>-->

                                                <!--                                                </div>-->
                                                <!--                                                <div data-value="XL" class="n-sd swatch-element XL">-->
                                                <!--                                                    <input class="variant-1" id="swatch-1-XL" type="radio"-->
                                                <!--                                                           name="option2" value="XL"-->
                                                <!--                                                           data-vhandle="XL">-->

                                                <!--                                                    <label for="swatch-1-XL">-->
                                                <!--                                                        <span>XL</span>-->
                                                <!--                                                    </label>-->

                                                <!--                                                </div>-->
                                                <div data-value="LK" class="n-sd swatch-element LK soldout">
                                                    <input class="variant-1" id="swatch-1-XXL" type="radio"
                                                           name="option2" value="LK"
                                                           data-vhandle="LK" disabled="">

                                                    <label>
                                                        <span>LK</span>
                                                    </label>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="selector-actions">
                                        <div class="quantity-area clearfix">
                                            <input type="button" value="-" onclick="decreasesQuantity()"
                                                   class="qty-btn">
                                            <input type="text" id="quantity" name="quantity" value="1" min="1"
                                                   class="quantity-selector">
                                            <input type="button" value="+" onclick="increaseQuantity()" class="qty-btn">
                                        </div>
                                        <div class="wrap-addcart clearfix">
                                            <div class="row-flex">
                                                <div class="snipcart-item block">
                                                    <div class="snipcart-details agileinfo_single_right_details">
                                                        <form action="#" method="post" class="mini-cart">
                                                            <fieldset>
                                                                <input type="hidden" name="cmd" value="_cart">
                                                                <input type="hidden" name="add" value="1">
                                                                <input type="hidden" name="business" value=" ">
                                                                <input type="hidden" name="image"
                                                                       value="<%=!product.getListImage().isEmpty()?product.getListImage().get(0).getUrl():""%>">
                                                                <input type="hidden" name="item_name"
                                                                       value="<%=product.getName()%>">
                                                                <input type="hidden" name="amount"
                                                                       value="<%=product.getPrice()%>">
                                                                <input type="hidden" name="discount_amount"
                                                                       value="10000">
                                                                <input type="hidden" name="currency_code" value="VND">
                                                                <input type="hidden" name="id_item"
                                                                       value="<%=product.getId()%>">
                                                                <input type="hidden" name="return" value=" ">
                                                                <input type="hidden" name="cancel_return" value=" ">
                                                                <button type="submit" name="submit" value="Thêm vào giỏ"
                                                                        class="button btn-addtocart addtocart-modal"
                                                                        onclick="addBtnCart()">Thêm vào giỏ
                                                                </button>
                                                            </fieldset>
                                                        </form>
                                                    </div>
                                                </div>
                                                </button>
                                                <a href="booking" type="button" class="buy-now button"
                                                   style="display: block;">Đặt lịch
                                                    ngay</a>
                                            </div>

                                            <!--                                            <a href="" target="_blank" class="button btn-check"-->
                                            <!--                                               style="color: #ffffff;text-decoration:none;"><span>Click nhận mã giảm giá ngay!</span></a>-->

                                        </div>
                                    </div>
                                    <!--                                                      <div class="product-action-bottom visible-xs">-->
                                    <!--                                                          <div class="input-bottom">-->
                                    <!--                                                            <input id="quan-input" type="number" value="1" min="1">-->
                                    <!--                                                          </div>-->
                                    <!--                                                          <button type="button" id="add-to-cartbottom"-->
                                    <!--                                                            class="add-to-cartProduct add-cart-bottom button addtocart-modal" name="add">Thêm vào-->
                                    <!--                                                            giỏ</button>-->
                                    <!--                                                        </div>-->
                                </form>
                                <div class="product-description">
                                    <div class="title-bl">
                                        <h2>Mô tả</h2>
                                    </div>
                                    <div class="description-content">
                                        <div class="description-productdetail">
                                            <%=product.getDescribe()%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--                    RATE & REVIEW           --%>
                    <div class="rate-and-review">
                        <form action="detail-product?id-product=<%=product.getId()%>" class="wrapper" method="post">
                            <div class="master">
                                <h2>Bạn cảm thấy sản phẩm này như thế nào?</h2>
                                <div class="rating-component">
                                    <div class="status-msg">
                                        <label>
                                            <input class="rating_msg" type="hidden" name="rating_msg" value=""/>
                                        </label>
                                    </div>
                                    <div class="stars-box">
                                        <i class="star fa fa-star" title="1 star" data-message="Rất tệ"
                                           data-value="1"></i>
                                        <i class="star fa fa-star" title="2 stars" data-message="Tệ"
                                           data-value="2"></i>
                                        <i class="star fa fa-star" title="3 stars" data-message="Trung bình"
                                           data-value="3"></i>
                                        <i class="star fa fa-star" title="4 stars" data-message="Tốt"
                                           data-value="4"></i>
                                        <i class="star fa fa-star" title="5 stars" data-message="Rất tốt"
                                           data-value="5"></i>
                                    </div>
                                    <div class="starrate">
                                        <label>
                                            <input class="ratevalue" type="hidden" name="rate_value" value=""/>
                                        </label>
                                    </div>
                                </div>

                                <div class="feedback-tags">
                                    <div class="tags-container" data-tag-set="1">
                                        <div class="question-tag">
                                            Tại sao bạn lại có trải nghiệm tệ?
                                        </div>
                                    </div>
                                    <div class="tags-container" data-tag-set="2">
                                        <div class="question-tag">
                                            Tại sao bạn lại có trải nghiệm tệ?
                                        </div>

                                    </div>

                                    <div class="tags-container" data-tag-set="3">
                                        <div class="question-tag">
                                            Tại sao bạn lại có trải nghiệm ở mức trung bình?
                                        </div>
                                    </div>
                                    <div class="tags-container" data-tag-set="4">
                                        <div class="question-tag">
                                            Tại sao bạn lại đánh giá sản phẩm tốt?
                                        </div>
                                    </div>

                                    <div class="tags-container" data-tag-set="5">
                                        <div class="make-compliment">
                                            <div class="compliment-container">
                                                Để lại bình luận chi tiết
                                                <i class="far fa-smile-wink"></i>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tags-box">
                                        <input type="text" class="tag form-control" name="comment"
                                               id="inlineFormInputName" placeholder="Nhập bình luận của bạn...">
                                        <input type="hidden" name="product_id" value="<%=product.getId()%>"/>
                                    </div>

                                </div>

                                <div class="button-box">
                                    <input type="submit" class="done btn btn-warning" disabled="disabled"
                                           value="Bình luận"/>
                                </div>

                                <div class="submited-box">
                                    <div class="loader"></div>
                                    <div class="success-message">
                                        Cảm ơn bạn!
                                    </div>
                                </div>
                            </div>
                        </form>


                        <%
                            for (RateReviewModel rate : listRate) {%>
                        <div class="product-list-comment">
                            <div class="info-user">
                                <img width="50px" height="50px" src="images/user/<%=rate.getUser().getAvatar()%>">
                                <p><%=rate.getUser().getName()%>
                                </p>
                                <div class="rated"><%=rate.getRate()%>
                                </div>
                                <div class="content-comment"><%=rate.getCommentModel().getContent()%>
                                </div>
                                <div class="create-at"><%=rate.getCommentModel().getCreateAt()%>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>

                    <div class="list-productRelated clearfix">
                        <div class="heading-title text-center">
                            <h2>Sản phẩm khác</h2>
                        </div>
                        <div class="container">
                            <%--                            Sản phâm--%>
                            <div class="row">
                                <%
                                    for (ProductModel p : pro
                                    ) {%>
                                <div class="col-md-3 col-sm-6 col-xs-6 col-6">
                                    <div class="block-banner-category">
                                        <div class="product-img fade-box">
                                            <a href="detail-product?id-product=<%=p.getId()%>">
                                                <img src="images/product/<%=!p.getListImage().isEmpty()?p.getListImage().get(0).getUrl():""%>"
                                                     alt=""
                                                     class="lazyloaded">
                                            </a>

                                        </div>
                                        <div class="product-detail clearfix">
                                            <div class="pro-text">
                                                <a style=" color: black;
                                                  font-size: 14px;text-decoration: none;"
                                                   href="detail-product?id-product=<%=p.getId()%>?id-product=<%=p.getId()%>"
                                                   title="" inspiration pack>
                                                </a>
                                            </div>
                                            <div class="pro-price">
                                                <p class=""><%=p.getPrice()%>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <!-- show zoom detail product -->
    <!-- zoom -->
    <div class="product-zoom11">
        <div class="product-zom">
            <div class="divclose">
                <i class="fa fa-times-circle"></i>
            </div>
            <div class="owl-carousel owl-theme owl-product1">
                <%
                    for (int image = 0; image < product.getListImage().size(); image++) {
                %>
                <div class="item"><img
                        src="images/product/<%=!product.getListImage().isEmpty()?product.getListImage().get(image).getUrl():""%>"
                        alt="">
                </div>
                <%
                    }%>


            </div>
        </div>
    </div>

    <!-- Modal address API -->
    <div class="modal fade" id="modalGetAddress" tabindex="-1" role="dialog" aria-labelledby="modalGetAddressTitle"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalGetAddressTitle">Địa chỉ giao hàng</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <p>Tỉnh/Thành phố</p>
                        <select class="select-province form-select" aria-label="Default select example">
                            <option selected>Vui lòng chọn Tỉnh/Thành phố</option>
                        </select>
                    </div>
                    <div class="row">
                        <p>Quận/Huyện</p>
                        <select class="select-district form-select" aria-label="Default select example">
                            <option selected>Vui lòng chọn Quận/Huyện</option>
                        </select>
                    </div>
                    <div class="row">
                        <p>Phường/Xã</p>
                        <select class="select-ward form-select" aria-label="Default select example">
                            <option selected>Vui lòng chọn Phường/Xã</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-primary getAPIAddress">Giao đến địa chỉ này</button>
                </div>
            </div>
        </div>
    </div>

</main>

<%@include file="../../common/web/footer.jsp" %>

<script src="js/divzoom.js"></script>
<script src="js/rate&review.js"></script>
<script>

    var logisticIDToken = "";

    async function autoLoginLogisticAPI() {
        $.ajax({
            url: "<%=APIConstants.LOGISTIC_HOST_API%>/auth/login",
            type: "POST",
            dataType: "json",
            data: {
                'email': '<%=APIConstants.LOGISTIC_EMAIL_LOGIN%>',
                'password': '<%=APIConstants.LOGISTIC_PASSWORD_LOGIN%>'
            },
            success: function (data) {
                // Xử lý dữ liệu trả về ở đây
                logisticIDToken = data.access_token
                // return data.access_token
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus, errorThrown);
            }
        });
    }

    $(document).ready(function () {
        $(".getAPIAddress").click(async function () {
            await autoLoginLogisticAPI()
            console.log(logisticIDToken)
            let tagSelectModalGetProvince = document.querySelector('.select-province')
            $.ajax({
                url: "<%=APIConstants.LOGISTIC_HOST_API%>/province",
                type: "GET",
                dataType: "json",
                headers: {
                    'Authorization': 'Bearer ' + logisticIDToken
                },
                success: function (data) {
                    // Xử lý dữ liệu trả về ở đây
                    console.log(data.original.data);

                    for (let i = 0; i < data.original.data.length; i++) {
                        let option = document.createElement("option");
                        option.value = `${data.original.data[i].ProvinceID}`;
                        option.text = `${data.original.data[i].ProvinceName}`;
                        tagSelectModalGetProvince.appendChild(option);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus, errorThrown);
                }
            });
        });

        $(".getAPIAddress").click(async function () {
            await autoLoginLogisticAPI()
            console.log(logisticIDToken)
            let tagSelectModalGetDistrict = document.querySelector('.select-district')
            $.ajax({
                url: "<%=APIConstants.LOGISTIC_HOST_API%>/district",
                type: "GET",
                dataType: "json",
                headers: {
                    'Authorization': 'Bearer ' + logisticIDToken
                }, data: {
                    provinceID: 269
                },
                success: function (data) {
                    // Xử lý dữ liệu trả về ở đây
                    console.log(data);

                    for (let i = 0; i < data.original.data.length; i++) {
                        let option = document.createElement("option");
                        option.value = `${data.original.data[i].DistrictID}`;
                        option.text = `${data.original.data[i].DistrictName}`;
                        tagSelectModalGetDistrict.appendChild(option);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus, errorThrown);
                }
            });
        });

        $(".getAPIAddress").click(async function () {
            await autoLoginLogisticAPI()
            console.log(logisticIDToken)
            let tagSelectModalGetWard = document.querySelector('.select-ward')
            $.ajax({
                url: "<%=APIConstants.LOGISTIC_HOST_API%>/ward",
                type: "GET",
                dataType: "json",
                headers: {
                    'Authorization': 'Bearer ' + logisticIDToken
                }, data: {
                    districtID: 2264
                },
                success: function (data) {
                    // Xử lý dữ liệu trả về ở đây
                    console.log(data);

                    for (let i = 0; i < data.original.data.length; i++) {
                        let option = document.createElement("option");
                        option.value = `${data.original.data[i].WardID}`;
                        option.text = `${data.original.data[i].WardName}`;
                        tagSelectModalGetWard.appendChild(option);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus, errorThrown);
                }
            });
        });
    });


</script>

</body>
</html>