package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.CheckoutDAO;
import vn.edu.hcmuaf.fit.model.DetailBookingModal;

public class CheckoutService {
    public static boolean addDetailBooking(int idInserted, DetailBookingModal checkoutDetail) {
        return new CheckoutDAO().addDetailBooking(idInserted,checkoutDetail);

    }

    public int insertBookingCart(Object obj) {
        return new CheckoutDAO().addBooking(obj);
    }
}
