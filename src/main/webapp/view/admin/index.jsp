<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.InventoriesDAO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.time.Instant" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Duration" %><%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Bảng điều khiển | ADMIN</title>
    <%@include file="../../common/admin/head.jsp"%>
</head>
<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp"%>

<%@include file="../../common/admin/sidebar.jsp"%>
<%
    List<InventoriesModel> inventoriesList = (List<InventoriesModel>) InventoriesDAO.getListProductsOutOfStock(10);
    List<InventoriesModel> inventoriesList2 = (List<InventoriesModel>) InventoriesDAO.getListProductsStockForALongTime();
%>
<main class="app-content">
    <div class="row">
        <div class="col-md-12">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><a href="#"><b>Bảng điều khiển</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
        </div>
    </div>
    <div class="row">
        <!--Left-->
        <div class="col-md-12 col-lg-6">
            <div class="row">
                <!-- col-6 -->
                <div class="col-md-6">
                    <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
                        <div class="info">
                            <h4>Tổng khách hàng</h4>
                            <p><b>56 khách hàng</b></p>
                            <p class="info-tong">Tổng số khách hàng được quản lý.</p>
                        </div>
                    </div>
                </div>
                <!-- col-6 -->
                <div class="col-md-6">
                    <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
                        <div class="info">
                            <h4>Tổng sản phẩm</h4>
                            <p><b>1850 sản phẩm</b></p>
                            <p class="info-tong">Tổng số sản phẩm được quản lý.</p>
                        </div>
                    </div>
                </div>
                <!-- col-6 -->
                <div class="col-md-6">
                    <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
                        <div class="info">
                            <h4>Tổng đơn hàng</h4>
                            <p><b>247 đơn hàng</b></p>
                            <p class="info-tong">Tổng số hóa đơn bán hàng trong tháng.</p>
                        </div>
                    </div>
                </div>
                <!-- col-6 -->
                <div class="col-md-6">
                    <div class="widget-small danger coloured-icon"><i class='icon bx bxs-error-alt fa-3x'></i>
                        <div class="info">
                            <h4>Sắp hết hàng</h4>
                            <p><b>4 sản phẩm</b></p>
                            <p class="info-tong">Số sản phẩm cảnh báo hết cần nhập thêm.</p>
                        </div>
                    </div>
                </div>
                <% if (inventoriesList == null) {
                %>
                <div>Chưa có dữ liệu</div>
                <%
                } else {

                %>
                <!-- col-12 -->
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Sản phẩm sắp hết hàng</h3>
                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Ảnh</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <%
                                for (InventoriesModel list : inventoriesList) {

                                    %>
                                <tr>
                                    <td><%=list.getIdProduct()%></td>
                                    <td><%=list.getName()%></td>
                                    <td>
                                    <img src="<% out.print("../images/product/"+list.getAvatar());%>"
                                         alt="" width="100px;" class="avatar">
                                    </td>
                                    <td><%=list.getPrice()%>₫</td>
                                    <%if (list.getQuantity()<4){%>
                                    <td><span class="badge bg-danger"><%=list.getQuantity()%></span></td>
                                    <% }else{%>
                                    <td><span class="badge bg-warning"><%=list.getQuantity()%></span></td>
                                    <%}%>
                                </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                        <!-- / div trống-->
                    </div>
                </div>
                <!-- / col-12 -->
                <%}%>
                <% if (inventoriesList2 == null) {
                %>
                <div>Chưa có dữ liệu</div>
                <%
                } else {

                %>
                <!-- col-12 -->
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Sản phẩm tồn kho lâu</h3>
                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Ảnh</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Ngày giờ nhập</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    Date serverTime = new Date();
                                    Timestamp currentDate = new Timestamp(serverTime.getTime());
                                    LocalDate localDateCurrent = currentDate.toLocalDateTime().toLocalDate();

                                    for (InventoriesModel list : inventoriesList2) {
                                        Timestamp modifiedDate = Timestamp.valueOf(list.getModifiedDate());
                                        LocalDate localDateModified = modifiedDate.toLocalDateTime().toLocalDate();
                                        long daysBetween = Duration.between(localDateCurrent.atStartOfDay(), localDateModified.atStartOfDay())
                                                .toDays();
                                        int day = (int) Math.abs(daysBetween);
                                        if (day>365){
                                %>
                                <tr>
                                    <td><%=list.getIdProduct()%></td>
                                    <td><%=list.getName()%></td>
                                    <td>
                                        <img src="<% out.print("../images/product/"+list.getAvatar());%>"
                                             alt="" width="100px;" class="avatar">
                                    </td>
                                    <td><%=list.getPrice()%>₫</td>
                                    <%if (list.getQuantity()<4){%>
                                    <td><span class="badge bg-danger"><%=list.getQuantity()%></span></td>
                                    <% }else{%>
                                    <td><span class="badge bg-warning"><%=list.getQuantity()%></span></td>
                                    <%}%>
                                    <td><%=day%></td>
                                </tr>
                                <%}}%>
                                </tbody>
                            </table>
                        </div>
                        <!-- / div trống-->
                    </div>
                </div>
                <!-- / col-12 -->
                <%}%>

                <!-- col-12 -->
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Khách hàng mới</h3>
                        <div>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên khách hàng</th>
                                    <th>Ngày sinh</th>
                                    <th>Số điện thoại</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>#183</td>
                                    <td>Nguyễn Minh Hoàng</td>
                                    <td>21/7/1992</td>
                                    <td><span class="tag tag-success">0921387221</span></td>
                                </tr>
                                <tr>
                                    <td>#219</td>
                                    <td>Trần Thị Hoài</td>
                                    <td>30/4/1975</td>
                                    <td><span class="tag tag-warning">0912376352</span></td>
                                </tr>
                                <tr>
                                    <td>#627</td>
                                    <td>Trần Thu Hằng</td>
                                    <td>12/3/1999</td>
                                    <td><span class="tag tag-primary">0128732665</span></td>
                                </tr>
                                <tr>
                                    <td>#175</td>
                                    <td>Nguyễn Tiến Phát</td>
                                    <td>4/12/2000</td>
                                    <td><span class="tag tag-danger">0912376763</span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
                <!-- / col-12 -->
            </div>
        </div>
        <!--END left-->
        <!--Right-->
        <div class="col-md-12 col-lg-6">
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Dữ liệu 6 tháng đầu vào</h3>
                        <div class="embed-responsive embed-responsive-16by9">
                            <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Thống kê 6 tháng doanh thu</h3>
                        <div class="embed-responsive embed-responsive-16by9">
                            <canvas class="embed-responsive-item" id="barChartDemo"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--END right-->
    </div>

    <%@include file="statisticalUser.jsp"%>
    <div class="text-center" style="font-size: 13px">
        <p><b>Copyright
            <script type="text/javascript">
                document.write(new Date().getFullYear());
            </script> Quản lý admin
        </b></p>
    </div>
</main>

<%@include file="../../common/admin/script.jsp"%>
<!--===============================================================================================-->
<script type="text/javascript" src="js/plugins/chart.js"></script>
<script type="text/javascript">
    var data = {
        labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
        datasets: [{
            label: "Dữ liệu đầu tiên",
            fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
            strokeColor: "rgb(255, 212, 59)",
            pointColor: "rgb(255, 212, 59)",
            pointStrokeColor: "rgb(255, 212, 59)",
            pointHighlightFill: "rgb(255, 212, 59)",
            pointHighlightStroke: "rgb(255, 212, 59)",
            data: [20, 59, 90, 51, 56, 100]
        },
            {
                label: "Dữ liệu kế tiếp",
                fillColor: "rgba(9, 109, 239, 0.651)  ",
                pointColor: "rgb(9, 109, 239)",
                strokeColor: "rgb(9, 109, 239)",
                pointStrokeColor: "rgb(9, 109, 239)",
                pointHighlightFill: "rgb(9, 109, 239)",
                pointHighlightStroke: "rgb(9, 109, 239)",
                data: [48, 48, 49, 39, 86, 10]
            }
        ]
    };
    var ctxl = $("#lineChartDemo").get(0).getContext("2d");
    var lineChart = new Chart(ctxl).Line(data);

    var ctxb = $("#barChartDemo").get(0).getContext("2d");
    var barChart = new Chart(ctxb).Bar(data);
</script>
</body>

</html>