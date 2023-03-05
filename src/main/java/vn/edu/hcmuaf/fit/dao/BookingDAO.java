package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.ConnectToDatabase;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.BookingModel;
import vn.edu.hcmuaf.fit.model.CategoryModel;
import vn.edu.hcmuaf.fit.model.DetailBookingModel;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class BookingDAO implements ObjectDAO {

    public static List<CategoryModel> getListStatus() {
        LinkedList<CategoryModel> list = new LinkedList<>();
        return null;
    }

    public static List<BookingModel> getListBooking(int status) {
        LinkedList<BookingModel> list = new LinkedList<>();

        String sql = "SELECT booking.id id,date_booking, id_user ,username, id_payment, t.name nameTypePayment,description, status_booking,tel " +
                "FROM booking join type_payments t on t.id = booking.id_payment " +
                "WHERE status_booking=?" + "order by id desc ";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, status + "");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookingModel booking = new BookingModel();
                booking.setId(rs.getString("id"));
                booking.setDate_booking(rs.getString("date_booking"));
                booking.setId_user(rs.getString("id_user"));
                booking.setUsername(rs.getString("username"));
                booking.setId_payment(rs.getString("id_payment"));
                booking.setNameTypePayment(rs.getString("nameTypePayment"));
                booking.setStatus_booking(rs.getInt("status_booking"));
                booking.setDescription(rs.getString("description"));
                booking.setTel(rs.getString("tel"));

                list.add(booking);
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean updateStatusBooking(String idBookingParam) {
        String sql = "Update booking set status_booking=1 where id=?";
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, idBookingParam);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<DetailBookingModel> getListDetailBooking(String idBooking) {
        List<DetailBookingModel> list = new LinkedList<>();

        String sql = "SELECT d.id id, id_booking, id_product, name, price, d.quantity quantity " +
                "FROM detail_bookings d join products on products.id = d.id_product " +
                "WHERE id_booking=?" + "order by id desc ";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, idBooking);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DetailBookingModel detailBookingModal = new DetailBookingModel();
                detailBookingModal.setId_booking(rs.getInt("id_booking"));
                detailBookingModal.setId_product(Integer.parseInt(rs.getString("id_product")));
                detailBookingModal.setQuantity(Integer.parseInt(rs.getString("quantity")));
                detailBookingModal.setName(rs.getString("name"));
                detailBookingModal.setPrice(rs.getString("price"));
                detailBookingModal.setId(Integer.parseInt(rs.getString("id")));

                list.add(detailBookingModal);
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public static void insertBooking(String id, String id_user, String id_payment, String date, String desc, int status, String username, String email, String tel, String address) {
        date += ":00";
        String sql = "INSERT INTO `booking`(`id`, `date_booking`, `id_user`, `id_payment`, `description`, `status_booking`, `username`, `email`, `tel`, `address`) " +
                "VALUES(NULL,date_booking = ?, id_user=?, id_payment=?,description = ?, status_booking=?, username=?,email=?,tel=?, address=?";

        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setTimestamp(1, Timestamp.valueOf(date.replace("T", " ")));
            ps.setString(2, id_user);
            ps.setString(3, id_payment);

            ps.setString(4, desc);
            ps.setInt(5, status);
            ps.setString(6, username);
            ps.setString(7, email);
            ps.setString(8, tel);
            ps.setString(9, address);
            ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
//
//    public void addCustomer(String name, String tel, String email, String address) {
////        String sql = "insert into customer(username,address,email,tel,id_user) values (?,?,?,?,?)";
//        String sql = "INSERT INTO booking " +
//                "VALUES (NULL, ?, ?, ?,?,?,?,?,?,?)";
//        Connection connect = ConnectToDatabase.getConnect();
//        try {
//            PreparedStatement ppstm = connect.prepareStatement(sql);
//            ppstm.setString(1, booking.getDate_booking());
//
//            ppstm.setString(2,booking.getid_user());
//            ppstm.setString(3, booking.getId_payment());
//            ppstm.setString(4, booking.getDescription());
//            ppstm.setString(5, "1");
//            ppstm.setString(6, booking.getUsername());
//            ppstm.setString(7, booking.getEmail());
//            ppstm.setString(8, booking.getTel());
//            ppstm.setString(9, booking.getAddress());
//
//            ppstm.executeUpdate();
//
//
//        } catch (Exception e) {
//            System.out.println("Error when addCustomer:" + e.getMessage());
//        }
//    }

    public void addBooking(String date_booking, String time_booking, String id_user, String id_payment, String description) {
        String sql = "insert into booking(date_booking,id_user,id_payment,description,status_booking) values (?,?,?,?,?)";
        Connection connect = ConnectToDatabase.getConnect();
        try {
            PreparedStatement ppstm = connect.prepareStatement(sql);
            ppstm.setString(1, date_booking + " " + time_booking);
            ppstm.setString(2, id_user);
            ppstm.setString(3, id_payment);
            ppstm.setString(4, description);
            ppstm.setInt(5, 0);
//            ppstm.setString(6, null);
            ppstm.executeUpdate();
            System.out.println("success");


        } catch (Exception e) {
            System.out.println("Error when addBooking:" + e.getMessage());
        }
    }

    public String selectIdNew() {
        String a = "";
        try {
            ResultSet rs = new ConnectToDatabase().selectData("select  id from customer order by id DESC LIMIT 1");
            while (rs.next()) {
                System.out.println("success");
                a = rs.getString(1);
            }

        } catch (Exception e) {
            System.out.println("Error when selectIdNew:" + e.getMessage());
        }
        return a;
    }

    @Override
    public boolean add(Object obj) {
        return false;
    }

    @Override
    public boolean del(String id) {
        return false;
    }

    @Override
    public boolean edit(String id, Object obj) {
        return false;
    }

    @Override
    public void read() {

    }

    static PreparedStatement statement = null;

    public static void deleteConfirm(int id) {
        String sql1 = "delete from detail_bookings where id_booking = ?";
        String sql = "delete from booking where id = ? ";
        Connection connection = new ConnectToDatabase().getConnect();
        try {
            statement = connection.prepareStatement(sql1);
            statement.setInt(1, id);
            statement.executeUpdate();

            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public static BookingModel getBooking(String id) {
        String sql = "SELECT booking.id id,date_booking, id_user ,username, id_payment, t.name nameTypePayment,description, status_booking,tel,email,address " +
                "FROM booking join type_payments t on t.id = booking.id_payment " +
                "WHERE booking.id= ?";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            BookingModel booking = null;
            while (rs.next()) {
                booking = new BookingModel();
                booking.setId(rs.getString("id"));
                booking.setDate_booking(rs.getString("date_booking"));
                booking.setId_user(rs.getString("id_user"));
                booking.setUsername(rs.getString("username"));
                booking.setId_payment(rs.getString("id_payment"));
                booking.setNameTypePayment(rs.getString("nameTypePayment"));
                booking.setStatus_booking(rs.getInt("status_booking"));
                booking.setDescription(rs.getString("description"));
                booking.setTel(rs.getString("tel"));
                booking.setAddress(rs.getString("address"));
                booking.setEmail(rs.getString("email"));

            }
            return booking;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public static void updateBooking(String id, String date, String desc, int status, String username, String email, String tel, String address) {
        date += ":00";
        String sql = "update booking set date_booking = ?, description = ?, status_booking=?, username=?,email=?,tel=?, address=? where id = ?";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setTimestamp(1, Timestamp.valueOf(date.replace("T", " ")));
            ps.setString(2, desc);
            ps.setInt(3, status);
            ps.setString(4, username);
            ps.setString(5, email);
            ps.setString(6, tel);
            ps.setString(7, address);
            ps.setString(8, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<BookingModel> getListBooking() {
        LinkedList<BookingModel> list = new LinkedList<>();

        String sql = "SELECT booking.id id,date_booking, id_user ,username, id_payment, t.name nameTypePayment,description, status_booking,tel,email " +
                "FROM booking join type_payments t on t.id = booking.id_payment " +
                "order by id desc ";
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookingModel booking = new BookingModel();
                booking.setId(rs.getString("id"));
                booking.setDate_booking(rs.getString("date_booking"));
                booking.setId_user(rs.getString("id_user"));
                booking.setUsername(rs.getString("username"));
                booking.setId_payment(rs.getString("id_payment"));
                booking.setNameTypePayment(rs.getString("nameTypePayment"));
                booking.setStatus_booking(rs.getInt("status_booking"));
                booking.setDescription(rs.getString("description"));
                booking.setTel(rs.getString("tel"));

                list.add(booking);
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<BookingModel> getListBookingByStatus(String id_user) {
        LinkedList<BookingModel> list = new LinkedList<>();


        String sql = "SELECT d.id id, id_booking, id_product, name, price, d.quantity quantity,avatar ,booking.date_booking ,booking.status_booking " +
                "FROM booking join detail_bookings d on d.id_booking = booking.id " +
                "join products on products.id = d.id_product " +
                "WHERE booking.id_user=? " +
                "order by id desc ";
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);

            ps.setString(1, id_user);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                BookingModel booking = new BookingModel();
                booking.setId(rs.getString("id"));
                booking.setDate_booking(rs.getString("id_booking"));
                booking.setId_product(rs.getInt("id_product"));
                booking.setName(rs.getString("name"));
                booking.setPrice(rs.getInt("price"));
                booking.setQuantity(rs.getInt("quantity"));
                booking.setAvatar(rs.getString("avatar"));
                booking.setDate_booking(rs.getString("date_booking"));
                booking.setStatus_booking(rs.getInt("status_booking"));


                list.add(booking);
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        BookingDAO b = new BookingDAO();
        b.updateBooking("1", "2022-12-12 12:12", "test", 1, "test", "test@gmail.com", "123", "tphcm");

    }

}