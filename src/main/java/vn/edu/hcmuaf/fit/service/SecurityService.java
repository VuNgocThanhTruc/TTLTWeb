package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.SecurityDAO;

public class SecurityService {
    public static void lockIpAddress(String ip, String reason, int number_warning){
         SecurityDAO.lockIpAddress(ip, reason, number_warning);
    }

    public static void lockUser(String ip, String reason, int number_warning){
        SecurityDAO.lockUser(ip, reason, number_warning);
    }
}
