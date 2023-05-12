package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.ComponentModel;
import vn.edu.hcmuaf.fit.model.FunctionModel;
import vn.edu.hcmuaf.fit.model.RoleModel;
import vn.edu.hcmuaf.fit.model.UserModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class AuthoritiesDAO {
    Connection connection;
    PreparedStatement ps = null;

    ResultSet rs = null;
    public AuthoritiesDAO(){
        connection = DBConnect.getInstall().getConnection();
    }

    //Lấy ra toàn bộ nhóm quyền
    public List<RoleModel> getAllRole(){
        String query = "Select id_role, name_role, describe_role from roles";
        List<RoleModel> roles = new ArrayList<RoleModel>();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                RoleModel role = new RoleModel(rs.getString("id_role"),rs.getString("name_role"),rs.getString("describe_role"));
                roles.add(role);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return roles;
    }

    //Lấy danh sách thành phần cần phân quyền
    public List<ComponentModel> getAllComponent(){
        String query = "Select id_component, name_component, code_name, enabled from components";
        List<ComponentModel> components = new ArrayList<ComponentModel>();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                ComponentModel component = new ComponentModel(rs.getString("id_component"),rs.getString("name_component"),rs.getString("code_name"),rs.getBoolean("enabled"));
                components.add(component);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return components;
    }

    //Lấy danh sách các chức năng
    public List<FunctionModel> getAllFunction(){
        String query = "Select id_function, name_function from functions";
        List<FunctionModel> functions = new ArrayList<FunctionModel>();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                FunctionModel function = new FunctionModel(rs.getString("id_function"),rs.getString("name_function"));
                functions.add(function);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return functions;
    }

    //tạo và cấp quyền mặc định cho nhóm quyền
    public void createRoleDecDefault(String id_role){
        List<ComponentModel> components = getAllComponent();
        List<FunctionModel> functions = getAllFunction();

        for(ComponentModel component : components){
            for(FunctionModel function : functions){
                decentralizeFunctionForRole(id_role, component.getId(), function.getId(), false);
            }
        }
    }

    //Lấy ra quyền trong một thành thành phần của một user *
    public void getAuthoritiesOfComponent(int id_role, int id_component){
        List<String> decentralizes = new ArrayList<>();
        String query = "select * from decentralizes where id_role = ? and id_component = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id_role);
            ps.setInt(2, id_component);
            rs = ps.executeQuery();
            while (rs.next()){
                decentralizes.add("Decentralize: role=" + rs.getInt("id_role")  + rs.getInt("id_component") + rs.getInt("id_function") + rs.getBoolean("isGrant"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    // tạo quyền sử dụng một chức năng cho nhóm quyền
    public void decentralizeFunctionForRole(String idRole, String idComponent, String idFunction, Boolean isGrant) {

        String query = "INSERT INTO `decentralizes` (`id_role`, `id_component`, `id_function`, `isGrant`) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idRole);
            ps.setString(2, idComponent);
            ps.setString(3, idFunction);
            ps.setBoolean(4, isGrant);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //phân quyền sử dụng chức năng cho nhóm quyền
    public void setDecFuncForRole(String idRole, String idComponent, String idFunction, Boolean isGrant){
        String query = "UPDATE `decentralizes` set isGrant = ? where id_role = ? and id_component = ? and id_function = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setBoolean(1, isGrant);
            ps.setString(2, idRole);
            ps.setString(3, idComponent);
            ps.setString(4, idFunction);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //xóa phân quyền của một nhóm quyền
    public void deleteDecentralizeRole(String idRole){
        String query = "delete from decentralizes where id_role = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idRole);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    //tạo id ngẫu nhiên không trùng cho nhóm quyền
    public String createIdRoleRamdom() {
        Random random = new Random();
        int id = random.nextInt(999999999);
        String result = String.valueOf(id);
        String query = "select id_role from roles where id_role = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()){
                if(rs.getString("id_role") != null){
                    return result;
                }else{
                    return createIdRoleRamdom();
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public void printDecentralizeOfRole(String idRole){
        List<ComponentModel> components = getAllComponent();
        List<FunctionModel> functions = getAllFunction();
        System.out.print("\t");
        if(functions != null)
        for(FunctionModel f : functions){
            System.out.print(f.getName()+"\t");
        }
        System.out.println();
        if(components != null)
        for(ComponentModel c : components){
            System.out.print(c.getId() + "\t");
            if(functions != null)
            for(FunctionModel f : functions){
                System.out.print(getDecFuncOfRolePrint(idRole, c.getId(), f.getId())+"\t\t");
            }
            System.out.println(c.getCode()+"");
        }
    }
    public String getDecFuncOfRolePrint(String idRole, String idComponent, String idFunction){
        String query = "select isGrant from decentralizes where id_role = ? and id_component = ? and id_function =? ";
        String result = "";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idRole);
            ps.setString(2, idComponent);
            ps.setString(3, idFunction);
            rs = ps.executeQuery();
            while (rs.next()){
                result = rs.getBoolean("isGrant") == true ? "o" : "-";
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public Boolean getDecFunctionOfRole(String idRole, String idComponent, String idFunction){
        String query = "select isGrant from decentralizes where id_role = ? and id_component = ? and id_function =? ";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idRole);
            ps.setString(2, idComponent);
            ps.setString(3, idFunction);
            rs = ps.executeQuery();
            while (rs.next()){
                return rs.getBoolean("isGrant");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public void resetRoleById(String idRole) {
        String query = "update decentralizes set isGrant = 0 where id_role = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idRole);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //tạo nhóm quyền
    public synchronized void createRole(String idRole, String nameRole, String describe_role) {
        String query = "insert into roles (`id_role`, `name_role`, `describe_role`) VALUES (?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idRole);
            ps.setString(2, nameRole);
            ps.setString(3, describe_role);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public RoleModel getRoleById(String idRole) {
        String query = "select id_role, name_role, describe_role from roles where id_role = ?";
        RoleModel role = null;
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idRole);
            rs = ps.executeQuery();
            while (rs.next()){
                role = new RoleModel(rs.getString("id_role"), rs.getString("name_role"), rs.getString("describe_role"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return role;
    }

    public void updateRole(String idRole, String nameRole, String describeRole) {
        String query = "update roles set name_role = ?, describe_role = ? where id_role = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, nameRole);
            ps.setString(2, describeRole);
            ps.setString(3, idRole);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public String getNameRoleById(String id) {
        String query = "select name_role from roles where id_role = ? ";
        String nameRole = "Chưa cấp quyền";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()){
                nameRole =  rs.getString("name_role");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return nameRole;
    }

    public Set<UserModel> getListUserOfRole(String idRole){
        Set<UserModel> list = new HashSet<UserModel>();
        if(UserDAO.getAllUser() != null) for(UserModel user : UserDAO.getAllUser()){
            if(user.getIdRole() != null){
                if(user.getIdRole().equals(idRole)){
                    list.add(user);
                }
            }
        }
        return list;
    }
}

