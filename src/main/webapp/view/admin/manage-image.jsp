<%@ page import="vn.edu.hcmuaf.fit.model.BlogModel" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.BlogService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.ImageDAO" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quản lý Image | ADMIN</title>
    <%@include file="../../common/admin/head.jsp" %>
</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->

<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<% List<ImageModel> listImage = (List<ImageModel>) ImageDAO.loadAllImage();%>
<%--<% List<ImageModel> imageFooter = (List<ImageModel>) ImageDAO.loadAllImage();%>--%>
<%@include file="../../common/admin/sidebar.jsp" %>
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

                            <a class="btn btn-add btn-sm" href="manage-image?type=add" title="Thêm"><i
                                    class="fas fa-plus"></i>
                                Tạo mới</a>
                        </div>

                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm print-file" type="button" title="In"
                               onclick="myApp.printTable()"><i class="fas fa-print"></i> In dữ liệu</a>
                        </div>

                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="myFunction(this)"><i
                                    class="fas fa-trash-alt"></i> Xóa tất cả </a>
                        </div>
                    </div>
                    <%--                    in ra tin tức--%>
                    <% if (listImage == null) {
                    %>
                    <div>Chưa có tin tức</div>
                    <%
                    } else {%>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th width="10"><input type="checkbox" id="all"></th>
                            <th>ID</th>
                            <th>Tên ảnh</th>
                            <th>Ảnh</th>
                            <th>Loại ảnh</th>
                            <th>Chức năng</th>

                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (ImageModel list : listImage) {%>
                        <tr>
                            <td width="10"><input type="checkbox" name="check1" value="1"></td>
                            <td><%=list.getId()%>
                            </td>
                            <td><%=list.getName_photo()%>
                            </td>

                            <td>

                                <img src="<% if(list.getType()==1){out.print("../images/banner/"+list.getPhoto());}else{out.print("../images/footer/"+list.getPhoto());}%>"
                                     alt="" width="100px;" class="avatar">

                            </td>


                            <td><%
                                if (list.getType() == 1) {
                                    out.print("Ảnh slide");
                                } else if (list.getType() == 2) {
                                    out.print("Ảnh footer");
                                }
                            %></td>
                            <td>

                                <a href="manage-image?type=del&id=<%=list.getId()%>">
                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"><i
                                            class="fas fa-trash-alt"> </i></button>
                                </a>
                                <a href="manage-image?type=edit&id-image=<%=list.getId()%>">
                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                            id="show-emp" data-toggle="modal" data-target="#ModalUP"><i
                                            class="fas fa-edit"></i>
                                    </button>
                                </a>
                            </td>
                        </tr>

                        <%}%>

                        </tbody>
                    </table>
                    <%}%>

                </div>
            </div>
        </div>
    </div>
</main>


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

    // jQuery(function () {
    //     jQuery(".trash").click(function () {
    //         swal({
    //             title: "Cảnh báo",
    //
    //             text: "Bạn có chắc chắn là muốn xóa?",
    //             buttons: ["Hủy bỏ", "Đồng ý"],
    //         })
    //             .then((willDelete) => {
    //                 if (willDelete) {
    //                     swal("Đã xóa thành công.!", {});
    //                 }
    //             });
    //     });
    // });
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