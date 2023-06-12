package vn.edu.hcmuaf.fit.dao;

import com.restfb.types.User;
import vn.edu.hcmuaf.fit.db.ConnectToDatabase;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.DiscountModel;
import vn.edu.hcmuaf.fit.model.UserModel;

import java.sql.*;
import java.util.*;

public class UserDAO implements ObjectDAO {
    public static Map<String, UserModel> mapUser = loadUsername();
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;


    public UserDAO() {
    }


    public static Map<String, UserModel> loadUsername() {
        Map<String, UserModel> mapTemp = new HashMap<>();
        try {
            ResultSet rs = new ConnectToDatabase().selectData("select * from users");
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String username = rs.getString(3);
                String email = rs.getString(4);
                String password = rs.getString(5);
                String avatar = rs.getString(6);
                String tel = rs.getString(7);
                int id_type_user = rs.getInt(8);
                String dob = rs.getString(9);
                int sex = rs.getInt(10);
                String address = rs.getString(11);
                String idRole = rs.getString("id_role");
                UserModel user = new UserModel(id, name, username, email, password, avatar, tel, id_type_user,
                        dob, sex, address, idRole);
                mapTemp.put(user.getUsername(), user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return mapTemp;
    }

    public static Map<String, UserModel> loadEmail() {
        Map<String, UserModel> mapTemp = new HashMap<>();
        try {
            ResultSet rs = new ConnectToDatabase().selectData("select * from users");
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String username = rs.getString(3);
                String email = rs.getString(4);
                String password = rs.getString(5);
                String avatar = rs.getString(6);
                String tel = rs.getString(7);
                int id_type_user = rs.getInt(8);
                String dob = rs.getString(9);
                int sex = rs.getInt(10);
                String address = rs.getString(11);
                UserModel user = new UserModel(id, name, username, email, password, avatar, tel, id_type_user,
                        dob, sex, address);
                mapTemp.put(user.getEmail(), user);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return mapTemp;
    }

    public static Map<String, UserModel> loadId() {
        Map<String, UserModel> mapTemp = new HashMap<>();
        try {
            ResultSet rs = new ConnectToDatabase().selectData("select * from users");
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String username = rs.getString(3);
                String email = rs.getString(4);
                String password = rs.getString(5);
                String avatar = rs.getString(6);
                String tel = rs.getString(7);
                int id_type_user = rs.getInt(8);
                String dob = rs.getString(9);
                int sex = rs.getInt(10);
                String address = rs.getString(11);
                UserModel user = new UserModel(id, name, username, email, password, avatar, tel, id_type_user,
                        dob, sex, address);
                mapTemp.put(user.getId(), user);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapTemp;
    }


    public int checkLogin(String username, String pass) {
//        User user = mapUser.get(username);
        UserModel user = loadUsername().get(username);

        if (user != null) {
            int id = user.getId_type_user();
            if (user.getPassword().equals(pass) && id == 1) {
                return 1;
            } else if (user.getPassword().equals(pass) && id == 2) {
                return 2;
            } else if (user.getPassword().equals(pass) && id == 3) {
                return 3;
            } else {
                return 0;
            }

        }
        return 0;
    }

    public int checkLoginbyEmail(String email, String pass) {
//        User user = mapUser.get(username);
        UserModel user = loadEmail().get(email);
        if (user != null) {
            int id = user.getId_type_user();
            if (user.getPassword().equals(pass) && id == 1) {
                return 1;
            } else if (user.getPassword().equals(pass) && id == 2) {
                return 2;
            } else {
                return 0;
            }

        }
        return 0;
    }

    public void signup(String name, int sex, String dob, String email, String username, String password) {
        String sql = "insert into users(name,username,email,password,avatar,tel,id_type_user,dob,sex,address, id_role) values (?,?,?,?,?,?,?,?,?,?,?)";
        Connection connect = ConnectToDatabase.getConnect();
        try {
            PreparedStatement ppstm = connect.prepareStatement(sql);
//            ppstm.setString(1, null);
            ppstm.setString(1, name);
            ppstm.setString(2, username);
            ppstm.setString(3, email);
            ppstm.setString(4, password);
            ppstm.setString(5, "no-avatar.png");
            ppstm.setString(6, null);
            ppstm.setInt(7, 1);
            ppstm.setString(8, dob);
            ppstm.setInt(9, sex);

            ppstm.setString(10, null);
            ppstm.setString(11, "444632065");
            ppstm.executeUpdate();


        } catch (Exception e) {
            System.out.println("Error when signup custommer:" + e.getMessage());
        }
    }

    public void signupWithAPI(String id, String name, String email, String tel, int sex, String dob) {
        String sql = "insert into users(name,username,email,password,avatar,tel,id_type_user,dob,sex, id_role) values (?,?,?,?,?,?,?,?,?,?)";
        Connection connect = ConnectToDatabase.getConnect();
        try {
            PreparedStatement ppstm = connect.prepareStatement(sql);
            ppstm.setString(1, name);
            ppstm.setString(2, id);
            ppstm.setString(3, email);
            ppstm.setString(4, id);
            ppstm.setString(5, "no-avatar.png");
            ppstm.setString(6, tel);
            ppstm.setInt(7, 3);
            ppstm.setString(8, dob);
            ppstm.setInt(9, sex);
            ppstm.setString(10, "444632065");
            ppstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error when signup custommer:" + e.getMessage());
        }
    }

    public int checksignup(String name, String username, String email, String password) {
        if (name != "" && username != "" && password != "") {
            UserModel user = loadUsername().get(username);
            UserModel userEmail = loadEmail().get(email);
            if (user == null || userEmail == null) {
                return 1;

            } else {
                return 0;
            }
        } else {
            return 2;
        }
    }


    @Override
    public boolean add(Object obj) {
        return false;
    }

    @Override
    public boolean del(String id) {
//        mapUser.remove(id);
        try {
            new ConnectToDatabase().executeSql("delete from users where name ='" + id + "'");
            return true;
        } catch (Exception e) {
            System.out.println("Error When delete custommer:" + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean edit(String id, Object obj) {
        UserModel user = (UserModel) obj;
//        mapUser.replace(id, user);
        loadUsername().replace(id, user);
        String sql = "update users set id=?;name=?,email=?,password=?,avatar=?,tel=?,id_type_user=?,dob=?,sex=?,address=?";
        Connection connect = ConnectToDatabase.getConnect();
        try {
            PreparedStatement ppstm = connect.prepareStatement(sql);

            ppstm.setString(2, user.getName());
            ppstm.setString(3, user.getEmail());
            ppstm.setString(4, user.getPassword());
            ppstm.setString(6, user.getTel());
            ppstm.setInt(7, user.getId_type_user());
            ppstm.setString(8, user.getDob());
            ppstm.setInt(9, user.getSex());
            ppstm.setString(10, user.getAddress());
            ppstm.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("Error when edit customer:" + e.getMessage());
        }
        return false;
    }

    public void editPro(String id, String name, int sex, String email, String tel, String dob, String address) {
//        User user = (O) obj;
        UserModel user = loadId().get(id);
        loadId().replace(id, user);
        String sql = "update users set name=?,email=?,tel=?,dob=?,sex=?,address=? where id ='" + id + "'";
        Connection connect = ConnectToDatabase.getConnect();
        try {
            PreparedStatement ppstm = connect.prepareStatement(sql);
//            ppstm.setString(1, "1");
            ppstm.setString(1, name);
//            ppstm.setString(3, null);
            ppstm.setString(2, email);
//            ppstm.setString(5, null);
//            ppstm.setString(6, null);
            ppstm.setString(3, tel);
//            ppstm.setInt(8, 1);
            ppstm.setString(4, dob);
            ppstm.setInt(5, sex);

            ppstm.setString(6, address);

            ppstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error when update custommer:" + e.getMessage());
        }
    }

    public void addImage(String id, String avatar) {
        String sql = "update users set avatar=? where id ='" + id + "'";
        Connection connect = ConnectToDatabase.getConnect();
        try {
            PreparedStatement ppstm = connect.prepareStatement(sql);

            ppstm.setString(1, avatar);

            ppstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error when addImage custommer:" + e.getMessage());
        }
    }

    @Override
    public void read() {
    }

    public boolean changePass(String userName, String newPass) {
//        User user = mapUser.get(userName);
        UserModel user = loadUsername().get(userName);
        if (user != null) {
            user.setPassword(newPass);
            loadUsername().replace(user.getName(), user);
            edit(user.getName(), user);
            return true;
        } else {
            return false;
        }
    }

    //Lấy ra toàn bộ tài khoản
    public static List<UserModel> getAllUser() {
        List<UserModel> listAllUser = new ArrayList<UserModel>();
        try {
            ResultSet rs = new ConnectToDatabase().selectData("select id, name, username,email, password, avatar, tel, id_type_user, dob, sex, address, id_role from users");
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String username = rs.getString(3);
                String email = rs.getString(4);
                String password = rs.getString(5);
                String avatar = rs.getString(6);
                String tel = rs.getString(7);
                int id_type_user = rs.getInt(8);
                String dob = rs.getString(9);
                int sex = rs.getInt(10);
                String address = rs.getString(11);
                String idRole = rs.getString(12);
                UserModel user = new UserModel(id, name, username, email, password, avatar, tel, id_type_user,
                        dob, sex, address, idRole);
                listAllUser.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error in UserDAO:" + e.getMessage());
        }
        return listAllUser;
    }


    public static void main(String[] args) {
        UserModel user = getUserById("1");
        System.out.println(user.getAvatar());;
    }

    //Lấy ra toàn bộ tài khoản người dùng
    public List<UserModel> getListAccountUser() {
        List<UserModel> listAccountUser = new ArrayList<UserModel>();
        try {
            ResultSet rs = new ConnectToDatabase().selectData("select id, name, username,email, password, avatar, tel, id_type_user, dob, sex, address, id_role from users where id_type_user = 1");
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String avatar = rs.getString("avatar");
                String tel = rs.getString("tel");
                int id_type_user = rs.getInt("id_type_user");
                String dob = rs.getString("dob");
                int sex = rs.getInt("sex");
                String address = rs.getString("address");
                String idRole = rs.getString("id_role");
                UserModel user = new UserModel(id, name, username, email, password, avatar, tel, id_type_user,
                        dob, sex, address, idRole);
                listAccountUser.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error in UserDAO:" + e.getMessage());
        }
        return listAccountUser;
    }

    //Lấy ra toàn bộ tài khoản admin
    public List<UserModel> getListAccountAdmin() {
        List<UserModel> listAccountAdmin = new ArrayList<UserModel>();
        try {
            ResultSet rs = new ConnectToDatabase().selectData("select id, name, username,email, password, avatar, tel, id_type_user, dob, sex, address, id_role from users where id_type_user = 2");
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String avatar = rs.getString("avatar");
                String tel = rs.getString("tel");
                int id_type_user = rs.getInt("id_type_user");
                String dob = rs.getString("dob");
                int sex = rs.getInt("sex");
                String address = rs.getString("address");
                String idRole = rs.getString("id_role");
                UserModel user = new UserModel(id, name, username, email, password, avatar, tel, id_type_user,
                        dob, sex, address, idRole);
                listAccountAdmin.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error in UserDAO:" + e.getMessage());
        }
        return listAccountAdmin;
    }

    //lấy ra một user bằng id
    public static UserModel getUserById(String idUser){
        UserModel user = null;
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement("select id, name, username,email, password, avatar, tel, id_type_user, dob, sex, address, id_role from users where id = ?");
            ps.setString(1, idUser);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String avatar = rs.getString("avatar");
                String tel = rs.getString("tel");
                int id_type_user = rs.getInt("id_type_user");
                String dob = rs.getString("dob");
                int sex = rs.getInt("sex");
                String address = rs.getString("address");
                String idRole = rs.getString("id_role");
                 user = new UserModel(id, name, username, email, password, avatar, tel, id_type_user,
                        dob, sex, address, idRole);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error in UserDAO:" + e.getMessage());
        }
        return user;
    }

}
