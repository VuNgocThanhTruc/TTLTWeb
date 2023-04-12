package vn.edu.hcmuaf.fit.model;

import vn.edu.hcmuaf.fit.service.CategorySevice;

import java.util.List;

public class ProductModel {
    private int id;
    private String name;
    private int idTypeProduct;
    private int idStatusDevice;
    private int idBrand;
    private long price;
    private String describe;
    //    private String avatar;
    public ProductModel() {
    }

    public ProductModel(int id, String name, int idTypeProduct, int idStatusDevice, int idBrand, long price, String describe) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.idBrand = idBrand;
        this.idTypeProduct = idTypeProduct;
        this.idStatusDevice = idStatusDevice;
        this.describe = describe;
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

    public String getCategory(int idTypeProduct){
        String result = "";
        List<CategoryModel>  listBrand = CategorySevice.getListTypeProduct();
        for (CategoryModel category: listBrand) {
            System.out.println("category: " + category + ", idTypeProduct: " +idTypeProduct);
            if(category.getId() == idTypeProduct){
                System.out.println("category true: " + category + ", idTypeProduct: " +idTypeProduct);
                result = category.getName();
                break;
            }
        }
        return result;
    }
    @Override
    public String toString() {
        return "ProductModel{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", idBrand=" + idBrand +
                ", idTypeProduct=" + idTypeProduct +
                ", idStatusDevice=" + idStatusDevice +
                ", describe='" + describe + '\'' +
                '}';
    }
}
