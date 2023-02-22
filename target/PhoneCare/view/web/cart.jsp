<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="../../common/web/head.jsp" %>

    <title>Giỏ hàng | Phone Care</title>


</head>

<body>
<%@include file="../../common/web/header.jsp" %>
<%
    HashMap<Integer, ProductCartModel> cart = (HashMap<Integer, ProductCartModel>) session.getAttribute("cart");
    String mess = (String) session.getAttribute("mess");
%>

<!--Content-->
<section class="h-100 gradient-custom">
    <div class="container py-5">
        <div class="row d-flex justify-content-center my-4 detail_cart">
            <div class="col-md-8">
                <%if (mess == "success") { %>
                <div class="alert alert-success">
                    Bạn đã <strong>đặt lịch thành công </strong>
                </div>
                <%}%>
                <div class="card mb-4">
                    <div class="card-header py-3">
                        <h5 class="mb-0 sumquantityCart"></h5>
                    </div>
                    <div class="card-body cart-item">
                        <!-- Single item -->
                        <%if (cart == null) {%>
                        <div>Không có sản phẩm nào trong giỏ hàng</div>
                        <%
                        } else {
                            for (Map.Entry<Integer, ProductCartModel> item : cart.entrySet()) {
                        %>
                        <form action="${pageContext.request.contextPath}/cart?action=update-cart" method="post">
                            <div class="row cart-item_<%=item.getKey()%>">
                                <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                    <!-- Image -->
                                    <div class="bg-image hover-overlay hover-zoom ripple rounded"
                                         data-mdb-ripple-color="light">
                                        <img src="images/product/<%=item.getValue().getProductModel().getAvatar()%>"
                                             class="w-100"
                                             alt=""/>

                                    </div>
                                    <!-- Image -->
                                </div>

                                <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                    <!-- Data -->
                                    <p><strong><%=item.getValue().getProductModel().getName()%>
                                    </strong></p>
                                    <p>Loại: <%=item.getValue().getProductModel().getIdTypeProduct()%>
                                    </p>

                                    <button type="submit" class="btn btn-danger btn-sm me-1 mb-2"
                                            data-mdb-toggle="tooltip"
                                            title="Xóa" name="btn_update" value="delete">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                    <button type="submit" class="btn btn-info btn-sm me-1 mb-2"
                                            data-mdb-toggle="tooltip"
                                            title="Cập nhật" name="btn_update" value="update">
                                        <i class="fas fa-save"></i>
                                    </button>
                                    <!-- Data -->
                                </div>

                                <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                    <!-- Quantity -->
                                    <div class="d-flex mb-4" style="max-width: 300px">
                                        <button class="btn btn-dark px-3 me-2"
                                                onclick="decreasesQuantity2()">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <input type="hidden" name="id_item" value="<%=item.getKey()%>">
                                        <div class="form-outline">
                                            <input id="quantity" min="0" name="quantity"
                                                   value="<%=item.getValue().getQuantity()%>"
                                                   type="number"
                                                   class="form-control minicart-quantity <%=item.getKey()%>"/>
                                        </div>

                                        <button class="btn btn-dark px-3 ms-2"
                                                onclick="increaseQuantity2()">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                    </div>
                                    <!-- Quantity -->

                                    <!-- Price -->
                                    <p class="text-start text-md-center">
                                        <strong><%=item.getValue().getProductModel().getPrice()%>
                                        </strong>
                                    </p>
                                    <!-- Price -->
                                </div>
                            </div>
                        </form>
                        <%
                            }%>

                        <%}%>
                        <!-- Single item -->`
                    </div>
                </div>
                <hr>
            </div>
        </div>
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
    <div class="col-md-4">
        <div class="card mb-4">
            <div class="card-header py-3">
                <h5 class="mb-0">Hóa đơn</h5>
            </div>
            <div class="card-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                        <div>
                            <strong>Tổng tiền</strong>
                        </div>
                        <span><strong class="change-cart-summoney">chen tong tien</strong></span>
                    </li>
                </ul>

                <a type="button" class="btn btn-primary btn-lg btn-block" href="checkout">
                    Đặt lịch
                </a>
            </div>
        </div>
    </div>

</section>

<%@include file="../../common/web/footer.jsp" %>

<%--<script>--%>
<%--    let htmlCart = ''--%>
<%--    let cart = getCartFromLocalStorage().value.items;--%>
<%--    console.log(cart)--%>
<%--    if (cart.length > 0) {--%>
<%--        htmlCart += `--%>
<%--        <div class="col-md-8">--%>
<%--          <div class="card mb-4">--%>
<%--            <div class="card-header py-3">--%>
<%--              <h5 class="mb-0 sumquantityCart"></h5>--%>
<%--            </div>--%>
<%--            <div class="card-body cart-item">`--%>

<%--        for (let i = 0; i < cart.length; i++) {--%>
<%--            htmlCart += `--%>
<%--              <!-- Single item -->--%>
<%--              <div class="row cart-item_${cart[i].id_item}">--%>
<%--                <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">--%>
<%--                  <!-- Image -->--%>
<%--                  <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">--%>
<%--                    <img src="images/product/${cart[i].image}" class="w-100"--%>
<%--                      alt="" />--%>

<%--                  </div>--%>
<%--                  <!-- Image -->--%>
<%--                </div>--%>

<%--                <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">--%>
<%--                  <!-- Data -->--%>
<%--                  <p><strong>${cart[i].item_name}</strong></p>--%>
<%--                  <p>Loại: ${cart[i].option2}</p>--%>

<%--                  <button type="button" class="btn btn-danger btn-sm me-1 mb-2" data-mdb-toggle="tooltip"--%>
<%--                    title="Remove item" onclick="deleteItem(${cart[i].id_item})">--%>
<%--                    <i class="fas fa-trash"></i>--%>
<%--                  </button>--%>

<%--                  <!-- Data -->--%>
<%--                </div>--%>

<%--                <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">--%>
<%--                  <!-- Quantity -->--%>
<%--                  <div class="d-flex mb-4" style="max-width: 300px">--%>
<%--                    <button class="btn btn-dark px-3 me-2"--%>
<%--                      onclick="decreasesQuantity2()">--%>
<%--                      <i class="fas fa-minus"></i>--%>
<%--                    </button>--%>

<%--                    <div class="form-outline">--%>
<%--                      <input id="quantity" min="0" name="quantity" value="${cart[i].quantity}" type="number" class="form-control minicart-quantity ${cart[i].id_item}" />--%>
<%--                    </div>--%>

<%--                    <button class="btn btn-dark px-3 ms-2"--%>
<%--                      onclick="increaseQuantity2()">--%>
<%--                      <i class="fas fa-plus"></i>--%>
<%--                    </button>--%>
<%--                  </div>--%>
<%--                  <!-- Quantity -->--%>

<%--                  <!-- Price -->--%>
<%--                  <p class="text-start text-md-center">--%>
<%--                    <strong>${convertMoney(cart[i].amount)}</strong>--%>
<%--                  </p>--%>
<%--                  <!-- Price -->--%>
<%--                </div>--%>
<%--              </div>--%>
<%--              <!-- Single item -->`--%>
<%--        }--%>
<%--        htmlCart += ` <hr>--%>
<%--            </div>--%>
<%--          </div>--%>

<%--          <div class="card mb-4 mb-lg-0">--%>
<%--            <div class="card-body">--%>
<%--              <p><strong>Một số phương thức thanh toán</strong></p>--%>
<%--              <img class="me-2" width="45px"--%>
<%--                src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"--%>
<%--                alt="Visa" />--%>
<%--              <img class="me-2" width="45px"--%>
<%--                src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"--%>
<%--                alt="American Express" />--%>
<%--              <img class="me-2" width="45px"--%>
<%--                src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"--%>
<%--                alt="Mastercard" />--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--        <div class="col-md-4">--%>
<%--          <div class="card mb-4">--%>
<%--            <div class="card-header py-3">--%>
<%--              <h5 class="mb-0">Hóa đơn</h5>--%>
<%--            </div>--%>
<%--            <div class="card-body">--%>
<%--              <ul class="list-group list-group-flush">--%>
<%--                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">--%>
<%--                  <div>--%>
<%--                    <strong>Tổng tiền</strong>--%>
<%--                  </div>--%>
<%--                  <span><strong class="change-cart-summoney">${convertMoney(sumMoney())}</strong></span>--%>
<%--                </li>--%>
<%--              </ul>--%>

<%--              <a type="button" class="btn btn-primary btn-lg btn-block" href="checkout.html">--%>
<%--                Đặt lịch--%>
<%--              </a>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>

<%--`--%>
<%--        console.log(true);--%>

<%--    } else {--%>
<%--        htmlCart = `<div class="text-center color-primary">Giỏ hàng của bạn bị trống!</div>`--%>
<%--        console.log(false);--%>

<%--    }--%>

<%--    $('.detail_cart').append(htmlCart)--%>
<%--    $('.sumquantityCart').append(`Giỏ hàng - ${cart.length} sản phẩm`)--%>

<%--    function deleteItem(position) {--%>
<%--        var cartTemp = getCartFromLocalStorage();--%>

<%--        for (let i = 0; i < cart.length; i++) {--%>
<%--            if (cart[i].id_item == position * 1) {--%>
<%--                accept = confirm("Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?");--%>
<%--                if (accept) {--%>
<%--                    if (cart.length == 1) {--%>
<%--                        $('.detail_cart').remove()--%>
<%--                    }--%>
<%--                    cartTemp.value.items.splice(i, 1)--%>
<%--                    localStorage.setItem('PPMiniCart', encodeURIComponent(JSON.stringify(cartTemp)))--%>
<%--                    $(`.cart-item_${position}`).remove()--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
</body>

</html>