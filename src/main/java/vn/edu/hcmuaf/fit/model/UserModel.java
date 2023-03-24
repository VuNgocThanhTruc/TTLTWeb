package vn.edu.hcmuaf.fit.model;

import vn.edu.hcmuaf.fit.service.AuthoritiesService;

public class UserModel {
    String id;
    String name;
    String username;
    String email;
    String password;
    String avatar;
    String tel;
    int id_type_user;
    String dob;
    int sex;
    String address;

    String idRole;

    public UserModel(String id, String name, String username, String email, String password, String avatar, String tel,
                     int id_type_user, String dob, int sex, String address) {
        super();
        this.id = id;
        this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.avatar = avatar;
        this.tel = tel;
        this.id_type_user = id_type_user;
        this.dob = dob;
        this.sex = sex;
        this.address = address;
    }

    public UserModel(String id, String name, String username, String email, String password, String avatar, String tel,
                     int id_type_user, String dob, int sex, String address, String idRole) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.avatar = avatar;
        this.tel = tel;
        this.id_type_user = id_type_user;
        this.dob = dob;
        this.sex = sex;
        this.address = address;
        this.idRole = idRole;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getId_type_user() {
        return id_type_user;
    }

    public void setId_type_user(int id_type_user) {
        this.id_type_user = id_type_user;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getIdRole() {
        return idRole;
    }

    public void setIdRole(String idRole) {
        this.idRole = idRole;
    }

    public String getNameRole(){
        AuthoritiesService auth = new AuthoritiesService();
        return auth.getNameRoleById(this.idRole);
    }


    @Override
    public String toString() {
        return "User [id=" + id + ", name=" + name + ", username=" + username + ", email=" + email + ", password="
                + password + ", avatar=" + avatar + ", tel=" + tel + ", id_type_user=" + id_type_user + ", dob=" + dob
                + ", sex=" + sex + ", address=" + address + "]\n";
    }

}