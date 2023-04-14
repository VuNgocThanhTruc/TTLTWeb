package vn.edu.hcmuaf.fit.model;

import java.util.List;

public class RateReviewModel {
    private int id;
    private int idProduct;
    private int rate;
    private UserModel user;
    private CommentModel commentModel;

    public RateReviewModel() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public UserModel getUser() {
        return user;
    }

    public void setUser(UserModel user) {
        this.user = user;
    }

    public CommentModel getCommentModel() {
        return commentModel;
    }

    public void setCommentModel(CommentModel commentModel) {
        this.commentModel = commentModel;
    }
}
