package vn.edu.hcmuaf.fit.model;

public class DetailBookingModel {

    private int id;
    private int id_booking;
    private int id_product;
    private int quantity;

    private String name;
    private String price;

    public DetailBookingModel() {
    }

    public DetailBookingModel(int id_booking, int id_product, int quantity) {
        this.id_booking = id_booking;
        this.id_product = id_product;
        this.quantity = quantity;
    }

    public int getId_booking() {
        return id_booking;
    }

    public void setId_booking(int id_booking) {
        this.id_booking = id_booking;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "DetailBookingModel: " +
                "id=" + id +
                ", id_booking=" + id_booking +
                ", id_product=" + id_product +
                ", quantity=" + quantity +
                ", name='" + name +
                ", price='" + price + "<br>";
    }
}
