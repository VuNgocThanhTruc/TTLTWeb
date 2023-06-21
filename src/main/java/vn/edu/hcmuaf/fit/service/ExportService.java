package vn.edu.hcmuaf.fit.service;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.dao.DiscountDAO;
import vn.edu.hcmuaf.fit.dao.InventoriesDAO;
import vn.edu.hcmuaf.fit.model.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.io.*;

public class ExportService {

    public ExportService(){
    }

    public static void exportProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // tạo workbook và sheet
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("List Product");

        // tạo header
        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Name");
        headerRow.createCell(2).setCellValue("Price");
        headerRow.createCell(3).setCellValue("Brand");

        // lấy dữ liệu
        List<ProductModel> listProduct = ProductService.getListProduct();

        // tạo các row dữ liệu
        int rowIndex = 1;
        for (ProductModel product : listProduct) {
            Row row = sheet.createRow(rowIndex++);
            row.createCell(0).setCellValue(product.getId());
            row.createCell(1).setCellValue(product.getName());
            row.createCell(2).setCellValue(product.getPrice());
            row.createCell(3).setCellValue(product.getCategory(product.getIdTypeProduct()));
        }

        // thiết lập response header

        //set content là file excel
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        // hiện thị thông báo download và set tên file download
        response.setHeader("Content-Disposition", "attachment; filename=\"products.xlsx\"");
        
        // ghi dữ liệu vào OutputStream để truyền dữ liệu về phía client để người dùng có thể download
        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();
    }


    public static void exportOrder(HttpServletRequest request, HttpServletResponse response) throws IOException{
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("List Order");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Orderer's name");
        headerRow.createCell(2).setCellValue("Tel");
        headerRow.createCell(3).setCellValue("Order date");
        headerRow.createCell(4).setCellValue("Tình trạng");
        headerRow.createCell(5).setCellValue("Mô tả");

        List<BookingModel> listBooking = BookingService.getListBooking();

        int rowIndex = 1;
        for (BookingModel book : listBooking) {
            Row row = sheet.createRow(rowIndex++);
            row.createCell(0).setCellValue(book.getId());
            row.createCell(1).setCellValue(book.getUsername());
            row.createCell(2).setCellValue(book.getTel());
            row.createCell(3).setCellValue(book.getDate_booking());
            row.createCell(4).setCellValue(book.getStatusBooking().getName());
            row.createCell(5).setCellValue(book.getDescription());
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        response.setHeader("Content-Disposition", "attachment; filename=\"order.xlsx\"");


        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();

        response.flushBuffer();
    }

    public static void exportOrderDetail(String idOrder,HttpServletRequest request, HttpServletResponse response) throws IOException{
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("List Order Detail");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Product name");
        headerRow.createCell(2).setCellValue("Price");
        headerRow.createCell(3).setCellValue("Quantity");

        List<DetailBookingModel> listDetailBookingBooking = BookingService.getListDetailBooking(idOrder);

        int rowIndex = 1;
        for (DetailBookingModel book : listDetailBookingBooking) {
            Row row = sheet.createRow(rowIndex++);
            row.createCell(0).setCellValue(book.getId());
            row.createCell(1).setCellValue(book.getName());
            row.createCell(2).setCellValue(book.getPrice());
            row.createCell(3).setCellValue(book.getQuantity());
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        response.setHeader("Content-Disposition", "attachment; filename=\"orderDetail.xlsx\"");


        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();


        response.flushBuffer();
    }

    public static void exportCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException{
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("List Customer");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Name");
        headerRow.createCell(2).setCellValue("Username");
        headerRow.createCell(3).setCellValue("Email");
        headerRow.createCell(4).setCellValue("Dob");
        headerRow.createCell(5).setCellValue("Sex");
        headerRow.createCell(6).setCellValue("Tel");

        AccountService accountService = new AccountService();
        List<UserModel> listAccUser = accountService.getListAccountUser();

        int rowIndex = 1;
        if (listAccUser != null) for (UserModel user : listAccUser) {
            Row row = sheet.createRow(rowIndex++);
            row.createCell(0).setCellValue(user.getId());
            row.createCell(1).setCellValue(user.getName());
            row.createCell(2).setCellValue(user.getUsername());
            row.createCell(3).setCellValue(user.getEmail());
            row.createCell(4).setCellValue(user.getDob());
            row.createCell(5).setCellValue(user.getSex());
            row.createCell(6).setCellValue(user.getTel());
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        response.setHeader("Content-Disposition", "attachment; filename=\"customer.xlsx\"");

        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();
        response.flushBuffer();
    }

    public static void exportBooking(HttpServletRequest request, HttpServletResponse response) throws IOException{
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("List Booking");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Orderer's name");
        headerRow.createCell(2).setCellValue("Tel");
        headerRow.createCell(3).setCellValue("Order date");
        headerRow.createCell(4).setCellValue("Status");
        headerRow.createCell(5).setCellValue("Description");

        int rowIndex = 1;
        List<BookingModel> bookings = BookingService.getListBooking(0);
        if(bookings!=null) for (BookingModel book :  bookings) {
            Row row = sheet.createRow(rowIndex++);
            row.createCell(0).setCellValue(book.getId());
            row.createCell(1).setCellValue(book.getUsername());
            row.createCell(2).setCellValue(book.getTel());
            row.createCell(3).setCellValue(book.getDate_booking());
            row.createCell(4).setCellValue(book.getStatusBooking().getName());
            row.createCell(5).setCellValue(book.getDescription());
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        response.setHeader("Content-Disposition", "attachment; filename=\"booking.xlsx\"");

        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();

        response.flushBuffer();
    }

    public static void exportWaitAccept(HttpServletRequest request, HttpServletResponse response) throws IOException{
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("List Wait Accept");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Orderer's name");
        headerRow.createCell(2).setCellValue("Tel");
        headerRow.createCell(3).setCellValue("Order date");
        headerRow.createCell(4).setCellValue("Status");
        headerRow.createCell(5).setCellValue("Description");

        int rowIndex = 1;
        List<BookingModel> bookings = BookingService.getListBooking(0);
        if(bookings!=null) for (BookingModel book : bookings) {
            Row row = sheet.createRow(rowIndex++);
            row.createCell(0).setCellValue(book.getId());
            row.createCell(1).setCellValue(book.getUsername());
            row.createCell(2).setCellValue(book.getTel());
            row.createCell(3).setCellValue(book.getDate_booking());
            row.createCell(4).setCellValue(book.getStatusBooking().getName());
            row.createCell(5).setCellValue(book.getDescription());
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        response.setHeader("Content-Disposition", "attachment; filename=\"wait.xlsx\"");

        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();
        response.flushBuffer();
    }

    public static void exportContact(HttpServletRequest request, HttpServletResponse response) throws IOException{
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("List Contact");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Name");
        headerRow.createCell(2).setCellValue("Tel");
        headerRow.createCell(3).setCellValue("Email");
        headerRow.createCell(4).setCellValue("Content");

        int rowIndex = 1;
        List<ContactModel> contacts = ContactService.getContact();
        if (contacts != null)for (ContactModel contact :  contacts) {
            Row row = sheet.createRow(rowIndex++);
            row.createCell(0).setCellValue(contact.getId());
            row.createCell(1).setCellValue(contact.getUsername());
            row.createCell(2).setCellValue(contact.getTel());
            row.createCell(3).setCellValue(contact.getEmail());
            row.createCell(4).setCellValue(contact.getContent());

        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        response.setHeader("Content-Disposition", "attachment; filename=\"contact.xlsx\"");

        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();


        response.flushBuffer();
    }

    public static void exportLog(List<Log> logs, HttpServletRequest request, HttpServletResponse response) throws IOException{
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("List Contact");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Level");
        headerRow.createCell(2).setCellValue("ID User");
        headerRow.createCell(3).setCellValue("IP Adress");
        headerRow.createCell(4).setCellValue("Src");
        headerRow.createCell(5).setCellValue("Title");
        headerRow.createCell(6).setCellValue("Content");
        headerRow.createCell(7).setCellValue("Create At");
        headerRow.createCell(8).setCellValue("Status");

        int rowIndex = 1;
        if (logs != null) for (Log log :  logs) {
            Row row = sheet.createRow(rowIndex++);
            row.createCell(0).setCellValue(log.getId());
            row.createCell(1).setCellValue(log.getLevel());
            row.createCell(2).setCellValue(log.getId_user());
            row.createCell(3).setCellValue(log.getIp_address() == null ? "Không xác định" : log.getIp_address());
            row.createCell(4).setCellValue(log.getSrc());
            row.createCell(5).setCellValue(log.getTitle());
            row.createCell(6).setCellValue(log.getContent());
            row.createCell(7).setCellValue(log.getCreate_at());
            row.createCell(8).setCellValue(log.getNameStatus());
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        response.setHeader("Content-Disposition", "attachment; filename=\"logs.xlsx\"");

        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();
        response.flushBuffer();
    }

    public static void exportProductInStock(HttpServletRequest request, HttpServletResponse response) throws IOException{
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("List product in stock");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Name Product");
        headerRow.createCell(2).setCellValue("Price");
        headerRow.createCell(3).setCellValue("Quantity");
        headerRow.createCell(4).setCellValue("Modified Date");

        int rowIndex = 1;
        List<InventoriesModel> inventories = InventoriesDAO.getListInventoryNotNull();
        if (inventories != null) for (InventoriesModel inventoriesModel :  inventories) {
            Row row = sheet.createRow(rowIndex++);
            row.createCell(0).setCellValue(inventoriesModel.getIdProduct());
            row.createCell(1).setCellValue(inventoriesModel.getName());
            row.createCell(2).setCellValue(inventoriesModel.getPrice());
            row.createCell(3).setCellValue(inventoriesModel.getQuantity());
            row.createCell(4).setCellValue(inventoriesModel.getModifiedDate());
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        response.setHeader("Content-Disposition", "attachment; filename=\"inventories.xlsx\"");

        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();
        response.flushBuffer();
    }

    public static void exportProductOutOfStock(HttpServletRequest request, HttpServletResponse response) throws IOException{
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("List out-of-stock product");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Name Product");
        headerRow.createCell(2).setCellValue("Price");

        int rowIndex = 1;
        List<InventoriesModel> inventories = InventoriesDAO.getListInventoryNull();
        if (inventories != null ) for (InventoriesModel inventoriesModel :  inventories) {
            Row row = sheet.createRow(rowIndex++);
            row.createCell(0).setCellValue(inventoriesModel.getIdProduct());
            row.createCell(1).setCellValue(inventoriesModel.getName());
            row.createCell(2).setCellValue(inventoriesModel.getPrice());

        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        response.setHeader("Content-Disposition", "attachment; filename=\"outInventories.xlsx\"");

        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();
        response.flushBuffer();
    }

    public static void exportProductDiscount(HttpServletRequest request, HttpServletResponse response) throws IOException{
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("List product discount");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Type Product");
        headerRow.createCell(2).setCellValue("Name Product");
        headerRow.createCell(3).setCellValue("Price");
        headerRow.createCell(4).setCellValue("Discount");
        headerRow.createCell(5).setCellValue("Price");
        headerRow.createCell(6).setCellValue("Date Start");
        headerRow.createCell(7).setCellValue("Date End");

        int rowIndex = 1;
        List<DiscountModel> discountList = (List<DiscountModel>) DiscountDAO.getDiscountManage();
        Date serverTime = new Date();
        Timestamp timestamp = new Timestamp(serverTime.getTime());
        if (discountList != null ) for (DiscountModel discountModel : discountList) {
            Timestamp dateStart = Timestamp.valueOf(discountModel.getDateStart());
            Timestamp dateEnd = Timestamp.valueOf(discountModel.getDateEnd());
            if(dateEnd.getTime() > timestamp.getTime() && dateStart.getTime() <timestamp.getTime()){
                int priceDiscount= (int) Math.ceil(discountModel.getPrice()*(100-discountModel.getPercentDiscount())/100);
                Row row = sheet.createRow(rowIndex++);
                row.createCell(0).setCellValue(discountModel.getIdDiscount());
                row.createCell(1).setCellValue(discountModel.getNameTypeProduct());
                row.createCell(2).setCellValue(discountModel.getNameProduct());
                row.createCell(3).setCellValue(discountModel.getPrice());
                row.createCell(4).setCellValue(discountModel.getPercentDiscount());
                row.createCell(5).setCellValue(priceDiscount);
                row.createCell(6).setCellValue(discountModel.getDateStart());
                row.createCell(7).setCellValue(discountModel.getDateEnd());
            }
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        response.setHeader("Content-Disposition", "attachment; filename=\"discount.xlsx\"");

        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();
        response.flushBuffer();
    }

    public static void exportProductNoDiscount(HttpServletRequest request, HttpServletResponse response) throws IOException{
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("List product no discount");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Type Product");
        headerRow.createCell(2).setCellValue("Name Product");
        headerRow.createCell(3).setCellValue("Price");
        headerRow.createCell(4).setCellValue("Discount");
        headerRow.createCell(5).setCellValue("Price");
        headerRow.createCell(6).setCellValue("Date Start");
        headerRow.createCell(7).setCellValue("Date End");

        int rowIndex = 1;
        List<DiscountModel> discountList = (List<DiscountModel>) DiscountDAO.getDiscountManage();
        Date serverTime = new Date();
        Timestamp timestamp = new Timestamp(serverTime.getTime());
        if (discountList != null ) for (DiscountModel discountModel : discountList) {
            Timestamp dateStart = Timestamp.valueOf(discountModel.getDateStart());
            Timestamp dateEnd = Timestamp.valueOf(discountModel.getDateEnd());
            if(dateEnd.getTime() < timestamp.getTime() && dateStart.getTime() <timestamp.getTime()){
                int priceDiscount= (int) Math.ceil(discountModel.getPrice()*(100-discountModel.getPercentDiscount())/100);
                Row row = sheet.createRow(rowIndex++);
                row.createCell(0).setCellValue(discountModel.getIdDiscount());
                row.createCell(1).setCellValue(discountModel.getNameTypeProduct());
                row.createCell(2).setCellValue(discountModel.getNameProduct());
                row.createCell(3).setCellValue(discountModel.getPrice());
                row.createCell(4).setCellValue(discountModel.getPercentDiscount());
                row.createCell(5).setCellValue(priceDiscount);
                row.createCell(6).setCellValue(discountModel.getDateStart());
                row.createCell(7).setCellValue(discountModel.getDateEnd());
            }
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        response.setHeader("Content-Disposition", "attachment; filename=\"nodiscount.xlsx\"");

        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();
        response.flushBuffer();
    }
}
