package vn.edu.hcmuaf.fit.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.db.JdbiConnector;
import vn.edu.hcmuaf.fit.model.ProductModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class LogDAO {
    public LogDAO(){
    }

    public static List<Log> loadAllLog(){
        Jdbi me = JdbiConnector.me();
        List<Log> logs = me.withHandle(
                handle -> {
                    return handle.createQuery("select  id, level, id_user, ip_address, src, content, create_at, status from logs").mapToBean(Log.class)
                            .stream().collect(Collectors.toList());
                }
        );
        return logs;
    }

    public static Log getLogById(String idLog){
        Connection conn = DBConnect.getInstall().getConnection();
        String query = "select id,level, id_user, ip_address, src, content, create_at,status from logs where id = ?";
        Log log = null;
        try{
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idLog);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                log = new Log(rs.getInt("id"),rs.getInt("level"),rs.getInt("id_user"), rs.getString("ip_address"), rs.getString("src"), rs.getString("content"), rs.getTimestamp("create_at"), rs.getInt("status"));
            }

        } catch (Exception e){
            e.getMessage();
        }
        return log;
    }

    public static void checked(String idLog){
        Connection conn = DBConnect.getInstall().getConnection();
        String query = "update logs set status = 1 where id = ?";
        try{
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idLog);
            ps.executeUpdate();
        } catch (Exception e){
            e.getMessage();
        }
    }
}
