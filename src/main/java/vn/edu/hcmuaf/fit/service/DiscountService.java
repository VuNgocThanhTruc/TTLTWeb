package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.DiscountDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.model.DiscountModel;

public class DiscountService {
    public static DiscountModel getDiscounts(int idProduct) {
        return DiscountDAO.getDiscount(idProduct);
    }
    public static DiscountModel getProductById(int idProduct) {
        return DiscountDAO.getProductById(idProduct);
    }
    public static DiscountModel getProductById2(int idProduct) {
        return DiscountDAO.getProductById2(idProduct);
    }




}
