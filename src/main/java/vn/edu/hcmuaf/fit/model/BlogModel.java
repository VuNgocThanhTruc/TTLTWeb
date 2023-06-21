package vn.edu.hcmuaf.fit.model;

import vn.edu.hcmuaf.fit.dao.BlogDAO;
import vn.edu.hcmuaf.fit.dao.BookingDAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class BlogModel {
    private String userCreate;
    private int id;
    private String title;
    private String briefContent;
    private String detailContent;
    private int status;
    private String avatar;
    private int typeBlog;
    private Date createdDate;

    public BlogModel(int id, String title, String briefContent, String detailContent, int status, String avatar, int typeBlog, Date createdDate, String userCreate) {
        this.id = id;
        this.title = title;
        this.briefContent = briefContent;
        this.detailContent = detailContent;
        this.status = status;
        this.avatar = avatar;
        this.typeBlog = typeBlog;
        this.createdDate = createdDate;
        this.userCreate = userCreate;
    }

    public BlogModel(int id, String title, String briefContent,String avatar, String userCreate, Date createdDate) {
        this.id = id;
        this.title = title;
        this.briefContent = briefContent;
        this.avatar = avatar;
        this.userCreate = userCreate;
        this.createdDate = createdDate;

    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getBriefContent() {
        if(this.briefContent == null) return "Không xác định";
        return briefContent;
    }

    public String getDetailContent() {
        return detailContent;
    }

    public int getStatus() {
        return status;
    }

    public String getAvatar() {
        return avatar;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public String getUserCreated() {
        return userCreate;
    }

    public int getTypeBlog() {
        return typeBlog;
    }
    public String getNameStatus(){
        if(getStatus() == 1){
            return "Đang đăng";
        }else{
            return "Không đăng";
        }
    }
    @Override
    public String toString() {
        return "<br>Blog: mã=" + id +
                ", tiêu đề='" + title +
                ", ngày tạo=" + createdDate +
                ", mã người tạo=" + userCreate +
                ", trạng thái=" + getNameStatus()
                ;
    }

    public static void main(String[] args) {
        BlogModel blog = new BlogModel(1, "Đây là title","Đây là mô tả", "Đây là nội dung chính", 1, "anhdaidien", 1, new Date(2023, 1,1), "1");
        BlogModel blog2 = new BlogModel(2, "Đây là title","Đây là mô tả", "Đây là nội dung chính", 1, "anhdaidien", 1, new Date(2023, 1,1), "1");
        List<BlogModel> list = new ArrayList<BlogModel>();
        list.add(blog);
        list.add(blog2);
        System.out.println(list);
    }
}
