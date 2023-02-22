<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <%@include file="../../common/web/head.jsp" %>
    <link rel="stylesheet" href="././css/sign.css">
    <title>Đăng nhập | Phone Care</title>

</head>

<body>
<%@include file="../../common/web/header.jsp" %>
<% String mess = (String) session.getAttribute("mess"); %>

<!--Content-->
<div class="content">
    <section class="signin ">
        <div class="container">
            <div class="signin-left">
                <div class="sign-title">
                    <h1>Đăng nhập</h1>
                </div>
            </div>
            <div class="signin-right " id="a-sign">
                <form action="login?action=login" method="post">
                    <%if (mess == "errorsignin") { %>
                    <div class="alert alert-danger">
                        <strong>Tài khoản hoặc Email</strong> hoặc <strong>mật khẩu </strong>không chính xác
                    </div>
                    <%}%>
                    <div class="username form-control1 ">
                        <input type="text" id="username" name="username" placeholder="Tài khoản hoặc Email">
                    </div>
                    <div class="password form-control1">
                        <input type="password" id="password" name="password" placeholder="Mật khẩu">
                        <!--                        <div class="error" style="position: absolute; bottom: 0;background: #fff; padding:10px; border:1px solid #ccc; color: red">Please fill out this field </div>-->
                    </div>
                    <div class="submit">
                        <input type="submit" value="Đăng nhập" id="submit"/>

                        <div class="forgetpassword">
                            <a href="getPassword">Quên mật khẩu?</a> hoặc <a href="signup">Đăng ký</a>
                        </div>
                    </div>
                    <br>
                    <div>
<%--                                                <button type="button" class="btn btn-sm btn-outline-primary" onlogin="checkLoginState()";>Login with Facebook <i class="fa fa-facebook-square"></i></button>--%>
                        <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">Login with Facebook
                        </fb:login-button>

                                                <button type="button" class="btn btn-sm btn-outline-danger" onclick="login()"><i class="fa fa-google-plus-square"></i>Login with với Google </button>

<%--                        <a style="text-decoration:none;" id="mySignin" onclick="login()"><span><img--%>
<%--                                src="image/mangXH/g+.png" alt="google" width="30px" height="30px"/></span><strong--%>
<%--                                style="margin-top:7px;color:red;margin-left:4px"> Google+</strong></a>--%>
                    </div>

                </form>
            </div>


        </div>
    </section>


</div>

<script>
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
        if (response.status === 'connected') {
            testAPI();
        } else {
            document.getElementById('status').innerHTML = 'Please log ' +
                'into this app.';
        }
    }

    function checkLoginState() {
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });

        FB.api('/me', {fields: ' name, email,birthday,gender'}, function (response) {
            console.log(response);
            window.location.href = 'login?action=Face&name=' + response.name + '&email=' + response.email + '&id=' + response.id;
        });
    }

    window.fbAsyncInit = function () {
        FB.init({
            appId: '5842543845823968',
            cookie: true,
            xfbml: true,
            version: 'v16.0'
        });


        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });

    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    function testAPI() {
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me', function (response) {
            console.log('Successful login for: ' + response.name);
            document.getElementById('status').innerHTML =
                'Thanks for logging in, ' + response.name + '!';
        });
    }
</script>

<!-- Script google login  -->
<script type="text/javascript">
    function login() {
        var myParams = {
            'clientid': '766570468302-3r7u9mli21vjoc9ai0cauniujd89prbp.apps.googleusercontent.com',
            'cookiepolicy': 'single_host_origin',
            'callback': 'loginCallback',
            'approvalprompt': 'force',
            'scope': 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.profile.emails.read'
        };
        gapi.auth.signIn(myParams);
    }

    function loginCallback(result) {
        if (result['status']['signed_in']) {
            var request = gapi.client.plus.people.get(
                {
                    'userId': 'me'
                });
            request.execute(function (resp) {
                console.log(resp.emails[0].value);
                console.log(resp.displayName);
                console.log(resp.name.givenName);
                console.log(resp.image.url);
                console.log(resp.ageRange.max);
                console.log(resp.id);
                console.log(resp.etag);
                console.log(resp);
                if (resp != null) {
                    window.location.href = 'login?action=Google&name=' + resp.name.givenName + '&email=' + resp.emails[0].value + '&id=' + resp.id + '&fullName=' + resp.displayName + '&image=' + resp.image.url + '&age=' + resp.ageRange.max + '&etag=' + resp.etag;
                }
                var email = '';
                if (resp['emails']) {
                    for (i = 0; i < resp['emails'].length; i++) {
                        if (resp['emails'][i]['type'] == 'account') {
                            email = resp['emails'][i]['value'];//here is required email id
                        }
                    }
                }
                var usersname = resp['displayName'];//required name
            });
        }
    }

    function onLoadCallback() {
        gapi.client.setApiKey('AIzaSyBvKg3asprpxMgAVhaonZOjJ_O-bcEoGxw');
        gapi.client.load('plus', 'v1', function () {
        });
    }

</script>

<script type="text/javascript">
    (function () {
        var po = document.createElement('script');
        po.type = 'text/javascript';
        po.async = true;
        po.src = 'https://apis.google.com/js/client.js?onload=onLoadCallback';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(po, s);
    })();
</script>

<%@include file="../../common/web/footer.jsp" %>

</body>

</html>