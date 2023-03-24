package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.ConnectToDatabase;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.BlogModel;
import vn.edu.hcmuaf.fit.service.BlogService;

import java.sql.*;
import java.time.Instant;
import java.util.LinkedList;
import java.util.List;

public class BlogDAO extends AbstractDAO {


    public static void insertBlog(String title, String brief, String detail, String imageFileName) {
        String sql = "INSERT INTO blogs (id, title, briefContent, detail_content, status, avatar, id_type_blog, create_date, id_user_create) " +
                "VALUES (NULL, ?, ?, ?, ?, ?, ? ,?, ? )";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, title);
            ps.setString(2, brief);
            ps.setString(3, detail);
            ps.setInt(4, 1);//status
            ps.setString(5,imageFileName);
            ps.setInt(6,1);
            ps.setTimestamp(7, Timestamp.from(Instant.now()));
            ps.setInt(8,1);
            ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public List<BlogModel> findAll() {
        LinkedList<BlogModel> list = new LinkedList<BlogModel>();

        String sql = "select blogs.id, title, briefContent, blogs.avatar,users.name, create_date " +
                "from blogs join users on blogs.id_user_create = users.id";

        conn = getConnection();

        if (conn != null)
            try {
                ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new BlogModel(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getDate(6)
                    ));
                }
                return list;
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (conn != null) conn.close();
                    if (ps != null) ps.close();
                    if (rs != null) rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        else {
            System.out.println("Connect database error");
        }
        return null;
    }

    public List<BlogModel> getNewBlog() {
        LinkedList<BlogModel> list = new LinkedList<BlogModel>();

        String sql = "select blogs.id, title, briefContent,blogs.avatar, users.name, create_date " +
                "from blogs join users on blogs.id_user_create = users.id " +
                "order by id desc limit 3";

        conn = getConnection();

        if (conn != null)
            try {
                ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new BlogModel(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getDate(6)
                    ));
                }
                return list;
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (conn != null) conn.close();
                    if (ps != null) ps.close();
                    if (rs != null) rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        else {
            System.out.println("Connect database error");
        }
        return null;
    }

    public static BlogModel getDetailBlogForId(String idBlogPram) {

        String sql = "select blogs.id, title, briefContent, detail_content, status, blogs.avatar,id_type_blog, type_blog.name_type_blog, create_date, users.name " +
                "from blogs join users on blogs.id_user_create = users.id " +
                "join type_blog on blogs.id_type_blog = type_blog.id " +
                "where blogs.id=?";

        conn = getConnection();

        if (conn != null)
            try {
                ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                ps.setString(1, idBlogPram);
                rs = ps.executeQuery();
                while (rs.next()) {
                    return new BlogModel(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getInt(5),
                            rs.getString(6),
                            rs.getInt(7),
                            rs.getDate(9),
                            rs.getString(10)
                    );
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (conn != null) conn.close();
                    if (ps != null) ps.close();
                    if (rs != null) rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        else {
            System.out.println("Connect database error");
        }
        return null;
    }
    public static List<BlogModel> getBlogAdmin() {
        LinkedList<BlogModel> list = new LinkedList<BlogModel>();

        String sql = "select blogs.id, title, briefContent, detail_content, status, blogs.avatar,id_type_blog, type_blog.name_type_blog, create_date, users.name " +
                "from blogs join users on blogs.id_user_create = users.id " +
                "join type_blog on blogs.id_type_blog = type_blog.id "+
                "order by id desc limit 4";

        conn = getConnection();

        if (conn != null)
            try {
                ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new BlogModel(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getInt(5),
                            rs.getString(6),
                            rs.getInt(7),
                            rs.getDate(9),
                            rs.getString(10)
                    ));
                }
                return list;
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (conn != null) conn.close();
                    if (ps != null) ps.close();
                    if (rs != null) rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        else {
            System.out.println("Connect database error");
        }
        return null;
    }
    //  Xóa tin tức
    public static void deleteBlog(int id) {
        String sql = "delete from blogs where id = ? ";
        Connection connection = new ConnectToDatabase().getConnect();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void update(String id, String title, String brief, String detail,String avatar){
        String sql = "update blogs set title = ?, briefContent = ?,detail_content = ?,avatar=? where id = ?";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, title);
            ps.setString(2, brief);
            ps.setString(3, detail);
            ps.setString(4, avatar);
            ps.setString(5, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    public static void main(String[] args) {
        new BlogDAO().insertBlog("test","test","test","tes.jpg");
    }
}