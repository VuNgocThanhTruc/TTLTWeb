<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.CategoryModel" %>
<%@ page import="vn.edu.hcmuaf.fit.model.ProductModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="../../common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Thêm sản phẩm | ADMIN</title>
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <!-- or -->
    <%@include file="../../common/admin/head.jsp" %>

    <link rel="stylesheet" href="css/manage-product.css">
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
    <script>

        function readURL(input, thumbimage) {
            if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#thumbimage").attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            } else { // Sử dụng cho IE
                $("#thumbimage").attr('src', input.value);

            }
            $("#thumbimage").show();
            $('.filename').text($("#uploadfile").val());
            $('.Choicefile').css('background', '#14142B');
            $('.Choicefile').css('cursor', 'default');
            $(".removeimg").show();
            $(".Choicefile").unbind('click');

        }

        $(document).ready(function () {
            $(".Choicefile").bind('click', function () {
                $("#uploadfile").click();

            });
            $(".removeimg").click(function () {
                $("#thumbimage").attr('src', '').hide();
                $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
                $(".removeimg").hide();
                $(".Choicefile").bind('click', function () {
                    $("#uploadfile").click();
                });
                $('.Choicefile').css('background', '#14142B');
                $('.Choicefile').css('cursor', 'pointer');
                $(".filename").text("");
            });
        })
    </script>
</head>

<body class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<%
    List<CategoryModel> categoryBrand = (List<CategoryModel>) request.getAttribute("categoryBrand");
    List<CategoryModel> categoryTypeProduct = (List<CategoryModel>) request.getAttribute("categoryTypeProduct");
    List<CategoryModel> listStatus = (List<CategoryModel>) request.getAttribute("listStatus");

    ProductModel product = (ProductModel) request.getAttribute("product");
    String pageContextPath = (String) request.getContextPath();
%>

<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>

<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="admin/manage-product">Quản lý sản phẩm</a></li>
            <li class="breadcrumb-item">Thêm sản phẩm</li>
        </ul>
    </div>
    <div class="row" id="change_product">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Tạo mới sản phẩm</h3>
                <div class="tile-body">
                    <form action="<%=pageContextPath%>/admin/manage-product?type=add" method="post">
                        <%--                        <div class="row element-button">--%>
                        <%--                            <div class="col-sm-2">--%>
                        <%--                                <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#exampleModalCenter"><i--%>
                        <%--                                        class="fas fa-folder-plus"></i> Thêm thương hiệu</a>--%>
                        <%--                            </div>--%>
                        <%--                            <div class="col-sm-2">--%>
                        <%--                                <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#adddanhmuc"><i--%>
                        <%--                                        class="fas fa-folder-plus"></i> Thêm danh mục</a>--%>
                        <%--                            </div>--%>
                        <%--                            <div class="col-sm-2">--%>
                        <%--                                <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#addtinhtrang"><i--%>
                        <%--                                        class="fas fa-folder-plus"></i> Thêm tình trạng</a>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label">Mã sản phẩm </label>
                                <input class="form-control" type="number" placeholder="" name="idProduct"
                                       value="">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label">Tên sản phẩm</label>
                                <input class="form-control" type="text" name="name_product"
                                       value="">
                            </div>
                            <div class="form-group  col-md-3">
                                <label class="control-label">Số lượng</label>
                                <input class="form-control" type="number" name="quantity"
                                       value="">
                            </div>
                            <div class="form-group col-md-3 ">
                                <label for="statusProduct" class="control-label">Tình trạng</label>
                                <select class="form-control" id="statusProduct" name="statusProduct">
                                    <% for (CategoryModel status : listStatus) {%>
                                    <option value="<%=status.getId()%>"><%=status.getName()%>
                                    </option>
                                    <% }%>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="categoryTypeProduct" class="control-label">Danh mục</label>
                                <select class="form-control" id="categoryTypeProduct" name="categoryTypeProduct">
                                    <option>-- Chọn danh mục sản phẩm --</option>
                                    <%for (CategoryModel type : categoryTypeProduct) {%>
                                    <option value="<%=type.getId()%>"><%=type.getName()%>
                                    </option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="form-group col-md-3 ">
                                <label for="categoryBrand" class="control-label">Thương hiệu</label>
                                <select class="form-control" id="categoryBrand" name="categoryBrand">
                                    <option>-- Chọn thương hiệu --</option>
                                    <%
                                        for (CategoryModel brand : categoryBrand) {
                                    %>
                                    <option value="<%=brand.getId()%>"><%=brand.getName()%>
                                    </option>
                                    <%}%>

                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label">Giá bán</label>
                                <input class="form-control" type="text" name="price"
                                       value="">
                            </div>
                            <div class="form-group col-md-12">
                                <label class="control-label">Ảnh sản phẩm</label>
                                <div id="myfileupload">
                                    <input type="file" id="uploadfile" name="ImageUpload" onchange="readURL(this)"/>
                                </div>
                                <div id="thumbbox">
                                    <img height="450" width="400" alt="Thumb image" id="thumbimage"
                                         style="display: none"/>
                                    <a class="removeimg" href="javascript:"></a>
                                </div>
                                <div id="boxchoice">
                                    <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i>
                                        Chọn
                                        ảnh</a>
                                    <p style="clear:both"></p>
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="control-label">Mô tả sản phẩm</label>
                                <textarea class="form-control" name="description"
                                          id="description"></textarea>
                                <script>CKEDITOR.replace('description');</script>
                            </div>
                            <button class="btn btn-save" type="submit" onclick="save()">Lưu lại</button>
                            <button class="btn btn-cancel" data-dismiss="modal" type="reset">Hủy bỏ</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>


<!--
MODAL BRAND
-->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form method="post" class="row" action="${pageContext.request.contextPath}/admin/manage-product?type=edit">
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thêm mới thương hiệu</h5>
              </span>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Nhập thương hiệu mới</label>
                            <input class="form-control" type="text" required>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Danh mục thương hiệu hiện đang có</label>
                            <ul style="padding-left: 20px;">
                                <%
                                    for
                                    (
                                            CategoryModel
                                                    brand
                                            :
                                            categoryBrand
                                    ) {
                                %>
                                <li><%=brand
                                        .
                                        getId
                                                (
                                                )%>"><%=brand
                                        .
                                        getName
                                                (
                                                )%>
                                </li>
                                <%}%>
                            </ul>
                        </div>
                    </div>
                    <BR>
                    <button class="btn btn-save" type="button" onclick="save()">Lưu lại</button>
                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                    <BR>
                </div>
                <div class="modal-footer">
                </div>
            </form>
        </div>
    </div>
</div>
<!--
MODAL
-->

<!--
MODAL CATEGORY TYPE PRODUCT
-->
<div class="modal fade" id="adddanhmuc" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thêm mới danh mục </h5>
              </span>
                    </div>
                    <div class="form-group col-md-12">
                        <label class="control-label">Nhập tên danh mục mới</label>
                        <input class="form-control" type="text" required>
                    </div>
                    <div class="form-group col-md-12">
                        <label class="control-label">Danh mục sản phẩm hiện đang có</label>
                        <ul style="padding-left: 20px;">
                            <%
                                for
                                (
                                        CategoryModel
                                                type
                                        :
                                        categoryTypeProduct
                                ) {
                            %>
                            <li><%=type
                                    .
                                    getId
                                            (
                                            )%>.<%=type
                                    .
                                    getName
                                            (
                                            )%>
                            </li>
                            <%}%>
                        </ul>
                    </div>
                </div>
                <BR>
                <button class="btn btn-save" type="button" onclick="save()">Lưu lại</button>
                <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                <BR>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!--
MODAL
-->

<!--
MODAL TÌNH TRẠNG
-->
<div class="modal fade" id="addtinhtrang" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thêm mới tình trạng</h5>
              </span>
                    </div>
                    <div class="form-group col-md-12">
                        <label class="control-label">Nhập tình trạng mới</label>
                        <input class="form-control" type="text" required name="modal_status">
                    </div>
                    <div class="form-group col-md-12">
                        <label class="control-label">Danh mục tình trạng hiện đang có</label>
                        <ul style="padding-left: 20px;">
                            <%
                                for
                                (
                                        CategoryModel
                                                brand
                                        :
                                        categoryBrand
                                ) {
                            %>
                            <li><%=brand
                                    .
                                    getId
                                            (
                                            )%>"><%=brand
                                    .
                                    getName
                                            (
                                            )%>
                            </li>
                            <%}%>
                        </ul>
                    </div>
                </div>
                <BR>
                <button class="btn btn-save" type="button" onclick="save()">Lưu lại</button>
                <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                <BR>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!--
MODAL
-->
<%@include file="../../common/admin/script.jsp" %>

<script>
    const inpFile = document.getElementById("inpFile");
    const loadFile = document.getElementById("loadFile");
    const previewContainer = document.getElementById("imagePreview");
    const previewImage = previewContainer.querySelector(".image-preview__image");
    const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");
    inpFile.addEventListener("change", function () {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            previewDefaultText.style.display = "none";
            previewImage.style.display = "block";
            reader.addEventListener("load", function () {
                previewImage.setAttribute("src", this.result);
            });
            reader.readAsDataURL(file);
        }
    });

    function save() {
        swal("Đã lưu thành công.!", {});
    }

</script>
</body>

</html>