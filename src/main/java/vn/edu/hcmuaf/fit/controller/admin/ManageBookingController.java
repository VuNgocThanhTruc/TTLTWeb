package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.dao.BookingDAO;
import vn.edu.hcmuaf.fit.dao.CustomerDAO;
import vn.edu.hcmuaf.fit.model.BookingModel;
import vn.edu.hcmuaf.fit.service.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManageBookingController", value = "/admin/manage-booking")
public class ManageBookingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
        String statusParam = request.getParameter("status");
        String view = "";
        List<BookingModel> listBooking = null;
        if (statusParam == null) {
            //get all list booking
            view = "/view/admin/manage-booked.jsp";
        } else if (statusParam.equalsIgnoreCase("accepted")) {
            listBooking = BookingService.getListBooking(1);
            view = "/view/admin/manage-booked.jsp";
        } else if (statusParam.equalsIgnoreCase("wait-accept")) {
            String actionParam = request.getParameter("action");
            if (actionParam != null && actionParam.equals("change_status")) {
                String idBookingParam = request.getParameter("id-booking");
                if (idBookingParam != null) {
                    boolean checkUpdateStatusBooking = BookingService.updateStatusBooking(idBookingParam);
                    request.setAttribute("message", checkUpdateStatusBooking);
                }
            }
            listBooking = BookingService.getListBooking(0);
            view = "/view/admin/manage-confirm.jsp";
        }
        if (request.getParameter("action") != null ){
            if(request.getParameter("action").equals("delete") ){
                BookingDAO dao = new BookingDAO();
                dao.deleteConfirm(Integer.parseInt(request.getParameter("id")));
                listBooking = BookingService.getListBooking(0);
            }
        }
        request.setAttribute("listBooking", listBooking);
        request.getRequestDispatcher(view).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
