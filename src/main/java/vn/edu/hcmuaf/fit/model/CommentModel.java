package vn.edu.hcmuaf.fit.model;

import java.sql.Timestamp;

public class CommentModel {
    private int id;
    private int id_rate_product;
    private String content;
    private Timestamp createAt;
    private int createBy;
    private int modified_by;
    private Timestamp modified_at;
    private int id_comment_parent;
    private int status;

    public CommentModel() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_rate_product() {
        return id_rate_product;
    }

    public void setId_rate_product(int id_rate_product) {
        this.id_rate_product = id_rate_product;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public int getCreateBy() {
        return createBy;
    }

    public void setCreateBy(int createBy) {
        this.createBy = createBy;
    }

    public int getModified_by() {
        return modified_by;
    }

    public void setModified_by(int modified_by) {
        this.modified_by = modified_by;
    }

    public Timestamp getModified_at() {
        return modified_at;
    }

    public void setModified_at(Timestamp modified_at) {
        this.modified_at = modified_at;
    }

    public int getId_comment_parent() {
        return id_comment_parent;
    }

    public void setId_comment_parent(int id_comment_parent) {
        this.id_comment_parent = id_comment_parent;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
