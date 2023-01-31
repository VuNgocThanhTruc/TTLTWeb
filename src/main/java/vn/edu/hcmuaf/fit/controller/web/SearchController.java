package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.model.ProductModel;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchPram = request.getParameter("q");
        ProductService productService = new ProductService();

        List<ProductModel> listProductBySearch = productService.getListProductBySearch(searchPram);

        request.setAttribute("listProduct", listProductBySearch);
        request.getRequestDispatcher("view/web/product.jsp").forward(request, response);
    }
}
