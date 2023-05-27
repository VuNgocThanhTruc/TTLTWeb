package vn.edu.hcmuaf.fit.model;

public class InventoriesModel {
    private int idProduct;
    private int quantity;
    private String modifiedDate;
    private String modifiedBy;
    private String name;
    private String avatar;
    private int price;

    public InventoriesModel() {


    }

    public InventoriesModel(int idProduct, int quantity, String modifiedDate, String modifiedBy) {
        this.idProduct = idProduct;
        this.quantity = quantity;
        this.modifiedDate = modifiedDate;
        this.modifiedBy = modifiedBy;
    }

    public InventoriesModel(int idProduct, int quantity, String modifiedDate, String modifiedBy, String name, String avatar, int price) {
        this.idProduct = idProduct;
        this.quantity = quantity;
        this.modifiedDate = modifiedDate;
        this.modifiedBy = modifiedBy;
        this.name = name;
        this.avatar = avatar;
        this.price = price;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(String modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "InventoriesModel{" +
                "idProduct=" + idProduct +
                ", quantity=" + quantity +
                ", modifiedDate='" + modifiedDate + '\'' +
                ", modifiedBy='" + modifiedBy + '\'' +
                ", name='" + name + '\'' +
                ", avatar='" + avatar + '\'' +
                ", price=" + price +
                '}';
    }
}
