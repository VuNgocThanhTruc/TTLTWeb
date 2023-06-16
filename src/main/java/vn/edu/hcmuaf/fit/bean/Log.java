package vn.edu.hcmuaf.fit.bean;


import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.dao.LogDAO;

import java.io.Serializable;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

public class Log extends AbBean implements Serializable {
    private int id;
    private int level;
    private String src;
    private int id_user;
    private String ip_address;
    private String title;
    private String content;
    private Timestamp create_at;
    private  int status;

    static Map<Integer, String> levelMapping = new HashMap<>();

    static {
        levelMapping.put(0, "INFO");
        levelMapping.put(1, "ALERT");
        levelMapping.put(2, "WARNING");
        levelMapping.put(3, "DANGER");
    }

    public static int INFO = 0;
    public static int ALERT = 1;
    public static int WARNING = 2;
    public static int DANGER = 3;

    public Log() {
    }
    public Log(int level,int userId, String ip_address, String src, String title, String content, Timestamp creatAt, int status) {
        this.level = level;
        this.src = src;
        this.id_user = userId;
        this.ip_address = ip_address;
        this.title = title;
        this.content = content;
        this.create_at = creatAt;
        this.status = status;
    }
    public Log(int level,int userId, String ip_address, String src,  String content, Timestamp creatAt, int status) {
        this.level = level;
        this.src = src;
        this.id_user = userId;
        this.ip_address = ip_address;
        this.content = content;
        this.create_at = creatAt;
        this.status = status;
    }
    public Log(int id, int level,int userId, String ip_address, String src, String title, String content, Timestamp creatAt, int status) {
        this.id = id;
        this.level = level;
        this.src = src;
        this.id_user = userId;
        this.title = title;
        this.content = content;
        this.create_at = creatAt;
        this.status = status;
    }
    public Log(int level,int userId, String ip_address, String src, String title, String content,int status) {
        this.level = level;
        this.src = src;
        this.ip_address = ip_address;
        this.id_user = userId;
        this.title = title;
        this.content = content;
        this.status = status;
    }
    public Log(int level,int userId, String ip_address, String src, String content,int status) {
        this.level = level;
        this.src = src;
        this.ip_address = ip_address;
        this.id_user = userId;
        this.content = content;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getLevelWithName() {
        return levelMapping.get(levelMapping.containsKey(this.level) ? this.level : 0);
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Timestamp create_at) {
        this.create_at = create_at;
    }

    public int getStatus() {
        return status;
    }


    public void setStatus(int status) {
        this.status = status;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getIp_address() {
        return ip_address;
    }

    public void setIp_address(String ip_address) {
        this.ip_address = ip_address;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public boolean insert(Jdbi db){
        Integer i = db.withHandle(handle ->
                handle.execute("INSERT INTO logs(`level`, `id_user`, `ip_address`, `src`, `title`,`content`, `create_at`, `status`)  VALUES(?,?,?,?,?,?,NOW(),?)",
                        this.level, getId_user() == -1 ? null : getId_user(),
                        getIp_address().trim() == ""? "Không xác định" : getIp_address(),
                        getSrc(),
                        getTitle(),
                        getContent(),
                        getStatus())
        );
        return i==1;
    }

    public String getNameStatus(){
        if(getStatus() == 1){
            return "Đã kiểm tra";
        }else{
            return "Chưa kiểm tra";
        }
    }
    public void checked(String idLog){
        LogDAO.checked(idLog);
    }
}