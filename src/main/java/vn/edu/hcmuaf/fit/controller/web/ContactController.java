package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.bean.Notification;
import vn.edu.hcmuaf.fit.bean.NotificationHasLink;
import vn.edu.hcmuaf.fit.dao.ContactDAO;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.service.NotificationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ContactController", value = "/contact")
public class ContactController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("activeContact","active");
        request.getRequestDispatcher("/view/web/contact.jsp").forward(request,response);
        HttpSession session = request.getSession();
        session.setAttribute("mess", null);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        HttpSession session = request.getSession();
        session.setAttribute("mess", null);
        String name = request.getParameter("name");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        String content = request.getParameter("content");
        ContactDAO contactDAO =new ContactDAO();
        contactDAO.add(name,tel,email,content);

        //Gửi thông báo đến admin
        ServletContext context = getServletContext();
        UserModel user = (UserModel) session.getAttribute("userlogin");
        String idUser = user.getId();
        String title = "Có một liên hệ mới từ <strong>" + name + "</strong>";
        String link = "manage-contact";
        Notification notification = new NotificationHasLink(idUser, title, link);
        NotificationService.sendNotifyHasLink((NotificationHasLink) notification, context);
        session.setAttribute("mess", "successSend");
        response.sendRedirect("contact");
    }
}
