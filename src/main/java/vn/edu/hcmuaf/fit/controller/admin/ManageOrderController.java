package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.dao.BookingDAO;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.BookingModel;
import vn.edu.hcmuaf.fit.model.StatusBooking;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.service.BookingService;
import vn.edu.hcmuaf.fit.service.ExportService;

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
        HttpSession session = request.getSession();
        UserModel user =(UserModel) session.getAttribute("userlogin");
        String typeParam = request.getParameter("type");
        String view = "/view/admin/manage-order.jsp";
        if (typeParam != null) {
            if (typeParam.equals("delete")) {
                BookingDAO dao = new BookingDAO();
                dao.deleteConfirm(Integer.parseInt(request.getParameter("id")));
            } else if (typeParam.equals("list")) {
                String idBooking = request.getParameter("id-booking");
                if (idBooking != null) {
                    request.setAttribute("idBooking", idBooking);
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
            }else if (typeParam.equals("exportExcel")) {
                ExportService.exportOrder(request,response);
            } else if(typeParam.equals("exportExcelDetail")){
                String idBooking = request.getParameter("idBooking");
                ExportService.exportOrderDetail(idBooking, request, response);
                DBConnect.getInstall().insert(
                        new Log(0,
                                Integer.parseInt(user == null ? "-1" : user.getId()),
                                request.getRemoteAddr(),request.getRequestURI(),
                                "Xuất dữ liệu chi tiết đặt hàng",
                                "Export Data Detail Booking id: "  + idBooking,
                                0));
            }
        }

        List<BookingModel> listBooking = BookingService.getListBooking();
        request.setAttribute("listBooking", listBooking);

        request.getRequestDispatcher(view).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user =(UserModel) session.getAttribute("userlogin");

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
                                    Integer.parseInt(user == null ? "-1" : user.getId()),
                                    request.getRemoteAddr(),request.getRequestURI(),
                                    "Sửa lịch đặt",
                                    "Update Booking id: "  + idBooking+", desc: " +desc +", date: " +date+", status: "+ status+", username: "+username + ", email: "+email +", tel: " + tel + "address: " +address ,
                                    0));
                    response.sendRedirect(request.getContextPath() + "/admin/manage-order?type=edit&id-booking=" + id);
                }
            } else if (typeParam.equals("add")) {
                String idBooking = request.getParameter("id-booking");
                if (idBooking != null) {
                    String id = request.getParameter("id-booking");
                    String desc = request.getParameter("description");
                    String date = request.getParameter("date");
                    int status = Integer.parseInt(request.getParameter("status"));
                    String username = request.getParameter("username");
                    String email = request.getParameter("email");
                    String tel = request.getParameter("tel");
                    String address = request.getParameter("address");
                    BookingService.insertBooking(id, user.getId(), "1", date, desc, status, username, email, tel, address);
                    DBConnect.getInstall().insert(
                            new Log(0,
                                    Integer.parseInt(user == null ? "-1" : user.getId()),
                                    request.getRemoteAddr(),request.getRequestURI(),
                                    "Thêm đặt lịch",
                                    "Add Booking id: "  + idBooking+", desc: " +desc +", date: " +date+", status: "+ status+", username: "+username + ", email: "+email +", tel: " + tel + "address: " +address ,
                                    0));
                    response.sendRedirect(request.getContextPath() + "/admin/manage-order");
                }
            }
        }
    }
}
