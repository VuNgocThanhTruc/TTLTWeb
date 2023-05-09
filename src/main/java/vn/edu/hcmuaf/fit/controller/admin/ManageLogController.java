package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.dao.LogDAO;
import vn.edu.hcmuaf.fit.dao.UserDAO;
import vn.edu.hcmuaf.fit.model.UserModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "ManageLogController", value = "/admin/manage-log")
public class ManageLogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String view = "";

        if(action.equals("manage-log")){
            List<Log> logs = LogDAO.loadAllLog();
            logs.sort(new Comparator<Log>() {
                @Override
                public int compare(Log o1, Log o2) {
                    return o2.getCreate_at().compareTo(o1.getCreate_at());
                }
            });
            request.setAttribute("logs", logs);
            view = "/view/admin/manage-log.jsp";
        }else if(action.equals("detail-log")){
            String idLog = (String) request.getParameter("id-log");
            Log log = LogDAO.getLogById(idLog);
            log.checked(idLog);
            int idUser = log.getId_user();
            if(idUser != 0){
                UserModel user = UserDAO.getUserById(String.valueOf(idUser));
                request.setAttribute("user", user);
            }

            request.setAttribute("log", log);
            view = "/view/admin/detail-log.jsp";
        }
        request.getRequestDispatcher(view).forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
