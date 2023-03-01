package vn.edu.hcmuaf.fit.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.restfb.types.User;

import vn.edu.hcmuaf.fit.service.RestFB;

@WebServlet("/login-facebook")
public class LoginFacebookController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginFacebookController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            request.getRequestDispatcher("/view/web/signin.jsp").forward(request, response);

        } else {
            String accessToken = RestFB.getToken(code);
            User user = RestFB.getUserInfo(accessToken);
            request.setAttribute("id-fb", user.getId());
            request.setAttribute("name-fb", user.getName());
//            request.setAttribute("email", user.getEmail());
//            request.setAttribute("avatar", user.getPicture());
            request.getRequestDispatcher("/view/web/demo.jsp").forward(request, response);

        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
