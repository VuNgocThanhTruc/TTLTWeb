package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.ConnectToDatabase;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.DiscountModel;
import vn.edu.hcmuaf.fit.model.ProductModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class DiscountDAO {


    // Lấy giảm giá từ id
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

    // Lấy giảm giá từ id
    public static DiscountModel getProductById(int id) {

        DiscountModel discounts = new DiscountModel();

        String sql = "SELECT p.id_type_product, p.id,p.`name`,t.name_type_product,p.avatar,p.price from products p join type_products t on p.id_type_product = t.id " +
                "WHERE p.id=" + id;
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idTypeProduct = Integer.parseInt(rs.getString(1));
                int idProduct = Integer.parseInt(rs.getString(2));
                String nameProduct = rs.getString(3);
                String nameTypeProduct = rs.getString(4);

                String avatar = rs.getString(5);
                int price = Integer.parseInt(rs.getString(6));
                discounts = new DiscountModel(idTypeProduct, idProduct, nameTypeProduct, nameProduct, avatar, price);
            }
            return discounts;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Lấy giảm giá từ id
    public static DiscountModel getProductById2(int id) {

        DiscountModel discounts = new DiscountModel();

        String sql = "SELECT d.id,p.id_type_product,p.id,d.date_start,d.date_end,d.percent_discount,t.name_type_product,p.`name`,p.avatar,p.price from products p join type_products t on p.id_type_product = t.id join discounts d on  d.id_product = p.id " +
                "WHERE p.id=" + id;
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
                discounts = new DiscountModel(idDiscount, idTypeProduct, idProduct, dateStart, dateEnd, percentDiscount, nameTypeProduct, nameProduct, avatar, price);
            }
            return discounts;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Lấy danh sách giảm giá
    public static List<DiscountModel> getDiscountManage() {
        LinkedList<DiscountModel> discounts = new LinkedList<>();

        String sql = "select d.id,d.id_type_product,d.id_product,d.date_start,d.date_end,d.percent_discount, t.name_type_product,p.`name`,p.avatar,p.price from discounts d join products p on d.id_product =p.id join type_products t on p.id_type_product=t.id ORDER BY d.id DESC";
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
                discounts.add(new DiscountModel(idDiscount, idTypeProduct, idProduct, dateStart, dateEnd, percentDiscount, nameTypeProduct, nameProduct, avatar, price));
            }
            return discounts;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Lấy danh sách sản phẩm chưa có mã giảm giá
    public static List<DiscountModel> getProductNoDiscount() {
        LinkedList<DiscountModel> discounts = new LinkedList<>();

        String sql = "Select p.id,t.name_type_product,p.`name`,p.avatar,p.price from products p  LEFT JOIN   discounts d on p.id=d.id_product join type_products t on p.id_type_product=t.id WHERE d.id_product is NULL group by p.id";
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idProduct = Integer.parseInt(rs.getString(1));
                String nameTypeProduct = rs.getString(2);
                String nameProduct = rs.getString(3);
                String avatar = rs.getString(4);
                int price = Integer.parseInt(rs.getString(5));
                discounts.add(new DiscountModel(idProduct, nameTypeProduct, nameProduct, avatar, price));
            }
            return discounts;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Lấy danh sách cách thể loại sản phẩm
    public static List<DiscountModel> getTypeProduct() {
        LinkedList<DiscountModel> discounts = new LinkedList<>();

        String sql = "select t.id,t.name_type_product from type_products t LEFT JOIN discounts d on t.id =d.id_product";
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idTypeProduct = Integer.parseInt(rs.getString(1));
                String nameTypeProduct = rs.getString(2);

                discounts.add(new DiscountModel(idTypeProduct, nameTypeProduct));
            }
            return discounts;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Lấy danh sách cách thể loại sản phẩm
    public static List<DiscountModel> getIDProductByIDTypeProduct(int id) {
        LinkedList<DiscountModel> discounts = new LinkedList<>();

        String sql = "select p.id from products p join type_products t on p.id_type_product=t.id\n" +
                "where p.id_type_product=" + id;
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idProduct = Integer.parseInt(rs.getString(1));
                discounts.add(new DiscountModel(idProduct));
            }
            return discounts;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    //Xóa 1 dòng bằng discount
    public void delDiscount(String id) {
        getDiscountManage().remove(id);
        try {
            new ConnectToDatabase().executeSql("delete from discounts where id ='" + id + "'");

        } catch (Exception e) {
            System.out.println("Error When delete discount:" + e.getMessage());
        }

    }

    // thêm mã giám giá
    public void addDiscount(int idTypeProduct, int idProduct, String dateStart, String dateEnd, int percentDiscount) {
//        String sql = "insert into discounts(id_type_product,id_product,date_start,date_end,percent_discount) values (?,?,?,?,?)";
        String sql = "insert into discounts(id_type_product,id_product,date_start,date_end,percent_discount) SELECT " + "'" +idTypeProduct + "','" + idProduct + "','" + dateStart + "','" + dateEnd + "','" + percentDiscount + "'  WHERE NOT EXISTS (\n" +
                "    SELECT 1\n" +
                "    FROM discounts WHERE id_product = " + idProduct + ")";
        Connection connect = ConnectToDatabase.getConnect();
        try {
            PreparedStatement ppstm = connect.prepareStatement(sql);
//            ppstm.setInt(1, idTypeProduct);
//            ppstm.setInt(2, idProduct);
//            ppstm.setString(3, dateStart);
//            ppstm.setString(4, dateEnd);
//            ppstm.setInt(5, percentDiscount);
            ppstm.executeUpdate();


        } catch (Exception e) {
            System.out.println("Error when addDiscount:" + e.getMessage());
        }
    }

    // cập nhật mã giám giá
    public void editDiscount(int idDiscount, String dateStart, String dateEnd, int percentDiscount) {
        String sql = "update discounts set date_start=?,date_end=?,percent_discount=? where id ='" + idDiscount + "'";
        Connection connect = ConnectToDatabase.getConnect();
        try {
            PreparedStatement ppstm = connect.prepareStatement(sql);

            ppstm.setString(1, dateStart);
            ppstm.setString(2, dateEnd);
            ppstm.setInt(3, percentDiscount);


            ppstm.executeUpdate();


        } catch (Exception e) {
            System.out.println("Error when addImage:" + e.getMessage());
        }
    }

    public static void main(String[] args) {
        DiscountDAO a = new DiscountDAO();
//        a.editDiscount(1, "2023-05-06 16:55:24", "2023-05-06 16:55:24", 10);
//        System.out.println(DiscountDAO.getProductById2(5));
//        System.out.println(DiscountDAO.getIDProductByIDTypeProduct(1));
//        a.addDiscount(3,3,"2024-05-06 16:55:24","2024-05-06 16:55:24",100);

//        a.addDiscountByTypeProduct(3,10,"2023-05-06 16:55:24","2023-05-06 16:55:24",10);
    }
}
