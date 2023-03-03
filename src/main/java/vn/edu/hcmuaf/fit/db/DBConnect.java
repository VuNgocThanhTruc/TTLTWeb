package vn.edu.hcmuaf.fit.db;

import java.sql.*;

public class DBConnect {
    String url = "jdbc:mysql://localhost:3306/phone_care";
    String user = "root";
    String pass = "";
    Connection conn;
    static DBConnect install;

    private DBConnect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static DBConnect getInstall() {
        if (install == null) install = new DBConnect();
        return install;
    }

    public Statement get(){
        if (conn==null) return null;
        try {
            return conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public PreparedStatement preStatement(String sql){
        if (conn==null) return null;
        try {
            return conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Connection getConnection(){
        return this.conn;
    }

    public static void main(String[] args) {
        Statement statement = DBConnect.getInstall().get();
        if (statement!= null)
            try {
                ResultSet rs = statement.executeQuery("select * from products");
                rs.last();
                System.out.println(rs.getRow());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        else{
            System.out.println("Connect error");
        }
    }

}
