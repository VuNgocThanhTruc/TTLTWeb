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

        AccountService accountService = new AccountService();
        //Gọi danh sách tài khoản người dùng
        List<UserModel> listAccUser = accountService.getListAccountUser();

        //Gọi danh sách tài khoản admin
        List<UserModel> listAccAdmin = accountService.getListAccountAdmin();
        DBConnect.getInstall().insert(
                new Log(0,
                        Integer.parseInt(user == null ? user.getId() : "-1"),
                        request.getRemoteAddr(),request.getRequestURI(),
                        "List account: "  + listAccUser + listAccAdmin,
                        0));
        request.setAttribute("listAccUser", listAccUser);
        request.setAttribute("listAccAdmin", listAccAdmin);
        request.getRequestDispatcher("/view/admin/manage-account.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
