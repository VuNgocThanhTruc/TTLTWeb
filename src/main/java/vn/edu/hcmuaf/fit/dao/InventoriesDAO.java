package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.DiscountModel;
import vn.edu.hcmuaf.fit.model.InventoriesModel;
import vn.edu.hcmuaf.fit.model.ProductModel;

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

    public static void main(String[] args) {
//        InventoriesDAO a = new InventoriesDAO();
        System.out.println(InventoriesDAO.getListProductsStockForALongTime());
    }
}
