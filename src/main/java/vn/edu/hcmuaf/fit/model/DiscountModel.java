package vn.edu.hcmuaf.fit.model;

public class DiscountModel {
    private int idDiscount;
    private int idTypeProduct;
    private int idProduct;
    private String dateStart;
    private String dateEnd;
    private int percentDiscount;
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

    @Override
    public String toString() {
        return "DiscountModel{" +
                "idDiscount=" + idDiscount +
                ", idTypeProduct=" + idTypeProduct +
                ", idProduct=" + idProduct +
                ", dateStart='" + dateStart + '\'' +
                ", dateEnd='" + dateEnd + '\'' +
                ", percentDiscount=" + percentDiscount +
                '}';
    }
}
