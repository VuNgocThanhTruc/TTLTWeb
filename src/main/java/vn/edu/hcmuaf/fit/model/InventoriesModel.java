package vn.edu.hcmuaf.fit.model;

public class InventoriesModel {
    private int idProduct;
    private int quantity;
    private String modifidedDate;
    private String modifiedBy;
    public InventoriesModel() {


    }

    public InventoriesModel(int idProduct, int quantity, String modifidedDate, String modifiedBy) {

        this.idProduct = idProduct;
        this.quantity = quantity;
        this.modifidedDate = modifidedDate;
        this.modifiedBy = modifiedBy;
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

    public String getModifidedDate() {
        return modifidedDate;
    }

    public void setModifidedDate(String modifidedDate) {
        this.modifidedDate = modifidedDate;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    @Override
    public String toString() {
        return "InventoriesModel{" +
                "idProduct=" + idProduct +
                ", quantity=" + quantity +
                ", modifidedDate='" + modifidedDate + '\'' +
                ", modifiedBy='" + modifiedBy + '\'' +
                '}';
    }
}
