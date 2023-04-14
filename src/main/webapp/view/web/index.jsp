<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.ProductModel" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.ProductDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.service.BlogService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.BlogModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../common/web/head.jsp" %>
    <title>Phone Care</title>
</head>
<body>
<% List<ProductModel> newList = (List<ProductModel>) ProductDAO.newProduct();%>
<% List<ImageModel> imageSlide = (List<ImageModel>) ImageDAO.loadImageSlide();%>

<!--Navbar-->
<%@include file="../../common/web/header.jsp" %>

<!-- Owl-Carousel-->
<div class="owl-carousel owl-theme owl-carousel-setting">
    <%
        for (ImageModel listImage : imageSlide) {
    %>
    <div class="item">
        <img src="images/banner/<%=listImage.getPhoto()%>"
             class="d-block w-100" alt="..."><img/>

    </div>
    <% }%>
</div>

<div class="content">
    <div class="container">
        <div class="hot_sp" style="padding-bottom: 10px;">
            <h2 style="text-align:center;padding-top: 10px">
                <a style="font-size: 28px;color: black;text-decoration: none" href="list-product">Sản phẩm bán chạy</a>
            </h2>
            <div class="view-all" style="text-align:center;padding-top: -10px;">
                <a style="color: black;text-decoration: none" href="list-product">Xem thêm</a>
            </div>
        </div>
    </div>
    <!--Product-->
    <div class="container" style="padding-bottom: 50px;">
        <div class="row">
            <%--            Sản pẩm bán chạy--%>
            <%
                List<ProductModel> newListSeller = (List<ProductModel>) ProductService.getSellerProduct();
                for (ProductModel product :
                        newListSeller) {%>
            <div class="col-md-3 col-sm-6 col-xs-6 col-6">
                <div class="block-banner-category">
                    <div class="product-img fade-box">
                        <a href="detail-product?id-product=<%=product.getId()%>" title="" class="img-resize">
                            <img src="images/product/<%=!product.getListImage().isEmpty()?product.getListImage().get(0).getUrl():""%>" alt="" class="lazyloaded">
                        </a>

                    </div>
                    <div class="product-detail clearfix">
                        <div class="pro-text">
                            <a style=" color: black;
                                                  font-size: 14px;text-decoration: none;"
                               href="detail-product?id-product=<%=product.getId()%>"
                               title="" inspiration
                               pack>
                                <%=product.getName()%>
                                <XS></XS>
                            </a>
                        </div>
                        <div class="pro-price">
                            <p class=""><%=product.getPrice()%>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }%>
        </div>

    </div>


</div>
<section class="section wrapper-home-banner">
    <div class="container-fluid" style="padding-bottom: 50px;">
        <div class="row">
            <div class="col-xs-12 col-sm-4 home-banner-pd">
                <div class="block-banner-category">
                    <a href="home" class="link-banner wrap-flex-align flex-column">
                        <div class="fg-image fade-box">
                            <img class="lazyloaded" src="images/logo/phonecare2.png" alt="">
                        </div>
                        <figcaption class="caption_banner site-animation">
                            <h2>Giới thiệu</h2>
                            `
                        </figcaption>
                    </a>
                </div>
            </div>
            <div class="col-xs-12 col-sm-4 home-banner-pd">
                <div class="block-banner-category">
                    <a href="list-blog" class="link-banner wrap-flex-align flex-column">
                        <div class="fg-image fade-box">
                            <img class="lazyloaded" src="images/blog/blog1.jpg" alt="">
                        </div>
                        <figcaption class="caption_banner site-animation">
                            <h2>Blog</h2>

                        </figcaption>
                    </a>
                </div>
            </div>
            <div class="col-xs-12 col-sm-4 home-banner-pd">
                <div class="block-banner-category">
                    <a href="contact" class="link-banner wrap-flex-align flex-column">
                        <div class="fg-image">
                            <img class="lazyloaded" src="images/blog/lienhe.png" alt="">
                        </div>
                        <figcaption class="caption_banner site-animation">
                            <h2>Liên hệ</h2>
                        </figcaption>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<section>
    <div class="content">
        <div class="container">
            <div class="hot_sp">
                <h2 style="text-align:center;">
                    <a style="font-size: 28px;color: black;text-decoration: none" href="list-product">Sản phẩm
                        mới</a>
                </h2>
                <div class="view-all" style="text-align:center;">
                    <a style="color: black;text-decoration: none" href="list-product">Xem thêm</a>
                </div>
            </div>
        </div>
    </div>

    <div class="container product" style="width: 100%;margin: auto;">
        <div class="owl-carousel owl-theme owl-product-setting">
            <%
                for (ProductModel product :
                        newList) {%>
            <div class="item">
                <div class="">
                    <div class="block-banner-category">
                        <div class="product-img fade-box">
                            <a href="detail-product?id-product=<%=product.getId()%>?id-product=<%=product.getId()%>"
                               title="" class="img-resize">
                                <img src="images/product/<%=!product.getListImage().isEmpty()?product.getListImage().get(0).getUrl():""%>" alt="" class="lazyloaded">
                            </a>

                        </div>
                        <div class="product-detail clearfix">
                            <div class="pro-text">
                                <a style=" color: #000000;
                                                                  font-size: 14px;text-decoration: none;"
                                   href="detail-product?id-product=<%=product.getId()%>?id-product=<%=product.getId()%>"
                                   title="" inspiration
                                   pack>
                                    <%=product.getName()%>
                                </a>
                            </div>
                            <div class="pro-price">
                                <p class="">Liên Hệ</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }%>
        </div>
    </div>
</section>
<section class="">
    <div class="content">
        <div class="container">
            <div class="hot_sp">
                <h2 style="text-align:center;padding-top: 10px">
                    <a style="font-size: 28px;color: black;text-decoration: none" href="list-blog">Bài viết mới
                        nhất</a>
                </h2>
                <br/>
            </div>
        </div>
    </div>
    <!--Blog-->
    <div>
        <div class="container" style="width: 100%;margin: auto;">
            <div class="owl-carousel owl-theme owl-product-setting">
                <%
                    BlogService blogService = new BlogService();
                    List<BlogModel> newListBlog = (List<BlogModel>) blogService.getNewBlog();
                    for (BlogModel blog : newListBlog) {
                %>
                <div class="col-md-4">
                    <div class="post_item">
                        <div class="post_featured">
                            <a href="detail-blog?id-blog=<%=blog.getId()%>" title="">
                                <img class="img-resize" style="padding-bottom:15px;"
                                     src="images/blog/<%=blog.getAvatar()%>" alt="" >
                            </a>
                        </div>
                        <div class="pro-text">
                  <span class="post_info_item">

                    <%=blog.getCreatedDate()%>

                  </span>
                        </div>
                        <div class="pro-text">
                            <h3 class="post_title">
                                <a style=" color: black;
                                  font-size: 18px;text-decoration: none;" href="detail-blog?id-blog=<%=blog.getId()%>"
                                   inspiration pack>
                                    <%=blog.getTitle()%>
                                </a>
                            </h3>
                        </div>
                        <div style="text-align:center; padding-bottom: 30px;">
                            <span><%=blog.getBriefContent()%></span>
                        </div>
                    </div>
                </div>
                <%
                    }%>
            </div>
        </div>
    </div>
    </div>
</section>

<section class="section wrapper-home-newsletter">
    <div class="container-fluid">
        <div class="content-newsletter">
            <h2>Đăng ký</h2>
            <p>Đăng ký nhận bản tin của Phone Care để cập nhật những sản phẩm mới, nhận thông tin ưu đãi đặc biệt và
                thông
                tin
                giảm giá khác.</p>
            <div class="form-newsletter">
                <form action="" accept-charset="UTF-8" class="">
                    <div class="form-group">
                        <input type="hidden" id="contact_tags">
                        <input required="" type="email" value="" placeholder="Nhập email của bạn"
                               aria-label="Email Address"
                               class="">
                        <button type="submit" class=""><span>Gửi</span></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
</div>

<div class="registratior_custom">
    <form action="">
        <div class="content">
            <div class="x-close">
                <i class="fa fa-times"></i>
            </div>
            <h3>Nhận các ưu đãi cùng Phone Care</h3>
            <p>Chúng tôi sẽ cập nhật các chương trình khuyến mãi mới đến bạn</p>
            <ul>
                <li>
                    <span>Giảm giá sản phẩm</span>
                </li>
                <li>
                    <span>Sản phẩm mới</span>
                </li>
                <li>
                    <span>Sản phẩm bán chạy</span>
                </li>
            </ul>
            <div class="form-newsletter">
                <form action="" accept-charset="UTF-8" class="">
                    <div class="form-group">
                        <input type="hidden" id="contact_tags2">
                        <input required="" type="email" value="" placeholder="Nhập email của bạn"
                               aria-label="Email Address"
                               class="">
                        <button type="submit" class=""><p>Đăng ký</p></button>
                    </div>
                </form>
            </div>
        </div>
    </form>
</div>

<!--gallery-->
<%@include file="../../common/web/footer.jsp" %>

</body>

</html>
