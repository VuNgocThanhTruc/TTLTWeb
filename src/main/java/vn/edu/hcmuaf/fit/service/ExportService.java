package vn.edu.hcmuaf.fit.service;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import vn.edu.hcmuaf.fit.model.BookingModel;
import vn.edu.hcmuaf.fit.model.DetailBookingModel;
import vn.edu.hcmuaf.fit.model.ProductModel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
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
        response.flushBuffer();
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
            row.createCell(4).setCellValue(book.getString_Status_booking());
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



}
