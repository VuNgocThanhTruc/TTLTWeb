<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.BlogModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>

<!DOCTYPE html>

<html>

<head>
    <%@include file="../../common/web/head.jsp" %>

    <title>Blog | Phone Care </title>
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
                        <a href="index.html">
                            <span>Trang chủ</span>
                        </a>
                    </li>
                    <li>
                        <span><span style="color: #F28102">Bài viết</span></span>
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
                        <%List<BlogModel> newListBlog = (List<BlogModel>) request.getAttribute("newListBlog");%>

                        <%for (BlogModel blog : newListBlog) {%>
                        <div class="item-article clearfix">
                            <div class="post-image">
                                <a href="">
                                    <img src="images/blog/<%=blog.getAvatar()%>" alt="" width="100px;" class="avatar"></a>
                            </div>
                            <div class="post-content">
                                <h3>
                                    <a href="list-blog"><%=blog.getTitle()%>
                                    </a>
                                </h3>
                                <span class="author"><%=blog.getUserCreated()%></span>
                                <span class="date"><%=blog.getCreatedDate()%> </span>
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
        <div class="col-md-9 col-sm-12 col-xs-12">
            <div class="heading-page clearfix">
                <h1>Bài viết</h1>
            </div>
            <div class="blog-content">
                <div class="list-article-content blog-posts">
                    <!-- Begin: Nội dung blog -->
                    <%List<BlogModel> listBlog = (List<BlogModel>) request.getAttribute("listBlog");%>

                    <%for (BlogModel blog : listBlog) {%>
                    <article class="blog-loop">
                        <div class="blog-post row">
                            <div class="col-md-4 col-xs-12 col-sm-12">
                                <a href="detail-blog?id-blog=<%=blog.getId()%>" class="blog-post-thumbnail" title=""
                                   rel="nofollow">
                                    <img style="border: 1px;width: 100%" src="images/blog/<%=blog.getAvatar()%>"
                                         alt="" width="100px;" class="avatar">
                                </a>
                            </div>
                            <div class="col-md-8 col-xs-12 col-sm-12">
                                <h3 class="blog-post-title">
                                    <a href="detail-blog?id-blog=<%=blog.getId()%>" title=""><%=blog.getTitle()%>
                                    </a>
                                </h3>
                                <div class="blog-post-meta">
                                    <span class="author vcard">Người viết: <%=blog.getUserCreated()%></span>
                                    <span class="date">
                      <time pubdate="" datetime="2022-10-30"><%=blog.getCreatedDate()%></time>
                    </span>
                                </div>
                                <p class="entry-content"><%=blog.getBriefContent()%>
                                </p>
                            </div>
                        </div>
                    </article>
                    <%}%>
                </div>
                <div class="sortpagibar pagi clearfix text-center">
                    <div id="pagination" class="clearfix">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <span class="page-node current">1</span>
                            <a class="page-node" href="">2</a>
                            <a class="next" href="">
                                <svg version="1.1" xmlns="http://www.w3.org/2000/svg"
                                     x="0px" y="0px" viewBox="0 0 31 10"
                                     style="enable-background:new 0 0 31 10; width: 31px; height: 10px;"
                                     xml:space="preserve">
                    <polygon points="31,5 25,0 25,4 0,4 0,6 25,6 25,10 "></polygon>
                  </svg>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../../common/web/footer.jsp" %>

</body>

</html>