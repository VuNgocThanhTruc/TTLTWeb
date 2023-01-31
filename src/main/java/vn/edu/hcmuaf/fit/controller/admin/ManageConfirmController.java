package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.constant.SystemConstant;
import vn.edu.hcmuaf.fit.service.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        String id = request.getParameter("id-booking");
        String desc = request.getParameter("desc");
        String date = request.getParameter("date");
        int status = Integer.parseInt(request.getParameter("status"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String address = request.getParameter("address");
        BookingService.updateBooking(id, date, desc, status, username, email, tel, address);

        response.sendRedirect(request.getContextPath() + "/admin/manage-confirm?type=edit-confirm&id-confirm=" + id);
    }
}