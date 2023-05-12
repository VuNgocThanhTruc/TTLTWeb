<%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 17/02/2023
  Time: 7:05 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.AccountService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sửa giảm giá | ADMIN</title>
  <%@include file="../../common/admin/head.jsp" %>
  <style>
    .tabs .tab-item.active {
      background-color: #ffffff;
    }
  </style>
</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<%
  List<UserModel> listAccountUser = (List<UserModel>) request.getAttribute("listAccUser");

  List<UserModel> listAccountAdmin = (List<UserModel>) request.getAttribute("listAccAdmin");
  DiscountModel discount = (DiscountModel) request.getAttribute("contain2");

  Boolean isGrantAdd = false;
  Boolean isGrantEdit = false;
  Boolean isGrantDel = false;
  for (FunctionModel function : functions) {
    if (function.getName().equals("Add")) {
      isGrantAdd = auth.getDecentralizeFuncOfRole(idRole, "2", function.getId());
    } else if (function.getName().equals("Edit")) {
      isGrantEdit = auth.getDecentralizeFuncOfRole(idRole, "2", function.getId());
    } else if (function.getName().equals("Delete")) {
      isGrantDel = auth.getDecentralizeFuncOfRole(idRole, "2", function.getId());
    }
  }
%>
<%
  String pageContextPath = (String) request.getContextPath();
%>

<main class="app-content">
  <div class="app-title">
    <ul class="app-breadcrumb breadcrumb side">
      <li class="breadcrumb-item active"><a href="manage-discount.jsp"><b>Quản lý giảm giá</b></a></li>
    </ul>
    <div id="clock"></div>
  </div>

  <!-- Tài khoản Admin -->
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <form action="manage-discount?type=editByIdProduct" method="post" >

            <div class="form-group col-md-3 ">
              <label class="control-label">Tên sản phẩm</label>
              <input class="form-control" type="text"  name="nameProduct"
                     value="<%=discount.getNameProduct()%>"  disabled>

            </div>
            <div class="form-group col-md-3 ">
              <label  class="control-label">Loại sản phẩm</label>

              <input class="form-control" type="text"  name="nameTypeProduct"
                     value="<%=discount.getNameTypeProduct()%>"  disabled>

            </div>
            <div class="form-group col-md-3 d-none ">

              <input class="form-control" type="number"  name="idDiscount"
                     value="<%=discount.getIdDiscount()%>"  >
            </div>
            <div class="form-group col-md-3 ">

              <img src="<% out.print("../images/product/"+discount.getAvatar());%>"
                   alt="" width="100px;" class="avatar">

            </div>
            <div class="form-group col-md-3">
              <label class="control-label">Giảm giá(%)</label>
              <input class="form-control" type="number"  name="numberDiscount"
                     value="<%=discount.getPercentDiscount()%>" min="1" max="100" >
            </div>

            <div class="form-group col-md-3">
              <label class="control-label">Ngày bắt đầu bắt đầu</label>
              <input class="form-control" type="datetime-local" placeholder=""
                     name="dateStart"
                     value="<%=discount.getDateStart()%>" step="1" >
            </div>
            <div class="form-group col-md-3">
              <label class="control-label">Ngày giờ kết thúc</label>
              <input class="form-control" type="datetime-local" value="<%=discount.getDateEnd()%>" name="dateEnd" step="1" >
            </div>

            <input class="btn btn-save" type="submit" value="lưu lại"/>
            <a href="manage-discount">
              <button class="btn btn-cancel" data-dismiss="modal" type="reset">Hủy bỏ</button>
            </a>
          </form>

        </div>
      </div>
    </div>
  </div>
</main>

<!-- Essential javascripts for application to work-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
  $('table.display').DataTable();
</script>

</body>
<script type="text/javascript">

  const $ = document.querySelector.bind(document);
  const $$ = document.querySelectorAll.bind(document);
  const tabs = $$('.tab-item');
  const panes = $$('.tab-pane');

  tabs.forEach((tab, index) => {
    const pane = panes[index];
    tab.onclick = function () {
      $('.tab-item.active').classList.remove('active')
      $('.tab-pane.active').classList.remove('active')

      this.classList.add('active')
      pane.classList.add('active')
    }
  })
</script>
</html>