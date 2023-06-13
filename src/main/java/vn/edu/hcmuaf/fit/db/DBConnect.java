package vn.edu.hcmuaf.fit.db;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bean.AbBean;
import vn.edu.hcmuaf.fit.bean.Notification;
import vn.edu.hcmuaf.fit.bean.NotificationHasLink;

import java.sql.*;
import java.util.Date;

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
    public boolean insert(AbBean bean){
        return bean.insert(JdbiConnector.me());
    }

    public boolean insertNotify(Notification notification){
        return notification.insert(JdbiConnector.me());
    }
}
