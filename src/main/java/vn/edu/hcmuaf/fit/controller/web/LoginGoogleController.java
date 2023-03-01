package vn.edu.hcmuaf.fit.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hcmuaf.fit.model.GooglePojo;
import vn.edu.hcmuaf.fit.service.GoogleUtils;

@WebServlet("/login-google")
public class LoginGoogleController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginGoogleController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            request.getRequestDispatcher("/view/web/signin.jsp").forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            request.setAttribute("id-gg", googlePojo.getId());
            request.setAttribute("name-gg", googlePojo.getName());
            request.setAttribute("email-gg", googlePojo.getEmail());
            request.setAttribute("avatar-gg", googlePojo.getPicture());


            request.getRequestDispatcher("/view/web/demo.jsp").forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
