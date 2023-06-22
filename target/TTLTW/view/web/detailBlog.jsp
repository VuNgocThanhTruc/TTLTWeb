<%@ page import="vn.edu.hcmuaf.fit.model.BlogModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <% BlogModel blog = (BlogModel) request.getAttribute("detailBlog");%>

    <%@include file="../../common/web/head.jsp" %>
    <title><%=blog.getTitle()%> | Phone Care</title>
    <style>
        #heading{
            display: flex;
            justify-content: space-between;
            flex-grow: 1;
            align-items: center;
            border-bottom: 2px solid #FFD43B;
        }
        #new-blog img{
            max-width: 100px;
            max-height: 65px;
        }
    </style>
</head>

<body>

<!--Navbar-->
<%@include file="../../common/web/header.jsp" %>

<div class="breadcrumb-shop">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pd5">
                <ol class="breadcrumb breadcrumb-arrows">
                    <li>
                        <a href="home">
                            <span>Trang chủ</span>
                        </a>
                    </li>
                    <li>
                        <a href="list-blog"><span>Bài viết</span></a>
                    </li>
                    <li>
                        <span style="color: #F28102"><%=blog.getTitle()%></span>
                    </li>
                </ol>
            </div>
        </div>
    </div>
</div>
<!--List Prodct-->

<div class="container">

    <div class="row">
        <div class="col-md-3 d-none d-sm-block d-sm-none d-md-block">
            <div class="sidebar-blog">
                <div class="news-latest">
                    <div class="sidebarblog-title title_block">
                        <h2>Bài viết mới nhất</h2>
                    </div>
                    <div class="list-news-latest layered">
                        <%List<BlogModel> newListBlog = (List<BlogModel>) request.getAttribute("newBlog");%>

                        <%for (BlogModel newblog : newListBlog) {%>
                        <div class="item-article clearfix">
                            <div class="post-image">
                                <a id="new-blog" href="detail-blog?id-blog=<%=newblog.getId()%>">
                                        <%=newblog.getAvatar()%>
                            </div>
                            <div class="post-content">
                                <h3>
                                    <a href="detail-blog?id-blog=<%=newblog.getId()%>"><%=newblog.getTitle()%>
                                    </a>
                                </h3>
                                <span class="author"><%=newblog.getUserCreated()%></span>
                                <span class="date"><%=newblog.getCreatedDate()%> </span>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="menu-blog">
                    <div class="group-menu">
                        <div class="page_menu_title title_block">
                            <h2>Danh mục trang</h2>
                        </div>
                        <div class="layered layered-category">
                            <div class="layered-content">
                                <ul class="menuList-links">
                                    <li class=""><a href="index.html" title="Trang chủ"><span>Trang chủ</span></a></li>
                                    <li class="has-submenu level0 ">
                                        <a title="Điện thoại">Điện thoại<span class="icon-plus-submenu"
                                                                              data-toggle="collapse"
                                                                              href="#collapseExample" role="button"
                                                                              aria-expanded="false"
                                                                              aria-controls="collapseExample"></span></a>
                                        <div class="collapse" id="collapseExample">
                                            <div class="card card-body" style="border:0">
                                                <ul class="menu-product">
                                                    <li class="">
                                                        <a href="#" title="Sửa điện thoại Iphone">
                                                            Sửa điện thoại Iphone
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="#" title="Sửa điện thoại Samsung">
                                                            Sửa điện thoại Samsung
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="#" title="Sửa điện thoại Xiaomi">
                                                            Sửa điện thoại Xiaomi
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="#" title="Sửa điện thoại Oppo">
                                                            Sửa điện thoại Oppo
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="#" title="Sửa điện thoại Vivo">
                                                            Sửa điện thoại Vivo
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="#" title="Sửa điện thoại Huawei">
                                                            Sửa điện thoại Huawei
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="has-submenu level0 ">
                                        <a title="Dịch vụ">Dịch vụ<span class="icon-plus-submenu" data-toggle="collapse"
                                                                        href="#collapseExample3" role="button"
                                                                        aria-expanded="false"
                                                                        aria-controls="collapseExample"></span></a>
                                        <div class="collapse" id="collapseExample3">
                                            <div class="card card-body" style="border:0">
                                                <ul class="menu-product">
                                                    <li class="">
                                                        <a href="#" title="Thay pin">
                                                            Thay pin
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="#" title="Thay màn hình">
                                                            Thay màn hình
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="#" title="Thay camera">
                                                            Thay camera
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="#" title="Thay vỏ">
                                                            Thay vỏ
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="#" title="Thay loa">
                                                            Thay loa
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="active"><a href="introduce.jsp"
                                                          title="Giới thiệu"><span>Giới thiệu</span></a></li>
                                    <li class=""><a href="list-blog" title="Blog"><span>Blog</span></a></li>
                                    <li class=""><a href="contact.jsp" title="Liên hệ"><span>Liên hệ</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9 col-sm-12 col-xs-12 article-area">
            <div class="content-page">
                <div id="heading"class="tile-title">
                    <button style="background: none; color: #808990;" class="btn btn-cancel" onclick="goBack()"><i class="fas fa-angle-left"></i> Quay lại</button>
                    <ul class="article-info-more" style="padding-left: 0 ">
                        <li> Người viết:<%=blog.getUserCreated()%> lúc
                            <time pubdate="" datetime="<%=blog.getCreatedDate()%>"><%=blog.getCreatedDate()%>
                            </time>
                        </li>
                        <li><i class="far fa-file-alt"></i><a style="color:black;text-decoration: none;" href="#">
                            <%=blog.getTypeBlog()%>
                        </a></li>
                    </ul>
                </div>
                <div class="article-content" style="font-size: 18px">
                    <div class="box-article-heading clearfix">
                        <h1 class="sb-title-article"><%=blog.getTitle()%>
                        </h1>

                    </div>
                    <%=blog.getDetailContent()%>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../../common/web/footer.jsp" %>
<script>
    function goBack() {
        window.history.back();
    }
</script>
</body>

</html>
