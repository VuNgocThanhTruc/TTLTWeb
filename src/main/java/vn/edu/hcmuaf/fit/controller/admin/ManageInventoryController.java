package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.constant.SystemConstant;
import vn.edu.hcmuaf.fit.dao.DiscountDAO;
import vn.edu.hcmuaf.fit.model.DiscountModel;
import vn.edu.hcmuaf.fit.service.DiscountService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@MultipartConfig
@WebServlet(value = "/admin/manage-inventory")
public class ManageInventoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeParam = request.getParameter("type");
        String view = "";

        DiscountService discountService = new DiscountService();

        if (SystemConstant.LIST.equals(typeParam)) {
            view = "/view/admin/manage-inventory.jsp";
        } else if (SystemConstant.ADD.equals(typeParam)) {
            view = "/view/admin/add-discount.jsp";
        } else if (SystemConstant.EDIT.equals(typeParam)) {
            String contain = request.getParameter("id-product");
            if (contain != null) {
                request.setAttribute("contain2", discountService.getProductById2(Integer.parseInt(contain)));
            }
            view = "/view/admin/edit-discount.jsp";
        } else if (typeParam == null) {
            view = "/view/admin/manage-inventory.jsp";
        } else if (typeParam.equals("del")) {
            doGet_Del(request, response);
            view = "/view/admin/manage-discount.jsp";
        } else if (typeParam.equals("addDiscount")) {

            String contain = request.getParameter("id-product");
            if (contain != null) {
                request.setAttribute("contain", discountService.getProductById(Integer.parseInt(contain)));
            }
            view = "/view/admin/add-detail-discount.jsp";
        }
        request.getRequestDispatcher(view).forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeParam = request.getParameter("type");
        String view = "";
        ProductService productService = new ProductService();

        if (SystemConstant.LIST.equals(typeParam)) {
            view = "/view/admin/manage-discount.jsp";
        } else if (SystemConstant.ADD.equals(typeParam)) {
            view = "/view/admin/add-discount.jsp";
        } else if (SystemConstant.EDIT.equals(typeParam)) {
            String idImgParam = request.getParameter("id-image");
//            if (idImgParam != null) {
//                request.setAttribute("image", productService.getDetailProduct(Integer.parseInt(idImgParam)));
//            }
            view = "/view/admin/edit-discount.jsp";
        } else if (typeParam == null) {
            view = "/view/admin/manage-discount.jsp";
        } else if (typeParam.equals("del")) {
            doGet_Del(request, response);
            view = "/view/admin/manage-discount.jsp";
        } else if (typeParam.equals("addByTypeProduct")) {
            doPost_addByTypeProduct(request, response);
            view = "/view/admin/manage-discount.jsp";

        } else if (typeParam.equals("addByIdProduct")) {
            doPost_addByIdProduct(request, response);

            view = "/view/admin/manage-discount.jsp";

        }
        else if (typeParam.equals("editByIdProduct")) {
            doPost_editByIdProduct(request, response);
            view = "/view/admin/manage-discount.jsp";

        }

        request.getRequestDispatcher(view).forward(request, response);

    }

    //xóa discount
    private void doGet_Del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        DiscountDAO discountDAO = new DiscountDAO();
        discountDAO.delDiscount(id);
    }

    // thêm mã giảm giá theo loại sản phẩm
    private void doPost_addByTypeProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        int typeProduct = Integer.parseInt(request.getParameter("typeProduct"));
        int numberDiscount = Integer.parseInt(request.getParameter("numberDiscount"));
        String dateStart = request.getParameter("dateStart");
        String dateEnd = request.getParameter("dateEnd");
        HttpSession session = request.getSession();
        DiscountDAO discountDAO = new DiscountDAO();
        List<DiscountModel> listIDTypeProduct = discountDAO.getIDProductByIDTypeProduct(typeProduct);
        for (DiscountModel list : listIDTypeProduct) {
            discountDAO.addDiscount(typeProduct, list.getIdProduct(), dateStart, dateEnd, numberDiscount);
        }
    }

    // thêm mã giảm giá theo id sản phẩm
    private void doPost_addByIdProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        int idTypeProduct = Integer.parseInt(request.getParameter("idTypeProduct"));
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        int numberDiscount = Integer.parseInt(request.getParameter("numberDiscount"));
        String dateStart = request.getParameter("dateStart");
        String dateEnd = request.getParameter("dateEnd");
        HttpSession session = request.getSession();
        DiscountDAO discountDAO = new DiscountDAO();
        discountDAO.addDiscount(idTypeProduct, idProduct, dateStart, dateEnd, numberDiscount);
    }
    // cập nhật mã giảm giá theo id sản phẩm
    private void doPost_editByIdProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        int idDiscount = Integer.parseInt(request.getParameter("idDiscount"));
        int numberDiscount = Integer.parseInt(request.getParameter("numberDiscount"));
        String dateStart = request.getParameter("dateStart");
        String dateEnd = request.getParameter("dateEnd");
        HttpSession session = request.getSession();
        DiscountDAO discountDAO = new DiscountDAO();
        discountDAO.editDiscount(idDiscount, dateStart, dateEnd, numberDiscount);
    }
}

