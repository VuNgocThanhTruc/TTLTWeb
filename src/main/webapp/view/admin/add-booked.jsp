<!DOCTYPE html>
<html lang="en">

<head>
    <title>Thêm đặt lịch | ADMIN</title>
    <link href="../../images/logo/logo_PhoneCare.png" rel="shortcut icon" type="image/x-icon">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="../../admin/doc/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- or -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../admin/doc/css/manage-product.css">
    <script type="text/javascript" src="../../admin/ckeditor/ckeditor.js"></script>
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
<header class="app-header">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                    aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">


        <!-- User Menu-->
        <li><a class="app-nav__item" href="../../admin/login.html"><i class='bx bx-log-out bx-rotate-180'></i> </a>

        </li>
    </ul>
</header>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="../../admin/images/admin.png" width="50px"
                                        alt="User Image">
        <div>
            <p class="app-sidebar__user-name"><b>Admin</b></p>
            <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
        </div>
    </div>
    <hr>
    <ul class="app-menu">

        <li><a class="app-menu__item active " href="index.jsp"><i class='app-menu__icon bx bx-tachometer'></i><span
                class="app-menu__label">Bảng điều khiển</span></a></li>
        <li><a class="app-menu__item" href="manage-customer.jsp"><i class='app-menu__icon bx bx-user-voice'></i><span
                class="app-menu__label">Quản lý khách hàng</span></a></li>
        <li><a class="app-menu__item" href="manage-product.jsp"><i
                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
        </li>
        <li><a class="app-menu__item" href="manage-order.jsp"><i class='app-menu__icon bx bx-task'></i><span
                class="app-menu__label">Quản lý đơn hàng</span></a></li>
        <li><a class="app-menu__item" href="manage-booked.jsp"><i class='app-menu__icon bx bx-calendar-check'></i><span
                class="app-menu__label">Quản lý lịch đã đặt </span></a></li>
        <li><a class="app-menu__item" href="manage-blog.jsp"><i class='app-menu__icon bx bx-news'></i><span
                class="app-menu__label">Quản lý tin tức </span></a></li>


    </ul>
</aside>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="manage-booked.jsp">Quản lý lịch đã đặt</a></li>
            <li class="breadcrumb-item">Thêm đặt lịch</li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Tạo mới đặt lịch</h3>
                <div class="tile-body">
                    <%--                    <div class="row element-button">--%>
                    <%--                        <div class="col-sm-2">--%>
                    <%--                            <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#exampleModalCenter"><i--%>
                    <%--                                    class="fas fa-folder-plus"></i> Thêm thương hiệu</a>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="col-sm-2">--%>
                    <%--                            <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#adddanhmuc"><i--%>
                    <%--                                    class="fas fa-folder-plus"></i> Thêm danh mục</a>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="col-sm-2">--%>
                    <%--                            <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#addtinhtrang"><i--%>
                    <%--                                    class="fas fa-folder-plus"></i> Thêm tình trạng</a>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <form class="row">
                        <div class="form-group col-md-3">
                            <label class="control-label">ID </label>
                            <input class="form-control" type="number" placeholder="">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Tên người đặt</label>
                            <input class="form-control" type="text">
                        </div>


                        <div class="form-group  col-md-3">
                            <label class="control-label">Điện thoại</label>
                            <input class="form-control" type="number">
                        </div>
                        <div class="form-group  col-md-3">
                            <label class="control-label">Ngày đặt</label>
                            <input class="form-control" type="date">
                        </div>
                        <div class="form-group col-md-3 ">
                            <label for="exampleSelect1" class="control-label">Tình trạng</label>
                            <select class="form-control" id="exampleSelect1">
                                <option>-- Chọn tình trạng --</option>
                                <option>Chờ thanh toán</option>
                                <option>Đã thanh toán</option>
                                <option>Đã hủy</option>
                            </select>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Mô tả sản phẩm</label>
                            <textarea class="form-control" name="mota" id="mota"></textarea>
                            <script>CKEDITOR.replace('mota');</script>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <button class="btn btn-save" type="button" onclick="save()">Lưu lại</button>
        <a class="btn btn-cancel" href="manage-booked.jsp">Hủy bỏ</a>
    </div>
</main>


<!--
MODAL CHỨC VỤ
-->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

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
MODAL DANH MỤC
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
                            <li>Thay vỏ</li>
                            <li>Thay pin</li>
                            <li>Thay cáp sạc</li>
                            <li>Thay mặt kính</li>
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
                        <input class="form-control" type="text" required>
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


<script src="../../admin/js/jquery-3.2.1.min.js"></script>
<script src="../../admin/js/popper.min.js"></script>
<script src="../../admin/js/bootstrap.min.js"></script>
<script src="../../admin/js/main.js"></script>
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