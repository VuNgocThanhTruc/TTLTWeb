package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.model.ProductModel;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

        request.setAttribute("pro", pro);
        request.setAttribute("product", product);

        request.getRequestDispatcher("view/web/detailProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idProduct = Integer.parseInt(request.getParameter("id-product"));



    }
}
