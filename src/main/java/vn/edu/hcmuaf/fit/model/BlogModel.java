package vn.edu.hcmuaf.fit.model;

import vn.edu.hcmuaf.fit.dao.BlogDAO;
import vn.edu.hcmuaf.fit.dao.BookingDAO;

import java.sql.Date;

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

    @Override
    public String toString() {
        return "BlogModel{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", brefContent='" + briefContent + '\'' +
                ", detailContent='" + detailContent + '\'' +
                ", status=" + status +
                ", avatar='" + avatar + '\'' +
                ", createdDate=" + createdDate +
                ", userCreate=" + userCreate +
                '}';
    }

    public static void main(String[] args) {
        BlogModel blog = BlogDAO.getDetailBlogForId(2+"");
        System.out.println(blog);
    }
}
