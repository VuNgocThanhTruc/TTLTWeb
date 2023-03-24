package vn.edu.hcmuaf.fit.model;

public class LibraryImageModel {
    private int id;
    private String url;
    private int id_product;
    private String skug;

    public LibraryImageModel(int id, String url, int id_product, String skug) {
        this.id = id;
        this.url = url;
        this.id_product = id_product;
        this.skug = skug;
    }

    public LibraryImageModel(String url) {
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public String getSkug() {
        return skug;
    }

    public void setSkug(String skug) {
        this.skug = skug;
    }

    @Override
    public String toString() {
        return "LibraryImageModel{" +
                "id=" + id +
                ", url='" + url + '\'' +
                ", id_product=" + id_product +
                ", skug='" + skug + '\'' +
                '}';
    }
}
