<%@ page import="vn.edu.hcmuaf.fit.model.CustomerModel" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quản lý khách hàng | ADMIN</title>
    <%@include file="../../common/admin/head.jsp" %>

</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<%
//    List<CustomerModel> listCustomer = (List<CustomerModel>) request.getAttribute("listCustomer");
    List<UserModel> listAccountUser = (List<UserModel>) request.getAttribute("listAccUser");
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
            <li class="breadcrumb-item"><a href="manage-customer.jsp">Quản lý khách hàng</a></li>
            <li class="breadcrumb-item"><a href="#">Danh sách khách hàng</a></li>
        </ul>
        <div id="clock"></div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">

<%--                    <div class="row element-button">--%>
<%--                        <div class="col-sm-2">--%>

<%--                            <a class="btn btn-add btn-sm" href="add-customer.jsp" title="Thêm"><i--%>
<%--                                    class="fas fa-plus"></i>--%>
<%--                                Tạo mới khách hàng</a>--%>
<%--                        </div>--%>


<%--                        <div class="col-sm-2">--%>
<%--                            <a class="btn btn-delete btn-sm print-file" type="button" title="In"--%>
<%--                               onclick="myApp.printTable()"><i--%>
<%--                                    class="fas fa-print"></i> In dữ liệu</a>--%>
<%--                        </div>--%>

<%--                        <div class="col-sm-2">--%>
<%--                            <a href="" class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="myFunction(this)"><i--%>
<%--                                    class="fas fa-trash-alt"></i> Xóa tất cả </a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <%--                    In ra khách hàng--%>
                    <% if (listAccountUser == null) {
                    %>
                    <div>Chưa có khách hàng</div>
                    <%
                    } else {%>
                    <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0"
                           border="0"
                           id="sampleTable">
                        <thead>
                        <tr>
                            <th><input type="checkbox" id="all"></th>
                            <th>ID</th>

                            <th>Avatar</th>
                            <th>Họ và tên</th>
                            <th>User name</th>
                            <th>Ngày sinh</th>
                            <th>Giới tính</th>
                            <th>Địa chỉ</th>
                            <th>Email</th>
                            <th>SĐT</th>

                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (UserModel acc :
                                    listAccountUser) {%>
                        <tr>
                            <td width="10"><input type="checkbox" name="check1" value="1"></td>
                            <td><%=acc.getId()%>
                            </td>

                            <td> <img src="<% out.print("../images/user/"+acc.getAvatar());%>"
                                      alt="" width="100px;" class="avatar">
                            </td>
                            <td><%=acc.getName()%>
                            </td>
                            <td><%=acc.getUsername()%>
                            </td>
                            <td><%=acc.getDob()%>
                            </td>
                            <td><%if(acc.getSex()==0){out.print("Nam");}else{out.print("Nữ");}%>
                            </td>
                            <td><%=acc.getAddress()%>
                            </td>
                            <td><%=acc.getEmail()%>
                            </td>
                            <td><%=acc.getTel()%>
                            </td>

<%--                            <td class="table-td-center">--%>
<%--                                <a class="btn btn-primary btn-sm trash" type="button" title="Xóa"--%>
<%--                                   href="manage-customer?action=delete&id=<%=customer.getId()%>"><i--%>
<%--                                        class="fas fa-trash-alt"></i></a>--%>

<%--                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"--%>
<%--                                        data-toggle="modal" data-target="#ModalUP"><i class="fas fa-edit"></i>--%>
<%--                                </button>--%>
<%--                            </td>--%>
                        </tr>
                        <%
                            }%>

                        </tbody>
                    </table>
                    <%
                        }%>

                </
                >
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
                <h5>Chỉnh sửa thông tin khách hàng cơ bản</h5>
              </span>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="control-label">ID khách hàng</label>
                        <input class="form-control" type="text" required value="#CD2187" disabled>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Họ và tên</label>
                        <input class="form-control" type="text" required value="Hồ Thị Thanh Ngân">
                    </div>
                    <div class="form-group  col-md-6">
                        <label class="control-label">Số điện thoại</label>
                        <input class="form-control" type="number" required value="09267312388">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Địa chỉ email</label>
                        <input class="form-control" type="text" required value="thanhngan@gmail.com">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="control-label">Ngày sinh</label>
                        <input class="form-control" type="date" value="1999-02-12">
                    </div>

                </div>
                <BR>
                <a href="edit-customer.jsp" style="    float: right;
        font-weight: 600;
        color: #ea0000;">Chỉnh sửa nâng cao</a>
                <BR>
                <BR>
                <button class="btn btn-save" type="button" onclick="save()">Lưu lại</button>
                <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                <BR>
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
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

<script>
    //In dữ liệu
    var myApp = new function () {
        this.printTable = function () {
            var tab = document.getElementById('sampleTable');
            var win = window.open('', '', 'height=700,width=700');
            win.document.write(tab.outerHTML);
            win.document.close();
            win.print();
        }
    }
    //     //Sao chép dữ liệu
    //     var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

    // copyTextareaBtn.addEventListener('click', function(event) {
    //   var copyTextarea = document.querySelector('.js-copytextarea');
    //   copyTextarea.focus();
    //   copyTextarea.select();

    //   try {
    //     var successful = document.execCommand('copy');
    //     var msg = successful ? 'successful' : 'unsuccessful';
    //     console.log('Copying text command was ' + msg);
    //   } catch (err) {
    //     console.log('Oops, unable to copy');
    //   }
    // });


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