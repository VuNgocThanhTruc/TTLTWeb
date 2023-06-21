package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.bean.Notification;
import vn.edu.hcmuaf.fit.bean.NotificationHasLink;
import vn.edu.hcmuaf.fit.bean.NotificationNoLink;
import vn.edu.hcmuaf.fit.dao.NotificationDAO;
import vn.edu.hcmuaf.fit.db.ConnectToDatabase;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.UserModel;

import javax.servlet.ServletContext;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class NotificationService {
    public NotificationService(){
    }

    public static void sendNotifyHasLink(NotificationHasLink notificationHasLink, ServletContext context){
        //Lưu thông báo vào cơ sở dữ liệu
        DBConnect.getInstall().insertNotify(notificationHasLink);
        //Gửi thông báo cho admin
        context.setAttribute("hasNewNotify", true);
    }

    public static void sendNotifyNoLink(NotificationNoLink notificationNoLink, ServletContext context){
        //Lưu thông báo vào cơ sở dữ liệu
        DBConnect.getInstall().insertNotify(notificationNoLink);
        //Gửi thông báo cho admin
        context.setAttribute("hasNewNotify", true);
    }

    public static List<Notification> getNotifyForAdmin(){
        NotificationDAO notificationDAO = new NotificationDAO();
        List<Notification> notifications = new ArrayList<>();
        List<Notification> notificationUnchecked = notificationDAO.getLatestUncheckedNotifys();
        List<Notification> notificationChecked = notificationDAO.getLatestCheckedNotifys(10);
        notifications.addAll(notificationUnchecked);
        notifications.addAll(notificationChecked);
        return notifications;
    }
}
