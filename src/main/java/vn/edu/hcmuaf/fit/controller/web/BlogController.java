package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.dao.BlogDAO;
import vn.edu.hcmuaf.fit.model.BlogModel;
import vn.edu.hcmuaf.fit.service.BlogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "BlogController", value = "/list-blog")
public class BlogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BlogService blogService = new BlogService();

        List<BlogModel> listBlog = blogService.getListBlog();
        List<BlogModel> newListBlog = blogService.getNewBlog();
        request.setAttribute("listBlog", listBlog);
        request.setAttribute("newListBlog", newListBlog);
        request.getRequestDispatcher("/view/web/blog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
