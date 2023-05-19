package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.constant.SystemConstant;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.BookingModel;
import vn.edu.hcmuaf.fit.model.StatusBooking;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.service.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ManageConfirmController", value = "/admin/manage-confirm")
public class ManageConfirmController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String view = "";
        String type = request.getParameter("type");
        String idConfirm = request.getParameter("id-confirm");
        if (type.equals("edit-confirm")) {
            request.setAttribute("bookingCurrent", BookingService.getConfirm(idConfirm));
            request.getRequestDispatcher("/view/admin/edit-confirm.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeParam = request.getParameter("type");
        if (SystemConstant.EDIT.equals(typeParam)) {
            doPost_Edit(request, response);
        }
    }

    private void doPost_Edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user =(UserModel) session.getAttribute("userlogin");

        String id = request.getParameter("id-booking");
        String desc = request.getParameter("desc");
        String date = request.getParameter("date");
        int status = Integer.parseInt(request.getParameter("status"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String address = request.getParameter("address");

        BookingModel bookingModel = new BookingModel();
        bookingModel.setId(id);
        bookingModel.setDate_booking(date);
        bookingModel.setDescription(desc);
        StatusBooking statusBooking = new StatusBooking();
        statusBooking.setId(status);
        bookingModel.setStatusBooking(statusBooking);
        bookingModel.setUsername(username);
        bookingModel.setEmail(email);
        bookingModel.setTel(tel);
        bookingModel.setAddress(address);
        BookingService.updateBooking(bookingModel);

        DBConnect.getInstall().insert(
                new Log(1,
                        Integer.parseInt(user == null ? user.getId() : "-1"),
                        request.getRemoteAddr(),request.getRequestURI(),
                        "Edit confirm: id: " + id,
                        0));

        response.sendRedirect(request.getContextPath() + "/admin/manage-confirm?type=edit-confirm&id-confirm=" + id);
    }
}