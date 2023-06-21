package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.SecurityDAO;
import vn.edu.hcmuaf.fit.dao.UserDAO;
import vn.edu.hcmuaf.fit.db.DBConnect;

import java.sql.PreparedStatement;

public class SecurityService {
    public static void lockIpAddress(String ip, String reason, int number_warning){
         SecurityDAO.lockIpAddress(ip, reason, number_warning);
    }

    public static void lockUser(String id_user, String reason, int number_warning){

        UserDAO userDAO = new UserDAO();
        if(userDAO.checkUserLogged(id_user)){
            SecurityDAO.lockUserAlerted(id_user, reason, number_warning);
        }else{
            SecurityDAO.lockUser(id_user, reason, number_warning);
        }
    }
}
