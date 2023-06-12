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
                    <div class="card-body " id="cart-item">
                        <!-- Single item -->
                        <%if (cart == null || cart.isEmpty()) {%>
                        <div>Không có sản phẩm nào trong giỏ hàng</div>
                        <%
                        } else {
                            for (Map.Entry<Integer, ProductCartModel> item : cart.entrySet()) {
                        %>
                        <%--                        <form action="${pageContext.request.contextPath}/cart?action=update-cart" method="post">--%>
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

                                <button type="button" class="btn btn-danger btn-sm me-1 mb-2"
                                        data-mdb-toggle="tooltip"
                                        title="Xóa" name="btn_update" value="delete"
                                        onclick="deleteItemCart(<%=item.getKey()%>)"
                                >
                                    <i class="fas fa-trash"></i>
                                </button>
                                <%--                                <button type="button" class="btn btn-info btn-sm me-1 mb-2"--%>
                                <%--                                        data-mdb-toggle="tooltip"--%>
                                <%--                                        title="Cập nhật" name="btn_update" value="update"--%>
                                <%--                                    <i class="fas fa-save"></i>--%>
                                <%--                                </button>--%>
                                <!-- Data -->
                            </div>

                            <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                <!-- Quantity -->
                                <div class="d-flex mb-4" style="max-width: 300px">
                                    <button class="btn btn-dark px-3 me-2"
                                            onclick="updateItemCart(<%=item.getKey()%>,-1)">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <input type="hidden" name="id_item" value="<%=item.getKey()%>">
                                    <div class="form-outline">
                                        <input id="quantity_<%=item.getKey()%>" min="0" name="quantity"
                                               data-id="<%=item.getKey()%>"
                                               value="<%=item.getValue().getQuantity()%>"
                                               type="number"
                                               class="form-control minicart-quantity <%=item.getKey()%>"/>
                                    </div>

                                    <button class="btn btn-dark px-3 ms-2"
                                            onclick="updateItemCart(<%=item.getKey()%>),1">
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
                        <%--                        </form>--%>
                        <%
                            }%>

                        <%}%>
                        <!-- Single item -->
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
                                <span><strong class="change-cart-summoney">
                            <%
                                float res = 0;
                                if (cart != null)
                                    for (Map.Entry<Integer, ProductCartModel> item : cart.entrySet()) {
                                        res += item.getValue().getSumMoney();
                                    }
                            %>
                                    <%=res%>
                        </strong></span>
                            </li>
                        </ul>

                        <a type="button" class="btn btn-primary btn-lg btn-block" href="checkout">
                            Đặt lịch
                        </a>
                    </div>
                </div>
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
</section>

<%@include file="../../common/web/footer.jsp" %>

<script>
    function deleteItemCart(idItem) {
        let numCart = document.querySelector(".sum-num-cart")
        let listCartEle = document.getElementById('cart-item');
        let cartItemEle = document.querySelector('div.cart-item_' + idItem);

        $.ajax({
            type: 'POST',
            data: {
                "id_item": idItem * 1,
            },
            dataType: 'json',
            url: "<%=request.getContextPath()%>/cart?action=delete-item-cart",
            success: function (data) {
                swal("Giỏ hàng đã được cập nhật!", {
                    buttons: false,
                    timer: 1000,
                    icon: "success",
                });

                numCart.innerText = data.numCart
                cartItemEle.remove()
            }
        });
    }

    function updateItemCart(idItem, type = 0) {
        let inputQuantityEle = document.getElementById('quantity_' + idItem);
        let quantity = inputQuantityEle.value
        let listCartEle = document.getElementById('cart-item');
        let cartItemEle = document.querySelector('div.cart-item_' + idItem);
        let numCart = document.querySelector(".sum-num-cart")

        $.ajax({
            dataType: 'json',
            type: 'POST',
            data: {
                "id_item": idItem * 1,
                "quantity": quantity * 1 + type
            },
            url: "<%=request.getContextPath()%>/cart?action=update-cart",
            success: function (data) {
                swal("Giỏ hàng đã được cập nhật!", {
                    buttons: false,
                    timer: 1000,
                    icon: "success",
                });
                numCart.innerText = data.numCart
                console.log(data)
                for (let i = 0; i < data.listProduct.length; i++) {
                    if (data.listProduct[i].idItem == idItem) {
                        console.log("in if 1")
                        if (data.listProduct[i].quantity == 0) {
                            console.log("in if 2")
                            cartItemEle.remove()
                        } else {
                            console.log("in else if 2")
                            inputQuantityEle.value = data.listProduct[i].quantity
                        }
                    }
                }
            }
        });
    }
</script>
</body>

</html>