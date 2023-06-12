package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.UserDAO;
import vn.edu.hcmuaf.fit.model.UserModel;

import java.util.List;

public class AccountService {

    public static UserDAO userDAO;

    public AccountService() {
        this.userDAO = new UserDAO();
    }

    //Service lấy ra tất cả tài khoản
    public List<UserModel> getAllUser(){
        return userDAO.getAllUser();
    }
    //Service lấy ra danh sách tài khoản người dùng
    public List<UserModel> getListAccountUser(){
        return userDAO.getListAccountUser();
    }

    //Service lấy ra danh sách tài khoản admin
    public List<UserModel> getListAccountAdmin(){
        return userDAO.getListAccountAdmin();
    }

    public static UserModel getUserById(String id){
        return userDAO.getUserById(id);
    }

    public List<UserModel> getListAccountLocked() {
        return userDAO.getListAccountLocked();
    }

    public Boolean getStatusLockUser(String id){
        return userDAO.getStatusLockUser(id);
    }

    public static void lockOrUnlockUser(String idUser, String action){
        userDAO.changeStatusUser(idUser, action);
    }
}
