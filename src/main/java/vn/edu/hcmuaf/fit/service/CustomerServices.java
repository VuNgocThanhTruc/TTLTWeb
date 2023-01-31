package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.CustomerDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.model.CustomerModel;

import java.util.List;

public class CustomerServices {
    public static List<CustomerModel> getCustomer(){
            return CustomerDAO.getCustomer();
        }
}
