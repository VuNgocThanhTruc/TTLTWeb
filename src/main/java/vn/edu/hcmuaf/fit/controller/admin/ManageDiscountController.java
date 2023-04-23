package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.constant.SystemConstant;
import vn.edu.hcmuaf.fit.dao.DiscountDAO;
import vn.edu.hcmuaf.fit.dao.ImageDAO;
import vn.edu.hcmuaf.fit.model.DiscountModel;
import vn.edu.hcmuaf.fit.model.ProductModel;
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
@WebServlet(value = "/admin/manage-discount")
public class ManageDiscountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeParam = request.getParameter("type");
        String view = "";
        ProductService productService = new ProductService();

        if (SystemConstant.LIST.equals(typeParam)) {
            view = "/view/admin/manage-discount.jsp";
//            List<DiscountModel> discountList = DiscountDAO.getDiscountManage();
//            request.setAttribute("discountList", discountList);
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
        }

//        request.setAttribute("listStatus", CategorySevice.getListStatus());
//
//        request.setAttribute("categoryTypeProduct", CategorySevice.getListTypeProduct());
//
//        request.setAttribute("categoryBrand", CategorySevice.getListBrand());
//
        request.getRequestDispatcher(view).forward(request, response);


//        request.getRequestDispatcher("/view/admin/manage-image.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
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
}
