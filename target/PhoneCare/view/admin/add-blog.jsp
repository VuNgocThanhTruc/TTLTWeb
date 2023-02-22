<%@ page import="vn.edu.hcmuaf.fit.model.BlogModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Thêm tin tức | ADMIN</title>
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
<style>
    .Choicefile {
        display: block;
        background: #14142B;
        border: 1px solid #fff;
        color: #fff;
        width: 150px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
        padding: 5px 0px;
        border-radius: 5px;
        font-weight: 500;
        align-items: center;
        justify-content: center;
    }

    .Choicefile:hover {
        text-decoration: none;
        color: white;
    }

    #uploadfile,
    .removeimg {
        display: none;
    }

    #thumbbox {
        position: relative;
        width: 100%;
        margin-bottom: 20px;
    }

    .removeimg {
        height: 25px;
        position: absolute;
        background-repeat: no-repeat;
        top: 5px;
        left: 5px;
        background-size: 25px;
        width: 25px;
        /* border: 3px solid red; */
        border-radius: 50%;

    }

    .removeimg::before {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        content: '';
        border: 1px solid red;
        background: red;
        text-align: center;
        display: block;
        margin-top: 11px;
        transform: rotate(45deg);
    }

    .removeimg::after {
        /* color: #FFF; */
        /* background-color: #DC403B; */
        content: '';
        background: red;
        border: 1px solid red;
        text-align: center;
        display: block;
        transform: rotate(-45deg);
        margin-top: -2px;
    }
</style>
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<%
    String pageContextPath = (String) request.getContextPath();
%>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="manage-blog.jsp">Quản lý tin tức</a></li>
            <li class="breadcrumb-item">Thêm tin tức</li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Thêm mới tin tức</h3>
                <div class="tile-body">
                    <form class="row" action="<%=pageContextPath%>/admin/manage-blog?action=add"
                          method="post" enctype="multipart/form-data">
                        <input type="hidden" class="form-control" placeholder="" name="id-blog"
                               value="">
                        <div class="form-group col-md-3">
                            <label class="control-label">Tiêu đề tin</label>
                            <input class="form-control" type="text" placeholder=""
                                   name="title" value="">
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Ảnh tin tức</label>
                            <div id="myfileupload">
                                <input type="file" id="uploadfile" name="ImageUpload" onchange="readURL(this)"
                                       value=""/>
                            </div>

                            <div id="thumbbox">
                                <img height="450" width="400" alt="Thumb image" id="thumbimage" />
                                <a class="removeimg" href="javascript:"></a>
                            </div>
                            <div id="boxchoice">
                                <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i>
                                    Chọn ảnh</a>
                                <p style="clear:both"></p>
                            </div>
                        </div>

                        <div class="form-group col-md-6">
                            <label class="control-label">Nội dung tóm tắt</label>
                            <textarea  id="input" class="form-control" rows="3"
                                       required="required"
                                       name="brief"></textarea>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Nội dung chi tiết</label>
                            <textarea  id="detail" class="form-control" rows="3"
                                       required="required"
                                       name="detail"></textarea>
                            <script>CKEDITOR.replace('detail');</script>

                        </div>
                        <input class="btn btn-save" type="submit" value="Lưu lại" onclick="save()"></input>
                        <a class="btn btn-cancel" href="manage-blog">Hủy bỏ</a>
                    </form>
                </div>

            </div>
        </div>
    </div>
</main>
<%@include file="../../common/admin/script.jsp" %>
<script src="../../admin/doc/js/plugins/pace.min.js"></script>
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