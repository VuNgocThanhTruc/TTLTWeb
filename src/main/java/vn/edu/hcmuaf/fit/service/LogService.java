package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.dao.UserDAO;
import vn.edu.hcmuaf.fit.db.ConnectToDatabase;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.model.VisitorModel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.*;

public class LogService {
    //Check log số lượng tối đa cho phép ip_address đăng nhập sai
    public static final Integer LOGIN_FAILED_LOG_MAX_IP = 5;

    //Check log số lượng cố gắng đăng nhập quá nhiều lần cho phép và lock ip
    public static final Integer LOGIN_FAILED_LOG_LOCK_IP = 10;

    //Số lần đăng nhập sai user cần ghi lại
    public static final Integer LOGIN_FAILED_LOG_USER = 5;

    //Số lần đăng nhập sai tối đa cho phép khi user đăng nhập sai
    public static final Integer LOGIN_FAILED_LOG_LOCK_USER = 10;

    public LogService(){
    }

    //Cảnh báo log khi đăng nhập sai quá nhiều lần hoặc lock ip khi cố gắng đăng nhập không hợp pháp
    public static void logIpAddressLoginFailed(String ipAddress, Integer failedLoginCount, HttpServletRequest request){
        HttpSession session = request.getSession();
        if (failedLoginCount == null) {
            failedLoginCount = 0;
        }
        String ipLoginFailed = (String) session.getAttribute("ipAddressLoginFailed");
        if(ipLoginFailed == null){
            session.setAttribute("ipAddressLoginFailed", ipAddress);
        }else if(ipAddress.equals(ipLoginFailed)) {
            failedLoginCount++;
            session.setAttribute("failedLoginCount", failedLoginCount);
            session.setAttribute("ipAddressLoginFailed", ipAddress);
            if(failedLoginCount == LOGIN_FAILED_LOG_MAX_IP && failedLoginCount < LOGIN_FAILED_LOG_LOCK_IP){
                //Gửi lock cảnh báo đăng nhập sai nhiều lần
                DBConnect.getInstall().insert(
                        new Log(2,
                                -1,
                                ipAddress,
                                request.getRequestURI(),
                                "Login failed "+ failedLoginCount +" times",
                                0));
            }else if(failedLoginCount == LOGIN_FAILED_LOG_LOCK_IP){
                //Gửi lock cảnh báo ip cố gắng xâm nhập quá nhiều lần và lock ip
                SecurityService.lockIpAddress(ipAddress, "Đăng nhập sai quá nhiều lần", failedLoginCount);
                DBConnect.getInstall().insert(
                        new Log(3,
                                -1,
                                ipAddress,
                                request.getRequestURI(),
                                "Login failed "+ failedLoginCount +" times, Suspected illegal login attempt",
                                0));
            }
        }
    }

    // Ghi lại số người truy cập
    public static void logAccess(java.util.Date date) {
        Connection connection = new ConnectToDatabase().getConnect();
        if(isFirstAccess(date)){
            String sql = "insert into number_visitors values(?,1)";
            PreparedStatement ps = null;
            try {
                ps = connection.prepareStatement(sql);
                ps.setDate(1,(java.sql.Date) date);
                ps.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else{
            String sql = "update number_visitors set amount = amount + 1 where date_access = ? ";
            try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setDate(1,(java.sql.Date) date);
                ps.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public static boolean isFirstAccess(java.util.Date date) {
        VisitorModel Visitor = null;
        String sql = "select date_access, amount from number_visitors where date_access = ? ";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setDate(1,(java.sql.Date) date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Visitor = new VisitorModel(rs.getDate(1), rs.getInt(2));
            }

        }catch (Exception e){
            e.getMessage();
        }

        if(Visitor == null){
            return true;
        }
        return false;
    }

    //Ghi lại user đăng nhập sai mật khẩu
    public static void logUserLoginFailed(String username, Integer failedLoginCount, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userLoginFailed =(String) session.getAttribute("userLoginFailed");
        if (failedLoginCount == null) {
            failedLoginCount = 0;
        }
        System.out.println("so sanh user: "+ username + ", "+ userLoginFailed);
        System.out.println("ket qua ss user: "+ username.equals(userLoginFailed));
        System.out.println("----------------------------------------------");
        if(userLoginFailed == null){
            session.setAttribute("userLoginFailed", username);
        }else if(username.equals(session.getAttribute("userLoginFailed"))) {
            failedLoginCount++;
            session.setAttribute("failedUserLoginCount", failedLoginCount);
            session.setAttribute("userLoginFailed", username);
            if(failedLoginCount == LOGIN_FAILED_LOG_USER && failedLoginCount < LOGIN_FAILED_LOG_LOCK_USER){
                //Gửi lock cảnh báo user đăng nhập sai nhiều lần
                DBConnect.getInstall().insert(
                        new Log(2,
                                -1,
                                username,
                                request.getRequestURI(),
                                "User login failed "+ failedLoginCount +" times",
                                0));
            }else if(failedLoginCount == LOGIN_FAILED_LOG_LOCK_USER){
                //Gửi lock cảnh báo user đăng nhập sai quá nhiều lần và lock user
                UserModel user = UserDAO.loadUsername().get(username);
                SecurityService.lockUser(user.getId(), "User đăng nhập sai quá nhiều lần", failedLoginCount);
                DBConnect.getInstall().insert(
                        new Log(3,
                                -1,
                                username,
                                request.getRequestURI(),
                                "User login failed "+ failedLoginCount +" times, Suspected illegal login attempt",
                                0));
            }
        }
    }

}
