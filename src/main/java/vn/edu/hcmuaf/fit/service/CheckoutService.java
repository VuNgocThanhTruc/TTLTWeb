package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.CheckoutDAO;
import vn.edu.hcmuaf.fit.model.DetailBookingModel;

public class CheckoutService {
    public static boolean addDetailBooking(int idInserted, DetailBookingModel checkoutDetail) {
        return new CheckoutDAO().addDetailBooking(idInserted,checkoutDetail);

    }

    public int insertBookingCart(Object obj) {
        return new CheckoutDAO().addBooking(obj);
    }
}
