package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.AuthoritiesDAO;
import vn.edu.hcmuaf.fit.model.ComponentModel;
import vn.edu.hcmuaf.fit.model.FunctionModel;
import vn.edu.hcmuaf.fit.model.RoleModel;
import vn.edu.hcmuaf.fit.model.UserModel;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class AuthoritiesService {
    public AuthoritiesDAO authoritiesDAO;
    public AuthoritiesService(){
        authoritiesDAO = new AuthoritiesDAO();
    }
    //lấy danh sách nhóm quyền
    public List<RoleModel> getAllRole(){
        return this.authoritiesDAO.getAllRole();
    }

    //lấy ra một nhóm quyền bằng id
    public RoleModel getRoleById(String idRole){return this.authoritiesDAO.getRoleById(idRole);}

    //lấy danh sách thành phần
    public List<ComponentModel> getAllComponent(){
        return this.authoritiesDAO.getAllComponent();
    }

    //lấy danh sách chức năng
    public List<FunctionModel> getAllFunction(){
        return this.authoritiesDAO.getAllFunction();
    }

    //kiểm ra một quyền sử dụng chức năng có được cấp hay chưa
    public Boolean getDecentralizeFuncOfRole(String idRole, String idComponent, String idFunction){
        return authoritiesDAO.getDecFunctionOfRole(idRole, idComponent, idFunction);
    }

    //set lại nhóm quyền từ đầu(không cấp quyền nào)
    public void resetRole(String id_role){
        authoritiesDAO.resetRoleById(id_role);
    }
    //gán quyền sử dụng một chức năng cho nhóm quyền
    public void decentralizeFunctionForRole(String id_role, String id_component, String id_function, Boolean isGrant){
        this.authoritiesDAO.decentralizeFunctionForRole(id_role, id_component, id_function, isGrant);
    }

    //tạo id ngẫu nhiên id nhóm quyền không trùng
    public String createIdRole(){
        return authoritiesDAO.createIdRoleRamdom();
    }

    //tạo một nhóm quyền
    public synchronized void createRoleSyn(String id_role, String name_role, String describe_role){
        authoritiesDAO.createRole(id_role, name_role, describe_role);
    }
    //tạo quyền mặc định cho nhóm quyền (chưa cấp quyền cho tất cả chức năng)
    public synchronized void createDecRoleDefault(String idRole){
        authoritiesDAO.createRoleDecDefault(idRole);
    }
    //sửa quyền sử dụng một chức năng cho một nhóm quyền
    public void setDecFuncForRole(String idRole, String idComponent, String idFunction, Boolean isGrant){
        this.authoritiesDAO.setDecFuncForRole(idRole, idComponent, idFunction, isGrant);
    }

    //in dữ liệu quyền dưới consloe
    public void print(String idRole) {
        authoritiesDAO.printDecentralizeOfRole(idRole);
    }

    //Cập nhật nhóm quyền
    public void updateRole(String idRole, String nameRole, String describeRole) {
        authoritiesDAO.updateRole(idRole, nameRole, describeRole);
    }
    // Lay ra ten nhom quyen bang id
    public String getNameRoleById(String id){
        return authoritiesDAO.getNameRoleById(id);
    }

    // Lay ra cac tai khoan thuoc nhom quyen tu idRole
    public Set<UserModel> listUserOfRole(String idRole){
        return authoritiesDAO.getListUserOfRole(idRole);
    }

    //Xoa nhom quyen
    public void deleteRole(String idRoleDel){
        authoritiesDAO.deleteRole(idRoleDel);
    }

    //CheckRelogin

    public static void checkRelogin(ServletContext context, UserModel user){
        Boolean requiredLogin = (Boolean) context.getAttribute("requiredLogin");
        UserModel userModel = null;
        if(requiredLogin != null && requiredLogin){
            Set<UserModel> listUserNeedRelogin = (Set<UserModel>) context.getAttribute("listUserNeedRelogin");
            if(user != null) {
                if(listUserNeedRelogin != null){
                    for (UserModel userNeedRelogin : listUserNeedRelogin){
                        if(userNeedRelogin.getId().equals(user.getId())){
                            userModel = userNeedRelogin;
                            break;
                        }
                    }
                }
            }
            if(userModel != null){
                listUserNeedRelogin.remove(userModel);
            }
            if(listUserNeedRelogin.size() == 0){
                context.setAttribute("requiredLogin", false);
            }else{
                context.setAttribute("listUserNeedRelogin", listUserNeedRelogin);
            }
        }

    }
    //Cấp toàn bộ quyền
    public void grantAllForAdmin(String idRole){
        if(idRole.equals("1")){
            for(ComponentModel component : getAllComponent()){
                if(!authoritiesDAO.checkComponentExistDec(component.getId())){
                    for(FunctionModel function : getAllFunction()){
                        decentralizeFunctionForRole(idRole, component.getId(), function.getId(), true);
                    }
                    continue;
                }
            }

        }
    }
}
