package vn.edu.hcmuaf.fit.dao;

import java.sql.*;

public class AbstractDAO{
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;

    public AbstractDAO() {
    }

    public static Connection getConnection() {
        String url = "jdbc:mysql://localhost:3306/phone_care";
        String user = "root";
        String pass = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            return null;
        }
    }
}