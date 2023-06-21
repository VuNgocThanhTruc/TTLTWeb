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
            border-left: 3px solid #f2f6fc;
        }

        .log-check-0.log-INFO{
            font-weight: bolder;
            background-color: #d2e8ff;
            border-left: 3px solid #61aeff;
        }
        .log-check-0.log-ALERT{
            font-weight: bolder;
            background-color: #d2e8ff;
            border-left: 3px solid #fff565;
        }
        .log-check-0.log-WARNING{
            font-weight: bolder;
            background-color: #d2e8ff;
            border-left: 3px solid #ffdebd;
        }
        .log-check-0.log-DANGER{
            font-weight: bolder;
            background-color: #d2e8ff;
            border-left: 3px solid #ff0000;
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
        .fm-col{
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 200px;
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
            <li class="breadcrumb-item active"><a href="manage-log"><b>Quản lý log</b></a></li>
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
                        <div class="col-sm-2">
                                <a href="export-excel?type=exportLogExcel" class="btn" type="button" title="Xuất dữ liệu"
                                   style="line-height: 0px;border: 1px solid #000000; font-size: 13px; padding: 5px 10px"
                                ><i class='bx bxs-file-export'></i> Xuất Excel</a>
                        </div>

                            <div id="function-btn" style="justify-content: space-between;display: none">
                                <div style="margin-left: 8px">
                                    <%--  Các chức năng  --%>
                                    <button style="width: 90px; height: 32px" class="btn btn-primary btn-sm trash" name="action"
                                            value="delete" type="submit" title="Xóa">
                                        <i class="fas fa-trash-alt"></i> Xóa
                                    </button>
                                    <button id="log-checked-all" style="background-color: #28a745; color: #fff;width: 90px; height: 32px; margin-left: 5px"
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
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active">
                            <form id="log-form">

                                <!-- danh sách log -->
                                <% if (logs == null) { %>
                                <div>Chưa thiết lập quyền nào</div>
                                <% } else { %>
                                <table style="font-size: 14px" class="table table-hover table-bordered" id="logTable">
                                    <thead>
                                        <tr>
                                            <th width="10"><input type="checkbox" id="all"></th>
                                            <th width="70px">Mức độ</th>
                                            <th width="50px">Id user</th>
                                            <th width="70px">IP Address</th>
                                            <th width="100px">Src</th>
                                            <th width="100px">Title</th>
                                            <th width="100px">Thời gian tạo</th>
                                            <th>Trạng thái</th>
                                            <th style="text-align: center" title="Xem chi tiết">Xem</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%for (Log log : logs) {%>
                                    <tr style="font-weight: bold" class="log-check-<%=log.getStatus()%> log-<%=log.getLevelWithName()%>">
                                        <td width="10"><input type="checkbox" name="check-log" class="select-log" value="<%=log.getId()%>"></td>
                                        <td><%=log.getLevelWithName()%>
                                        </td>
                                        <td class="fm-col"><%=log.getId_user()%>
                                        </td>
                                        <td class="fm-col"><%=log.getIp_address()%>
                                        </td>
                                        <td class="fm-col"><%=log.getSrc()%>
                                        </td>
                                        <td class="fm-col"><%=log.getTitle()%>
                                        </td>
                                        <td class="fm-col"><%String formattedDate = formatter.format(log.getCreate_at());%>
                                            <%=formattedDate%>
                                        </td>
                                        <td class="status-log fm-col"><%=log.getNameStatus()%>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Data table plugin-->
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#logTable').DataTable();</script>

<script>
    // select all checkbox
    $('#all').click(function (e) {
        console.log("click")
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

    //Đánh dấu đã kiểm tra tất cả các log

    $(document).ready(function() {
        $('#log-checked-all').click(function(e) {
            setCheckedAllLog()
            $('input[type="checkbox"]:checked').each(function() {
                var trElement = $(this).closest('tr')
                trElement.css('background-color', '#ffffff');
                trElement.find('.status-log').text('Đã kiểm tra');
            });
        });
    });

    function setCheckedAllLog() {
        var logCheckboxes = document.getElementsByName("check-log");
        var logIds = Array.from(logCheckboxes).filter(function(checkbox) {
            return checkbox.checked;
        }).map(function(checkbox) {
            return checkbox.value;
        });

        var params = "" + logIds.join(",");

        $.ajax({
            url: 'manage-log',
            method: 'GET',
            data: {
                action: "changeCheckedAllLog", checkbox: params
            }
        });
    }
</script>

</body>
</html>
