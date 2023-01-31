package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.dao.ContactDAO;
import vn.edu.hcmuaf.fit.dao.CustomerDAO;
import vn.edu.hcmuaf.fit.model.BlogModel;
import vn.edu.hcmuaf.fit.model.ContactModel;
import vn.edu.hcmuaf.fit.service.BlogService;
import vn.edu.hcmuaf.fit.service.ContactService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManageContactController", value = "/admin/manage-contact")
public class ManageContactController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("action") != null ){
            if(request.getParameter("action").equals("delete") ){
                ContactDAO dao = new ContactDAO();
//                dao.deleteContact(Integer.parseInt(request.getParameter("id")));
            }
        }
        List<ContactModel> listContact = ContactService.getContact();
        request.setAttribute("listContact", listContact);
        request.getRequestDispatcher("/view/admin/manage-contact.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}