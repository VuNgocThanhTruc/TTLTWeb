package vn.edu.hcmuaf.fit.model;

public class CustomerModel {
    private int id;
    private String username;
    private String address;
    private String email;
    private String tel;

    public CustomerModel(int id, String username, String address, String email, String tel) {
        this.id = id;
        this.username = username;
        this.address = address;
        this.email = email;
        this.tel = tel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

}

