package vn.edu.hcmuaf.fit.controller.admin;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;
@MultipartConfig
@WebServlet(name = "UploadController", value = "/admin/upload")
public class UploadController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uploadPath = getServletContext().getRealPath("/images/blog/");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            System.out.println("not exits file");
        }
        Part part = request.getPart("upload");
        String fileName = part.getSubmittedFileName();
        String filePath = uploadPath + File.separator + fileName;
        String sourceSave = request.getServletContext().getRealPath("/") + "/images/blog/" + fileName;
        part.write(sourceSave);
        try (
            InputStream inputStream = part.getInputStream();
            FileOutputStream outputStream = new FileOutputStream(filePath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            String imageUrl = request.getContextPath() + "/images/blog/" + fileName;
            String callback = request.getParameter("CKEditorFuncNum");
            PrintWriter out = response.getWriter();
            out.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ", \"" + imageUrl + "\");</script>");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
