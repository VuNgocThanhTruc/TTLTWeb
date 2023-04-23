package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.DiscountModel;
import vn.edu.hcmuaf.fit.model.ProductModel;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import  java.util.List;

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
    public static List<DiscountModel> getDiscountManage() {
//        LinkedList<ProductModel> list = new LinkedList<ProductModel>();
        LinkedList<DiscountModel> discounts = new LinkedList<>();

        String sql = "select d.id,d.id_type_product,d.id_product,d.date_start,d.date_end,d.percent_discount, t.name_type_product,p.`name`,p.avatar,p.price from discounts d join products p on d.id_product =p.id join type_products t on p.id_type_product=t.id ";
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
                String nameTypeProduct = rs.getString(7);
                String nameProduct = rs.getString(8);
                String avatar = rs.getString(9);
                int price = Integer.parseInt(rs.getString(10));
                discounts.add(new DiscountModel(idDiscount, idTypeProduct, idProduct, dateStart, dateEnd, percentDiscount,nameTypeProduct,nameProduct,avatar,price));
            }
            return discounts;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
//        DiscountDAO a =new DiscountDAO();
//        System.out.println(DiscountDAO.getDiscount(10));
//        System.out.println(DiscountDAO.getDiscountManage());
    }
}
