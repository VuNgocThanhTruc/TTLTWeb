package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.dao.UserDAO;
import vn.edu.hcmuaf.fit.db.ConnectToDatabase;
import vn.edu.hcmuaf.fit.model.UserModel;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@MultipartConfig
@WebServlet("/AddImage")
public class AddImage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddImage() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        System.out.println("In do post method of Add Image servlet.");
        Part file = request.getPart("image");

        String imageFileName = file.getSubmittedFileName();  // get selected image file name
        System.out.println("Selected Image File Name : " + imageFileName);

        String uploadPath = getServletContext().getRealPath("") + File.separator +"/images/user/" + imageFileName;  // upload path where we have to upload our actual image
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

        UserModel user = (UserModel) session.getAttribute("userlogin");
        session.setAttribute("userlogin", user);
        UserDAO userDAO = new UserDAO();
        userDAO.addImage(user.getId(), imageFileName);
        user = UserDAO.loadId().get(user.getId());
        session.setAttribute("userlogin", user);
        request.getRequestDispatcher("/view/web/profile-admin.jsp").forward(request, response);


    }


}