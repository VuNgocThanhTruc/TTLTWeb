<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="../../common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Thêm ảnh| ADMIN</title>
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

<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<%
  String pageContextPath = (String) request.getContextPath();
  //  DiscountModel discount = (DiscountModel) request.getAttribute("contain2");
  ImageModel image=(ImageModel) request.getAttribute("image");

%>
<main class="app-content">
  <div class="app-title">
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item"><a href="manage-image">Quản lý ảnh</a></li>
      <li class="breadcrumb-item">Thêm ảnh</li>
    </ul>
  </div>
  <div class="row" id="change_product">
    <div class="col-md-12">
      <div class="tile">
        <h3 class="tile-title">Sửa ảnh</h3>
        <div class="tile-body">
          <form action="manage-image?type=edit&id-image=<%=image.getId()%>" method="post" enctype="multipart/form-data">
            <div class="form-group col-md-3">
              <label class="control-label">Tên ảnh </label>
              <input class="form-control" type="text" placeholder="" name="namePhoto"
                     value="<%=image.getName_photo()%>">
            </div>

            <div class="form-group col-md-3 ">
              <label for="statusProduct" class="control-label">Loại</label>
              <select class="form-control" id="statusProduct" name="numType">

                <option value="<%=image.getType()%>" name="numType" selected><%
                  if (image.getType() == 1) {
                    out.print("Ảnh slide");
                  } else if (image.getType() == 2) {
                    out.print("Ảnh footer");
                  }
                %>
                </option>
                <option value="<% if (image.getType() == 1) {
                    out.print(2);
                  } else if (image.getType() == 2) {
                    out.print(1);
                  }%>" name="numType" ><%
                  if (image.getType() == 1) {
                    out.print("Ảnh footer");
                  } else if (image.getType() == 2) {
                    out.print("Ảnh slide");
                  }
                %>
                </option>
              </select>
            </div>
            <div class="form-group col-md-12">
              <label class="control-label">Ảnh sản phẩm</label>
              <div id="myfileupload">
                <input type="file" id="uploadfile" name="ImageUpload" onchange="readURL(this)" value="<%=image.getPhoto()%>"/>
                <input type="hidden" value="" name="id-image">
              </div>
              <div id="thumbbox">
                <img height="450" width="400" alt="Thumb image" id="thumbimage"
                     src="<% if(image.getType()==1){out.print("../images/banner/"+image.getPhoto());}else{out.print("../images/footer/"+image.getPhoto());}%>"/>
                <a class="removeimg" href="javascript:"></a>
              </div>
              <div id="boxchoice">
                <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i>
                  Chọn
                  ảnh</a>
                <p style="clear:both"></p>
              </div>
            </div>

            <input class="btn btn-save" type="submit" value="lưu lại"/>
            <a href="manage-image">
              <button class="btn btn-cancel" type="button">Hủy bỏ</button>
            </a>
          </form>


        </div>
      </div>
    </div>
  </div>
</main>


<%@include file="../../common/admin/script.jsp" %>

<script>
  // const inpFile = document.getElementById("inpFile");
  // const loadFile = document.getElementById("loadFile");
  // const previewContainer = document.getElementById("imagePreview");
  // const previewImage = previewContainer.querySelector(".image-preview__image");
  // const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");
  // inpFile.addEventListener("change", function () {
  //     const file = this.files[0];
  //     if (file) {
  //         const reader = new FileReader();
  //         previewDefaultText.style.display = "none";
  //         previewImage.style.display = "block";
  //         reader.addEventListener("load", function () {
  //             previewImage.setAttribute("src", this.result);
  //         });
  //         reader.readAsDataURL(file);
  //     }
  // });


  function save() {

    swal("Đã lưu thành công.!", {});

  }

  submitForms = function () {
    let text = ""
    for (let i = 1; i < 2; i++) {
      text += "form" + i;
      document.getElementById(text).submit();
    }

  }

</script>
</body>

</html>