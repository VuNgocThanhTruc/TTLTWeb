package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.BookingModel;
import vn.edu.hcmuaf.fit.model.DetailBookingModel;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CheckoutDAO implements ObjectDAO {

    public int addBooking(Object obj) {
        BookingModel booking = (BookingModel) obj;
        String sql = "INSERT INTO bookings (date_booking, id_user, id_payment, description, status_booking, username, email, tel, address, create_by, to_district_id, to_ward_id, height, length, width, weight,from_district_id,from_ward_id) " +
                "VALUES (?, ?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
        try {
            ps.setString(1, booking.getDate_booking());
            ps.setString(2,booking.getId_user());
            ps.setString(3, booking.getId_payment());
            ps.setString(4, booking.getDescription());
            ps.setInt(5, 0);
            ps.setString(6, booking.getUsername());
            ps.setString(7, booking.getEmail());
            ps.setString(8, booking.getTel());
            ps.setString(9, booking.getAddress());
            ps.setInt(10, booking.getCreateBy());
            ps.setInt(11, booking.getToDistrictId());
            ps.setInt(12, booking.getToWardId());
            ps.setInt(13, booking.getHeight());
            ps.setInt(14, booking.getLength());
            ps.setInt(15, booking.getWidth());
            ps.setInt(16, booking.getWeight());
            ps.setInt(17, booking.getFromDistrictId());
            ps.setInt(18, booking.getFromWardId());

            ps.executeUpdate();
            ResultSet idInserted = ps.getGeneratedKeys();

            if (idInserted.next()){
                return idInserted.getInt(1);
            }
        } catch (
                Exception e) {
            throw new RuntimeException(e);
        }
        return 0;
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

    public boolean addDetailBooking(int idInserted, DetailBookingModel detailBookingModal) {
        String sql = "INSERT INTO detail_bookings " +
                "VALUES (NULL, ?, ?, ?)";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setInt(1, idInserted);
            ps.setInt(2, detailBookingModal.getId_product());
            ps.setInt(3, detailBookingModal.getQuantity());

            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {

//

    }
}
