<%@ page import="vn.edu.hcmuaf.fit.service.StatisticalService" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.AccountService" %><%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 27/05/2023
  Time: 6:58 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .tabs .tab-item.active {
            background-color: #ffffff;
        }

        .tabs .tab-item {
            padding: 5px 10px;
            text-align: center;
            border-radius: 4px;
            font-size: 15px;
            min-width: 80px;
            cursor: pointer;
            max-width: 100px
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>

<body>
<%--  Bảng điều khiển người dùng  --%>
<%
    List<String> dailyStatistics = StatisticalService.getDailyStatisticsAccess();
    String dailyXValues = dailyStatistics.get(0);
    String dailyYValues = dailyStatistics.get(1);

    List<String> monthlyStatistics = StatisticalService.getMonthlyStatisticsAccess();
    String monthlyXValues = monthlyStatistics.get(0);
    String monthlyYValues = monthlyStatistics.get(1);

    List<String> yearlyStatistics = StatisticalService.getYearlyStatisticsAccess();
    String yearlyXValues = yearlyStatistics.get(0);
    String yearlyYValues = yearlyStatistics.get(1);

    List<Map<String, Object>> ipWarningStatistics = StatisticalService.ipWarningStatistics();

    List<Map<String, Object>> userWarningStatistics = StatisticalService.userWarningStatistics();
%>
<div class="row">
    <div class="col-md-12">
        <div class="app-title">
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><a href="#"><b>Thống kê người dùng</b></a></li>
            </ul>
            <div id=""></div>
        </div>
    </div>
</div>
<div class="row">
    <!--Left-->
    <div class="col-md-12 col-lg-6">
        <div class="row">
            <div class="col-md-12">
                <%--Bảng ip đăng nập sai nhiều lần--%>

                    <div class="tile">
                        <h3 class="tile-title">Địa chỉ ip đăng nhập sai nhều lần</h3>
                        <div>
                            <% if (ipWarningStatistics == null) {%>
                            <div>Chưa có tài khoản nào</div>
                            <%} else {%>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Địa chỉ IP</th>
                                    <th>Số lần cảnh báo</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% for (Map<String, Object> data : ipWarningStatistics) {%>
                                <tr>
                                    <td><%=data.get("ip")%>
                                    </td>
                                    <td><%=data.get("amount")%>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                            <%}%>
                        </div>
                    </div>
                <%--Bảng user đăng nhập sai nhiều lần--%>
                    <div class="tile">
                        <h3 class="tile-title">User đăng nhập sai nhều lần</h3>
                        <div>
                            <% if (userWarningStatistics == null) {%>
                            <div>Chưa có tài khoản nào</div>
                            <%} else {%>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>ID user</th>
                                    <th>Name user</th>
                                    <th>Trạng thái tài khoản</th>
                                    <th>Số lần cảnh báo</th>
                                    <th>Cập nhật lần cuối</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% for (Map<String, Object> data : userWarningStatistics) {%>
                                <tr>
                                    <%
                                        String id_user_warning =(String) data.get("id");
                                        boolean isLocked = (Boolean) data.get("locked");
                                        String statusUser = "";
                                        if(isLocked){
                                            statusUser = "Đã khóa";
                                        }else{
                                            statusUser = "Đang hoạt động";
                                        }
                                        UserModel user_warning = AccountService.getUserById(id_user_warning);
                                        String name_user_warning = user_warning.getName();
                                    %>
                                    <td>
                                        <a href="manage-account?action=profile-user&id-user=<%=id_user_warning%>" style="display: flex; align-items: center;">
                                            <p title="Xem chi tiết" style="margin: 0; padding-left: 20px; font-size: 17px">#<%=id_user_warning%></p>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="manage-account?action=profile-user&id-user=<%=id_user_warning%>" style="display: flex; align-items: center;">
                                            <p title="Xem chi tiết" style="margin: 0; padding-left: 20px; font-size: 17px"><%=name_user_warning%></p>
                                        </a>
                                    </td>
                                    <td><%=statusUser%></td>
                                    <td><%=data.get("amount")%></td>
                                    <td><%=data.get("modified_date")%></td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                            <%}%>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    <!--END left-->

    <!--Right-->
    <div class="col-md-12 col-lg-6">
        <div class="col-md-12">
            <div class="tile">
                <h3 style="display: flex; justify-content: space-between;" class="tile-title">
                    <div style="line-height: 34px;">Thống kê số lượng truy cập</div>
                    <div class="tabs"
                         style="display: flex; min-width: 246px; max-width: 342px;padding: 3px; border-radius: 5px; background-color: #ededef">
                        <div class="tab-item active">
                            <b>Ngày</b>
                        </div>

                        <div class="tab-item">
                            <b>Tháng</b>
                        </div>

                        <div class="tab-item">
                            <b>Năm</b>
                        </div>
                    </div>
                </h3>
                <div class="tab-content">
                    <div class="tab-pane active">
                        <div class="embed-responsive">
                            <canvas id="statiscalUserChartDay" style="width:100%;max-width:600px"></canvas>
                        </div>
                    </div>

                    <div class="tab-pane">
                        <div class="embed-responsive">
                            <canvas id="statiscalUserChartMonth" style="width:100%;max-width:600px"></canvas>
                        </div>
                    </div>

                    <div class="tab-pane">
                        <div class="embed-responsive">
                            <canvas id="statiscalUserChartYear" style="width:100%;max-width:600px"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--END right-->
</div>
<script>
    // Chuẩn bị dữ liệu cho biểu đồ
    var xValuesDay = <%=dailyXValues%>;
    var yValuesDay = <%=dailyYValues%>;
    ;

    var barColors = "#5fa0f5";
    new Chart("statiscalUserChartDay", {
        type: "bar",
        data: {
            labels: xValuesDay,
            datasets: [{
                backgroundColor: barColors,
                data: yValuesDay
            }]
        },
        options: {
            legend: {display: false},
            title: {
                display: true,
                text: "Số lượng truy cập các ngày gần đây"
            }
        }
    });


    var xValuesMonth = <%=monthlyXValues%>;
    var yValuesMonth = <%=monthlyYValues%>;
    new Chart("statiscalUserChartMonth", {
        type: "bar",
        data: {
            labels: xValuesMonth,
            datasets: [{
                backgroundColor: barColors,
                data: yValuesMonth
            }]
        },
        options: {
            legend: {display: false},
            title: {
                display: true,
                text: "Số lượng truy cập các tháng gần đây"
            }
        }
    });

    var xValuesYear = <%=yearlyXValues%>;
    var yValuesYear = <%=yearlyYValues%>;
    new Chart("statiscalUserChartYear", {
        type: "bar",
        data: {
            labels: xValuesYear,
            datasets: [{
                backgroundColor: barColors,
                data: yValuesYear
            }]
        },
        options: {
            legend: {display: false},
            title: {
                display: false,
                text: "Số lượng truy cập các năm gần đây"
            }
        }
    });

    const tabs = document.querySelectorAll('.tab-item');
    const panes = document.querySelectorAll('.tab-pane');

    tabs.forEach((tab, index) => {
        const pane = panes[index];
        tab.onclick = function () {
            document.querySelector('.tab-item.active').classList.remove('active')
            document.querySelector('.tab-pane.active').classList.remove('active')

            this.classList.add('active')
            pane.classList.add('active')
        }
    })
</script>
</body>
</html>
