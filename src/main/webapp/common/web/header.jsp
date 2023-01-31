        <%@ page import="vn.edu.hcmuaf.fit.model.CategoryModel" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.User" %>
<%--
  Created by IntelliJ IDEA.
  User: vutru
  Date: 12/8/2022
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: vutru
  Date: 12/8/2022
  Time: 1:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="../../common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>

</head>

<body>
<% User user = (User) session.getAttribute("userlogin"); %>
<%ServletContext servletContext =  request.getServletContext();%>
<%List<CategoryModel> listBrand = (List<CategoryModel>) servletContext.getAttribute("listBrand");%>

<div class="header">
    <a style="color: #ffffff;text-decoration: none;" href="home">Hotline: 1800 2057 (Miễn phí) Thời gian làm việc
        T2 - CN: 8h - 20h</a>

</div>

<!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">

    <div class="container">
        <a>
            <img src="images/logo/logo_PhoneCare.png" class="logo-top" alt="">
        </a>
        <a class="navbar-brand" href="home">

            <img src="images/logo/phoneCare.png" class="logoWord-top" alt="">
        </a>
        <div class="desk-menu collapse navbar-collapse justify-content-md-center" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item ">
                    <a class="nav-link" href="home">TRANG CHỦ</a>
                </li>

                <li class="nav-item lisanpham active">
                    <a class="nav-link" href="list-product">Điện thoại
                        <i class="fa fa-chevron-down" aria-hidden="true"></i>
                    </a>
                    <ul class="sub_menu active">
<%--                        <%--%>
<%--                            for (CategoryModel brand : listBrand) {--%>
<%--                        %>--%>
<%--                        <li class="nav-item ">--%>
<%--                            <a href="category?brand=<%=brand.getName().toLowerCase()%>"--%>
<%--                               title="Sửa điện thoại <%=brand.getName()%>">--%>
<%--                                Sửa điện thoại <%=brand.getName()%>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <% }%>--%>

                    </ul>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="bookingOnline">Đặt Lịch Sửa Chữa
                        <i class="fa fa-chevron-down" aria-hidden="true"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="introduce">GIỚI THIỆU</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="list-blog">BLOG</a>
                </li>
                <li class="">
                    <a class="nav-link" href="contact">LIÊN HỆ</a>
                </li>
            </ul>
        </div>
        <div id="offcanvas-flip1" uk-offcanvas="flip: true; overlay: true">
            <div class="uk-offcanvas-bar" style="background: white;
        width: 100%;">

                <button class="uk-offcanvas-close" style="color:#272727" type="button" uk-close></button>
                <h3 style="font-size: 14px;
          color: #272727;
          text-transform: uppercase;
          margin: 3px 0 30px 0;
          font-weight: 500; letter-spacing: 2px;">MENU</h3>
                <div class="justify-content-md-center">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="home">TRANG CHỦ</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle aaaa" href="list-product" id="navbarDropdown"
                               role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <p>Điện thoại</p>
                                <i class="fa fa-angle-double-right"></i>

                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="border:0;">
<%--                                <%--%>
<%--                                    for (CategoryModel brand : listBrand) {--%>
<%--                                %>--%>
<%--                                <a class="dropdown-item" href="list-product?brand=<%=brand.getName().toLowerCase()%>"--%>
<%--                                   title="">Sửa điện thoại list-product?brand=<%=brand.getName()%>--%>
<%--                                </a>--%>
<%--                                <% }%>--%>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle aaaa" href="list-product" id="navbarDropdown2"
                               role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <p>Dịch vụ</p>
                                <i class="fa fa-angle-double-right"></i>

                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown2" style="border:0;">
                                <a class="dropdown-item" href="list-product" title="">Thay pin</a>
                                <a class="dropdown-item" href="list-product" title="">Thay màn hình</a>
                                <a class="dropdown-item" href="list-product" title="">Thay camera</a>
                                <a class="dropdown-item" href="list-product" title="">Thay vỏ</a>
                                <a class="dropdown-item" href="list-product" title="">Thay loa</a>


                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="introduce">GIỚI THIỆU</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="list-blog">BLOG</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact">LIÊN HỆ</a>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
        <div id="offcanvas-flip" uk-offcanvas="flip: true; overlay: true">
            <div class="uk-offcanvas-bar" style="    background: white;
            width: 350px;">

                <button class="uk-offcanvas-close" style="color:#272727" type="button" uk-close></button>

                <h3 style="font-size: 14px;
                color: #272727;
                text-transform: uppercase;
                margin: 3px 0 30px 0;
                font-weight: 500; letter-spacing: 2px;">Tìm kiếm</h3>
                <div class="search-box wpo-wrapper-search">
                    <form action="search" class="searchform searchform-categoris ultimate-search" method="post">
                        <div class="wpo-search-inner" style="display:inline">
                            <input type="hidden" name="type" value="product">
                            <input required="" id="inputSearchAuto" name="q" maxlength="40" autocomplete="off"
                                   class="searchinput input-search search-input" type="text" size="20"
                                   placeholder="Tìm kiếm sản phẩm...">
                        </div>
                        <button type="submit" class="btn-search btn" id="search-header-btn">
                            <i style="font-weight:bold" class="fas fa-search"></i>
                        </button>
                        <div class="search-item">
                            <div class="search-item-left">
                                <div class="item-name">Thay màn hình Iphone X</div>
                                <div class="item-price">1,690,000₫</div>
                            </div>
                            <div class="search-item-right">
                                <div class="img">
                                    <img src="images/product/thay-man-hinh-iphone-x-fc.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="search-item">
                            <div class="search-item-left">
                                <div class="item-name">Thay màn hình Iphone X</div>
                                <div class="item-price">1,690,000₫</div>
                            </div>
                            <div class="search-item-right">
                                <div class="img">
                                    <img src="images/product/thay-man-hinh-iphone-x-fc.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="search-item">
                            <div class="search-item-left">
                                <div class="item-name">Thay màn hình Iphone X</div>
                                <div class="item-price">1,690,000₫</div>
                            </div>
                            <div class="search-item-right">
                                <div class="img">
                                    <img src="images/product/thay-man-hinh-iphone-x-fc.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </form>
                    <div id="ajaxSearchResults" class="smart-search-wrapper ajaxSearchResults" style="display: none">
                        <div class="resultsContent"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- cart -->

        <div class="product_list_header">
            <form action="#" method="post" class="last">
                <input type="hidden" name="cmd" value="_cart">
                <input type="hidden" name="display" value="1">
                <button class="w3view-cart btn" type="submit" name="submit" value="" onclick="addBtnCart()">
                    <div class="icon-ol"><i class="icon-header fas fa-shopping-cart" aria-hidden="true"></i></div>
                </button>
            </form>
        </div>

<%--        <div class="user mr-4"></div>--%>

        <div id="offcanvas-flip3" uk-offcanvas="flip: true; overlay: true">
            <div class="uk-offcanvas-bar" style="    background: white;
            width: 350px;">

                <button class="uk-offcanvas-close" style="color:#272727" type="button" uk-close></button>

                <h3 style="font-size: 14px;
                color: #272727;
                text-transform: uppercase;
                margin: 3px 0 30px 0;
                font-weight: 500; letter-spacing: 2px;">Lịch Đã Đặt</h3>
                <div class="site-nav-container-last" style="color:#272727">
                    <div class="cart-view clearfix">
                        <table id="cart-view2">
                            <tbody>
                            <tr class="item_1">
                                <td class="img"><a href="home" title=""><img
                                        src="images/product/thay-man-hinh-iphone-x-fc.jpg"
                                        alt=""></a></td>
                                <td>
                                    <a class="pro-title-view" style="color: #272727" href="home"
                                       title=" &quot;Grape&quot;">Thay
                                        Màn Hình
                                        Iphone X</a>
                                    <span class="variant">Zin</span>
                                    <span class="pro-quantity-view">1</span>
                                    <span class="pro-price-view">1,690,000₫</span>
                                    <span class="remove_link remove-cart"><a href="home"><i style="color: #272727;"
                                                                                            class="fas fa-times"></i></a></span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <span class="line"></span>
                        <table class="table-total">
                            <tbody>
                            <tr>
                                <td class="text-left">Cửa hàng</td>
                                <td class="text-right">P. Bình An, Quận 2</td>
                            </tr>
                            <tr>
                                <td class="text-left">Ngày hẹn</td>
                                <td class="text-right">22/12/2022</td>
                            </tr>
                            <tr>
                                <td class="text-left">Tình trạng</td>
                                <td class="text-right">Chưa thanh toán</td>
                            </tr>
                            <tr>
                                <td class="distance-td"><a href="cart" class="linktocart button dark">Xem giỏ
                                    hàng</a></td>
                                <td><a href="checkout" class="linktocheckout button dark">Thanh toán</a></td>
                            </tr>
                            </tbody>
                        </table>
                        <a href="booked" class="button btn-check" style="text-decoration:none;">Xem lịch đã đặt</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="icon-ol">

            <a class="" uk-toggle="target: #offcanvas-flip">
                <i class="icon-header fas fa-search"></i>
            </a>

            <button class="navbar-toggler" type="button" uk-toggle="target: #offcanvas-flip1" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <%if (user == null) { %>
            <a href="signin" >
                <i class="icon-header fas fa-user"></i>
            </a>
            <%}%>
        </div>
        <%if (user != null) { %>
        <div class=" mr-4">
            <ul class="navbar-nav mx-2">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle aaaa" href="product.html" id="navbarDropdownUser"
                       role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <p><%
                            if (user != null) {
                                out.print(user.getName());
                            }
                        %>
                            <i class="fa fa-angle-down"></i>
                            <%-- <img src=${user.avatar} alt="" width=50/>--%>
                        </p>
                    </a>

                    <div class="dropdown-menu" aria-labelledby="navbarDropdownUser" style="border:0;">
                        <a class="dropdown-item" href="profile" title="">Thông tin</a>
                        <a class="dropdown-item" href="booked.html" uk-toggle="target: #offcanvas-flip3" title="">Lịch
                            sử đặt hẹn</a>
                        <a class="dropdown-item" href="login?action=logout" methods="post" title="" >Đăng xuất</a>
                    </div>
                </li>
            </ul>
        </div>
        <%}%>
    </div>
    </div>

</nav>
</body>

</html>


