package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.DiscountModel;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DiscountDAO {


    // Lấy giảm giá
    public static DiscountModel getDiscount(int id) {

        DiscountModel discounts = new DiscountModel();

        String sql = "select id,id_type_product,id_product,date_start,date_end,percent_discount from discounts " +
                "where id_product=" + id;
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idDiscount = Integer.parseInt(rs.getString(1));
                int idTypeProduct = Integer.parseInt(rs.getString(2));
                int idProduct = Integer.parseInt(rs.getString(3));
                String dateStart = rs.getString(4);
                String dateEnd = rs.getString(5);
                int percentDiscount = Integer.parseInt(rs.getString(6));
                discounts = new DiscountModel(idDiscount, idTypeProduct, idProduct, dateStart, dateEnd, percentDiscount);
            }
            return discounts;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
//        DiscountDAO a =new DiscountDAO();
        System.out.println(DiscountDAO.getDicount(1));
    }
}
