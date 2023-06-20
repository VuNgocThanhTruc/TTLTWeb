package vn.edu.hcmuaf.fit.util;

import vn.edu.hcmuaf.fit.dao.AuthoritiesDAO;

public class AuthoritiesUtil {
    static AuthoritiesDAO authoritiesDAO = new AuthoritiesDAO();
    public static final String idAccess = "1";
    public static final String idAdd = "2";
    public static final String idEdit = "3";
    public static final String idDelete = "4";
    public static final String idRoleUser = authoritiesDAO.getIdRoleByName("User");
}
