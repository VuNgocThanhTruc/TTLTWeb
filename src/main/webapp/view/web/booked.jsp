<%@ page import="vn.edu.hcmuaf.fit.model.ProductModel" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.BookingDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="../../common/web/head.jsp" %>
    <title>Lịch đã đặt | Phone Care</title>

</head>

<body>
<%
    List<BookingModel> listBooked = (List<BookingModel>) request.getAttribute("listBooked");
//    String checkMess = request.getAttribute("message") != null ? (String) request.getAttribute("message") : "";
%>
<%@include file="../../common/web/header.jsp" %>

<!--Content-->
<section class="h-100 gradient-custom">

    <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
        <div aria-labelledby="nav-week1-tab" class="tab-pane fade show active" id="nav-week1"
             role="tabpanel">

            <div class="row d-flex justify-content-center my-4">
                <div class="col-md-8">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <h5 class="mb-0">Lịch sử đã đặt </h5>
                        </div>
                        <div class="card-body">
                            <!-- Single item -->
                            <%
                                if (listBooked.size() == 0) {%>
                            <div class="row">
                                <h1> Chưa có lịch sử đặt lịch nào!</h1>
                            </div>
                            <%
                            } else {
                                for (BookingModel booking :
                                        listBooked) {
                            %>
                            <div class="row">
                                <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                    <!-- Image -->
                                    <div class="bg-image hover-overlay hover-zoom ripple rounded"
                                         data-mdb-ripple-color="light">
                                        <img src="images/product/<%=booking.getAvatar()%>" class="w-100"
                                             alt="<%=booking.getName()%>"/>

                                    </div>
                                    <!-- Image -->
                                </div>

                                <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                    <!-- Data -->
                                    <p><strong><%=booking.getName() %>
                                    </strong></p>


                                    <p>Ngày hẹn: <%=booking.getDate_booking() %>
                                    </p>
                                    <p>Tình trạng: <%=booking.getStatusBooking().getName() %>
                                    </p>


                                    <!-- Data -->
                                </div>

                                <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                    <!-- Data -->
                                    <p>Số lượng: <%=booking.getQuantity() %>
                                    </p>
                                    <p><strong>Giá: <%=booking.getPrice() %>
                                    </strong></p>


                                    <!-- Price -->
                                </div>
                            </div>
                            <!-- Single item -->

                            <hr class="my-4"/>
                            <% }
                            }%>
                        </div>
                    </div>
                    <!--                <div class="card mb-4">-->
                    <!--                    <div class="card-body">-->
                    <!--                        <p><strong>Expected shipping delivery</strong></p>-->
                    <!--                        <p class="mb-0">12.10.2020 - 14.10.2020</p>-->
                    <!--                    </div>-->
                    <!--                </div>-->
                    <div class="card mb-4 mb-lg-0">
                        <div class="card-body">
                            <p><strong>Một số phương thức thanh toán</strong></p>
                            <img class="me-2" width="45px"
                                 src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
                                 alt="Visa"/>
                            <img class="me-2" width="45px"
                                 src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
                                 alt="American Express"/>
                            <img class="me-2" width="45px"
                                 src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
                                 alt="Mastercard"/>

                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</section>

<%@include file="../../common/web/footer.jsp" %>

</body>

</html>