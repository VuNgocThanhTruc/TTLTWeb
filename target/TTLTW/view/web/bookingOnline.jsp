<%@ page import="vn.edu.hcmuaf.fit.constant.APIConstants" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/13/2022
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <%@include file="../../common/web/head.jsp" %>

    <title>Booking | Phone Care</title>
    <link rel="stylesheet" href="../../css/booking.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
</head>

<body>
<%@include file="../../common/web/header.jsp" %>
<% String mess = (String) session.getAttribute("mess"); %>
<!-- content -->
<main id="booking" class="my-5">
    <div class="container">
        <h2 class="title my-3">
            ĐẶT LỊCH SỬA CHỮA
        </h2>
        <div class="col-md-7 col-lg-7 info-booking">
            <div class="info-user">

                <form action="bookingOnline?action=booking" method="post">
                    <h3>Thông tin khách hàng</h3>
                    <%if (mess == "success") { %>
                    <div class="alert alert-success">
                        Bạn đã <strong>đặt lịch thành công </strong>
                    </div>
                    <%}%>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="username">Họ và Tên</label>
                                <input type="text" value="<% if(user!=null) {out.print(user.getName());}%>"
                                       placeholder="<% if(user==null) {out.print("Nhập họ và tên");}%>"
                                       class="form-control"
                                       name="username" id="username" required>
                            </div>
                            <div class="col-md-6">
                                <label for="tel">Số điện thoại</label>
                                <input type="tel" value="<% if(user!=null) {out.print(user.getTel());}%>"
                                       placeholder="<% if(user==null) {out.print("Nhập số điện thoại");}%>"
                                       class="form-control"
                                       name="tel" id="tel" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control"
                               value="<% if(user!=null) {out.print(user.getEmail());}%>"
                               placeholder="<% if(user==null) {out.print("Nhập email");}%>" name="email" id="email">
                    </div>
                    <div class="form-group">
                        <a class="btn btn-primary"
                           data-toggle="modal" data-target="#modalGetAddress">
                            Chọn địa chỉ
                        </a>
                        <br>
                        <input type="hidden" name="id-province" class="id-province">
                        <input type="hidden" name="id-district" class="id-district">
                        <input type="hidden" name="id-ward" class="id-ward">
                        <input type="text" class="form-control"
                               value="<% if(user!=null) {out.print(user.getAddress());}%>"
                               placeholder="<% if(user==null) {out.print("Nhập địa chỉ");}%>" name="address"
                               id="address">
                    </div>

                    <div class="form-group">
                        <label for="time">Thời gian</label>
                        <div class="row">
                            <div class="col-md-6">
                                <input type="time" class="form-control" name="time" id="time">
                            </div>
                            <div class="col-md-6">
                                <input type="date" class="form-control" name="date" id="date">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Ghi chú</label>
                        <textarea name="description" class="form-control" rows="5"
                                  placeholder="Ghi chú thêm thông tin như mô tả về điện thoại (màu sắc, các lỗi hiện có)..."></textarea>
                    </div>
                    <div class="form-group">
                        <label>Phương thức thanh toán</label>

                        <div class="female">
                            <input type="radio" id="cod" checked name="payment" value="1">
                            <label for="cod">Thanh toán khi nhận hàng (COD)</label>
                        </div>
                        <%--                        <div class="male">--%>
                        <%--                            <input type="radio" id="male" name="sex" value="1">--%>
                        <%--                            <label for="male">Nam</label>--%>
                        <%--                        </div>--%>
                    </div>

                    <div class="text-center">
                        <%--                            <button type="submit" class="btn btn-primary btn-booking">Đặt hẹn</button>--%>
                        <%--                            </button>--%>
                        <input class="btn btn-primary btn-booking" type="submit" value="Đặt hẹn" id="btnSave"/>
                    </div>
                </form>
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
    // function redirectPage(e) {
    //     e.preventDefault();
    //     location.replace('checkout.html')
    // }
    //
    //
    // $('.btn-booking').click(function () {
    //     swal({
    //         title: "",
    //         text: "Đặt lịch thành công",
    //         icon: "success",
    //         close: true,
    //         button: false,
    //     });
    // });
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
                $('.id-ward').val(valueWard)
                $('.id-district').val(valueDistrict)
                $('.id-province').val(valueProvince)
                console.log(valueProvince)
                console.log(valueDistrict)
                console.log(valueWard)

                $('.address').val(`${tagSelectModalGetWard.options[tagSelectModalGetWard.selectedIndex].textContent}, ${tagSelectModalGetDistrict.options[tagSelectModalGetDistrict.selectedIndex].textContent}, ${tagSelectModalGetProvince.options[tagSelectModalGetProvince.selectedIndex].textContent}`)

                await autoLoginLogisticAPI()

                //display service fee
                const options = {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': 'Bearer ' + logisticIDToken
                    },
                    body: JSON.stringify({
                        'from_district_id': <%=APIConstants.ID_DISTRICT_STORE%>,
                        'from_ward_id': <%=APIConstants.ID_WARD_STORE%>,
                        'to_district_id': valueDistrict,
                        'to_ward_id': valueWard,
                        'height': height,
                        'length': length,
                        'width': width,
                        'weight': weight,
                    })
                };

                await fetch(`<%=APIConstants.LOGISTIC_HOST_API%>/calculateFee`, options)
                    .then(response => response.json())
                    .then(data => {
                        if (data.status === 200) {
                            serviceFee.text(data.data[0].service_fee)
                        }
                    })
                    .catch(error => {
                        console.log(error)
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
</body>

</html>
