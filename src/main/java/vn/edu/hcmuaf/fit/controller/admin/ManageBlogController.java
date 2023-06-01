package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.constant.SystemConstant;
import vn.edu.hcmuaf.fit.dao.BlogDAO;
import vn.edu.hcmuaf.fit.dao.CustomerDAO;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.BlogModel;
import vn.edu.hcmuaf.fit.model.CustomerModel;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.service.BlogService;
import vn.edu.hcmuaf.fit.service.BookingService;
import vn.edu.hcmuaf.fit.service.CustomerServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@MultipartConfig
@WebServlet(name = "ManageBlogController", value = "/admin/manage-blog")
public class ManageBlogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user =(UserModel) session.getAttribute("userlogin");
        String actionParam = request.getParameter("action");
        String view = "/view/admin/manage-blog.jsp";
        if (actionParam != null) {
            if (actionParam.equals("delete")) {
                BlogDAO dao = new BlogDAO();
                String idBlog = request.getParameter("id");
                dao.deleteBlog(Integer.parseInt(idBlog));
                DBConnect.getInstall().insert(
                        new Log(2,
                                Integer.parseInt(user == null ? "-1" : user.getId()),
                                request.getRemoteAddr(),
                                request.getRequestURI(),
                                "Delete Blog id: "  + idBlog,
                                0));
            } else if (actionParam.equals("edit-blog")) {
                String idBlog = request.getParameter("id-blog");
                BlogModel blog = BlogService.getDetailBlogForId(idBlog);
                request.setAttribute("blog", blog);
                view = "/view/admin/edit-blog.jsp";
            } else if (SystemConstant.ADD.equals(actionParam)) {
                view = "/view/admin/add-blog.jsp";
            }
        }
        List<BlogModel> listBlog = BlogService.getBlogAdmin();
        request.setAttribute("listBlog", listBlog);
        request.getRequestDispatcher(view).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeParam = request.getParameter("action");
        if (SystemConstant.EDIT.equals(typeParam)) {
            doPost_Edit(request, response);
        }else if (SystemConstant.ADD.equals(typeParam)) {
            doPostAdd(request,response);
        }
    }

    private void doPostAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user =(UserModel) session.getAttribute("userlogin");

        String title = request.getParameter("title");

        String detail = request.getParameter("detail");
        // Xử lý tóm tắt nội dung
        String brief = "";
        String regex = "(?i)<img[^>]+>";
        brief = detail.replaceAll(regex, "");
        //Lấy một ảnh trong nội dung làm ảnh bìa
        String coverImage = "<img alt='' src='' style='height:100px'; width:300px' />'";
        Pattern pattern = Pattern.compile("<img[^>]+>");
        Matcher matcher = pattern.matcher(detail);
        if (matcher.find()) {
            coverImage = matcher.group();
        }
        BlogService.insertBlog(title, brief, detail, coverImage);
        DBConnect.getInstall().insert(
                new Log(2,
                        Integer.parseInt(user == null ? "-1" : user.getId()),
                        request.getRemoteAddr(),request.getRequestURI(),
                        "Add Blog Title: "  + title+", brief: " + brief+", detail: " + detail+", imageFileName: "+ coverImage,
                        0));
        response.sendRedirect(request.getContextPath() + "/admin/manage-blog");

    }

    private void doPost_Edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user =(UserModel) session.getAttribute("userlogin");
        String id = request.getParameter("id-blog");
        String title = request.getParameter("title");
        String detail = request.getParameter("detail");
        // Xử lý tóm tắt nội dung
        String brief = "";
        String regex = "(?i)<img[^>]+>";
        brief = detail.replaceAll(regex, "");
        //Lấy một ảnh trong nội dung làm ảnh bìa
        String coverImage = "<img alt='' src='' style='height:100px'; width:300px' />'";
        Pattern pattern = Pattern.compile("<img[^>]+>");
        Matcher matcher = pattern.matcher(detail);
        if (matcher.find()) {
            coverImage = matcher.group();
        }
        BlogService.updateBlog(id, title, brief, detail, coverImage);
        DBConnect.getInstall().insert(
                new Log(1,
                        Integer.parseInt(user == null ? "-1" : user.getId()),
                        request.getRemoteAddr(),request.getRequestURI(),
                        "Edit Blog id: "  + id,
                        0));
        response.sendRedirect(request.getContextPath() + "/admin/manage-blog?action=edit-blog&id-blog=" + id);
    }
}