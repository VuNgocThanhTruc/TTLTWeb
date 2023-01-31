package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.dao.CustomerDAO;
import vn.edu.hcmuaf.fit.model.CustomerModel;
import vn.edu.hcmuaf.fit.service.CustomerServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManageCustomerController", value = "/admin/manage-customer")
public class ManageCustomerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        xóa khách hàng
       if (request.getParameter("action") != null ){
           if(request.getParameter("action").equals("delete") ){
               CustomerDAO dao = new CustomerDAO();
               dao.deleteCustomer(Integer.parseInt(request.getParameter("id")));
           }
       }
        List<CustomerModel> listCustomer = CustomerServices.getCustomer();
        request.setAttribute("listCustomer",listCustomer);
        request.getRequestDispatcher("/view/admin/manage-customer.jsp").forward(request,response);

//        CustomerDAO
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
