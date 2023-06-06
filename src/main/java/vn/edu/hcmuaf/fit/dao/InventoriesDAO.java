package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.ConnectToDatabase;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.DiscountModel;
import vn.edu.hcmuaf.fit.model.InventoriesModel;
import vn.edu.hcmuaf.fit.model.ProductModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class InventoriesDAO {
    public static List<InventoriesModel> getListProductsOutOfStock(int id) {
        LinkedList<InventoriesModel> list = new LinkedList<>();
        String sql = "select i.id_product,i.quantity,i.modified_date,i.modified_by,p.`name`,p.avatar,p.price from inventories i join products p on i.id_product=p.id where quantity <" + id + " order by quantity asc";
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idProduct = Integer.parseInt(rs.getString(1));
                int quantity = Integer.parseInt(rs.getString(2));
                String modifiedDate = rs.getString(3);
                String modifiedBy = rs.getString(4);
                String name = rs.getString(5);
                String avatar = rs.getString(6);
                int price = Integer.parseInt(rs.getString(7));
                list.add(new InventoriesModel(idProduct, quantity, modifiedDate, modifiedBy, name, avatar, price));
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
    public static List<InventoriesModel> getListProductsStockForALongTime() {
        LinkedList<InventoriesModel> list = new LinkedList<>();
        String sql = "select i.id_product,i.quantity,i.modified_date,i.modified_by,p.`name`,p.avatar,p.price from inventories i  JOIN products p on i.id_product=p.id  order by i.modified_date desc";
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idProduct = Integer.parseInt(rs.getString(1));
                int quantity = Integer.parseInt(rs.getString(2));
                String modifiedDate = rs.getString(3);
                String modifiedBy = rs.getString(4);
                String name = rs.getString(5);
                String avatar = rs.getString(6);
                int price = Integer.parseInt(rs.getString(7));
                list.add(new InventoriesModel(idProduct, quantity, modifiedDate, modifiedBy, name, avatar, price));
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
    //Lấy danh sách các sản phẩm có tồn kho
    public static List<InventoriesModel> getListInventoryNotNull(){
        LinkedList<InventoriesModel> list = new LinkedList<>();
        String sql = "SELECT i.id_product,i.quantity,i.modified_date,i.modified_by,p.`name`,p.avatar,p.price FROM inventories i RIGHT JOIN products p on p.id=i.id_product WHERE i.id_product is not null";
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idProduct = Integer.parseInt(rs.getString(1));
                int quantity = Integer.parseInt(rs.getString(2));
                String modifiedDate = rs.getString(3);
                String modifiedBy = rs.getString(4);
                String name = rs.getString(5);
                String avatar = rs.getString(6);
                int price = Integer.parseInt(rs.getString(7));
                list.add(new InventoriesModel(idProduct, quantity, modifiedDate, modifiedBy, name, avatar, price));
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    //Lấy danh sách các sản phẩm có tồn kho bằng id
    public static InventoriesModel getListInventoryNotNullById(int idproduct){
       InventoriesModel inventory = new InventoriesModel();
        String sql = "SELECT i.id_product,i.quantity,i.modified_date,i.modified_by,p.`name`,p.avatar,p.price FROM inventories i RIGHT JOIN products p on p.id=i.id_product WHERE i.id_product ="+idproduct;
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idProduct = Integer.parseInt(rs.getString(1));
                int quantity = Integer.parseInt(rs.getString(2));
                String modifiedDate = rs.getString(3);
                String modifiedBy = rs.getString(4);
                String name = rs.getString(5);
                String avatar = rs.getString(6);
                int price = Integer.parseInt(rs.getString(7));
                inventory=new InventoriesModel(idProduct, quantity, modifiedDate, modifiedBy, name, avatar, price);
            }
            return inventory;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    //Lấy danh sách các sản phẩm chưa có tồn kho
    public static List<InventoriesModel> getListInventoryNull(){
        LinkedList<InventoriesModel> list = new LinkedList<>();
        String sql = "SELECT p.id ,p.`name`,p.avatar,p.price FROM inventories i RIGHT JOIN products p on p.id=i.id_product WHERE i.id_product is null";
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idProduct = Integer.parseInt(rs.getString(1));

                String name = rs.getString(2);
                String avatar = rs.getString(3);
                int price = Integer.parseInt(rs.getString(4));
                list.add(new InventoriesModel(idProduct, name, avatar, price));
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    //Lấy danh sách các sản phẩm chưa có tồn kho bằng id
    public static InventoriesModel getListInventoryNullById(int idproduct){
        InventoriesModel inventory = new InventoriesModel();
        String sql = "SELECT p.id ,p.`name`,p.avatar,p.price FROM inventories i RIGHT JOIN products p on p.id=i.id_product WHERE p.id ="+idproduct;
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idProduct = Integer.parseInt(rs.getString(1));

                String name = rs.getString(2);
                String avatar = rs.getString(3);
                int price = Integer.parseInt(rs.getString(4));
                inventory=new InventoriesModel(idProduct, name, avatar, price);
            }
            return inventory;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    // cập nhật kho
    public void editInventories(int idProduct, int quantity, String modifiedDate) {
        String sql = "update inventories set quantity=?,modified_date=? where id_product ='" + idProduct + "'";
        Connection connect = ConnectToDatabase.getConnect();
        try {
            PreparedStatement ppstm = connect.prepareStatement(sql);

            ppstm.setInt(1, quantity);
            ppstm.setString(2, modifiedDate);

            ppstm.executeUpdate();


        } catch (Exception e) {
            System.out.println("Error when editInventories:" + e.getMessage());
        }
    }
    // thêm vào kho
    public void addInventories(int idProduct, int quantity, String modifiedDate) {
        String sql = "insert into inventories(id_product,quantity,modified_date) values (?,?,?)";
        Connection connect = ConnectToDatabase.getConnect();
        try {
            PreparedStatement ppstm = connect.prepareStatement(sql);
            ppstm.setInt(1, idProduct);
            ppstm.setInt(2, quantity);
            ppstm.setString(3, modifiedDate);
            ppstm.executeUpdate();


        } catch (Exception e) {
            System.out.println("Error when addInventories:" + e.getMessage());
        }
    }
    public static void main(String[] args) {
//        InventoriesDAO a = new InventoriesDAO();
        System.out.println(InventoriesDAO.getListInventoryNull());
    }
}
