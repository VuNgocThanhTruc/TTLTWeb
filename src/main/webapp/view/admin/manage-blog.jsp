<%@ page import="vn.edu.hcmuaf.fit.model.BlogModel" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.BlogService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quản lý sản phẩm | ADMIN</title>
    <%@include file="../../common/admin/head.jsp" %>
    <style>
        img{
            max-width: 250px;
            max-height: 150px;
            object-fit: contain;
        }
    </style>
</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>
<%
    List<BlogModel> listBlog = (List<BlogModel>) request.getAttribute("listBlog");
    Boolean isGrantAdd = false;
    Boolean isGrantEdit = false;
    Boolean isGrantDel = false;
    for(FunctionModel function : functions){
        if(function.getName().equals("Add")){
            isGrantAdd = auth.getDecentralizeFuncOfRole(idRole,"10",function.getId());
        }else if(function.getName().equals("Edit")){
            isGrantEdit = auth.getDecentralizeFuncOfRole(idRole,"10",function.getId());
        }else if(function.getName().equals("Delete")){
            isGrantDel = auth.getDecentralizeFuncOfRole(idRole,"10",function.getId());
        }
    }
%>

<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="manage-blog.jsp"><b>Quản lý tin tức</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <%--Tạo mới tin tức --%>
                            <%if(isGrantAdd == true) {%>
                                <a class="btn btn-add btn-sm" href="manage-blog?action=add" title="Thêm"><i
                                        class="fas fa-plus"></i>
                                    Tạo mới
                                </a>
                            <%} else {%>
                                <button
                                        class="btn btn-add btn-sm"
                                        type="button"
                                        title="Không có quyền này!"
                                        style="opacity: 0.5; cursor: not-allowed;"
                                        disabled
                                >
                                    <i class="fas fa-plus"></i> Tạo mới
                                </button>
                            <%}%>
                        </div>

<%--                        <div class="col-sm-2">--%>
<%--                            <a class="btn btn-delete btn-sm print-file" type="button" title="In"--%>
<%--                               onclick="myApp.printTable()"><i class="fas fa-print"></i> In dữ liệu</a>--%>
<%--                        </div>--%>

                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="myFunction(this)"><i
                                    class="fas fa-trash-alt"></i> Xóa tất cả </a>
                        </div>
                    </div>
                    <%--                    in ra tin tức--%>
                    <% if (listBlog == null){
                    %>
                    <div>Chưa có tin tức</div>
                    <%
                    }else {%>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th width="10"><input type="checkbox" id="all"></th>
                            <th>ID</th>
                            <th width="300px">Tiêu đề tin</th>
                            <th width="300px">Ảnh đại diên</th>
                            <th width="500px">Nội dung tóm tắt</th>
                            <th width="150px" style="text-align: center">Người đăng</th>
                            <th width="100px" style="text-align: center">Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (BlogModel blog :
                                    listBlog ) {%>
                        <tr>
                            <td width="10"><input type="checkbox" name="check1" value="1"></td>
                            <td><%=blog.getId()%></td>
                            <td><%=blog.getTitle()%></td>
                            <td><%=blog.getAvatar()%></td>
                            <td class="brief-content"><%=blog.getBriefContent()%></td>
                            <td><%=blog.getUserCreated()%></td>
                            <td>
                                <%--xóa tin tức--%>
                                <%if(isGrantDel == true) {%>
                                    <a class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                       href="manage-blog?action=delete&id=<%=blog.getId()%>" onclick="return confirmDelete()"><i class="fas fa-trash-alt"></i></a>
                                <%} else {%>
                                    <button
                                            class="btn btn-primary btn-sm trash"
                                            type="button"
                                            title="Không có quyền này!"
                                            style="opacity: 0.5; cursor: not-allowed;"
                                            disabled
                                    >
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                <%}%>
                                <%-- sua tin tuc--%>
                                <%if(isGrantEdit == true) {%>
                                    <a href="manage-blog?action=edit-blog&id-blog=<%=blog.getId()%>               ">
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                                    id="show-confirm"
                                                    data-toggle="modal" data-target="#ModalConfirm"><i class="fas fa-edit"></i>
                                        </button>
                                    </a>
                                <%} else {%>
                                    <button
                                            class="btn btn-primary btn-sm edit"
                                            type="button"
                                            title="Không có quyền này!"
                                            style="opacity: 0.5; cursor: not-allowed;"
                                            disabled
                                    >
                                        <i class="fas fa-edit"></i>
                                    </button>
                                <%}%>
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
<%@include file="../../common/admin/script.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<script src="../../admin/doc/js/plugins/pace.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<script>
    function deleteRow(r) {
        var i = r.parentNode.parentNode.rowIndex;
        document.getElementById("myTable").deleteRow(i);
    }

    function confirmDelete() {
        if (confirm("Bạn có chắc chắn muốn xóa?")) {
            return true; // Nếu người dùng chấp nhận xóa, tiếp tục hành động
        } else {
            return false; // Nếu người dùng không chấp nhận xóa, ngăn không cho hành động xóa xảy ra
        }
    }

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

    var tdBriefs = document.querySelectorAll('.brief-content');
    for(var i = 0; i < tdBriefs.length; i++){
        var tdBrief = tdBriefs[i];
        var firstElement = tdBrief.firstElementChild;
        firstElement.style.fontWeight = "400";
        firstElement.style.fontStyle = "normal";
        firstElement.style.color = "#000";

        var content = firstElement.textContent;

        if (content.length > 200) {
            var truncatedContent = content.substring(0, 200) + "...";
            firstElement.textContent = truncatedContent;
        }else{
            firstElement.textContent = content + "...";
        }

        var lengthChildren = tdBrief.children.length;
        for (var j = 1; i < lengthChildren; j++) {
            var children = tdBrief.children[j];
            if(children != undefined){
                children.style.display = 'none';
            }
            if(j > lengthChildren) break;
        }
    }

    var ems = document.querySelectorAll('em');
    for(var i = 0; i < ems.length; i++){
        var em = ems[i];
        em.style.fontStyle = 'normal'
        em.style.color = "#000";
        em.style.fontWeight = "400";
    }

    var strongs = document.querySelectorAll('strong');
    for(var i = 0; i < strongs.length; i++){
        var strong = strongs[i];
        strong.style.fontStyle = 'normal'
        strong.style.color = "#000";
        strong.style.fontWeight = "400";
    }

</script>

</body>

</html>