package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.BlogDAO;
import vn.edu.hcmuaf.fit.model.BlogModel;

import java.util.List;

public class BlogService {

    public BlogDAO blogDAO;

    public BlogService() {
        this.blogDAO = new BlogDAO();
    }

    public static void insertBlog(String title, String brief, String detail, String imageFileName, String idUser) {
        BlogDAO.insertBlog(title, brief, detail, imageFileName, idUser);
    }

    public List<BlogModel> getListBlog() {
        return blogDAO.findAll();
    }

    public List<BlogModel> getNewBlog() {
        return blogDAO.getNewBlog();
    }
    public  static List<BlogModel> getBlogAdmin() {
        return BlogDAO.getBlogAdmin();

    }



    public static BlogModel getDetailBlogForId(String idBlogPram) {
        return BlogDAO.getDetailBlogForId(idBlogPram);
    }

    public static void updateBlog(String id, String title, String brief, String detail, String avatar){
            BlogDAO.update(id, title, brief, detail,avatar);
    }

    public static void main(String[] args) {
        System.out.println(new BlogService().getDetailBlogForId("4"));
    }
}