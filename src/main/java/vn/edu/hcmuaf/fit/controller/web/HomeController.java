package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.model.CategoryModel;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.model.ImageModel;
import vn.edu.hcmuaf.fit.dao.ImageDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().setAttribute("listBrand", ProductService.getListBrand());
        request.setAttribute("activeH","active");
        request.getRequestDispatcher("/view/web/index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
