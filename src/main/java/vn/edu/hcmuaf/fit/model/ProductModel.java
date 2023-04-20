package vn.edu.hcmuaf.fit.model;

import java.util.List;

public class ProductModel {
    private int id;
    private String name;
    private int idTypeProduct;
    private int idStatusDevice;
    private int idBrand;
    private long price;
    private String describe;

    private int height;
    private int length;
    private int width;
    private int weight;

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

    public List<LibraryImageModel> getListImage() {
        return listImage;
    }

    public void setListImage(List<LibraryImageModel> listImage) {
        this.listImage = listImage;
    }

    private List<LibraryImageModel> listImage;

    public ProductModel() {
    }

    public ProductModel(int id, String name, int idTypeProduct, int idStatusDevice, int idBrand, long price, String describe, int height, int length, int width, int weight, List<LibraryImageModel> listImage) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.idBrand = idBrand;
        this.idTypeProduct = idTypeProduct;
        this.idStatusDevice = idStatusDevice;
        this.height = height;
        this.length = length;
        this.width = width;
        this.weight = weight;
        this.describe = describe;
        this.listImage = listImage;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
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


    public String getDescribe() {
        return describe;
    }


    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
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

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    @Override
    public String toString() {
        return "ProductModel{" + "id=" + id + ", name='" + name + '\'' + ", price=" + price + ", idBrand=" + idBrand + ", idTypeProduct=" + idTypeProduct + ", idStatusDevice=" + idStatusDevice + ", describe='" + describe + '\'' + '}';
    }
}
