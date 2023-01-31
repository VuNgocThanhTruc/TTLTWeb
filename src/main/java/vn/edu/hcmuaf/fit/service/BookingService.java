package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.BookingDAO;
import vn.edu.hcmuaf.fit.model.BookingModel;
import vn.edu.hcmuaf.fit.model.DetailBookingModal;

import java.util.List;

public class BookingService {
    public static List<BookingModel> getListBooking(int status) {
        return BookingDAO.getListBooking(status);
    }

    public static boolean updateStatusBooking(String idBookingParam) {
        return BookingDAO.updateStatusBooking(idBookingParam);
    }

    public static BookingModel getConfirm(String id) {
        return BookingDAO.getBooking(id);
    }

    public static List<BookingModel> getListBooking() {
        return BookingDAO.getListBooking();
    }

    public static void updateBooking(String id, String date, String desc, int status, String username, String email, String tel, String address) {
        BookingDAO.updateBooking(id, date, desc, status, username, email, tel, address);
    }

    public static void insertBooking(String id, String id_user, String id_payment, String date, String desc, int status, String username, String email, String tel, String address) {
        BookingDAO.insertBooking(id, id_user, id_payment, date, desc, status, username, email, tel, address);
    }

    public static void main(String[] args) {
        System.out.println(BookingService.updateStatusBooking("997"));
    }

    public static List<DetailBookingModal> getListDetailBooking(String idBooking) {
        return BookingDAO.getListDetailBooking(idBooking);
    }
}