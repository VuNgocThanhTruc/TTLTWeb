package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.CategoryModel;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class CategoryDAO {

    public static List<CategoryModel> getListCategory() {
        LinkedList<CategoryModel> list = new LinkedList<CategoryModel>();

        String sql = "select id,name from brands";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CategoryModel categoryModel = new CategoryModel();
                categoryModel.setId(rs.getInt("id"));
                categoryModel.setName(rs.getString("name"));
                list.add(categoryModel);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<CategoryModel> getListTypeProduct() {
        LinkedList<CategoryModel> list = new LinkedList<CategoryModel>();

        String sql = "select id,name_type_product from type_products";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CategoryModel categoryModel = new CategoryModel();
                categoryModel.setId(rs.getInt("id"));
                categoryModel.setName(rs.getString("name_type_product"));
                list.add(categoryModel);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public static List<CategoryModel> getListStatusProduct() {
        LinkedList<CategoryModel> list = new LinkedList<CategoryModel>();

        String sql = "select id,status from status_devices";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CategoryModel categoryModel = new CategoryModel();
                categoryModel.setId(rs.getInt("id"));
                categoryModel.setName(rs.getString("status"));
                list.add(categoryModel);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<CategoryModel> getListTypeStatusBooking() {
        LinkedList<CategoryModel> list = new LinkedList<CategoryModel>();

        String sql = "select id,name from status_bookings";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CategoryModel categoryModel = new CategoryModel();
                categoryModel.setId(rs.getInt("id"));
                categoryModel.setName(rs.getString("name"));
                list.add(categoryModel);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(new CategoryDAO().getListTypeStatusBooking().toString());
    }

}
