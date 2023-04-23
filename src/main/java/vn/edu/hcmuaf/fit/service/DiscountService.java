package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.DiscountDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.model.DiscountModel;

public class DiscountService {
    public static DiscountModel getDiscounts(int idProduct) {
        return DiscountDAO.getDicount(idProduct);
    }
}
