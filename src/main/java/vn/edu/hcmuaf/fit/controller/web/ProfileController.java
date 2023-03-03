package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.dao.UserDAO;
import vn.edu.hcmuaf.fit.model.UserModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import static java.lang.Integer.parseInt;

@WebServlet("/profile")
public class ProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/web/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        String action = request.getParameter("action");

        System.out.println("Profile dopost: " + action);
        HttpSession session = request.getSession();
        session.setAttribute("mess", null);
        if (action == null) {
            System.out.println("Khong thuc hien duoc gi het");
            session.setAttribute("mess", null);
        } else if (action.equals("update")) {
            System.out.println("update thanhcong ");
            String id = request.getParameter("id");
            String hovaten = request.getParameter("name");
            int sex = parseInt(request.getParameter("sex"));
            String email = request.getParameter("email");
            String tel = request.getParameter("tel");
            String dob = request.getParameter("dob");
            String address = request.getParameter("address");
            UserDAO user = new UserDAO();
            user.editPro(id, hovaten, sex, email, tel, dob, address);

            UserModel user2 = UserDAO.loadId().get(id);
            session.setAttribute("userlogin", user2);
            System.out.println(id + " " + hovaten + " " + 0 + " " + email + " " + tel + " " + dob + " " + address);
            request.getRequestDispatcher("/view/web/profile.jsp").forward(request, response);

        }
//        else if (action.equals("addImage")) {
//
//            System.out.println("In do post method of Add Image servlet.");
//            Part file = request.getPart("image");
//
//            String imageFileName = file.getSubmittedFileName();  // get selected image file name
//            System.out.println("Selected Image File Name : " + imageFileName);
//
//            String uploadPath = "E:/WebProgramming/src/main/webapp/images/user/" + imageFileName;  // upload path where we have to upload our actual image
//            System.out.println("Upload Path : " + uploadPath);
//
//            try {
//
//                FileOutputStream fos = new FileOutputStream(uploadPath);
//                InputStream is = file.getInputStream();
//
//                byte[] data = new byte[is.available()];
//                is.read(data);
//                fos.write(data);
//                fos.close();
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//            User user = (User) session.getAttribute("userlogin");
//
//            UserDAO userDAO = new UserDAO();
//            userDAO.addImage(user.getId(),imageFileName);
//            request.getRequestDispatcher("/view/web/profile.jsp").forward(request, response);
//        }
    }
}
