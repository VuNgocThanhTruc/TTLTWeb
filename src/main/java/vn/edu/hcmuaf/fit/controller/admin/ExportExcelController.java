package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.dao.DiscountDAO;
import vn.edu.hcmuaf.fit.dao.InventoriesDAO;
import vn.edu.hcmuaf.fit.dao.LogDAO;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.DiscountModel;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.service.AccountService;
import vn.edu.hcmuaf.fit.service.BookingService;
import vn.edu.hcmuaf.fit.service.ContactService;
import vn.edu.hcmuaf.fit.service.ExportService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ExportExcelController", value = "/admin/export-excel")
public class ExportExcelController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user =(UserModel) session.getAttribute("userlogin");
        String typeParam = request.getParameter("type");
        if(typeParam.equals("exportCustomerExcel")){
            ExportService.exportCustomer(request, response);
            AccountService accountService = new AccountService();
            List<UserModel> listAccUser = accountService.getListAccountUser();
            DBConnect.getInstall().insert(
                    new Log(0,
                            Integer.parseInt(user == null ? "-1" : user.getId()),
                            request.getRemoteAddr(),request.getRequestURI(),
                            "Xuất dữ liệu khách hàng",
                            "Export data: "  + listAccUser,
                            0));
        } else if (typeParam.equals("exportBookingExcel")) {
            ExportService.exportBooking(request, response);
            DBConnect.getInstall().insert(
                    new Log(0,
                            Integer.parseInt(user == null ? "-1" : user.getId()),
                            request.getRemoteAddr(),request.getRequestURI(),
                            "Xuất dữ liệu danh sách đặt lịch sữa chữa",
                            "Export data: "  + BookingService.getListBooking(),
                            0));
        } else if (typeParam.equals("exportWaitAcceptExcel")) {
            ExportService.exportWaitAccept(request, response);
            DBConnect.getInstall().insert(
                    new Log(0,
                            Integer.parseInt(user == null ? "-1" : user.getId()),
                            request.getRemoteAddr(),request.getRequestURI(),
                            "Xuất dữ liệu danh sách đặt lịch đang chờ xác nhận",
                            "Export data: "  + BookingService.getListBooking(0),
                            0));
        }else if (typeParam.equals("exportContactExcel")) {
            ExportService.exportContact(request, response);
            DBConnect.getInstall().insert(
                    new Log(0,
                            Integer.parseInt(user == null ? "-1" : user.getId()),
                            request.getRemoteAddr(),request.getRequestURI(),
                            "Xuất dữ liệu danh sách đặt liên hệ",
                            "Export data: "  + ContactService.getContact(),
                            0));
        }else if (typeParam.equals("exportLogExcel")) {
            List<Log> logs = LogDAO.loadAllLog();
            logs.sort(new Comparator<Log>() {
                @Override
                public int compare(Log o1, Log o2) {
                    return o2.getCreate_at().compareTo(o1.getCreate_at());
                }
            });
            ExportService.exportLog(logs, request, response);
            DBConnect.getInstall().insert(
                    new Log(0,
                            Integer.parseInt(user == null ? "-1" : user.getId()),
                            request.getRemoteAddr(),request.getRequestURI(),
                            "Xuất dữ liệu danh sách log",
                            "Export data: "  + logs,
                            0));
        }else if (typeParam.equals("exportProductInStockExcel")) {
            ExportService.exportProductInStock(request, response);
            DBConnect.getInstall().insert(
                    new Log(0,
                            Integer.parseInt(user == null ? "-1" : user.getId()),
                            request.getRemoteAddr(),request.getRequestURI(),
                            "Xuất dữ liệu danh sách sản phẩm trong kho",
                            "Export data: "  + InventoriesDAO.getListInventoryNotNull(),
                            0));
        }else if (typeParam.equals("exportProductOutOfStockExcel")) {
            ExportService.exportProductOutOfStock(request, response);
            DBConnect.getInstall().insert(
                    new Log(0,
                            Integer.parseInt(user == null ? "-1" : user.getId()),
                            request.getRemoteAddr(),request.getRequestURI(),
                            "Xuất dữ liệu danh sách sản phẩm không có trong kho",
                            "Export data: "  + InventoriesDAO.getListInventoryNull(),
                            0));
        }else if (typeParam.equals("exportProductDiscountExcel")) {
            ExportService.exportProductDiscount(request, response);
            List<DiscountModel> discountList = (List<DiscountModel>) DiscountDAO.getDiscountManage();
            Date serverTime = new Date();
            Timestamp timestamp = new Timestamp(serverTime.getTime());
            List<DiscountModel> sales = new ArrayList<>();
            if(discountList!= null){
                for(DiscountModel discount : discountList){
                    Timestamp dateStart = Timestamp.valueOf(discount.getDateStart());
                    Timestamp dateEnd = Timestamp.valueOf(discount.getDateEnd());
                    if(dateEnd.getTime() > timestamp.getTime() && dateStart.getTime() <timestamp.getTime()){
                        sales.add(discount);
                    }
                }
            }
            DBConnect.getInstall().insert(
                    new Log(0,
                            Integer.parseInt(user == null ? "-1" : user.getId()),
                            request.getRemoteAddr(),request.getRequestURI(),
                            "Xuất dữ liệu danh sách sản phẩm đang giảm giá",
                            "Export data: "  + sales,
                            0));
        }else if (typeParam.equals("exportProductNoDiscountExcel")) {
            ExportService.exportProductNoDiscount(request, response);
            List<DiscountModel> discountList = (List<DiscountModel>) DiscountDAO.getDiscountManage();
            Date serverTime = new Date();
            Timestamp timestamp = new Timestamp(serverTime.getTime());
            List<DiscountModel> noDiscount = new ArrayList<>();
            if(discountList!= null){
                for(DiscountModel discount : discountList){
                    Timestamp dateStart = Timestamp.valueOf(discount.getDateStart());
                    Timestamp dateEnd = Timestamp.valueOf(discount.getDateEnd());
                    if(dateEnd.getTime() < timestamp.getTime() && dateStart.getTime() <timestamp.getTime()){
                        noDiscount.add(discount);
                    }
                }
            }
            DBConnect.getInstall().insert(
                    new Log(0,
                            Integer.parseInt(user == null ? "-1" : user.getId()),
                            request.getRemoteAddr(),request.getRequestURI(),
                            "Xuất dữ liệu danh sách sản phẩm không giảm hoặc hết giảm giá",
                            "Export data: "  + noDiscount,
                            0));
        }
    }
}
