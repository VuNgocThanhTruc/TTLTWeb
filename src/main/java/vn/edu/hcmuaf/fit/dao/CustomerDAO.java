package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.ConnectToDatabase;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.CustomerModel;
import vn.edu.hcmuaf.fit.model.ProductModel;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class CustomerDAO {
    //   Lấy ra khách hàng
    public static List<CustomerModel> getCustomer() {
        LinkedList<CustomerModel> list = new LinkedList<CustomerModel>();

        String sql = "select * from customers";
        Statement statement = DBConnect.getInstall().get();
        if (statement != null) try {
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                list.add(new CustomerModel(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5)));
            }
            return list;


        } catch (Exception e) {
            e.printStackTrace();
        }
        else {
            System.out.println("Không có kết nối");
        }
        return null;
    }
    //Goi khach hang
    public static CustomerModel getCustomerById(String id) {
        CustomerModel cus = null;

        String sql = "select * from customers where id = ?";
        Connection connection = new ConnectToDatabase().getConnect();
        if (connection != null) try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                cus = new CustomerModel(rs.getInt(1),rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5));
            }
            return cus;
        } catch (Exception e) {
            e.printStackTrace();
        }
        else {
            System.out.println("Không có kết nối");
        }
        return null;
    }


    // xóa khách hàng
    public static void deleteCustomer(int id) {
        String sql = "delete from customers where id = ? ";
        Connection connection = new ConnectToDatabase().getConnect();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
//    xóa tất cả khah hàng

}