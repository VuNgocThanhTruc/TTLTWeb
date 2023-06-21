<%--
  Created by IntelliJ IDEA.
  User: vutru
  Date: 12/8/2022
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .amount-notyfy{
            background: #ff0000;
            border-radius: 100%;
            text-align: center;
            padding : 4px 3px 2px 2px;
            position: absolute;
            width: 20px;
            height: 20px;
            font-size: 14px;
            top: -10px;
            left: 12px;
            font-weight: 500;
            display: none;
        }
        .notification_container{
            width: 450px;
            list-style-type: none;
            box-shadow: 0 -4px 32px rgba(0,0,0,.2);
            color: #1d2129;
            overflow: hidden;
            padding: 0;
            border-radius: 10px;
            animation: notify_animation .4s ease;
        }
        .notification_container header{
            align-items: center;
            display: flex;
            justify-content: space-between;
            padding: 16px 20px;
        }
        .notification_btn_view{
            background: transparent;
            border-radius: 4px;
            color: #f31c0b;
            cursor: pointer;
            font-size: 18px;
            margin-left: auto;
            padding: 8px;
            border: none;
            box-shadow: none;
            display: block;
            outline: none;
        }
        .notification_btn_view:hover{
            background-color: rgba(22,24,35,.05);
        }
        .notification_content{
            max-height: 68vh;
            overflow-y: auto;
            overscroll-behavior: contain;
        }
        .notification_avatar{
            border-radius: 50%;
            flex-shrink: 0;
            height: 48px;
            position: relative;
            width: 48px;
        }
        .notification_avatar img{
            border-radius: 50%;
            height: 50px;
            object-fit: cover;
            width: 50px;
        }
        .notification_message{
            color: #000;
            flex: 1 1;
            font-size: 18px;
            line-height: 18px;
            padding: 0 10px 0 20px;
            word-break: break-word;
            text-align: left;
            font-weight: 400;
        }
        .notification_createdTime {
            color: #f31c0b;
            font-size: 14px;
            font-weight: 600;
            margin-top: 6px;
        }
        .notification_item{
            background-color: #fff;
            border-radius: 10px;
            cursor: default;
            display: flex;
            flex-direction: row;
            margin: 0 8px;
            padding: 8px 36px 8px 12px;
            transition: background-color .3s;
            align-items: center;
            cursor: pointer;
            margin-bottom: 8px;
            min-height: 75px;
        }

        .notification_item:hover{
            background-color: rgba(22,24,35,.05);
        }
        #notify{
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }
        .notify_checked{
           background-color:  #f7e5e4;
        }
        .notification_empty{
            text-align: center;
            padding-bottom: 20px;
        }
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background-color: #f1f1f1;
        }

        ::-webkit-scrollbar-thumb {
            background-color: #cccccc;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background-color: #555;
        }

        @keyframes notify_animation {
            from {
                opacity: 0;
                transform: translateY(-8px);
            }to {
               opacity: 100;
               transform: translateY(0);
            }
        }
    </style>
</head>
<body>
<% String getPath = (String) request.getContextPath(); %>
<header class="app-header">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                    aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">
        <!-- User Menu-->
        <li>
            <div style="padding: 14px 30px;">
                    <i id="notify" style="color: #fff; font-size: 20px; position: relative ;cursor: pointer;" class="fas fa-bell">
                        <div class="amount-notyfy"><span id="notify-amount">0</span></div>
                        <div id="notification" style="position: absolute; display: none;right: 0; top: 30px; background-color: #fff; border-radius: 10px; font-family:'Segoe UI',sans-serif,'Apple Color Emoji','Segoe UI Emoji','Segoe UI Symbol';">
                            <ul class="notification_container">
                                <header>
                                    <h4>Thông báo</h4>
                                    <button id="notification-checked-all" style="outline: none" class="notification_btn_view">Đánh dấu đã đọc</button>
                                </header>
                                <div class="notification_content">
                                </div>
                            </ul>
                        </div>
                    </i>
            </div>
        </li>
        <li>
            <a class="app-nav__item" href="<%=getPath%>/signin"><i class='bx bx-log-out bx-rotate-180'></i> </a>
        </li>
    </ul>
</header>
<script>
    /* toggle modal thông báo */
    $(document).ready(function(){
        $("#notify").click(function(){
            $("#notification").toggle();
        });

        $(".notification_container").click(function(event){
            event.stopPropagation();
        });
    });

    /* Nhận và kiểm tra có thông báo theo thời gian thực */
    $(document).ready(function(){
        function checkNewNotifications(){
            notificationAjax()
        }
    });
    setInterval(checkNewNotifications, 3000);
    function notificationAjax() {
        $.ajax({
            url: "notification",
            data: {action: "checkNewNotify"},
            type: "GET",
            success: function(response) {
                if (response === "true") {
                    loadNotificationAdmin();
                }
            }
        });
    }

    /*Load các thông báo lên admin*/
    loadNotificationAdmin();
    var notify_amount = document.querySelector("#notify-amount")
    var notify_content = document.querySelector(".notification_content")
    function loadNotificationAdmin() {
        $.ajax({
            url: "notification",
            data: {action: "loadNotifyAdmin"},
            type: "GET",
            success: function(response) {
                notify_amount.innerHTML = response.notifyLength
                notify_content.innerHTML = response.notifyContent
            },
            error: function(xhr, status, error) {
                console.error("Lỗi khi tải các thông báo lên admin: " + error);
            }
        });
        /*Nếu có thông báo chưa đọc thì mới hiển thị số lượng*/
        $(document).ready(function() {
            var notifyAmount = parseInt($('#notify-amount').text());

            if (notifyAmount === 0) {
                $('.amount-notyfy').hide();
            } else {
                $('.amount-notyfy').show();
            }
        });
    }

    /*Đánh dấu đã đọc thông báo*/
    $(document).ready(function() {
        $('.notification-link').click(function(e) {
            e.preventDefault();
            var notificationId = $(this).data('notification-id');
            // Đánh dấu thông báo đã được đọc trong bảng notifications
            setCheckedNotify(notificationId);
            //Xóa background chưa đọc
            $(this).find('.notification_item').removeClass('notify_checked');
            // Chuyển hướng đến liên kết
            window.location.href = $(this).attr('href');
        });
    });

    function setCheckedNotify(notificationId) {
        $.ajax({
            url: 'notification',
            method: 'GET',
            data: {
                notificationId: notificationId, action: "changeCheckedNotify"
            }
        });
    }

    //Đánh dấu đã đọc tất cả các thông báo
    $(document).ready(function() {
        $('#notification-checked-all').click(function(e) {
            setCheckedAllNotify()
            loadNotificationAdmin();
        });
    });

    function setCheckedAllNotify() {
        $.ajax({
            url: 'notification',
            method: 'GET',
            data: {
                action: "changeCheckedAllNotify"
            }
        });
    }
</script>
</body>
</html>
