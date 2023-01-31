package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.model.ProductModel;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/category"})
public class CategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String categoryPram = request.getParameter("brand");
        List<ProductModel> listProduct = new ProductService().getListProductForBrand(categoryPram);

        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("view/web/product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
