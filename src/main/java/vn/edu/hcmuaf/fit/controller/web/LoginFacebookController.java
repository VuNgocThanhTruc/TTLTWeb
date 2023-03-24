package vn.edu.hcmuaf.fit.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.restfb.types.User;

import vn.edu.hcmuaf.fit.dao.UserDAO;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.service.RestFB;

@WebServlet("/login-facebook")
public class LoginFacebookController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginFacebookController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            request.getRequestDispatcher("/view/web/signin.jsp").forward(request, response);

        } else {
            String accessToken = RestFB.getToken(code);
            User user = RestFB.getUserInfo(accessToken);
            request.setAttribute("id-fb", user.getId());
            request.setAttribute("name-fb", user.getName());
            request.setAttribute("login", "facebook");
//            request.setAttribute("avatar", user.getPicture());
            int checkUserName = new UserDAO().checkLogin(user.getId(), user.getId());
            if (checkUserName == 1) {
                UserModel usermodel = UserDAO.loadUsername().get(user.getId());
                session.setAttribute("userlogin", usermodel);
                response.sendRedirect("home");
            } else {
                request.getRequestDispatcher("/view/web/loginWithAPI.jsp").forward(request, response);
            }
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (action == null) {
            System.out.println("Khong thuc hien duoc gi het");
        } else if (action.equals("signupFB")) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String tel = request.getParameter("tel");
            int sex = Integer.parseInt(request.getParameter("sex"));
            String dob = request.getParameter("dob");

            System.out.println(id + " " + name + " " + email + " " + tel + " " + sex + " " + dob);
            UserDAO userdao = new UserDAO();
            userdao.signupWithAPI(id, name, email, tel, sex, dob);
            UserModel user = UserDAO.loadUsername().get(id);
            session.setAttribute("userlogin", user);
            response.sendRedirect("home");
        }
    }

}
