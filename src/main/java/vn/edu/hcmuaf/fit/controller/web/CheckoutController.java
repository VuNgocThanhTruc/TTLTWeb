package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.model.*;
import vn.edu.hcmuaf.fit.service.CheckoutService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        HashMap<Integer, ProductCartModel> cart = (HashMap<Integer, ProductCartModel>) session.getAttribute("cart");
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("view/web/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String address = request.getParameter("address");
        String time = request.getParameter("time");
        String date = request.getParameter("date");
        String description = request.getParameter("description");
        String payment = request.getParameter("payment");
        String store = request.getParameter("store");

        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("userlogin");
        CheckoutService checkoutService = new CheckoutService();
        BookingModel booking = new BookingModel();
        if (user != null) {
            booking.setId_user("1");
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
        int idInserted = checkoutService.insertBookingCart(booking);
        if (idInserted > 0) {
            session.setAttribute("mess", "success");
        }

        HashMap<Integer, ProductCartModel> cart = (HashMap<Integer, ProductCartModel>) session.getAttribute("cart");

        boolean checkAddBooking = false;
        for (Map.Entry<Integer, ProductCartModel> productCart : cart.entrySet()) {
            DetailBookingModel checkoutDetail = new DetailBookingModel(productCart.getKey(), productCart.getValue().getProductModel().getId(), productCart.getValue().getQuantity());
            checkAddBooking = CheckoutService.addDetailBooking(idInserted, checkoutDetail);
        }

        if (cart != null && checkAddBooking)
            session.removeAttribute("cart");
        response.sendRedirect("cart");
    }
}
