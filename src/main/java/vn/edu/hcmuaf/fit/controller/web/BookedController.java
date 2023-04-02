package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.model.BookingModel;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.service.BookingService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet( value = "/booked")
public class BookedController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel userModel = (UserModel) session.getAttribute("userlogin");
        List<BookingModel> listBookedByIdUser=BookingService.getListBookedByIdUser(Integer.parseInt(userModel.getId()));

        request.setAttribute("listBooked",listBookedByIdUser);
        request.getRequestDispatcher("/view/web/booked.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
