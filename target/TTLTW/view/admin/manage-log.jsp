<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Log" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 19/04/2023
  Time: 4:16 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../common/admin/head.jsp" %>
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
    <style>
        .tabs .tab-item.active {
            background-color: #ffffff;
        }

        .log-check-0.log-INFO{
            font-weight: bolder;
            background-color: #d2e8ff;
        }
        .log-check-0.log-ALERT{
            font-weight: bolder;
            background-color: #fcf8e3;
        }
        .log-check-0.log-WARNING{
            font-weight: bolder;
            background-color: #ffdebd;
        }
        .log-check-0.log-DANGER{
            font-weight: bolder;
            background-color: #f1c2c2;
        }
        .log-check-1.log-INFO{
            font-weight: 500;
            background-color: #f2f6fc;
        }
        .log-check-1.log-ALERT{
            font-weight: 500;
            background-color: #f2f6fc;
        }
        .log-check-1.log-WARNING{
            font-weight: 500;
            background-color: #f2f6fc;
        }
        .log-check-1.log-DANGER{
            font-weight: 500;
            background-color: #f2f6fc;
        }
        p{
            margin: 0;
        }
    </style>
    <title>Quản lý log | ADMIN</title>
</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<%
    // Lấy ra quyền của từng chức năng
    Boolean isGrantAdd = false;
    Boolean isGrantEdit = false;
    Boolean isGrantDel = false;
    for (FunctionModel function : functions) {
        if (function.getName().equals("Add")) {
            isGrantAdd = auth.getDecentralizeFuncOfRole(idRole, "11", function.getId());
        } else if (function.getName().equals("Edit")) {
            isGrantEdit = auth.getDecentralizeFuncOfRole(idRole, "11", function.getId());
        } else if (function.getName().equals("Delete")) {
            isGrantDel = auth.getDecentralizeFuncOfRole(idRole, "11", function.getId());
        }
    }

    // Lấy ra toàn bộ log
    List<Log> logs = (List<Log>) request.getAttribute("logs");

    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
%>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="manage-blog.jsp"><b>Quản lý log</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <%-- Nav Tab  --%>
                    <div class="row element-button">
                        <%-- Tabs --%>
                        <div class="col-sm-5" style="padding-left: 10px">
                            <div class="tabs"
                                 style="display: flex; min-width: 346px; max-width: 342px;padding: 3px; border-radius: 5px; background-color: #ededef">
                                <div class="tab-item active"
                                     style="padding: 5px 10px; text-align: center ;border-radius: 4px;font-size: 15px;min-width: 170px;cursor: pointer; max-width: 180px">
                                    <b>Thông tin log</b>
                                </div>
                                <div class="tab-item"
                                     style="padding: 5px 10px; text-align: center ;border-radius: 4px;font-size: 15px;min-width: 170px;cursor: pointer; max-width: 180px">
                                    <b>Cảnh báo log</b>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active">
                            <form method="POST" action="/admin/manage-log">
                                <div id="function-btn" style="justify-content: space-between;display: none" class="row element-button">
                                    <div style="margin-left: 18px">
                                        <%--  Các chức năng  --%>
                                        <button style="width: 90px;" class="btn btn-primary btn-sm trash" name="action"
                                                value="delete" type="submit" title="Xóa">
                                            <i class="fas fa-trash-alt"></i> Xóa
                                        </button>
                                        <button style="background-color: #28a745; color: #fff;width: 90px; margin-left: 5px"
                                                class="btn btn-primary btn-sm" name="action" value="check" type="submit"
                                                title="Xóa">
                                            <i class="fas fa-check-square"></i> Đã xem
                                        </button>
                                    </div>
                                    <!--  thông báo  -->
                                    <div>
                                        <div class="notify">
                                            <% if (request.getAttribute("notify") != null) {%>
                                            <%=request.getAttribute("notify")%>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                                <!-- danh sách log -->
                                <% if (logs == null) { %>
                                <div>Chưa thiết lập quyền nào</div>
                                <% } else { %>
                                <table class="table table-hover table-bordered" id="logTable">
                                    <thead>
                                        <tr>
                                            <th width="10"><input type="checkbox" id="all"></th>
                                            <th>Mức độ</th>
                                            <th>Id user</th>
                                            <th>IP Address</th>
                                            <th>Src</th>
                                            <th>Content</th>
                                            <th>Thời gian tạo</th>
                                            <th>Trạng thái</th>
                                            <th>Chi tiết</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%for (Log log : logs) {%>
                                    <tr style="font-weight: bold" class="log-check-<%=log.getStatus()%> log-<%=log.getLevelWithName()%>">
                                        <td width="10"><input type="checkbox" name="check1" class="select-log"></td>
                                        <td><%=log.getLevelWithName()%>
                                        </td>
                                        <td><%=log.getId_user()%>
                                        </td>
                                        <td><%=log.getIp_address()%>
                                        </td>
                                        <td><%=log.getSrc()%>
                                        </td>
                                        <td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px"> <span class="content-log" style="display: inline-block; max-width: 100%;max-height: 19px; overflow: hidden; text-overflow: ellipsis"><%=log.getContent()%></span>
                                        </td>
                                        <td><%String formattedDate = formatter.format(log.getCreate_at());%>
                                            <%=formattedDate%>
                                        </td>
                                        <td class="status-log"><%=log.getNameStatus()%>
                                        </td>
                                        <td style="text-align: center"><a class="link-log" href="manage-log?action=detail-log&id-log=<%=log.getId()%>"><i style="width: 100%;height: 100%" class="fas fa-angle-right"></i></a>
                                        </td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                                <%}%>
                            </form>
                        </div>

                        <div class="tab-pane">
                            <h1>Tab cảnh báo</h1>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</main>

<%@include file="../../common/admin/script.jsp" %>
<!-- Essential javascripts for application to work-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#logTable').DataTable();</script>

<script>
    // select all checkbox
    $('#all').click(function (e) {
        $('#logTable tbody :checkbox').prop('checked', $(this).is(':checked'));
        if ($(this).is(':checked')) {
            $('#function-btn').show();
        } else {
            $('#function-btn').hide();
        }
        e.stopImmediatePropagation();
    });
    //select checkbox
    $(".select-log").change(function() {
        if($(".select-log:checked").length > 0) {
            $('#function-btn').show();
        } else {
            $('#function-btn').hide();
        }
    });


    // chuyển tab
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

    //focus vào thẻ a trong table

    function focusLink(){
        const table = document.getElementById('logTable');
        const cells = table.getElementsByTagName('td');

        for (var i = 0; i < cells.length; i++) {
            cells[i].addEventListener('click', function() {
                this.parentNode.style.backgroundColor = '#f2f6fc';
                this.parentNode.querySelector('.status-log').innerText = 'Đã kiểm tra';
                const link = this.querySelector('a');
                if (link) {
                    link.focus();
                    link.click();
                }
            });
        }
    }

    focusLink();

    const paginate_btns = document.querySelectorAll('.paginate_button')
    paginate_btns.forEach(btn => {
        btn.addEventListener('click', function (){
            focusLink();
        })
    })


</script>

</body>
</html>
