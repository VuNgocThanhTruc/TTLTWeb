package vn.edu.hcmuaf.fit.model;

public class RoleModel {
    private String id;
    private String name;
    private String describe;

    public RoleModel(String id, String name, String describe) {
        this.id = id;
        this.name = name;
        this.describe = describe;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescribe() {
        return describe;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    @Override
    public String toString() {
        return "RoleModel{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", describe='" + describe + '\'' +
                '}';
    }
}
