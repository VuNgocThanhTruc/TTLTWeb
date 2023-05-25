<!DOCTYPE html>
<html lang="en">

<head>
    <title>Chỉnh sửa đơn hàng | ADMIN</title>
    <link href="../../images/logo/logo_PhoneCare.png" rel="shortcut icon" type="image/x-icon">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="../../admin/doc/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- or -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

</head>

<body onload="time()" class="app sidebar-mini rtl">
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
                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a></li>
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
            <li class="breadcrumb-item"><a href="manage-order.jsp">Quản lý đơn hàng</a></li>
            <li class="breadcrumb-item"><a href="#">Chỉnh sửa đơn hàng</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Chỉnh sửa chi tiết</h3>
                <div class="tile-body">
                    <form class="row">
                        <div class="form-group  col-md-4">
                            <label class="control-label">ID đơn hàng</label>
                            <input class="form-control" type="text" value="MD0837">
                        </div>

                        <div class="form-group  col-md-4">
                            <label class="control-label">Tên khách hàng</label>
                            <input class="form-control" type="text" value="Triệu Thanh Phú">
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Số điện thoại khách hàng</label>
                            <input class="form-control" type="number" value="0348417665" >
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Địa chỉ khách hàng</label>
                            <input class="form-control" type="text" value="46 Bùi Thị Xuân">
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Giá đơn hàng (vnd)</label>
                            <input class="form-control" type="text" value="1.234.000">
                        </div>

                        <div class="form-group  col-md-4">
                            <label class="control-label">Ngày làm đơn hàng</label>
                            <input class="form-control" type="date" >
                        </div>

                        <div class="form-group  col-md-4">
                            <label class="control-label">Mã sản phẩm</label>
                            <input class="form-control" type="text" value="72638003">
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Tên sản phẩm</label>
                            <input class="form-control" type="text" value="Thay dây nút nguồn Xiaomi Redmi Note 11 Pro">
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Số lượng</label>
                            <input class="form-control" type="number" value="1">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="exampleSelect1" class="control-label">Tình trạng</label>
                            <select class="form-control" id="exampleSelect1">

                                <option>Đã xử lý</option>
                                <option>Đang chờ</option>
                                <option>Đã hủy</option>
                            </select>
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Ghi chú đơn hàng</label>
                            <textarea class="form-control" rows="4" ></textarea>
                        </div>
                    </form>
                </div>
                <button class="btn btn-save" type="button" onclick="save()">Lưu lại</button>
                <a class="btn btn-cancel" href="manage-order.jsp">Hủy bỏ</a>
            </div></div></div>
</main>
<script>
    function save() {

        swal("Đã lưu thành công.!", {});

    }
</script>
<!-- Essential javascripts for application to work-->
<script src="../../admin/js/plugins/jquery-3.2.1.min.js"></script>
<script src="../../admin/js/popper.min.js"></script>
<script src="../../admin/js/plugins/bootstrap.min.js"></script>
<script src="../../admin/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="../../admin/doc/js/plugins/pace.min.js"></script>
</body>
</html>