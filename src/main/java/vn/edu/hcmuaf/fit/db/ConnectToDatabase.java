package vn.edu.hcmuaf.fit.db;

import java.sql.*;

public class ConnectToDatabase {
    public ConnectToDatabase() {
    }

    public static Connection getConnect() {
        String url = "jdbc:mysql://localhost:3306/phone_care";
        String user = "root";
        String pass = "";
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return connection;
    }

    public void executeSql(String sql) throws Exception {
        Connection connect = getConnect();
        PreparedStatement stmt = connect.prepareStatement(sql);
        stmt.executeUpdate();
    }

    public static ResultSet selectData(String sql) throws Exception {
        Connection connect = getConnect();
        PreparedStatement stmt = connect.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public static PreparedStatement UseStament(String sql) throws SQLException, Exception {
        return getConnect().prepareStatement(sql);
    }
}