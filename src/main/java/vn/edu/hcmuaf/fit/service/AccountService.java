package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.UserDAO;
import vn.edu.hcmuaf.fit.model.User;

import java.util.List;

public class AccountService {

    public UserDAO userDAO;

    public AccountService() {
        this.userDAO = new UserDAO();
    }

    //Service lấy ra tất cả tài khoản
    public List<User> getAllUser(){
        return userDAO.getAllUser();
    }
}
