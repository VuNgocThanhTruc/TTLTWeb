package vn.edu.hcmuaf.fit.dao;


import vn.edu.hcmuaf.fit.db.ConnectToDatabase;
import vn.edu.hcmuaf.fit.model.ImageModel;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class ImageDAO {
    public ImageDAO() {
    }

    public static List<ImageModel> loadImageSlide() {
        LinkedList<ImageModel> list = new LinkedList<>();
        try {
            ResultSet rs = new ConnectToDatabase().selectData("select * from images where type=1 ");
            while (rs.next()) {
                String id = rs.getString(1);
                String name_photo = rs.getString(2);
                String photo = rs.getString(3);
                int type = rs.getInt(4);

                ImageModel imageModel = new ImageModel(id, name_photo, photo, type);
                list.add(imageModel);

            }
            return list;
        } catch (Exception e) {
            System.out.println("LoadImage: " + e.getMessage());
        }
        return list;
    }

    public static List<ImageModel> loadImageFooter() {
        LinkedList<ImageModel> list = new LinkedList<>();
        try {
            ResultSet rs = new ConnectToDatabase().selectData("select * from images where type=2 ");
            while (rs.next()) {
                String id = rs.getString(1);
                String name_photo = rs.getString(2);
                String photo = rs.getString(3);
                int type = rs.getInt(4);

                ImageModel imageModel = new ImageModel(id, name_photo, photo, type);
                list.add(imageModel);

            }
            return list;
        } catch (Exception e) {
            System.out.println("LoadImage: " + e.getMessage());
        }
        return list;
    }

    public static List<ImageModel> loadAllImage() {
        LinkedList<ImageModel> list = new LinkedList<>();
        try {
            ResultSet rs = new ConnectToDatabase().selectData("select * from images");
            while (rs.next()) {
                String id = rs.getString(1);
                String name_photo = rs.getString(2);
                String photo = rs.getString(3);
                int type = rs.getInt(4);

                ImageModel imageModel = new ImageModel(id, name_photo, photo, type);
                list.add(imageModel);

            }
            return list;
        } catch (Exception e) {
            System.out.println("LoadImage: " + e.getMessage());
        }
        return list;
    }

    public static List<ImageModel> loadImgById(String id_img) {
        LinkedList<ImageModel> list = new LinkedList<>();
        try {
            ResultSet rs = new ConnectToDatabase().selectData("select * from images where id ='" + id_img + "'");
            while (rs.next()) {
                String id = rs.getString(1);
                String name_photo = rs.getString(2);
                String photo = rs.getString(3);
                int type = rs.getInt(4);

                ImageModel imageModel = new ImageModel(id, name_photo, photo, type);
                list.add(imageModel);

            }
            return list;
        } catch (Exception e) {
            System.out.println("LoadImage: " + e.getMessage());
        }
        return list;
    }

    public void del(String id) {
        loadAllImage().remove(id);
        try {
            new ConnectToDatabase().executeSql("delete from images where id ='" + id + "'");

        } catch (Exception e) {
            System.out.println("Error When delete img:" + e.getMessage());
        }

    }

    public void addImage(String name_photo, String photo, int type) {
        String sql = "insert into images(name_photo,photo,type) values (?,?,?)";
        Connection connect = ConnectToDatabase.getConnect();
        try {
            PreparedStatement ppstm = connect.prepareStatement(sql);
            ppstm.setString(1, name_photo);
            ppstm.setString(2, photo);
            ppstm.setInt(3, type);


            ppstm.executeUpdate();


        } catch (Exception e) {
            System.out.println("Error when addImage:" + e.getMessage());
        }
    }

    public void updatePhoto(int id, String name, String photo, int type) {
        String sql = "update images set photo=?, type=?,name_photo=? where id =?";
        Connection connect = ConnectToDatabase.getConnect();
        try {
            PreparedStatement ppstm = connect.prepareStatement(sql);

            ppstm.setString(1, photo);
            ppstm.setInt(2, type);
            ppstm.setString(3, name);
            ppstm.setInt(4, id);



            ppstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error when addImage custommer:" + e.getMessage());
        }
    }

    public String getIdNew() {
        String a = "";
        try {
            ResultSet rs = new ConnectToDatabase().selectData("select  id from images order by id DESC LIMIT 1");
            while (rs.next()) {
                System.out.println("success");
                a = rs.getString(1);
            }

        } catch (Exception e) {
            System.out.println("Error when selectIdNew:" + e.getMessage());
        }
        return a;
    }

    public int getTypeNew() {
        int a = 0;
        try {
            ResultSet rs = new ConnectToDatabase().selectData("select type from images order by id DESC LIMIT 1");
            while (rs.next()) {
                System.out.println("success");
                a = rs.getInt(1);
            }

        } catch (Exception e) {
            System.out.println("Error when selectIdNew:" + e.getMessage());
        }
        return a;
    }

    public static void main(String[] args) {
        ImageDAO imageDao = new ImageDAO();
//        imageDao.addImage("sad", "asd", 1);
//        imageDao.updatePhoto("8","ád","fdsfsd",1);
    }
}

