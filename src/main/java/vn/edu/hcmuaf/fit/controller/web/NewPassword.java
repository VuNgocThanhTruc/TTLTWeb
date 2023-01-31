package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.db.ConnectToDatabase;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.setAttribute("mess", null);
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;
        if (newPassword == "" && confPassword == "") {
            session.setAttribute("mess", "errorEnter");
            request.getRequestDispatcher("/view/web/newPassword.jsp").forward(request, response);
        } else if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

            try {
                Connection con = ConnectToDatabase.getConnect();
                PreparedStatement pst = con.prepareStatement("update users set password = ? where email = ? ");
                pst.setString(1, newPassword);
                pst.setString(2, (String) session.getAttribute("email"));

                int rowCount = pst.executeUpdate();
                if (rowCount > 0) {
                    request.setAttribute("status", "Đặt lại thành công");
                    dispatcher = request.getRequestDispatcher("/view/web/signin.jsp");
                } else {
                    request.setAttribute("status", "Đặt lại không thành công");
                    dispatcher = request.getRequestDispatcher("/view/web/signin.jsp");
                }
                dispatcher.forward(request, response);
            } catch (Exception e) {
                System.out.println("Error When new password:" + e.getMessage());

            }
        } else {
            System.out.println("error reset pass");
            session.setAttribute("mess", "errorNewPass");
            request.getRequestDispatcher("/view/web/newPassword.jsp").forward(request, response);
//            response.sendRedirect("ValidateOtp");
        }
    }

}
