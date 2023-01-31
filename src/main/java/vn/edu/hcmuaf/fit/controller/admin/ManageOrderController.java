package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.dao.BookingDAO;
import vn.edu.hcmuaf.fit.model.BookingModel;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManageOrderController", value = "/admin/manage-order")
public class ManageOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeParam = request.getParameter("type");
        String view = "/view/admin/manage-order.jsp";
        if (typeParam != null) {
            if (typeParam.equals("delete")) {
                BookingDAO dao = new BookingDAO();
                dao.deleteConfirm(Integer.parseInt(request.getParameter("id")));
            } else if (typeParam.equals("list")) {
                String idBooking = request.getParameter("id-booking");
                if (idBooking != null) {
                    request.setAttribute("listDetailBooking", BookingService.getListDetailBooking(idBooking));
                    view = "/view/admin/listDetailBooking.jsp";
                }
            } else if (typeParam.equals("edit")) {
                String idBooking = request.getParameter("id-booking");
                if (idBooking != null) {
                    request.setAttribute("bookingCurrent", BookingService.getConfirm(idBooking));
                    view = "/view/admin/edit-confirm.jsp";
                }
            } else if (typeParam.equals("add")) {
                view = "/view/admin/add-booking.jsp";
            }
        }

        List<BookingModel> listBooking1 = BookingService.getListBooking();
        request.setAttribute("listBooking1", listBooking1);

        request.getRequestDispatcher(view).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeParam = request.getParameter("type");
        if (typeParam != null) {
            if (typeParam.equals("edit")) {
                String idBooking = request.getParameter("id-booking");
                if (idBooking != null) {
                    String id = request.getParameter("id-booking");
                    String desc = request.getParameter("description");
                    String date = request.getParameter("date");
                    int status = Integer.parseInt(request.getParameter("status"));
                    String username = request.getParameter("username");
                    String email = request.getParameter("email");
                    System.out.println(email);
                    String tel = request.getParameter("tel");
                    String address = request.getParameter("address");
                    BookingService.updateBooking(id, date, desc, status, username, email, tel, address);

                    response.sendRedirect(request.getContextPath() + "/admin/manage-order?type=edit&id-booking=" + id);
                }
            } else if (typeParam.equals("add")) {
                String idBooking = request.getParameter("id-booking");
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("userlogin");
                if (idBooking != null) {
                    String id = request.getParameter("id-booking");
                    String desc = request.getParameter("description");
                    String date = request.getParameter("date");
                    System.out.println(date);
                    int status = Integer.parseInt(request.getParameter("status"));
                    String username = request.getParameter("username");
                    String email = request.getParameter("email");
                    String tel = request.getParameter("tel");
                    String address = request.getParameter("address");
                    BookingService.insertBooking(id, user.getId(), "1", date, desc, status, username, email, tel, address);

                    response.sendRedirect(request.getContextPath() + "/admin/manage-order");
                }
            } else if (typeParam.equals("list")) {
                String idBooking = request.getParameter("id-booking");
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("userlogin");
                if (idBooking != null) {
                    String id = request.getParameter("id-booking");
                    String desc = request.getParameter("description");
                    String date = request.getParameter("date");
                    System.out.println(date);
                    int status = Integer.parseInt(request.getParameter("status"));
                    String username = request.getParameter("username");
                    String email = request.getParameter("email");
                    String tel = request.getParameter("tel");
                    String address = request.getParameter("address");
                    BookingService.insertBooking(id, user.getId(), "1", date, desc, status, username, email, tel, address);

                    response.sendRedirect(request.getContextPath() + "/admin/manage-order");
                }
            }
        }
    }
}
