package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.model.ProductModel;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "listProduct", value = "/list-product")
public class ProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductModel> listProduct;
        String searchParam = request.getParameter("search");

        if (searchParam != null) {
            listProduct = ProductService.getListProductBySearch(searchParam);
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            for (ProductModel p : listProduct) {
                out.println(
                        "<div class=\"search-item\">\n" +
                        "   <div class=\"search-item-left\">\n" +
                        "       <a href=\"" + request.getContextPath() + "/detail-product?id-product=" + p.getId() + "\" class=\"item-name\">" + p.getName() + "</a>\n" +
                        "       <div class=\"item-price\">" + p.getPrice() + "</div>\n" +
                        "   </div>\n" +
                        "   <div class=\"search-item-right\">\n" +
                        "       <div class=\"img\">\n" +
//                        "           <img src=\"images/product/" + p.getAvatar() + "\" alt=\"\">\n" +
                        "       </div>\n" +
                        "    </div>\n" +
                        " </div>"
                );
            }
        } else {
            listProduct = ProductService.getTop8();
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("activeProduct", "active");
            request.getRequestDispatcher("/view/web/product.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}