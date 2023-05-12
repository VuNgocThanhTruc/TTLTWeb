<%@ page import="vn.edu.hcmuaf.fit.model.ProductModel" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.CategoryModel" %>
<%@ page import="vn.edu.hcmuaf.fit.model.CustomerModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quản lý sản phẩm | ADMIN</title>
    <%@include file="../../common/admin/head.jsp" %>
</head>
<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>

<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>

<%
    List<ProductModel> listProduct = (List<ProductModel>) request.getAttribute("listProduct");
    String pageContextPath = (String) request.getContextPath();
    List<CategoryModel> categoryTypeProduct = (List<CategoryModel>) request.getAttribute("categoryTypeProduct");
    List<CategoryModel> listBrand = (List<CategoryModel>) request.getAttribute("categoryBrand");

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
            <li class="breadcrumb-item">Quản lý sản phẩm</li>
            <li class="breadcrumb-item"><a href="manage-product">Danh sách sản phẩm</a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <%if(isGrantAdd == true) {%>
                            <a class="btn btn-add btn-sm" href="manage-product?type=add" title="Thêm"><i
                                    class="fas fa-plus"></i>
                                Tạo mới sản phẩm</a>
                            <%} else {%>
                            <button
                                    class="btn btn-add btn-sm"
                                    type="button"
                                    title="Không có quyền này!"
                                    style="opacity: 0.5; cursor: not-allowed;"
                                    disabled
                            >
                                <i class="fas fa-plus"></i> Tạo mới sản phẩm
                            </button>
                            <%}%>
                        </div>


<%--                        <div class="col-sm-2">--%>
<%--                            <a class="btn btn-delete btn-sm print-file" type="button" title="In"--%>
<%--                               onclick="myApp.printTable()"><i--%>
<%--                                    class="fas fa-print"></i> In dữ liệu</a>--%>
<%--                        </div>--%>


                        <div class="col-sm-2">
                            <a href="deleteAll" class="btn btn-delete btn-sm" type="button" title="Xóa"
                               onclick="myFunction(this)"><i
                                    class="fas fa-trash-alt"></i> Xóa tất cả </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="manage-product?type=exportExcel" class="btn" type="button" title="Xuất dữ liệu" style="line-height: 0px;border: 1px solid #000000; font-size: 13px; padding: 5px 10px"
                            ><i class='bx bxs-file-export'></i> Xuất Excel</a>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th width="10"><input type="checkbox" id="all"></th>
                            <th>ID sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Ảnh</th>
                            <th>Số lượng</th>
                            <th>Tình trạng</th>
                            <th>Giá tiền</th>
                            <th>Danh mục</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if(listProduct != null)  for (ProductModel product : listProduct) {%>
                        <tr class="product-<%=product.getId()%>">
                            <td width="10"><input type="checkbox" name="check1" value="1"></td>
                            <td class="id"><%=product.getId()%>
                            </td>
                            <td class="name"><%=product.getName()%>
                            </td>
                            <td>
                                <img
                                    src="../images/product/<%=product.getAvatar()%>"
                                    alt="" width="100px;" class="avatar">
                            </td>
                            <td class="quantity">
<%--                                <%=product.getSumQuantity()%>--%>
                            </td>
                            <td><span class="badge bg-success" class="status">Hoàn Thành</span></td>
                            <td class="price"><%=product.getPrice()%>
                            </td>
                            <td>
                                <%
                                    for (CategoryModel type : categoryTypeProduct) {
                                        if (type.getId() == product.getIdTypeProduct()) {
                                %>
                                <%=type.getName()%>
                                <%
                                        }
                                    }
                                %>
                                <input type="hidden" class="category" value="<%=product.getIdTypeProduct()%>">
                            </td>

                            <td>
                                <%--Xóa product--%>
                                <%if(isGrantDel == true) {%>
                                <a class="btn btn-primary btn-sm trash" type="button" title="Xóa" href="manage-product?type=delete&id-product=<%=product.getId()%>"><i class="fas fa-trash-alt"></i></a>
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
                                <%--Sửa product--%>
                                <%if(isGrantEdit == true) {%>
                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"
                                            data-toggle="modal" data-target="#ModalEditProduct"
                                            onclick="editProductBasic(<%=product.getId()%>)"><i class="fas fa-edit"></i>
                                    </button>
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
                </div>
            </div>

        </div>
    </div>
</main>

<!--
MODAL EDIT BASIC
-->
<div class="modal fade" id="ModalEditProduct" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form method="POST">
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  col-md-12">
                          <span class="thong-tin-thanh-toan">
                            <h5>Chỉnh sửa thông tin sản phẩm cơ bản</h5>
                          </span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="control-label" for="idModal">Mã sản phẩm </label>
                            <input class="form-control" type="number" value="" id="idModal" name="idModal" disabled>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label" for="nameModal">Tên sản phẩm</label>
                            <input class="form-control" type="text" required
                                   value="" id="nameModal" name="nameModal">
                        </div>
                        <div class="form-group  col-md-6">
                            <label class="control-label" for="brandModal">Thương hiệu</label>
                            <select class="form-control" id="brandModal" name="brandModal">
                                <%
                                    for (CategoryModel brand : listBrand) {
                                %>
                                    <option value="<%=brand.getId()%>"><%=brand.getName()%></option>
                                <%}%>
                            </select>

                        </div>
                        <div class="form-group col-md-6 ">
                            <label for="statusModal" class="control-label" for="statusModal">Tình trạng sản phẩm</label>
                            <select class="form-control" id="statusModal" name="statusModal">
                                <option value="1">Còn hàng</option>
                                <option value="0">Hết hàng</option>
                                <option value="-1">Ngưng hoạt động</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="control-label" for="priceModal">Giá bán</label>
                            <input class="form-control" type="text" id="priceModal" name="priceModal" value="300.000đ">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="categoryModal" class="control-label">Danh mục</label>
                            <select class="form-control" id="categoryModal" name="categoryModal">
                                <%
                                    for (CategoryModel type : categoryTypeProduct) {
                                %>
                                <option value="<%=type.getId()%>"><%=type.getName()%>
                                </option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <br>
                    <a class="urlEditBasic"
                       style="float: right;font-weight: 600;color: #ea0000;">Chỉnh sửa sản phẩm nâng cao</a>
                    <BR>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-save" type="button" onclick="save()">Lưu lại</button>
                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="../../common/admin/script.jsp" %>
<!-- Essential javascripts for application to work-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<script src="js/main.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
<script>
    function deleteRow(r) {
        var i = r.parentNode.parentNode.rowIndex;
        document.getElementById("myTable").deleteRow(i);
    }

    // document.querySelector('.trash').addEventListener('click', function(e) {
    //     var form = this;
    //
    //     e.preventDefault(); // <--- prevent form from submitting
    //
    //     swal({
    //         title: "Cảnh báo",
    //         text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
    //         buttons: ["Hủy bỏ", "Đồng ý"],
    //         icon: "warning",
    //         buttons: [
    //             'No, cancel it!',
    //             'Yes, I am sure!'
    //         ],
    //         dangerMode: true,
    //     }).then(function(isConfirm) {
    //         if (isConfirm) {
    //             swal({
    //                 title: 'Shortlisted!',
    //                 text: 'Candidates are successfully shortlisted!',
    //                 icon: 'success'
    //             }).then(function() {
    //                 form.submit(); // <--- submit form programmatically
    //             });
    //         } else {
    //             swal("Cancelled", "Your imaginary file is safe :)", "error");
    //         }
    //     })
    // });

    jQuery(function () {
        jQuery(".trash").click(function () {
            swal({
                title: "Cảnh báo",
                text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
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

    function save() {
        $.ajax({
            type: 'POST',
            url: '<%=request.getContextPath()%>/admin/manage-product',
            data: {
                idModal: $('#ModalEditProduct #idModal').val(),
                nameModal: $('#ModalEditProduct #nameModal').val(),
                statusModal: $('#ModalEditProduct #statusModal').val(),
                priceModal: $('#ModalEditProduct #priceModal').val(),
                categoryModal: $('#ModalEditProduct #categoryModal').val(),
                brandModal: $('#ModalEditProduct #brandModal').val(),
            },
            success: (result) => {
                swal("Cập nhật thành công.!");
                setTimeout(location.reload(),1000)
            }
        })

    }

    <!--MODAL-->
    function editProductBasic(idProduct) {

        let id = document.querySelector(`.product-${idProduct} .id`).innerText
        let name = document.querySelector(`.product-${idProduct} .name`).innerText
        let quantity = document.querySelector(`.product-${idProduct} .quantity`).innerText
        <%--let status = document.querySelector(`.product-${idProduct} .status`).innerText--%>
        let price = document.querySelector(`.product-${idProduct} .price`).innerText
        let category = document.querySelector(`.product-${idProduct} .category`).value

        $('#ModalEditProduct #idModal').val(id);
        $('#ModalEditProduct #nameModal').val(name);
        $('#ModalEditProduct #quantityModal').val(quantity);
        // $('#ModalEditProduct #statusModal').val(status);
        $('#ModalEditProduct #priceModal').val(price);
        $('#ModalEditProduct .urlEditBasic').attr('href', `manage-product?type=edit&id-product=${idProduct}`);
        $('#ModalEditProduct form').attr('action', `<%=pageContextPath%>/admin/manage-product`);

        let listCategory = document.querySelectorAll('#ModalEditProduct #categoryModal option')
        for (let i = 0; i < listCategory.length; i++) {
            listCategory[i].value == category ? listCategory[i].selected = true : listCategory[i].selected = false
        }
    }

</script>
</body>

</html>