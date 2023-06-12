package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.constant.APIConstants;
import vn.edu.hcmuaf.fit.model.BookingModel;
import vn.edu.hcmuaf.fit.model.StatusBooking;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.service.CheckoutService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BookingOnlineController", value = "/bookingOnline")
public class BookingOnlineController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("activeBooking","active");
        request.getRequestDispatcher("/view/web/bookingOnline.jsp").forward(request, response);
        HttpSession session = request.getSession();
        session.setAttribute("mess", null);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        session.setAttribute("mess", null);
        if (action == null) {
            session.setAttribute("mess", null);
        } else if (action.equals("booking")) {
            String name = request.getParameter("username");
            String tel = request.getParameter("tel");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String time = request.getParameter("time");
            String date = request.getParameter("date");
            String description = request.getParameter("description");
            String payment = request.getParameter("payment");
            String fromDistrictID = request.getParameter("id-district");
            String fromWardID = request.getParameter("id-ward");
            int toDistrictID = APIConstants.ID_DISTRICT_STORE;
            int toWardID = APIConstants.ID_WARD_STORE;


            UserModel user = (UserModel) session.getAttribute("userlogin");
            CheckoutService checkoutService = new CheckoutService();
            BookingModel booking = new BookingModel();
            if (user != null) {
                booking.setId_user(user.getId());
            }else {
                booking.setId_user(null);
            }
            StatusBooking statusBooking = new StatusBooking();
            statusBooking.setId(1);

            booking.setStatusBooking(statusBooking);
            booking.setUsername(name);
            booking.setEmail(email);
            booking.setTel(tel);
            booking.setAddress(address);
            booking.setDate_booking(date + " " + time + ":00");
            booking.setDescription(description);
            booking.setId_payment(payment);
            booking.setFromDistrictId(Integer.parseInt(fromDistrictID));
            booking.setFromWardId(Integer.parseInt(fromWardID));
            booking.setToDistrictId(toDistrictID);
            booking.setToWardId(toWardID);

            System.out.println(fromDistrictID);
            System.out.println(fromWardID);
            System.out.println(toWardID);

            int idInserted = checkoutService.insertBookingCart(booking);
            if (idInserted > 0) {
                session.setAttribute("mess", "success");
            }
            response.sendRedirect("bookingOnline");
        }
    }
}
