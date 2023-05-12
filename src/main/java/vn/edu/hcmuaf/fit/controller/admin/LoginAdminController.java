package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.dao.UserDAO;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.util.Encode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/login-admin")
public class LoginAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        int checkUserName = 2;

        if (checkUserName == 1) {

            UserModel user = UserDAO.loadUsername().get(username);
            session.setAttribute("userlogin", user);
            session.setAttribute("mess", null);
            response.sendRedirect("home");

        }  else if (checkUserName == 2) {
            UserModel user = UserDAO.loadUsername().get(username);
            session.setAttribute("userlogin", user);
            session.setAttribute("mess", null);
            System.out.println("admin dang nhap");
            response.sendRedirect("admin/index");

        }  else {
            session.setAttribute("mess", "errorsignin");
            //response.sendRedirect("signin");
            response.sendRedirect("admin/index");
        }
    }
}
