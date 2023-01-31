package vn.edu.hcmuaf.fit.controller.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ValidateOtp
 */
@WebServlet("/ValidateOtp")
public class ValidateOtp extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        try {
            int value = Integer.parseInt(request.getParameter("otp"));

            int otp = (int) session.getAttribute("otp");


            if (value == otp) {

                request.setAttribute("email", request.getParameter("email"));
                request.setAttribute("status", "success");
                dispatcher = request.getRequestDispatcher("/view/web/newPassword.jsp");
                dispatcher.forward(request, response);

            } else {
                request.setAttribute("message", "OTP sai");

                dispatcher = request.getRequestDispatcher("/view/web/enterOtp.jsp");
                dispatcher.forward(request, response);

            }
        } catch (Exception e) {
            System.out.println("Error When OTP:" + e.getMessage());
            request.setAttribute("message", "OTP là chuỗi số");
            dispatcher = request.getRequestDispatcher("/view/web/enterOtp.jsp");
            dispatcher.forward(request, response);

        }

    }

}
