package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.model.BlogModel;
import vn.edu.hcmuaf.fit.service.BlogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailBlogController", value = "/detail-blog")
public class DetailBlogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BlogService blogService = new BlogService();

        String idBlogPram = request.getParameter("id-blog");
        BlogModel detailBlog = blogService.getDetailBlogForId(idBlogPram);
        List<BlogModel> newBlog = blogService.getNewBlog();

        request.setAttribute("newBlog",newBlog);
        request.setAttribute("detailBlog",detailBlog);
        request.getRequestDispatcher("/view/web/detailBlog.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}