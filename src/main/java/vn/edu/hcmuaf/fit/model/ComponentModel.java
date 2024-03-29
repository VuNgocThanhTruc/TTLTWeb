package vn.edu.hcmuaf.fit.model;

public class ComponentModel {
    private String id;
    private String name;
    private String code;
    private Boolean enabled;

    public ComponentModel(String id, String name, String code, Boolean enabled) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.enabled = enabled;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getIcon(){
        String result = "";
        switch (this.code){
            case "QLKH": result = "app-menu__icon bx bx-user";
                break;
            case "QLSP": result = "app-menu__icon bx bxl-product-hunt";
                break;
            case "QLDH": result = "app-menu__icon bx bx-purchase-tag-alt";
                break;
            case "QLDLSC": result = "app-menu__icon bx bxs-calendar";
                break;
            case "CXN": result = "app-menu__icon bx bx-calendar-check";
                break;
            case "QLTT": result = "app-menu__icon bx bx-news";
                break;
            case "QLA": result = "app-menu__icon bx bx-image";
                break;
            case "QLLH": result = "app-menu__icon bx bxs-contact";
                break;
            case "QLTK": result = "app-menu__icon bx bxs-user-account";
                break;
            case "QLGG": result = "app-menu__icon bx bxs-discount";
                break;
            case "QLQ": result = "app-menu__icon bx bxs-key";
                break;
            case "QLL": result = "app-menu__icon bx bx-file-blank";
                break;
            case "QLK": result = "app-menu__icon bx bx-store";
                break;
       default: result = "";
        }
        return result;
    }

    public String getHref(){
        String result = "";
        switch (this.code){
            case "QLKH": result = "manage-customer?menu=QLKH";
                break;
            case "QLSP": result = "manage-product?menu=QLSP";
                break;
            case "QLDH": result = "manage-order?menu=QLDH";
                break;
            case "QLDLSC": result = "manage-booking?status=accepted&menu=QLDLSC";
                break;
            case "CXN": result = "manage-booking?status=wait-accept&menu=CXN";
                break;
            case "QLTT": result = "manage-blog?menu=QLTT";
                break;
            case "QLA": result = "manage-image?menu=QLA";
                break;
            case "QLLH": result = "manage-contact?menu=QLLH";
                break;
            case "QLTK": result = "manage-account?action=manager-account&menu=QLTK";
                break;
            case "QLGG": result = "manage-discount?menu=QLGG";
                break;
            case "QLQ": result = "manage-authorities?action=manage-authorities&menu=QLQ";
                break;
            case "QLL": result = "manage-log?action=manage-log&menu=QLL";
                break;
            case "QLK": result = "manage-inventory&menu=QLK";
                break;
            default: result = "";
        }
        return result;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    @Override
    public String toString() {
        return "ComponentModel{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", enabled=" + enabled +
                '}';
    }
}
