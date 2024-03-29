package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.ConnectToDatabase;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.BookingModel;
import vn.edu.hcmuaf.fit.model.CategoryModel;
import vn.edu.hcmuaf.fit.model.DetailBookingModel;
import vn.edu.hcmuaf.fit.model.StatusBooking;

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

        String sql = "SELECT b.id id,date_booking, id_user ,username, id_payment, t.name nameTypePayment,description, b.status_booking id_status_booking, s.name name_status_booking,tel, from_district_id, from_ward_id,to_district_id, to_ward_id, height, length, width, weight " +
                "FROM bookings b join type_payments t on t.id = b.id_payment " +
                "join status_bookings s on s.id = b.status_booking " +
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

                StatusBooking statusBooking = new StatusBooking();
                statusBooking.setId(rs.getInt("id_status_booking"));
                statusBooking.setName(rs.getString("name_status_booking"));

                booking.setStatusBooking(statusBooking);
                booking.setDescription(rs.getString("description"));
                booking.setTel(rs.getString("tel"));
                booking.setFromDistrictId(rs.getInt("from_district_id"));
                booking.setFromWardId(rs.getInt("from_ward_id"));

                booking.setToDistrictId(rs.getInt("to_district_id"));
                booking.setToWardId(rs.getInt("to_ward_id"));
                booking.setHeight(rs.getInt("height"));
                booking.setLength(rs.getInt("length"));
                booking.setWidth(rs.getInt("width"));
                booking.setWeight(rs.getInt("weight"));

                list.add(booking);
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean updateStatusBooking(String typeStatus, String idBookingParam) {
        String sql = "Update bookings set status_booking=? where id=?";
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, typeStatus);
            ps.setString(2, idBookingParam);
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
        String sql = "INSERT INTO `bookings`(`id`, `date_booking`, `id_user`, `id_payment`, `description`, `status_booking`, `username`, `email`, `tel`, `address`) " +
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
        String sql = "insert into bookings(date_booking,id_user,id_payment,description,status_booking) values (?,?,?,?,?)";
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
            ResultSet rs = new ConnectToDatabase().selectData("select  id from customers order by id DESC LIMIT 1");
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
        String sql = "delete from bookings where id = ? ";
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
        String sql = "SELECT b.id id,date_booking, id_user ,username, id_payment, t.name nameTypePayment,description, b.status_booking id_status_booking, s.name name_status_booking,tel,email,address " +
                "FROM bookings b join type_payments t on t.id = b.id_payment " +
                "join status_bookings s on s.id = b.status_booking " +
                "WHERE b.id= ?";
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

                StatusBooking statusBooking = new StatusBooking();
                statusBooking.setId(rs.getInt("id_status_booking"));
                statusBooking.setName(rs.getString("name_status_booking"));

                booking.setStatusBooking(statusBooking);
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

    public static void updateBooking(BookingModel bookingModel) {
        String sql = "update bookings set date_booking = ?, description = ?, status_booking=?, username=?,email=?,tel=?, address=?, id_transport=? where id = ?";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setTimestamp(1, Timestamp.valueOf(bookingModel.getDate_booking()));
            ps.setString(2, bookingModel.getDescription());
            ps.setInt(3, bookingModel.getStatusBooking().getId());
            ps.setString(4, bookingModel.getUsername());
            ps.setString(5, bookingModel.getEmail());
            ps.setString(6, bookingModel.getTel());
            ps.setString(7, bookingModel.getAddress());
            ps.setString(8, bookingModel.getIdTransport());
            ps.setString(9, bookingModel.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void updateBookingIDTransport(BookingModel bookingModel) {
        String sql = "update bookings set id_transport=? where id = ?";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, bookingModel.getIdTransport());
            ps.setString(2, bookingModel.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<BookingModel> getListBooking() {
        LinkedList<BookingModel> list = new LinkedList<>();

        String sql = "SELECT b.id id,date_booking, id_user ,username, id_payment, t.name nameTypePayment,description, b.status_booking id_status_booking, s.name name_status_booking,tel,email,id_transport " +
                "FROM bookings b join type_payments t on t.id = b.id_payment " +
                "join status_bookings s on s.id = b.status_booking " +
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
                StatusBooking statusBooking = new StatusBooking();
                statusBooking.setId(rs.getInt("id_status_booking"));
                statusBooking.setName(rs.getString("name_status_booking"));
                booking.setStatusBooking(statusBooking);
                booking.setDescription(rs.getString("description"));
                booking.setTel(rs.getString("tel"));
                booking.setIdTransport(rs.getString("id_transport"));

                list.add(booking);
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<BookingModel> getListBookedByIDUser(int idUser) {
        LinkedList<BookingModel> list = new LinkedList<>();


        String sql = "SELECT d.id id, id_booking, id_product, p.name name_product, price, d.quantity quantity,b.date_booking ,b.status_booking id_status_booking, s.name name_status_booking " +
                "FROM bookings b join detail_bookings d on d.id_booking = b.id " +
                "join products p on p.id = d.id_product " +
                "join status_bookings s on s.id = b.status_booking " +
                "WHERE b.id_user=? " +
                "order by id desc ";
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);

            ps.setInt(1, idUser);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                BookingModel booking = new BookingModel();
                booking.setId(rs.getString("id"));
                booking.setDate_booking(rs.getString("id_booking"));
                booking.setId_product(rs.getInt("id_product"));
                booking.setName(rs.getString("name_product"));
                booking.setPrice(rs.getInt("price"));
                booking.setQuantity(rs.getInt("quantity"));
//                booking.setAvatar(rs.getString("avatar"));
                booking.setDate_booking(rs.getString("date_booking"));

                StatusBooking statusBooking = new StatusBooking();
                statusBooking.setId(rs.getInt("id_status_booking"));
                statusBooking.setName(rs.getString("name_status_booking"));

                booking.setStatusBooking(statusBooking);

                list.add(booking);
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        BookingModel bookingModel = new BookingModel();
        bookingModel.setId("1013");
        bookingModel.setIdTransport("558e6a5e95ba4aaaba10b84385d67d00");
        BookingDAO.updateBookingIDTransport(bookingModel);

    }

}