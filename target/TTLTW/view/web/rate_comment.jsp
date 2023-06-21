<%@ page import="vn.edu.hcmuaf.fit.model.ProductModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="../../common/web/head.jsp" %>
    <title>Đánh giá và nhận xét | Phone Care</title>

</head>

<body>
<%    ProductModel product = (ProductModel) request.getAttribute("product");%>
<%@include file="../../common/web/header.jsp" %>

<%--                    RATE & REVIEW           --%>
<div class="rate-and-review">
    <form action="rate-comment?id-product=<%=product.getId()%>" class="wrapper" method="post">
        <div class="master">
            <h2>Bạn cảm thấy sản phẩm này như thế nào?</h2>
            <div class="rating-component">
                <div class="status-msg">
                    <label>
                        <input class="rating_msg" type="hidden" name="rating_msg" value=""/>
                    </label>
                </div>
                <div class="stars-box">
                    <i class="star fa fa-star" title="1 star" data-message="Rất tệ"
                       data-value="1"></i>
                    <i class="star fa fa-star" title="2 stars" data-message="Tệ"
                       data-value="2"></i>
                    <i class="star fa fa-star" title="3 stars" data-message="Trung bình"
                       data-value="3"></i>
                    <i class="star fa fa-star" title="4 stars" data-message="Tốt"
                       data-value="4"></i>
                    <i class="star fa fa-star" title="5 stars" data-message="Rất tốt"
                       data-value="5"></i>
                </div>
                <div class="starrate">
                    <label>
                        <input class="ratevalue" type="hidden" name="rate_value" value=""/>
                    </label>
                </div>
            </div>

            <div class="feedback-tags">
                <div class="tags-container" data-tag-set="1">
                    <div class="question-tag">
                        Tại sao bạn lại có trải nghiệm tệ?
                    </div>
                </div>
                <div class="tags-container" data-tag-set="2">
                    <div class="question-tag">
                        Tại sao bạn lại có trải nghiệm tệ?
                    </div>

                </div>

                <div class="tags-container" data-tag-set="3">
                    <div class="question-tag">
                        Tại sao bạn lại có trải nghiệm ở mức trung bình?
                    </div>
                </div>
                <div class="tags-container" data-tag-set="4">
                    <div class="question-tag">
                        Tại sao bạn lại đánh giá sản phẩm tốt?
                    </div>
                </div>

                <div class="tags-container" data-tag-set="5">
                    <div class="make-compliment">
                        <div class="compliment-container">
                            Để lại bình luận chi tiết
                            <i class="far fa-smile-wink"></i>
                        </div>
                    </div>
                </div>

                <div class="tags-box">
                    <input type="text" class="tag form-control" name="comment"
                           id="inlineFormInputName" placeholder="Nhập bình luận của bạn...">
                    <input type="hidden" name="product_id" value="<%=product.getId()%>"/>
                </div>

            </div>

            <div class="button-box">
                <input type="submit" class="done btn btn-warning" disabled="disabled"
                       value="Bình luận"/>
            </div>

            <div class="submited-box">
                <div class="loader"></div>
                <div class="success-message">
                    Cảm ơn bạn!
                </div>
            </div>
        </div>
    </form>
</div>

<%@include file="../../common/web/footer.jsp" %>
<script src="js/rate&review.js"></script>

</body>

</html>