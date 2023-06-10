package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import vn.edu.hcmuaf.fit.model.UserModel;
//Quản lý tài khoản
@WebServlet(name = "ManageAccountController", value = "/admin/manage-account")
public class ManageAccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user =(UserModel) session.getAttribute("userlogin");
        String action = request.getParameter("action");
        String view = "";
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
                            "List account: "  + listAccUser + listAccAdmin,
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
        }

        request.getRequestDispatcher(view).forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
