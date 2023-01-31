package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.ContactDAO;
import vn.edu.hcmuaf.fit.dao.CustomerDAO;
import vn.edu.hcmuaf.fit.model.ContactModel;
import vn.edu.hcmuaf.fit.model.CustomerModel;

import java.util.List;

public class ContactService {
    public static List<ContactModel> getContact(){
        return ContactDAO.getListContact();
    }
}