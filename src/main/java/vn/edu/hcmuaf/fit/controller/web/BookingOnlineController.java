package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.model.BookingModel;
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

        System.out.println("bookingOnline dopost: " + action);
        HttpSession session = request.getSession();
        session.setAttribute("mess", null);
        if (action == null) {
            System.out.println("Khong thuc hien duoc gi het");
            session.setAttribute("mess", null);
        } else if (action.equals("booking")) {
//            System.out.println("update successfully " );
            String name = request.getParameter("username");
            String tel = request.getParameter("tel");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String time = request.getParameter("time");
            String date = request.getParameter("date");
            String description = request.getParameter("description");
            String payment = request.getParameter("payment");


            UserModel user = (UserModel) session.getAttribute("userlogin");
            CheckoutService checkoutService = new CheckoutService();
            BookingModel booking = new BookingModel();
            if (user != null) {
                booking.setId_user(user.getId());
            }else {
                booking.setId_user(null);
            }
            booking.setStatus_booking(0);
            booking.setUsername(name);
            booking.setEmail(email);
            booking.setTel(tel);
            booking.setAddress(address);
            booking.setDate_booking(date + " " + time + ":00");
            booking.setDescription(description);
            booking.setId_payment(payment);
            int idInserted = checkoutService.insertBookingCart(booking);
            if (idInserted > 0) {
                session.setAttribute("mess", "success");
            }
            response.sendRedirect("bookingOnline");
        }
    }
}
