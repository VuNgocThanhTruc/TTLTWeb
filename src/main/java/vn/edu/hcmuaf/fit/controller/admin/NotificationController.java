package vn.edu.hcmuaf.fit.controller.admin;

import org.json.JSONObject;
import vn.edu.hcmuaf.fit.bean.Notification;
import vn.edu.hcmuaf.fit.bean.NotificationHasLink;
import vn.edu.hcmuaf.fit.dao.NotificationDAO;
import vn.edu.hcmuaf.fit.dao.UserDAO;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.service.NotificationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

@WebServlet(name = "NotificationController", value = "/admin/notification")
public class NotificationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Trả về các thông báo
        ServletContext context = getServletContext();
        String action = request.getParameter("action");
        if(action.equals("loadNotifyAdmin")){
            //Load các thông báo lên admin
            List<Notification> notifications =  NotificationService.getNotifyForAdmin();
            String content = "";
            int length = 0;
            if(notifications == null || notifications.size() == 0){
                content = "<div class=\"notification_empty\">Chưa có thông báo</div>";
            }
            if (notifications != null) for(Notification notification : notifications){
                UserModel user = UserDAO.getUserById(notification.getId_user());
                boolean checked = notification.isChecked();
                String class_checked = "";
                if(checked == false){
                    class_checked = "notify_checked";
                    length ++;
                }
                String avatar = "";
                if(user !=null){
                     avatar = user.getAvatar();
                }
                if (avatar == null || avatar.equals("")){
                    avatar = "no-avatar.png";
                }
                if(notification instanceof NotificationHasLink){
                    content += "<a class=\"notification-link\" data-notification-id=\""+notification.getId()+"\" href=\""+((NotificationHasLink) notification).getLinkNotify()+"\"> <div class=\"notification_item "+ class_checked +"\">\n" +
                            "<div class=\"notification_avatar\">\n" +
                            "<img src=\"../images/user/"+ avatar +"\" alt=\"avatar\">\n" +
                            "</div>\n" +
                            "<div class=\"notification_message\">\n" +
                            "<div>"+notification.getTitle()+"</div>\n" +
                            "<div class=\"notification_createdTime\">"+notification.formatTimeAgo()+"</div>\n" +
                            "</div>\n" +
                            "</div></a>";
                }else{
                    content += "<div class=\"notification_item notification-link"+ class_checked +"\">\n" +
                            "<div class=\"notification_avatar\">\n" +
                            "<img src=\"../images/user/"+ avatar +"\" alt=\"avatar\">\n" +
                            "</div>\n" +
                            "<div class=\"notification_message\">\n" +
                            "<div>"+notification.getTitle()+"</div>\n" +
                            "<div class=\"notification_createdTime\">"+notification.getTime()+"</div>\n" +
                            "</div>\n" +
                            "</div>";
                }
            }
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("notifyLength", length);
            jsonObject.put("notifyContent", content);
            response.setContentType("application/json");
            response.getWriter().write(jsonObject.toString());

            Boolean hasNewNotification =(Boolean) context.getAttribute("hasNewNotify");
            if(hasNewNotification == null || hasNewNotification == true){
                context.setAttribute("hasNewNotify", false);
            }
        }else if(action.equals("checkNewNotify")){
            // Kiểm tra xem có thông báo mới hay không
            Boolean hasNewNotification =(Boolean) context.getAttribute("hasNewNotify");
            if(hasNewNotification == null){
                hasNewNotification = false;
            }
            response.setContentType("text/plain");
            PrintWriter out = response.getWriter();
            out.print(hasNewNotification);
            out.flush();
        } else if(action.equals("changeCheckedNotify")) {
            //Đánh dấu người dùng đã đọc thông báo
            String idNotify = request.getParameter("notificationId");
            NotificationDAO notificationDAO = new NotificationDAO();
            notificationDAO.setCheckedNotify(idNotify);
        } else if (action.equals("changeCheckedAllNotify")) {
            NotificationDAO notificationDAO = new NotificationDAO();
            notificationDAO.setCheckedAllNotify();
        }
    }
}
