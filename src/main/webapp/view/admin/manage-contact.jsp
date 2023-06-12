<%@ page import="vn.edu.hcmuaf.fit.model.BlogModel" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.BlogService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.ContactModel" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ContactService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Quản lý Liên hệ | ADMIN</title>
  <%@include file="../../common/admin/head.jsp" %>
</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<%
  List<ContactModel> listContact = (List<ContactModel>) request.getAttribute("listContact");
  Boolean isGrantAdd = false;
  Boolean isGrantEdit = false;
  Boolean isGrantDel = false;
  for(FunctionModel function : functions){
    if(function.getName().equals("Add")){
      isGrantAdd = auth.getDecentralizeFuncOfRole(idRole,"2",function.getId());
    }else if(function.getName().equals("Edit")){
      isGrantEdit = auth.getDecentralizeFuncOfRole(idRole,"2",function.getId());
    }else if(function.getName().equals("Delete")){
      isGrantDel = auth.getDecentralizeFuncOfRole(idRole,"2",function.getId());
    }
  }
%>

<main class="app-content">
  <div class="app-title">
    <ul class="app-breadcrumb breadcrumb side">
      <li class="breadcrumb-item active"><a href="manage-blog.jsp"><b>Quản lý liên hệ</b></a></li>
    </ul>
    <div id="clock"></div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <div class="row element-button">
          <% if (listContact == null){
          %>
          <div>Chưa có phản hồi </div>
          <%
          }else {%>
          <table class="table table-hover table-bordered" id="sampleTable">
            <thead>
            <tr>
              <th width="10"><input type="checkbox" id="all"></th>
              <th>ID</th>
              <th>Họ và tên</th>
              <th>Số điện thoại</th>
              <th>email</th>
              <th>Nội dung</th>
              <th>Chức năng</th>
            </tr>
            </thead>
            <tbody>
            <%
              for (ContactModel contact :
                      listContact ) {%>
            <tr>
              <td width="10"><input type="checkbox" name="check1" value="1"></td>
              <td><%=contact.getId()%></td>
              <td><%=contact.getUsername()%></td>
              <td><%=contact.getEmail()%></td>
              <td><%=contact.getTel()%></td>
              <td><%=contact.getContent()%></td>
              <td>
                <%--xóa tin tức--%>
                <a class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                   href="manage-contact?action=delete&id=<%=contact.getId()%>"><i class="fas fa-trash-alt"></i></a>

                <%--              --%>
                <%--                <a href="manage-contact?action=edit-blog&id-blog=<%=contact.getId()%>               ">--%>
                <%--                  <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"--%>
                <%--                          id="show-confirm"--%>
                <%--                          data-toggle="modal" data-target="#ModalConfirm"><i class="fas fa-edit"></i>--%>
                <%--                  </button>--%>
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
MODAL
-->
<div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">

      <div class="modal-body">
        <div class="row">
          <div class="form-group  col-md-12">
                            <span class="thong-tin-thanh-toan">
                                <h5>Chỉnh sửa tin tức cơ bản</h5>
                            </span>
          </div>
        </div>
        <div class="row">
          <div class="form-group col-md-6">
            <label class="control-label">ID</label>
            <input class="form-control" type="text" required value="1" disabled>
          </div>
          <div class="form-group col-md-6">
            <label class="control-label">Tiêu đề tin</label>
            <input class="form-control" type="text" required value="Thông tin liên quan về Iphone 14">
          </div>
          <div class="form-group  col-md-6">
            <label class="control-label">Người đăng</label>
            <input class="form-control" type="text" required value="Quản trị">
          </div>
          <div class="form-group col-md-6">
            <label class="control-label">Ngày đăng</label>
            <input class="form-control" type="date" value="15/10/2022">
          </div>
          <div class="form-group  col-md-6">
            <label for="exampleSelect1" class="control-label">Người đăng</label>
            <select class="form-control" id="exampleSelect1">
              <option>Quản trị</option>
              <option>Nhân viên</option>
            </select>
          </div>
          <div class="form-group  col-md-6">
            <label for="exampleSelect1" class="control-label">Loại tin</label>
            <select class="form-control" id="">
              <option>Công nghệ</option>
              <option>Giải đáp</option>
            </select>
          </div>
        </div>
        <br>
        <a href="edit-blog.jsp" style="float: right;font-weight: 600;color: #ea0000;">Chỉnh sửa nâng cao</a>
        <br>
        <br>
        <button class="btn btn-save" type="button" onclick="save()">Lưu lại</button>
        <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
        <br>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
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
<script>
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

  //Modal
  $("#show-emp").on("click", function () {
    $("#ModalUP").modal({backdrop: false, keyboard: false})
  });

  function save() {

    swal("Đã lưu thành công.!", {});

  }
</script>

</body>

</html>

