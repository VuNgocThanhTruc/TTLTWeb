package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;

public class SecurityDAO {
    Connection connection;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public SecurityDAO(){
        connection = DBConnect.getInstall().getConnection();
    }

    public static void lockIpAddress(String ip, String reason, int number_warning){
        String sql = "INSERT INTO `ip_address_log`(`ip_address`, `locked`, `reason`, `number_warning`) " +
                "VALUES(?, true, ?, ?)";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, ip);
            ps.setString(2, reason);
            ps.setInt(3, number_warning);
            ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    public static void lockUser(String id_user, String reason, int number_warning){
        String sql = "INSERT INTO `user_log`(`id_user`, `locked`, `reason`, `number_warning`, `modified_date`) VALUES(?,true,?,?,?)";
        java.sql.Date now = new java.sql.Date(System.currentTimeMillis());
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, id_user);
            ps.setString(2, reason);
            ps.setInt(3, number_warning);
            ps.setDate(4,now);
            ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
