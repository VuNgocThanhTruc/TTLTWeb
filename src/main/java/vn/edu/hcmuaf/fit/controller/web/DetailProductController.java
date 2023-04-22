package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.model.*;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailProductController", value = "/detail-product")
public class DetailProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idProduct = Integer.parseInt(request.getParameter("id-product"));

        ProductService productService = new ProductService();
        ProductModel product = productService.getDetailProduct(idProduct);

        List<ProductModel> pro = ProductService.getDifferentProduct();
        List<RateReviewModel> listRate = ProductService.getListCommentByIdProduct(idProduct);
        // danh sach ton kho
        InventoriesModel inventoriesList = productService.getInventores(idProduct);
        // giảm giá
        DiscountModel discount = productService.getDiscounts(idProduct);


        request.setAttribute("pro", pro);
        request.setAttribute("product", product);
        request.setAttribute("listRate", listRate);
        // danh sach ton kho
        request.setAttribute("inventoriesList", inventoriesList);
        // giảm giá
        request.setAttribute("discount", discount);

        request.getRequestDispatcher("view/web/detailProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idProduct = Integer.parseInt(request.getParameter("id-product"));
        ProductService productService = new ProductService();
        ProductModel product = productService.getDetailProduct(idProduct);
        List<RateReviewModel> listRate = ProductService.getListCommentByIdProduct(idProduct);
        List<ProductModel> pro = ProductService.getDifferentProduct();
        // danh sach ton kho

        int rate = Integer.parseInt(request.getParameter("rate_value"));
        String content = request.getParameter("comment");


        HttpSession session = request.getSession();
        UserModel userModel = (UserModel) session.getAttribute("userlogin");
        int idUser = Integer.parseInt(userModel.getId());

        boolean isInsertRateReview = ProductService.insertRateReview(idProduct, rate, idUser, content);
        session.setAttribute("isInsertRateReview", isInsertRateReview);

        request.setAttribute("listRate", listRate);
        request.setAttribute("pro", pro);
        request.setAttribute("product", product);

        request.getRequestDispatcher("view/web/detailProduct.jsp").forward(request, response);
    }
}
