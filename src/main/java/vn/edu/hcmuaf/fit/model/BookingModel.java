package vn.edu.hcmuaf.fit.model;

import java.util.Date;

public class BookingModel {
    private String id;
    private String date_booking;
    private String id_user;
    private String id_payment;
    private String description;
    private StatusBooking statusBooking;
    private String username;
    private String nameTypePayment;
    private String tel;

    private int id_product;
    private String name;
    private int price;
    private int quantity;
    private String avatar;
    private String address;
    private String email;
    private int fromDistrictId;
    private int fromWardId;
    private int toDistrictId;
    private int toWardId;
    private int height;
    private int length;
    private int width;
    private int weight;
    private String idTransport;
    private int createBy;
    private int sumMoney;

    public BookingModel(String id, String date_booking, String id_user, String id_payment, String description, StatusBooking statusBooking, String username, String nameTypePayment, String tel, int id_product, String name, int price, int quantity, String avatar, String address, String email) {
        this.id = id;
        this.date_booking = date_booking;
        this.id_user = id_user;
        this.id_payment = id_payment;
        this.description = description;
        this.statusBooking = statusBooking;
        this.username = username;
        this.nameTypePayment = nameTypePayment;
        this.tel = tel;
        this.id_product = id_product;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.avatar = avatar;
        this.address = address;
        this.email = email;
    }

    public BookingModel() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDate_booking() {
        return date_booking;
    }

    public void setDate_booking(String date_booking) {
        this.date_booking = date_booking;
    }

    public String getId_user() {
        return id_user;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }

    public String getId_payment() {
        return id_payment;
    }

    public void setId_payment(String id_payment) {
        this.id_payment = id_payment;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public StatusBooking getStatusBooking() {
        return statusBooking;
    }

    public void setStatusBooking(StatusBooking status_booking) {
        this.statusBooking = status_booking;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNameTypePayment() {
        return nameTypePayment;
    }

    public void setNameTypePayment(String nameTypePayment) {
        this.nameTypePayment = nameTypePayment;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getToDistrictId() {
        return toDistrictId;
    }

    public void setToDistrictId(int toDistrictId) {
        this.toDistrictId = toDistrictId;
    }

    public int getToWardId() {
        return toWardId;
    }

    public void setToWardId(int toWardId) {
        this.toWardId = toWardId;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getCreateBy() {
        return createBy;
    }

    public void setCreateBy(int createBy) {
        this.createBy = createBy;
    }

    public String getIdTransport() {
        return idTransport;
    }

    public void setIdTransport(String idTransport) {
        this.idTransport = idTransport;
    }

    @Override
    public String toString() {
        return "BookingModel: " +
                "id='" + id + '\'' +
                ", date_booking='" + date_booking + '\'' +
                ", id_user='" + id_user + '\'' +
                ", id_payment='" + id_payment + '\'' +
                ", description='" + description + '\'' +
                ", statusBooking=" + statusBooking +
                ", username='" + username + '\'' +
                ", nameTypePayment='" + nameTypePayment + '\'' +
                ", tel='" + tel + '\'' +
                ", id_product=" + id_product +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", toDistrictId=" + toDistrictId +
                ", toWardId=" + toWardId +
                ", height=" + height +
                ", length=" + length +
                ", width=" + width +
                ", weight=" + weight;
    }

    public int getFromWardId() {
        return fromWardId;
    }

    public void setFromWardId(int fromWardId) {
        this.fromWardId = fromWardId;
    }

    public int getFromDistrictId() {
        return fromDistrictId;
    }

    public void setFromDistrictId(int fromDistrictId) {
        this.fromDistrictId = fromDistrictId;
    }

    public int getSumMoney() {
        return sumMoney;
    }

    public void setSumMoney(int sumMoney) {
        this.sumMoney = sumMoney;
    }
}

