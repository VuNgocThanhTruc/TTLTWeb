package vn.edu.hcmuaf.fit.model;


public class ImageModel {
    private String id;
    private String name_photo;
    private String photo;
    private int type;


    public ImageModel(String id, String name_photo, String photo, int type) {
        super();
        this.id = id;
        this.name_photo = name_photo;
        this.photo = photo;
        this.type = type;
    }

    public ImageModel() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName_photo() {
        return name_photo;
    }

    public void setName_photo(String name_photo) {
        this.name_photo = name_photo;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "ImageDAO [id=" + id + ", name_photo=" + name_photo + ", photo=" + photo + ", type=" + type + "]";
    }

}
