package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.db.DBConnect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LogService {
    //Check log số lượng tối đa cho phép đăng nhập sai
    public static final Integer LOGIN_FAILED_LOG_MAX = 5;

    //Check log số lượng cố gắng đăng nhập quá nhiều lần cho phép và lock ip
    public static final Integer LOGIN_FAILED_LOG_LOCK_IP = 20;
    public LogService(){
    }

    //Cảnh báo log khi đăng nhập sai quá nhiều lần hoặc lock ip khi cố gắng đăng nhập không hợp pháp
    public static void logUserLoginFailed(String ipAddressLoginFailed, Integer failedLoginCount, HttpServletRequest request){
        HttpSession session = request.getSession();
        if (failedLoginCount == null) {
            failedLoginCount = 0;
        }
        if(ipAddressLoginFailed == null){
            session.setAttribute("ipAddressLoginFailed", ipAddressLoginFailed);
        }else if(ipAddressLoginFailed.equals(ipAddressLoginFailed)) {
            failedLoginCount++;
            session.setAttribute("failedLoginCount", failedLoginCount);
            if(failedLoginCount == LOGIN_FAILED_LOG_MAX && failedLoginCount < LOGIN_FAILED_LOG_LOCK_IP){
                //Gửi lock cảnh báo đăng nhập sai nhiều lần
                DBConnect.getInstall().insert(
                        new Log(2,
                                -1,
                                ipAddressLoginFailed,
                                request.getRequestURI(),
                                "Login failed "+ failedLoginCount +" times",
                                0));
            }else if(failedLoginCount == LOGIN_FAILED_LOG_LOCK_IP){
                //Gửi lock cảnh báo ip cố gắng xâm nhập quá nhiều lần và lock ip
                DBConnect.getInstall().insert(
                        new Log(3,
                                -1,
                                ipAddressLoginFailed,
                                request.getRequestURI(),
                                "Login failed "+ failedLoginCount +" times, Suspected illegal login attempt",
                                0));
            }
        }
    }

}
