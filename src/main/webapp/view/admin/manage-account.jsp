<%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 17/02/2023
  Time: 7:05 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.AccountService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Quản lý tài khoản | ADMIN</title>
  <%@include file="../../common/admin/head.jsp" %>
</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->

<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<%
  List<User> listAccount = (List<User>) request.getAttribute("listAcc");
%>
<%@include file="../../common/admin/sidebar.jsp" %>
<main class="app-content">
  <div class="app-title">
    <ul class="app-breadcrumb breadcrumb side">
      <li class="breadcrumb-item active"><a href="manage-blog.jsp"><b>Quản lý tài khoản</b></a></li>
    </ul>
    <div id="clock"></div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <div class="row element-button">
            <div class="col-sm-2">

              <a class="btn btn-add btn-sm" href="manage-account.jsp?action=add" title="Thêm"><i
                      class="fas fa-plus"></i>
                Tạo mới</a>
            </div>

            <div class="col-sm-2">
              <a class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="myFunction(this)"><i
                      class="fas fa-trash-alt"></i> Xóa tất cả </a>
            </div>
          </div>
          <%--  danh sách người dùng --%>
          <% if (listAccount == null){
          %>
          <div>Chưa có tài khoản nào</div>
          <%
          }else {%>
          <table class="table table-hover table-bordered" id="sampleTable">
            <thead>
            <tr>
              <th width="10"><input type="checkbox" id="all"></th>
              <th>ID</th>
              <th>Name</th>
              <th>Username</th>
              <th>Email</th>
              <th>Tel</th>
              <th>Sex</th>
              <th>Address</th>
              <th>Chức năng</th>
            </tr>
            </thead>
            <tbody>
            <%
              for (User acc :
                      listAccount) {%>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td><%=acc.getId()%></td>
              <td><%=acc.getName()%></td>
              <td><%=acc.getUsername()%></td>
              <td><%=acc.getEmail()%></td>
              <td><%=acc.getTel()%></td>
              <td><%=acc.getSex()%></td>
              <td><%=acc.getAddress()%></td>
              <td>
                <%--chức năng xóa người dùng--%>
                <a class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                   href="manage-blog?action=delete&id=<%=acc.getId()%>"><i class="fas fa-trash-alt"></i></a>

                <%-- chức năng sửa thông tin người dùng--%>
                <a href="manage-blog?action=edit-blog&id-blog=<%=acc.getId()%>               ">
                  <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                          id="show-confirm"
                          data-toggle="modal" data-target="#ModalConfirm"><i class="fas fa-edit"></i>
                  </button>
                </a>
              </td>
            </tr>
            <%
              }%>
            </tbody>
          </table>
          <%
            }%>
        </div>
      </div>
    </div>
  </div>
</main>

<!--
<%@include file="../../common/admin/script.jsp" %>
-->

<!-- Essential javascripts for application to work-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<script src="js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="../../admin/doc/js/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
<script>
  function deleteRow(r) {
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(i);
  }

  jQuery(function () {
    jQuery(".trash").click(function () {
      swal({
        title: "Cảnh báo",

        text: "Bạn có chắc chắn là muốn xóa?",
        buttons: ["Hủy bỏ", "Đồng ý"],
      })
              .then((willDelete) => {
                if (willDelete) {
                  swal("Đã xóa thành công.!", {});
                }
              });
    });
  });
  oTable = $('#sampleTable').dataTable();
  $('#all').click(function (e) {
    $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
    e.stopImmediatePropagation();
  });

  // print data
  var myApp = new function () {
    this.printTable = function () {
      var tab = document.getElementById('sampleTable');
      var win = window.open('', '', 'height=700,width=700');
      win.document.write(tab.outerHTML);
      win.document.close();
      win.print();
    }
  }

</script>

</body>

</html>