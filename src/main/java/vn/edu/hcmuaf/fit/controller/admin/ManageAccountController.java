package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.dao.UserDAO;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.util.Encode;

//Quản lý tài khoản
@WebServlet(name = "ManageAccountController", value = "/admin/manage-account")
public class ManageAccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user =(UserModel) session.getAttribute("userlogin");
        String action = request.getParameter("action");
        String view = "";
        if(action != null){
            if(action.equals("manager-account")){
                AccountService accountService = new AccountService();
                //Gọi danh sách tài khoản người dùng
                List<UserModel> listAccUser = accountService.getListAccountUser();
                //Gọi danh sách tài khoản admin
                List<UserModel> listAccAdmin = accountService.getListAccountAdmin();
                //Gọi danh sách các tài khoản bị khóa
                List<UserModel> listAccLocked = accountService.getListAccountLocked();
                DBConnect.getInstall().insert(
                        new Log(0,
                                Integer.parseInt(user == null ? "-1" : user.getId()),
                                request.getRemoteAddr(),
                                request.getRequestURI(),
                                "Lấy ra danh sách các tài khoản",
                                "" + listAccUser + listAccAdmin,
                                0));
                request.setAttribute("listAccUser", listAccUser);
                request.setAttribute("listAccAdmin", listAccAdmin);
                request.setAttribute("listAccLocked", listAccLocked);
                view = "/view/admin/manage-account.jsp";
            } else if(action.equals("profile-user")){
                String idUserLog = (String) request.getParameter("id-user");
                if(idUserLog.equals("Null")){
                    view = "/view/common/notfound.jsp";
                }else{
                    UserModel userLog = AccountService.getUserById(idUserLog);
                    request.setAttribute("userLog", userLog);
                    view = "/view/admin/profile-admin.jsp";
                }
            } else if (action.equals("changeStatusUser")) {
                String actionChange = request.getParameter("statusUser");
                String userId = request.getParameter("userId");
                AccountService.lockOrUnlockUser(userId, actionChange);
            } else if (action.equals("add-account-admin")){
                    view = "/view/admin/add-account.jsp";
            }
        }else{
            AccountService accountService = new AccountService();
            List<UserModel> listAccUser = accountService.getListAccountUser();
            List<UserModel> listAccAdmin = accountService.getListAccountAdmin();
            List<UserModel> listAccLocked = accountService.getListAccountLocked();
            DBConnect.getInstall().insert(
                    new Log(0,
                            Integer.parseInt(user == null ? "-1" : user.getId()),
                            request.getRemoteAddr(),
                            request.getRequestURI(),
                            "Lấy ra danh sách các tài khoản",
                            "List account: "  + listAccUser + listAccAdmin,
                            0));
            request.setAttribute("listAccUser", listAccUser);
            request.setAttribute("listAccAdmin", listAccAdmin);
            request.setAttribute("listAccLocked", listAccLocked);
            view = "/view/admin/manage-account.jsp";
        }

        request.getRequestDispatcher(view).forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user =(UserModel) session.getAttribute("userlogin");
        String action = request.getParameter("action");
        String view = "";
        if(action.equals("add-account")){
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            password = Encode.toSHA1(password);
            String hovaten = request.getParameter("hovaten");
            String email = request.getParameter("email");
            String dob = request.getParameter("dob");
            int sex = Integer.parseInt(request.getParameter("sex"));
            String idRole =  request.getParameter("role");
            int check = new UserDAO().checksignup(hovaten, username, email, password);
            if (check == 1) {
                new UserDAO().signupAdmin(hovaten, sex, dob, email, username, password, idRole);
                session.setAttribute("mess", "success");
                request.getRequestDispatcher("/view/admin/add-account.jsp").forward(request, response);
            } else if (check == 2) {
                session.setAttribute("mess", "errornull");
                response.sendRedirect("signup");
            } else {
                session.setAttribute("mess", "errorsignup");
                response.sendRedirect("signup");
            }
        }
    }
}
