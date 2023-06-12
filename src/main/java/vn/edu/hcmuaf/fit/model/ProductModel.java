package vn.edu.hcmuaf.fit.model;

import vn.edu.hcmuaf.fit.service.CategorySevice;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class ProductModel {
    private int id;
    private String name;
    private int idTypeProduct;
    private int idStatusDevice;
    private int idBrand;
    private long price;
    private String describe;
    private String avatar;

    private int height;
    private int length;
    private int width;
    private int weight;
    private List<LibraryImageModel> listImage;
    private String dateStart;
    private String dateEnd;
    private int percentDiscount;


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

    public ProductModel(int id, String name, int idTypeProduct, int idStatusDevice, int idBrand, long price, String describe, int height, int length, int width, int weight, List<LibraryImageModel> listImage, String dateStart, String dateEnd, int percentDiscount) {
        this.id = id;
        this.name = name;
        this.idTypeProduct = idTypeProduct;
        this.idStatusDevice = idStatusDevice;
        this.idBrand = idBrand;
        this.price = price;
        this.describe = describe;
        this.height = height;
        this.length = length;
        this.width = width;
        this.weight = weight;
        this.listImage = listImage;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.percentDiscount = percentDiscount;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(String dateEnd) {
        this.dateEnd = dateEnd;
    }

    public int getPercentDiscount() {
        return percentDiscount;
    }

    public void setPercentDiscount(int percentDiscount) {
        this.percentDiscount = percentDiscount;
    }

    public long getPrice() {
        return price;
    }

    public long getPriceDiscount() {
        Date serverTime = new Date();
        Timestamp timestamp = new Timestamp(serverTime.getTime());
        if (dateStart != null || dateEnd != null) {
            Timestamp start = Timestamp.valueOf(dateStart);
            Timestamp end = Timestamp.valueOf(dateEnd);
            if (end.getTime() > timestamp.getTime() && start.getTime() <timestamp.getTime()) {
                int priceDiscount = (int) Math.ceil(price * (100 - percentDiscount) / 100);
                System.out.println("a");
                System.out.println(end.getTime());
                System.out.println(start.getTime());
                System.out.println(priceDiscount);
                return priceDiscount;

            }
            System.out.println("b");
            return price;
        }
        System.out.println("c");
        return price;
    }

//    public long getPriceDiscount() {
//        return priceDiscount;
//    }



    public void setPrice(long price) {
        this.price = price;
    }

    public String getCategory(int idTypeProduct) {
        String result = "";
        List<CategoryModel> listBrand = CategorySevice.getListTypeProduct();
        for (CategoryModel category : listBrand) {
            System.out.println("category: " + category + ", idTypeProduct: " + idTypeProduct);
            if (category.getId() == idTypeProduct) {
                System.out.println("category true: " + category + ", idTypeProduct: " + idTypeProduct);
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
                ", idTypeProduct=" + idTypeProduct +
                ", idStatusDevice=" + idStatusDevice +
                ", idBrand=" + idBrand +
                ", price=" + price +
                ", describe='" + describe + '\'' +
                ", height=" + height +
                ", length=" + length +
                ", width=" + width +
                ", weight=" + weight +
                ", listImage=" + listImage +
                ", dateStart='" + dateStart + '\'' +
                ", dateEnd='" + dateEnd + '\'' +
                ", percentDiscount=" + percentDiscount +
                '}';
    }
}
