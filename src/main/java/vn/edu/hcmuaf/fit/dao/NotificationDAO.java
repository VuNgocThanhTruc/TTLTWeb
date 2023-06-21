package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.bean.Notification;
import vn.edu.hcmuaf.fit.bean.NotificationHasLink;
import vn.edu.hcmuaf.fit.bean.NotificationNoLink;
import vn.edu.hcmuaf.fit.db.ConnectToDatabase;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.RoleModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NotificationDAO {
    Connection connection;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public NotificationDAO(){
        connection = DBConnect.getInstall().getConnection();
    }
    public void setCheckedNotify(String idNotify){
        String query = "UPDATE notifications SET checked = true WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, idNotify);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List<Notification> getLatestUncheckedNotifys(){
        List<Notification> notifications = new ArrayList<>();
        String query =  "SELECT id, id_user, title, time, linkNotify, checked FROM `notifications` WHERE checked = 0 ORDER BY time DESC";
        try {
            ResultSet rs = new ConnectToDatabase().selectData(query);
            while (rs.next()) {
                Notification notification = null;
                String id = rs.getString(1);
                String idUser = rs.getString(2);
                String title = rs.getString(3);
                Timestamp time = rs.getTimestamp(4);
                String link = rs.getString(5);
                boolean checked = rs.getBoolean(6);
                if(link != null || !link.equals("")){
                    notification = new NotificationHasLink(id, idUser, title, time, checked, link);
                }else {
                    notification = new NotificationNoLink(id,idUser, title, time, checked);
                }
                notifications.add(notification);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return notifications;
    }
    public List<Notification> getLatestCheckedNotifys(int numberOfNotify){
        String query = "SELECT * FROM notifications WHERE checked = 1 ORDER BY time DESC LIMIT ?;";
        List<Notification> notifications = new ArrayList<Notification>();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, numberOfNotify);
            rs = ps.executeQuery();
            while (rs.next()){
                Notification notification = null;
                String id = rs.getString(1);
                String idUser = rs.getString(2);
                String title = rs.getString(3);
                Timestamp time = rs.getTimestamp(4);
                String link = rs.getString(5);
                boolean checked = rs.getBoolean(6);
                if(link != null || !link.equals("")){
                    notification = new NotificationHasLink(id, idUser, title, time, checked, link);
                }else {
                    notification = new NotificationNoLink(id,idUser, title, time, checked);
                }
                notifications.add(notification);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return notifications;
    }

    public void setCheckedAllNotify(){
        String query = "update notifications set checked = true where checked = false";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
