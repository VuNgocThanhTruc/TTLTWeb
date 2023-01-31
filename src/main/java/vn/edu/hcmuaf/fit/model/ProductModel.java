package vn.edu.hcmuaf.fit.model;

public class ProductModel {
    private int id;
    private String name;
    private String avatar;
    private long price;

    private int idBrand;

    private int idTypeProduct;

    private int idStatusDevice;

    private int sumQuantity;

    private String describe;

    private int idStore;

    public ProductModel() {
    }

    public ProductModel(int id, String name,String avatar,int idTypeProduct,int idStatusDevice, int idBrand, long price,int sumQuantity,String describe, int idStore) {
        this.id = id;
        this.name = name;
        this.avatar = avatar;
        this.price = price;
        this.idBrand = idBrand;
        this.idTypeProduct = idTypeProduct;
        this.idStatusDevice = idStatusDevice;
        this.sumQuantity = sumQuantity;
        this.describe = describe;
        this.idStore = idStore;
    }

    public ProductModel(int id, String name, String avatar, long price, int sumQuantity) {
        this.id = id;
        this.name = name;
        this.avatar = avatar;
        this.price = price;
        this.sumQuantity = sumQuantity;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getAvatar() {
        return avatar;
    }

    public long getPrice() {
        return price;
    }

    public int getIdBrand() {
        return idBrand;
    }

    public int getIdTypeProduct() {
        return idTypeProduct;
    }

    public int getIdStatusDevice() {
        return idStatusDevice;
    }

    public int getSumQuantity() {
        return sumQuantity;
    }

    public String getDescribe() {
        return describe;
    }

    public int getIdStore() {
        return idStore;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public void setIdBrand(int idBrand) {
        this.idBrand = idBrand;
    }

    public void setIdTypeProduct(int idTypeProduct) {
        this.idTypeProduct = idTypeProduct;
    }

    public void setIdStatusDevice(int idStatusDevice) {
        this.idStatusDevice = idStatusDevice;
    }

    public void setSumQuantity(int sumQuantity) {
        this.sumQuantity = sumQuantity;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public void setIdStore(int idStore) {
        this.idStore = idStore;
    }

    @Override
    public String toString() {
        return "ProductModel{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", avatar='" + avatar + '\'' +
                ", price=" + price +
                ", idBrand=" + idBrand +
                ", idTypeProduct=" + idTypeProduct +
                ", idStatusDevice=" + idStatusDevice +
                ", sumQuantity=" + sumQuantity +
                ", describe='" + describe + '\'' +
                ", idStore=" + idStore +
                '}';
    }
}
