<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html >

<head>
    <%@include file="../../common/web/head.jsp" %>
    <title>Liên hệ | Phone Care</title>

</head>

<body>
<% String mess = (String) session.getAttribute("mess"); %>
<%@include file="../../common/web/header.jsp" %>


<div class="breadcrumb-shop">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pd5">
                <ol class="breadcrumb breadcrumb-arrows">
                    <li>
                        <a href="index.html">
                            <span>Trang chủ</span>
                        </a>
                    </li>
                    <li>
                        <span><span style="color: #777777">Liên hệ</span></span>
                    </li>
                </ol>
            </div>
        </div>
    </div>
</div>
<section>

    <div class="container">

        <div class="row">
            <div class="col-md-6 col-sm-12 col-xs-12 box-heading-contact">
                <div class="box-map">

                    <!--                        <iframe allowfullscreen=""-->
                    <!--                                height="450" loading="lazy" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.215762226615!2d106.78957711471934!3d10.871187492257217!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1636726820180!5m2!1svi!2s" style="border:0;" width="600"></iframe>-->
                    <iframe allowfullscreen="" frameborder="0" height="700"
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.215762226615!2d106.78957711471934!3d10.871187492257217!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1636726820180!5m2!1svi!2s"
                            style="border:0" width="100%"></iframe>

                    <!--            <iframe-->
                    <!--              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1025.6909825921396!2d106.6854739108858!3d10.782465761154615!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f2e5ba4431f%3A0xa1e4cc4c30b79491!2zSOG6u20gMjMyIFbDtSBUaOG7iyBTw6F1LCBwaMaw4budbmcgNywgUXXhuq1uIDMsIEjhu5MgQ2jDrSBNaW5oLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1566967773757!5m2!1svi!2s"-->
                    <!--              width="100%" height="700" frameborder="0" style="border:0" allowfullscreen=""></iframe>-->
                    <!--                    <a href="https://www.google.com/maps/place/Khoa+C%C3%B4ng+ngh%E1%BB%87+Th%C3%B4ng+tin/@10.873203,106.7892172,17z/data=!3m1!4b1!4m5!3m4!1s0x3174d89fdd1c3b31:0x8f87c513d055215c!8m2!3d10.8731863!4d106.7914061?hl=vi"><img-->
                    <!--                            src="images/bandoNL.png" height="793" width="712"/></a>-->
                </div>
            </div>
            <div class="col-md-6 col-sm-12 col-xs-12  wrapbox-content-page-contact">
                <div class="header-page-contact clearfix">
                    <h1>Liên hệ</h1>
                </div>
                <div class="box-info-contact">
                    <ul class="list-info">
                        <li>
                            <p>Địa chỉ chúng tôi</p>
                            <p><strong>Linh Trung,Tp. Thủ Đức, Tp. Hồ
                                Chí Minh.</strong></p>
                        </li>
                        <li>
                            <p>Email chúng tôi</p>
                            <p><strong>phonecare@gmail.com</strong></p>
                        </li>
                        <li>
                            <p>Điện thoại</p>
                            <p><strong>1800 2057 (Miễn phí)</strong></p>
                        </li>
                        <li>
                            <p>Thời gian làm việc</p>
                            <p><strong>
                                Thứ hai đến chủ nhật: 8h - 20h </strong></p>
                        </li>
                    </ul>
                </div>
                <div class="box-send-contact">
                    <h2>Gửi thắc mắc cho chúng tôi</h2>
                    <%if (mess == "successSend") { %>
                    <div class="alert alert-success">
                        Bạn đã <strong>gửi phản hồi thành công </strong> chúng tôi sẽ nhanh chóng phản hồi lại với bạn
                    </div>
                    <%}%>
                    <div id="col-left contactFormWrapper menuList-links">
                        <form accept-charset="UTF-8" action="contact" class="contact-form" method="post">
                            <div class="contact-form">
                                <div class="row">
                                    <div class="col-sm-12 col-xs-12">
                                        <div class="input-group">
                                            <input class="form-control" placeholder="Tên của bạn" required=""
                                                   type="text" name="name" >
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="input-group">
                                            <input class="form-control" placeholder="Email của bạn" required=""
                                                   type="text" name="email">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="input-group">
                                            <input class="form-control" placeholder="Số điện thoại của bạn" required=""
                                                   type="text" name="tel">
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-xs-12">
                                        <div class="input-group">
                                            <textarea placeholder="Nội dung" name="content"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <button class="button dark" type="submit">Gửi cho chúng tôi</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


    </div>

</section>

<%@include file="../../common/web/footer.jsp" %>

</body>

</html>