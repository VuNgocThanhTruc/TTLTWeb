<!DOCTYPE html>
<html lang="en">

<head>
    <title>Chỉnh sửa sản phẩm | ADMIN</title>
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
    <link rel="stylesheet" href="../../admin/doc/css/manage-product.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="../../admin/ckeditor/ckeditor.js"></script>
    <script src="https://code.jquery.com/jquery.min.js" type="text/javascript"></script>
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
            <li class="breadcrumb-item"><a href="manage-booked.jsp">Quản lý lịch đã đặt</a></li>
            <li class="breadcrumb-item">Chỉnh sửa đặt lịch</li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Chỉnh sửa chi tiết</h3>
                <div class="tile-body">
                    <form class="row">
                        <div class="form-group col-md-3">
                            <label class="control-label">ID </label>
                            <input class="form-control" type="number" value="72638003">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Tên sản phẩm</label>
                            <input class="form-control" type="text" value="Thay dây nút nguồn Xiaomi Redmi Note 11 Pro">
                        </div>


                        <div class="form-group  col-md-3">
                            <label class="control-label">Số lượng</label>
                            <input class="form-control" type="number" value="1">
                        </div>
                        <div class="form-group  col-md-3">
                            <label class="control-label">Ngày hẹn</label>
                            <input class="form-control" type="date" value="2022-10-22">
                        </div>
                        <div class="form-group  col-md-3">
                            <label class="control-label">Cửa hàng</label>
                            <input class="form-control" type="text" value="P. Bình An, Quận 2">
                        </div>
                        <div class="form-group col-md-3 ">
                            <label for="exampleSelect1" class="control-label">Tình trạng</label>
                            <select class="form-control" id="exampleSelect1">

                                <option>Chờ thanh toán</option>
                                <option>Đã thanh toán</option>
                                <option>Đã hủy</option>
                            </select>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="exampleSelect1" class="control-label">Danh mục</label>
                            <select class="form-control" id="exampleSelect1">
                                <option>Thay dây nguồn</option>
                                <option>Thay vỏ</option>
                                <option>Thay mặt kính</option>
                                <option>Thay pin</option>
                                <option>Thay chân sạc</option>
                            </select>
                        </div>
                        <div class="form-group col-md-3 ">
                            <label for="exampleSelect1" class="control-label">Thương hiệu</label>
                            <select class="form-control" id="exampleSelect1">

                                <option>Iphone</option>
                                <option>Samsung</option>
                                <option>Xiaomi</option>
                                <option>Khác</option>
                            </select>
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Tổng tiền</label>
                            <input class="form-control" type="text" value="1.690.000">
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Ảnh đại diện</label>
                            <div id="myfileupload">
                                <input type="file" id="uploadfile" name="ImageUpload" onchange="readURL(this);"/>
                            </div>
                            <div id="thumbbox">
                                <img height="300" width="300" alt="Thumb image" id="thumbimage"
                                     src="../../images/product/thay-day-nut-nguon-xiaomi-redmi-note-11-pro_1667623363.png"/>
                                <a class="removeimg" href="javascript:"></a>
                            </div>
                            <div id="boxchoice">
                                <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i>
                                    Chọn ảnh</a>
                                <p style="clear:both"></p>
                            </div>

                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Mô tả sản phẩm</label>
                            <div class="form-control" name="mota" id="mota">
                                <div>
                                    <h2 style="text-align: justify;"><span style="font-size:22px;">Ưu điểm dây nguồn
                                                nút nguồn, volume Redmi Note 11 Pro</span></h2>

                                    <p style="text-align: justify;"><span style="font-size:14px;"><span
                                            style="font-family:Arial,Helvetica,sans-serif;"><em>Dây nguồn nút
                                                        nguồn, volume Xiaomi Redmi Note 11 Pro</em> luôn có giá tốt nhất
                                                    thị trường. <strong>Linh kiện Xiaomi</strong> được kiểm tra kỹ lưỡng
                                                    từ tình trạng đến chất lượng trước khi nhập về. Có nguồn gốc rõ
                                                    ràng, hoàn thiện tỉ mỉ với độ bền cao, dây nguồn phù hợp tiêu chuẩn
                                                    dùng cho sửa chữa điện thoại <strong>Redmi Note 11 Pro </strong>hiệu
                                                    quả.</span></span></p>

                                    <p style="text-align: justify;"><span style="font-size:14px;"><span
                                            style="font-family:Arial,Helvetica,sans-serif;">Nhờ vào đó, các linh
                                                    kiện có độ tương thích cao, lỗi từ nhà sản xuất thấp, hoàn toàn khôi
                                                    phục được chức năng <strong>nút nguồn, volume</strong> hỏng hóc do
                                                    đứt dây nguồn linh kiện.</span></span></p>

                                    <p style="text-align: center;"><img
                                            src="../../images/product/thay-day-nut-nguon-xiaomi-redmi-note-11-pro_1667623363.png"
                                            alt="" srcset=""></p>

                                    <h3 style="text-align: justify;"><span style="font-size:20px;">Những thói quen
                                                gây nên lỗi nút nguồn, nút volume không hoạt động</span></h3>

                                    <p><span style="font-size:14px;"><span
                                            style="font-family:Arial,Helvetica,sans-serif;">Có thể đơn giản chỉ
                                                    là những thói quen thường ngày, tuy nhiên về lâu dài sẽ dẫn đến
                                                    những tình huống lỗi khi sử dụng điện thoại không đáng có. Một số
                                                    thói quen cần lưu ý để tránh gây <strong>lỗi nút nguồn, nút
                                                        volume</strong> như sau:</span></span></p>

                                    <ul>
                                        <li aria-level="1" style="text-align: justify;"><span
                                                style="font-size:14px;"><span
                                                style="font-family:Arial,Helvetica,sans-serif;">Bấm mạnh tay
                                                        trong quá trình sử dụng là một trong những nguyên do ít người để
                                                        ý nhất. Điều này làm cho nút nguồn, nút volume mất đi khả năng
                                                        đàn hồi. Dẫn đến nút bấm bị liệt và không đáp ứng được nhu cầu
                                                        tắt, mở nguồn hoặc tăng giảm volume của người
                                                        dùng.</span></span></li>
                                        <li aria-level="1" style="text-align: justify;"><span
                                                style="font-size:14px;"><span
                                                style="font-family:Arial,Helvetica,sans-serif;">Nút nguồn bị bám
                                                        bụi bẩn do máy không được vệ sinh lâu ngày, các hạt cát và hạt
                                                        bụi bám vào trong các khe điện thoại. Tích tụ lâu ngày, làm cho
                                                        nút nguồn, volume bị kẹt và không thể sử dụng.</span></span>
                                        </li>
                                        <li aria-level="1" style="text-align: justify;"><span
                                                style="font-size:14px;"><span
                                                style="font-family:Arial,Helvetica,sans-serif;">Nút nguồn bị
                                                        dính nước, ẩm mốc. Ở trường hợp này, bất cẩn để điện thoại ngấm
                                                        nước, dẫn tới nước đọng lại trong máy, gây ẩm mốc, lâu ngày
                                                        không chỉ ảnh hưởng tới nút nguồn, volume, ngoài ra các linh
                                                        kiện bên trong như dây nguồn nút nguồn, volume, hoạt động khác
                                                        của máy cũng sẽ bị ảnh hưởng.</span></span></li>
                                        <li aria-level="1" style="text-align: justify;"><span
                                                style="font-size:14px;"><span
                                                style="font-family:Arial,Helvetica,sans-serif;">Va đập mạnh cũng
                                                        giống với khi sử dụng một lực quá lớn điều chỉnh nút volume và
                                                        nút nguồn. Những va chạm nhẹ thông thường không ảnh hưởng nhiều
                                                        đến linh kiện. Tuy nhiên đối với các va chạm mạnh, ngoài những
                                                        phần dễ tổn hại như màn hình, nắp lưng, ống kính…Với những bộ
                                                        phận nằm bên trong cũng sẽ chịu tác động không ít, gây đứt, gãy
                                                        dây nguồn nút nguồn, volume, dẫn đến nút nguồn, nút volume không
                                                        phản hồn.&nbsp;</span></span></li>
                                    </ul>

                                    <p style="text-align: justify;"><span style="font-size:14px;"><span
                                            style="font-family:Arial,Helvetica,sans-serif;">Với những lỗi
                                                    <strong>nút nguồn, nút volume</strong> hay <strong>dây nguồn nút
                                                        nguồn, volume</strong>, cách sửa chữa cũng không quá phức tạp,
                                                    chúng ta sẽ cần đến các kỹ thuật viên chuyên nghiệp để tiến hành
                                                    thay và tháo lắp linh kiện mới, thông thường những lỗi này sẽ không
                                                    ảnh hưởng quá nhiều đến phần cứng của máy. Đừng quá lo lắng và liên
                                                    hệ đến các địa chỉ sửa chữa uy tín nhé.&nbsp;</span></span></p>

                                </div>

                                </textarea>
                                <script>CKEDITOR.replace('mota');</script>
                            </div>
                        </div>
                    </form>
                    <button class="btn btn-save" type="button" onclick="save()">Lưu lại</button>
                    <a class="btn btn-cancel" href="manage-booked.jsp">Hủy bỏ</a>
                </div>
            </div>
        </div>
    </div>
</main>

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