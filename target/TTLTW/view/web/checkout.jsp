<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.constant.APIConstants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <%@include file="../../common/web/head.jsp" %>

    <title> Thanh toán | Phone Care</title>
    <link rel="stylesheet" href="css/checkout.css">

</head>

<body>
<%@include file="../../common/web/header.jsp" %>
<%
    HashMap<Integer, ProductCartModel> cart = (HashMap<Integer, vn.edu.hcmuaf.fit.model.ProductCartModel>) session.getAttribute("cart");
%>

<main id="checkout">
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
                            <a href="cart">
                                <span>Giỏ hàng</span>
                            </a>
                        </li>
                        <li>
                            <span><span style="color: #777777">Thanh toán</span></span>
                        </li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="content">
        <div class="modal-checkout my-5">
            <div class="row">
                <div class="modal-product col-md-6 col-lg-6">
                    <div class="product">

                        <!-- Slideshow container -->
                        <div class="product-slideshow">
                            <%
                                for (Map.Entry<Integer, ProductCartModel> item : cart.entrySet()) {
                            %>
                            <div class="productSlides fade-checkout">
                                <div class="img">
                                    <img src="images/product/<%=item.getValue().getProductModel().getAvatar()%>"
                                         class="img-fluid w-100">
                                </div>
                                <h1 class="product-name">
                                    <%=item.getValue().getProductModel().getName()%>
                                </h1>
                                <p class="product-code-name">
                                    loại: <%=item.getValue().getProductModel().getIdTypeProduct()%>
                                </p>
                                <p class="price">
                                    Đơn giá: <%=item.getValue().getProductModel().getPrice()%>
                                </p>
                                <p class="quantity text-center">
                                    Số lượng: <%=item.getValue().getQuantity()%>
                                </p>
                                <p class="money text-center">
                                    Tổng
                                    tiền: <%=item.getValue().getProductModel().getPrice() * item.getValue().getQuantity()%>
                                </p>
                            </div>
                            <%}%>

                            <!-- The dots/circles -->
                            <div style="text-align:center" class="dots"></div>

                        </div>

                    </div>

                    <div class="sum-money">
                        <div class="service-fee">Giá tiền vận chuyển: <span></span></div>
                        <div class="lead-time">Thời gian dự kiến giao: <span></span></div>
                        <h3 class="d-flex justify-content-center">Thành tiền:
                            <%
                                float res = 0;
                                if (cart != null)
                                    for (Map.Entry<Integer, ProductCartModel> item : cart.entrySet()) {
                                        res += item.getValue().getSumMoney();
                                    }
                            %>
                            <%=res%>
                        </h3>
                    </div>
                    <div class="round-shape"></div>
                    <a class="back_to_cart" href="cart"><i class="fas fa-arrow-left mr-2"></i>Quay lại trang giỏ
                        hàng</a>
                </div>
                <div class="col-md-6 col-lg-6 modal-info">
                    <div class="info">
                        <h2 class="text-light">Thông tin người đặt</h2>
                        <form action="checkout" method="post">
                            <ul class="form-list">
                                <li class="form-list-row">
                                    <div class="user">
                                        <label for="name">Tên</label><br>
                                        <i class="fas fa-user"></i></i><input type="text" name="name" id="name"
                                                                              required>
                                    </div>
                                </li>
                                <li class="form-list-row">
                                    <div class="email">
                                        <label for="email">Email</label><br>
                                        <i class="fa fa-envelope-o"></i><input type="email" name="email" id="email"
                                                                               required>
                                    </div>
                                </li>
                                <li class="form-list-row">
                                    <div class="tel">
                                        <label for="tel">Số điện thoại</label><br>
                                        <i class="fa fa-phone"></i><input type="tel" name="tel" id="tel"
                                                                          required>
                                    </div>
                                </li>

                                <li class="form-list-row">
                                    <div>
                                        <a class="text-light line"
                                           data-toggle="modal" data-target="#modalGetAddress">
                                            Chọn địa chỉ
                                        </a>
                                        <br>
                                        <i class="far fa-credit-card"></i><input type="text" name="address" id="address"
                                                                                 class="address"
                                                                                 required>
                                        <input type="hidden" name="service-fee" class="service-fee-input">
                                        <input type="hidden" name="id-province" class="id-province">
                                        <input type="hidden" name="id-district" class="id-district">
                                        <input type="hidden" name="id-ward" class="id-ward">
                                    </div>
                                </li>
                                <li class="form-list-row">
                                    <div class="date">
                                        <label for="time">Thời gian</label><br>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="time" class="form-control" name="time" id="time"
                                                       required>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="date" class="form-control" name="date" id="date" required>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="form-list-row">
                                    <div class="note">
                                        <label for="description">Ghi chú</label><br>
                                        <textarea name="description" id="description" class="form-control" rows="5"
                                                  placeholder="Ghi chú thêm thông tin như mô tả về điện thoại (màu sắc, các lỗi hiện có)..."></textarea>
                                    </div>
                                </li>
                                <li class="form-list-row">
                                    <div class="payment">
                                        <label for="payment">Phương thức thanh toán</label>
                                        <input type="radio" name="payment" id="payment" value="1" checked="checked">
                                        Sau khi nhận hàng
                                        <input type="radio" name="payment" value="2">
                                        Tại cửa hàng
                                        <input type="radio" name="payment" value="3">
                                        Qua momo
                                    </div>
                                </li>
                                <li class="form-list-row">
                                    <div class="store">
                                        <label for="store">Chi nhánh:</label>
                                        <br>
                                        <input type="radio" name="store" id="store" value="1" checked="checked">
                                        ĐH Nông Lâm, Linh Trung, Tp Thủ Đức, Tp Hồ Chí Minh, Việt Nam
                                        <br>
                                        <input type="radio" name="store" value="2">
                                        Quận 1, Tp Hồ Chí Minh, Việt Nam
                                    </div>
                                </li>
                            </ul>
                            <button class="btn-submit" type="submit">Xác nhận</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal address API -->
    <div class="modal fade" id="modalGetAddress" tabindex="-1" role="dialog" aria-labelledby="modalGetAddressTitle"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalGetAddressTitle">Địa chỉ giao hàng</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <p class="col-4">Tỉnh/Thành phố</p>
                        <select class="col-6 select-province form-select" aria-label="Default select example">
                            <option selected>Vui lòng chọn Tỉnh/Thành phố</option>
                        </select>
                    </div>
                    <div class="row">
                        <p class="col-4">Quận/Huyện</p>
                        <select class="col-6 select-district form-select" aria-label="Default select example" disabled>
                            <option selected>Vui lòng chọn Quận/Huyện</option>
                        </select>
                    </div>
                    <div class="row">
                        <p class="col-4">Phường/Xã</p>
                        <select class="col-6 select-ward form-select" aria-label="Default select example" disabled>
                            <option selected>Vui lòng chọn Phường/Xã</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-primary getAPIAddress">Giao đến địa chỉ này</button>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="../../common/web/footer.jsp" %>

<script>

    var htmlItemm = "";
    var sumMoney = 0

    <%--for (let i = 0; i < cart.length; i++) {--%>
    <%--    htmlItemm += `--%>
    <%--                            <div class="productSlides fade-checkout">--%>
    <%--                                <div class="img">--%>
    <%--                                    <img src="./images/product/${cart[i].image}"--%>
    <%--                                        class="img-fluid w-100">--%>
    <%--                                </div>--%>
    <%--                                <h1 class="product-name">--%>
    <%--                                    ${cart[i].item_name}--%>
    <%--                                </h1>--%>
    <%--                                <p class="product-code-name">--%>
    <%--                                    loại ${cart[i].option2}--%>
    <%--                                </p>--%>
    <%--                                <p class="price">--%>
    <%--                                    Đơn giá: ${convertMoney(cart[i].amount)}--%>
    <%--                                </p>--%>
    <%--                                <p class="quantity text-center">--%>
    <%--                                    Số lượng: ${cart[i].quantity}--%>
    <%--                                </p>--%>
    <%--                                <p class="money text-center">--%>
    <%--                                    Tổng tiền: ${convertMoney(cart[i].quantity*cart[i].amount)}--%>
    <%--                                </p>--%>
    <%--                            </div>--%>
    <%--        `;--%>
    <%--    var htmlSumMoney = `--%>
    <%--            <h3 class="d-flex justify-content-center">Thành tiền: ${convertMoney(sumMoney+=cart[i].quantity*cart[i].amount)}</h3>--%>
    <%--    `--%>
    <%--}--%>
    for (let i = 0; i < <%=cart.size()%>; i++) {

        htmlItemm += `
                 <span class="dot" onclick="currentSlide(${i+1})"></span>
            `
    }

    $('.product-slideshow .dots').append(htmlItemm)


    // $('.sum-money').append(htmlSumMoney)

    let logisticIDToken = null;

    async function autoLoginLogisticAPI() {

        await fetch(`<%=request.getContextPath()%>/api/logistic?action=login`, {
            method: 'POST'
        })
            .then(response => response.json())
            .then(data => {
                logisticIDToken = data
            })
            .catch(error => {
                console.log(error)
            });
    }

    $(document).ready(function () {
        let tagSelectModalGetProvince = document.querySelector('.select-province')
        let tagSelectModalGetDistrict = document.querySelector('.select-district')
        let tagSelectModalGetWard = document.querySelector('.select-ward')

        let height = 100
        let length = 100
        let width = 100
        let weight = 100

        let valueProvince = 0
        let valueDistrict = 0
        let valueWard = 0

        $('.getAPIAddress').click(async () => {
            let serviceFee = $('.service-fee span')
            let leadTime = $('.lead-time span')

            if (valueProvince > 0 && valueDistrict > 0 && valueWard > 0) {
                $('.address').val(`${tagSelectModalGetWard.options[tagSelectModalGetWard.selectedIndex].textContent}, ${tagSelectModalGetDistrict.options[tagSelectModalGetDistrict.selectedIndex].textContent}, ${tagSelectModalGetProvince.options[tagSelectModalGetProvince.selectedIndex].textContent}`)

                await autoLoginLogisticAPI()

                //display service fee
                const data = {
                    'logisticIDToken': logisticIDToken,
                    'from_district_id': <%=APIConstants.ID_DISTRICT_STORE%>,
                    'from_ward_id': <%=APIConstants.ID_WARD_STORE%>,
                    'to_district_id': valueDistrict,
                    'to_ward_id': valueWard,
                    'height': height,
                    'length': length,
                    'width': width,
                    'weight': weight,
                };

                await $.ajax({
                    type: 'POST',
                    data: data,
                    url: `<%=request.getContextPath()%>/api/logistic?action=calculateFee`,
                    success: function (data) {
                        if (data.status === 200) {
                            serviceFee.text(data.data[0].service_fee)
                            document.querySelector('input[name="service-fee"]').value = data.data[0].service_fee
                        }
                    }
                });

                await $.ajax({
                    type: 'POST',
                    data: data,
                    url: `<%=request.getContextPath()%>/api/logistic?action=leadTime`,
                    success: function (data) {
                        console.log(data)
                        if (data.status === 200) {
                            leadTime.text(data.data[0].formattedDate)
                        }
                    }
                });


            }
        })

        $(".select-province").focus(async function () {
            if (logisticIDToken == null) {
                await autoLoginLogisticAPI()

                await fetch(`<%=request.getContextPath()%>/api/logistic?action=province&logisticIDToken=${logisticIDToken}`, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json',
                    }
                })
                    .then(response => response.json())
                    .then(data => {
                        for (let i = 0; i < data.original.data.length; i++) {
                            let option = document.createElement("option");
                            option.value = `${data.original.data[i].ProvinceID}`;
                            option.text = `${data.original.data[i].ProvinceName}`;
                            tagSelectModalGetProvince.appendChild(option);
                        }
                        valueProvince = tagSelectModalGetProvince.value * 1
                        console.log("valueProvince: " + valueProvince)
                        $('.id-province').val(valueProvince)
                        handleEventSelectProvinceChange()
                        handleEventSelectDistrictChange()
                    })
                    .catch(error => {
                        console.log(error)
                    });
            }
        })

        function handleEventSelectProvinceChange() {
            $(".select-province").change(async function () {
                valueProvince = tagSelectModalGetProvince.value * 1
                $('.id-province').val(valueProvince)
                console.log("valueProvince: " + valueProvince)

                tagSelectModalGetDistrict.innerHTML = ''
                // await autoLoginLogisticAPI()

                if (valueProvince > 0) {
                    tagSelectModalGetDistrict.disabled = false;

                    const options = {
                        method: 'GET',
                        headers: {
                            'Content-Type': 'application/json',
                            'Authorization': 'Bearer ' + logisticIDToken
                        }
                    };

                    await fetch(`<%=APIConstants.LOGISTIC_HOST_API%>/district?provinceID=${valueProvince}`, options)
                        .then(response => response.json())
                        .then(data => {
                            for (let i = 0; i < data.original.data.length; i++) {
                                let option = document.createElement("option");
                                option.value = `${data.original.data[i].DistrictID}`;
                                option.text = `${data.original.data[i].DistrictName}`;
                                tagSelectModalGetDistrict.appendChild(option);
                            }
                            valueDistrict = tagSelectModalGetDistrict.value * 1
                            $('.id-district').val(valueDistrict)
                        })
                        .catch(error => {
                            console.log(error)
                        });
                }
            });
        }

        function handleEventSelectDistrictChange() {
            $(".select-district").change(async function () {
                valueDistrict = tagSelectModalGetDistrict.value * 1
                tagSelectModalGetWard.innerHTML = ''
                if (valueDistrict > 0) {
                    tagSelectModalGetWard.disabled = false;
                    const options = {
                        method: 'GET',
                        headers: {
                            'Authorization': 'Bearer ' + logisticIDToken
                        }
                    };

                    await fetch(`<%=APIConstants.LOGISTIC_HOST_API%>/ward?districtID=${valueDistrict}`, options)
                        .then(response => response.json())
                        .then(data => {
                            for (let i = 0; i < data.original.data.length; i++) {
                                let option = document.createElement("option");
                                option.value = `${data.original.data[i].WardCode}`;
                                option.text = `${data.original.data[i].WardName}`;
                                tagSelectModalGetWard.appendChild(option);
                            }
                            valueWard = tagSelectModalGetWard.value * 1
                            $('.id-ward').val(valueWard)
                        })
                        .catch(error => {
                            console.log(error)
                        });
                }
            });
        }

        handleEventSelectProvinceChange()
        handleEventSelectDistrictChange()
    });

</script>
<script src="js/checkout.js"></script>
</body>

</html>