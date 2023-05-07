package vn.edu.hcmuaf.fit.model;

public class DiscountModel {
    private int idDiscount;
    private int idTypeProduct;
    private int idProduct;
    private String dateStart;
    private String dateEnd;
    private int percentDiscount;

    private String nameTypeProduct;
    private String nameProduct;
    private String avatar;
    private int price;

    public DiscountModel() {

    }

    public DiscountModel(int idDiscount, int idTypeProduct, int idProduct, String dateStart, String dateEnd, int percentDiscount) {
        this.idDiscount = idDiscount;
        this.idTypeProduct = idTypeProduct;
        this.idProduct = idProduct;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.percentDiscount = percentDiscount;
    }

    public DiscountModel(int idProduct, String nameTypeProduct, String nameProduct, String avatar, int price) {
        this.idProduct = idProduct;
        this.nameTypeProduct = nameTypeProduct;
        this.nameProduct = nameProduct;
        this.avatar = avatar;
        this.price = price;
    }

    public DiscountModel(int idTypeProduct, String nameTypeProduct) {
        this.idTypeProduct = idTypeProduct;
        this.nameTypeProduct = nameTypeProduct;
    }

    public DiscountModel(int idProduct) {
        this.idProduct = idProduct;
    }

    public DiscountModel(int idDiscount, int idTypeProduct, int idProduct, String dateStart, String dateEnd, int percentDiscount, String nameTypeProduct, String nameProduct, String avatar, int price) {
        this.idDiscount = idDiscount;
        this.idTypeProduct = idTypeProduct;
        this.idProduct = idProduct;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.percentDiscount = percentDiscount;
        this.nameTypeProduct = nameTypeProduct;
        this.nameProduct = nameProduct;
        this.avatar = avatar;
        this.price = price;
    }


    public int getIdDiscount() {
        return idDiscount;
    }

    public void setIdDiscount(int idDiscount) {
        this.idDiscount = idDiscount;
    }

    public int getIdTypeProduct() {
        return idTypeProduct;
    }

    public void setIdTypeProduct(int idTypeProduct) {
        this.idTypeProduct = idTypeProduct;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
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

    public String getNameTypeProduct() {
        return nameTypeProduct;
    }

    public void setNameTypeProduct(String nameTypeProduct) {
        this.nameTypeProduct = nameTypeProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
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
        return "DiscountModel{" +
                "idDiscount=" + idDiscount +
                ", idTypeProduct=" + idTypeProduct +
                ", idProduct=" + idProduct +
                ", dateStart='" + dateStart + '\'' +
                ", dateEnd='" + dateEnd + '\'' +
                ", percentDiscount=" + percentDiscount +
                ", nameTypeProduct='" + nameTypeProduct + '\'' +
                ", nameProduct='" + nameProduct + '\'' +
                ", avatar='" + avatar + '\'' +
                ", price=" + price +
                '}';
    }
}
