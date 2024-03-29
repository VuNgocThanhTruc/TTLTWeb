package vn.edu.hcmuaf.fit.controller.admin;

import com.sun.mail.iap.Response;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.ComponentModel;
import vn.edu.hcmuaf.fit.model.FunctionModel;
import vn.edu.hcmuaf.fit.model.RoleModel;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.service.AuthoritiesService;

import javax.management.relation.Role;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;

@WebServlet(name = "ManageAuthoritiesController", value = "/admin/manage-authorities")
public class ManageAuthoritiesController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user =(UserModel) session.getAttribute("userlogin");

        AuthoritiesService authoritiesService = new AuthoritiesService();
        String view = "";
        String action = request.getParameter("action");
        if(action.equals("add-authorities")){
            List<ComponentModel> components = authoritiesService.getAllComponent();
            List<FunctionModel> functions = authoritiesService.getAllFunction();
            request.setAttribute("components", components);
            request.setAttribute("functions", functions);
            view = "/view/admin/add-authorities.jsp";
        }else if(action.equals("edit-authorities")){
            String idRole = request.getParameter("id-role");
            RoleModel role = authoritiesService.getRoleById(idRole);
            String nameRole = role.getName();
            String describeRole = role.getDescribe();
            List<ComponentModel> components = authoritiesService.getAllComponent();
            List<FunctionModel> functions = authoritiesService.getAllFunction();
            request.setAttribute("id-role", idRole);
            request.setAttribute("name-role", nameRole);
            request.setAttribute("describe-role", describeRole);
            view = "/view/admin/edit-authorities.jsp";
        }else if(action.equals("delete-authorities")){
            List<RoleModel> roles = authoritiesService.getAllRole();
            request.setAttribute("roles", roles);
            String idComponent = request.getParameter("idComp");
            String idRoleDel = request.getParameter("id-role");
            request.setAttribute("id-component", idComponent);
            authoritiesService.deleteRole(idRoleDel);
            DBConnect.getInstall().insert(
                    new Log(3,
                            Integer.parseInt(user == null ? "-1" : user.getId()),
                            request.getRemoteAddr(),request.getRequestURI(),
                            "Xóa nhóm quyền",
                            "Role: id= " +idRoleDel,
                            0));
            view = "/view/admin/manage-authorities.jsp";
        }else if(action.equals("manage-authorities")) {
            List<RoleModel> roles = authoritiesService.getAllRole();
            request.setAttribute("roles", roles);
            String idComponent = request.getParameter("idComp");
            request.setAttribute("id-component", idComponent);
            view = "/view/admin/manage-authorities.jsp";
            DBConnect.getInstall().insert(
                    new Log(0,
                            Integer.parseInt(user == null ? "-1" : user.getId()),
                            request.getRemoteAddr(),request.getRequestURI(),
                            "Manage Authorities Page",
                            0));
        } else if (action.equals("checkRelogin")) {
            System.out.println("dang checkRelogin");
        }
        request.getRequestDispatcher(view).forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user =(UserModel) session.getAttribute("userlogin");

        String action = request.getParameter("action");
        String view = "/view/admin/manage-authorities.jsp?action=manage-authorities";
        AuthoritiesService authoritiesService = new AuthoritiesService();
        if(action.equals("add-authorities")){
            String nameRole = request.getParameter("name-role");
            String describeRole = request.getParameter("describe-role");
            //tạo nhóm quyền
            String idRole = authoritiesService.createIdRole();
            authoritiesService.createRoleSyn(idRole, nameRole, describeRole);
            //cài quyền mặc định cho nhóm quyền
            authoritiesService.createDecRoleDefault(idRole);
            //cài đặt quyền cho nhóm quyền
            String[] decentralizes = request.getParameterValues("cb_decentralize");
            if(decentralizes != null)
                for(String d : decentralizes){
                    String[] inputDecArr = d.split("-");
                    String idComponent = inputDecArr[0];
                    String idFunction = inputDecArr[1];
                    authoritiesService.setDecFuncForRole(idRole, idComponent, idFunction, true);
                }

            DBConnect.getInstall().insert(
                    new Log(2,
                            Integer.parseInt(user == null ? "-1" : user.getId()),
                            request.getRemoteAddr(),request.getRequestURI(),
                            "Thêm nhóm quyền",
                            "Role: id= " + idRole +", nameRole :" + nameRole,
                            0));

            request.setAttribute("notify","Đã thêm nhóm quyền: " + nameRole);
        }else if(action.equals("edit-authorities")){
            String idRole = request.getParameter("id-role");
            String nameRole = request.getParameter("name-role");
            String describeRole = request.getParameter("describe-role");
            //Cài lại tên và mô tả cho nhóm quyền
            authoritiesService.updateRole(idRole, nameRole, describeRole);
            //cài lại quyền mặc định cho nhóm quyền
            authoritiesService.resetRole(idRole);
            //cài quyền cho nhóm quyền
            String[] decentralizes = request.getParameterValues("cb_decentralize");
            if(decentralizes != null)
                for(String d : decentralizes){
                    String[] inputDecArr = d.split("-");
                    String idComponent = inputDecArr[0];
                    String idFunction = inputDecArr[1];
                    authoritiesService.setDecFuncForRole(idRole, idComponent, idFunction, true);
                }

            authoritiesService.print(idRole);

            // Thong bao relogin cho cac tai khoan thuoc nhom quyen
            Set<UserModel> listUserNeedRelogin = authoritiesService.listUserOfRole(idRole);
            Set<UserModel> listUserNeedReloginBegin =(Set<UserModel>) getServletContext().getAttribute("listUserNeedRelogin");
            if(listUserNeedReloginBegin != null && listUserNeedReloginBegin.size() != 0){
                listUserNeedRelogin.addAll(listUserNeedReloginBegin);
            }
            getServletContext().setAttribute("requiredLogin", true);
            getServletContext().setAttribute("listUserNeedRelogin", listUserNeedRelogin);
            getServletContext().setAttribute("idRoleEdit", idRole);

            DBConnect.getInstall().insert(
                    new Log(2,
                            Integer.parseInt(user == null ? "-1" : user.getId()),
                            request.getRemoteAddr(),request.getRequestURI(),
                            "Cập nhật nhóm quyền",
                            "Edit Role: id: " + idRole +", nameRole :" + nameRole,
                            0));

            request.setAttribute("notify","Đã sửa nhóm quyền: " + nameRole);
        }

        List<RoleModel> roles = authoritiesService.getAllRole();
        request.setAttribute("roles", roles);
        request.getRequestDispatcher(view).forward(request,response);
    }
}
