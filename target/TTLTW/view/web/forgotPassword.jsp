<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<%@include file="../../common/web/head.jsp" %>
<title>Quên mật khẩu | PhoneCare</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='' rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
body {
	background-position: center;
	background-color: #eee;
	background-repeat: no-repeat;
	background-size: cover;
	color: #505050;
	font-family: "Rubik", Helvetica, Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	line-height: 1.5;
	text-transform: none
}

.forgot {
	background-color: #fff;
	padding: 12px;
	border: 1px solid #dfdfdf
}

.padding-bottom-3x {
	padding-bottom: 72px !important
}

.card-footer {
	background-color: #fff
}

.btn {
	font-size: 13px
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #76b7e9;
	outline: 0;
	box-shadow: 0 0 0 0px #28a745
}
</style>
</head>
<% String mess = (String) session.getAttribute("mess"); %>
<body oncontextmenu='return false' class='snippet-body'>
	<div class="container padding-bottom-3x mb-2 mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<div class="forgot">
					<h2>Quên mật khẩu?</h2>
					<p>Thay đổi mật khẩu của bạn trong ba bước đơn giản. Điều này sẽ giúp bạn bảo mật mật khẩu của mình!</p>
					<ol class="list-unstyled">
						<li><span class="text-primary text-medium">1. </span>Nhập địa chỉ email của bạn dưới đây.</li>
						<li><span class="text-primary text-medium">2. </span>Hệ thống của chúng tôi sẽ gửi mã OTP vào email của bạn</li>
						<li><span class="text-primary text-medium">3. </span>Nhập OTP trên trang tiếp theo</li>
					</ol>
				</div>
				<form class="card mt-4" action="forgotPassword" method="POST">
					<div class="card-body">
						<%if (mess == "error") { %>
						<div class="alert alert-danger">
							<strong> Email</strong> không tồn tại
						</div>
						<%}%>
						<div class="form-group">
							<label for="email-for-pass">Nhập địa chỉ email của bạn</label> <input
								class="form-control" type="text" name="email" id="email-for-pass" required=""><small
								class="form-text text-muted">Nhập địa chỉ email đã đăng ký. Sau đó, chúng tôi sẽ gửi email OTP đến địa chỉ này.</small>
						</div>
					</div>
					<div class="card-footer">
						<button class="btn btn-success" type="submit">Lấy mật khẩu mới</button>
						<button class="btn btn-danger" ><a href="signin" style="color: white"  >Quay lại đăng nhập</a></button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
	<script type='text/javascript' src=''></script>
	<script type='text/javascript' src=''></script>
	<script type='text/Javascript'></script>
</body>
</html>