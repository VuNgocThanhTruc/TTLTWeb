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
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script src="js/common.js"></script>
    <link rel="stylesheet" href="css/manage-product.css">
    <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
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
    #header-blog::placeholder {
        color: #b3b3b1; /* Màu chữ của placeholder */
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
    .cke_inner.cke_reset{
        height: inherit;
    }
    .form-group{
        width: 100%;
    }

    #header-blog{
        display: inline-block;
        width: 100%;
        font-size: 2.0rem;
        font-weight: 500;
        font-family: system-ui,'Segoe UI',Roboto,Helvetica,Arial,sans-serif,'Apple Color Emoji','Segoe UI Emoji','Segoe UI Symbol';
        border: none;
        background: none;
    }
    .hidden-label {
        display: none;
    }
    #cke_1_top{
        border: none;
        background: #fff;
    }
    #cke_detail{
        height: 100vh;
        border: none;
    }
    #cke_1_bottom{
        display: none;
    }
    .cke_inner.cke_reset #cke_1_contents{
        height: inherit;
    }
    #heading{
        display: flex;
        justify-content: space-between;
        flex-grow: 1;
        flex-grow: 1;
    }
    #header-blog::placeholder {
        color: #b3b3b1; /* Màu chữ của placeholder */
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
                <div class="tile-body">
                    <form class="row" action="<%=pageContextPath%>/admin/manage-blog?action=add"
                          method="post" enctype="multipart/form-data">
                        <div id="heading"class="tile-title">
                            <a style="background: none; color: #808990;" class="btn btn-cancel" href="manage-blog"><i class="fas fa-angle-left"></i> Quay lại</a>
                            <input class="btn btn-save" type="submit" value="Xuất bản" onclick="return confirmNotify('Bạn chắc chắn muốn xuất bản?')">
                        </div>
                        <input type="hidden" class="form-control" placeholder="" name="id-blog"
                               value="">
                        <div class="form-group">
                            <input id="header-blog" class="form-control" type="text" placeholder="Tiêu đề"
                                   name="title" value="">
                        </div>

                        <div style="position: relative" class="form-group">
                            <label id="placehoder-content-blog"
                                   style="position: absolute; top: 60px; left: 20px; color: #b3b3b1"
                                   class="control-label">Nội dung viết ở đây</label>
                            <textarea  id="detail" class="form-control" rows="3"
                                       required="required"
                                       name="detail">
                            </textarea>
                            <script>
                                CKEDITOR.replace('detail', {
                                    extraPlugins:'filebrowser',
                                    filebrowserBrowseUrl: '/list',
                                    filebrowserUploadMethod: 'form',
                                    filebrowserUploadUrl: 'upload',
                                    filebrowserImageUploadUrl: 'upload',
                                    toolbar: [
                                        { name: 'document', items: ['Save'] },
                                        { name: 'clipboard', items: ['Cut', 'Copy', 'Paste'] },
                                        { name: 'editing', items: ['Bold', 'Italic', 'Underline', 'Strike', 'NumberedList', 'BulletedList', 'Blockquote'] },
                                        { name: 'insert', items: ['Table', 'Image', 'Link'] },
                                        { name: 'others', items: ['RemoveFormat'] },
                                        { name: 'undo', items: ['Undo', 'Redo'] }
                                    ],on: {
                                        instanceReady: function(evt) {
                                            var editor = evt.editor;
                                            var label = document.getElementById('placehoder-content-blog');
                                            const cke_1_contents = document.getElementById('cke_1_contents');
                                            cke_1_contents.style.height = 'inherit';
                                            if (editor.getData().trim() !== '') {
                                                label.classList.add('hidden-label');
                                            }
                                            editor.on('change', function() {
                                                if (editor.getData().trim() !== '') {
                                                    label.classList.add('hidden-label');
                                                } else {
                                                    label.classList.remove('hidden-label');
                                                }
                                            });
                                        }
                                    }
                                })
                            </script>
                        </div>
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


    function save() {
        swal("Đã lưu thành công.!", {});
    }

</script>
</body>

</html>