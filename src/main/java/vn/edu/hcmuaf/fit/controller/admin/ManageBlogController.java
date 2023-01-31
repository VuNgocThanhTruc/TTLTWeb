package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.constant.SystemConstant;
import vn.edu.hcmuaf.fit.dao.BlogDAO;
import vn.edu.hcmuaf.fit.dao.CustomerDAO;
import vn.edu.hcmuaf.fit.model.BlogModel;
import vn.edu.hcmuaf.fit.model.CustomerModel;
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

@MultipartConfig
@WebServlet(name = "ManageBlogController", value = "/admin/manage-blog")
public class ManageBlogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionParam = request.getParameter("action");
        String view = "/view/admin/manage-blog.jsp";

        if (actionParam != null) {
            if (actionParam.equals("delete")) {
                BlogDAO dao = new BlogDAO();
                dao.deleteBlog(Integer.parseInt(request.getParameter("id")));
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
        String title = request.getParameter("title");
        String brief = request.getParameter("brief");
        String detail = request.getParameter("detail");

        Part file = request.getPart("ImageUpload");
        String imageFileName = file.getSubmittedFileName();  // get selected image file name
        System.out.println("Selected Image File Name : " + imageFileName);

        String uploadPath = getServletContext().getRealPath("") + File.separator + "/images/blog/" + imageFileName;  // upload path where we have to upload our actual image
        System.out.println("Upload Path : " + uploadPath);

        // Uploading our selected image into the images folder

        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        BlogService.insertBlog( title, brief, detail, imageFileName);

        response.sendRedirect(request.getContextPath() + "/admin/manage-blog");

    }

    private void doPost_Edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id-blog");
        String title = request.getParameter("title");
        String brief = request.getParameter("brief");
        String detail = request.getParameter("detail");

        System.out.println(request.getPart("ImageUpload"));

        Part file = request.getPart("ImageUpload");

        String imageFileName = file.getSubmittedFileName();  // get selected image file name
        System.out.println("Selected Image File Name : " + imageFileName);

        String uploadPath = getServletContext().getRealPath("") + File.separator + "/images/blog/" + imageFileName;  // upload path where we have to upload our actual image
        System.out.println("Upload Path : " + uploadPath);

        // Uploading our selected image into the images folder

        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        BlogService.updateBlog(id, title, brief, detail, imageFileName);

        response.sendRedirect(request.getContextPath() + "/admin/manage-blog?action=edit-blog&id-blog=" + id);
    }
}