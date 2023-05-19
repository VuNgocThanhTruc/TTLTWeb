package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.constant.SystemConstant;
import vn.edu.hcmuaf.fit.dao.ImageDAO;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@MultipartConfig
@WebServlet(value = "/admin/manage-image")
public class ManageImageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeParam = request.getParameter("type");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String view = "";
        ProductService productService = new ProductService();

        if (SystemConstant.LIST.equals(typeParam)) {
            view = "/view/admin/manage-image.jsp";
        } else if (SystemConstant.ADD.equals(typeParam)) {
            view = "/view/admin/add-image.jsp";
        } else if (SystemConstant.EDIT.equals(typeParam)) {
            String idImgParam = request.getParameter("id-image");
            if (idImgParam != null) {
                request.setAttribute("image", ImageDAO.loadImgById(idImgParam));
            }
            view = "/view/admin/edit-image.jsp";
        } else if (typeParam == null) {
            view = "/view/admin/manage-image.jsp";
        } else if (typeParam.equals("del")) {
            doGet_Del(request, response);
            view = "/view/admin/manage-image.jsp";
        }

//        request.setAttribute("listStatus", CategorySevice.getListStatus());
//
//        request.setAttribute("categoryTypeProduct", CategorySevice.getListTypeProduct());
//
//        request.setAttribute("categoryBrand", CategorySevice.getListBrand());
//
        request.getRequestDispatcher(view).forward(request, response);


//        request.getRequestDispatcher("/view/admin/manage-image.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String typeParam = request.getParameter("type");
        if (typeParam.equals("add")) {
            doPost_Add(request, response);
        } else if (SystemConstant.EDIT.equals(typeParam)) {
            doPost_Edit(request, response);
//System.out.println("vô gòi");
        }

    }

    private void doPost_Add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String name = request.getParameter("name_photo");


        int numType = Integer.parseInt(request.getParameter("numType"));

//        update image from client path to server
        Part file = request.getPart("ImageUpload");

        String imageFileName = file.getSubmittedFileName();  // get selected image file name
        System.out.println("Selected Image File Name : " + imageFileName);
        String uploadPath = "";
        if (numType == 1) {
            uploadPath = getServletContext().getRealPath("") + File.separator + "/images/banner/" + imageFileName;  // upload path where we have to upload our actual image
            System.out.println("Upload Path : " + uploadPath);
        } else {
            uploadPath = getServletContext().getRealPath("") + File.separator + "/images/footer/" + imageFileName;  // upload path where we have to upload our actual image
            System.out.println("Upload Path : " + uploadPath);
        }


        // Uploading our selected image into the images folder

        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        ImageDAO imageDAO = new ImageDAO();

        imageDAO.addImage(name, imageFileName, numType);

        response.sendRedirect("manage-image");


    }

    private void doPost_Edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        ImageDAO imageDao = new ImageDAO();
        int id = Integer.parseInt(request.getParameter("id-image"));
        String name = request.getParameter("namePhoto");
        int type = Integer.parseInt(request.getParameter("numType"));
        if(type==1){
        String imageFileName = updateImageServer(request,"banner");
        imageDao.updatePhoto(id,name,imageFileName,type);
        }
        else if(type==2) {
            String imageFileName = updateImageServer(request,"footer");
            imageDao.updatePhoto(id,name,imageFileName,type);
        }
        response.sendRedirect("manage-image");
    }
    //        update image from client path to server
    protected String updateImageServer(HttpServletRequest request, String saveIntoPath) throws ServletException, IOException {
        Part file = request.getPart("ImageUpload");
        String imageFileName = file.getSubmittedFileName();  // get selected image file name
        String uploadPath = getServletContext().getRealPath("") + File.separator +"/images/"+saveIntoPath+"/" + imageFileName;  // upload path where we have to upload our actual image

        // Uploading our selected image into the images folder

        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
            return imageFileName;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private void doGet_Del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");


        String id = request.getParameter("id");

        HttpSession session = request.getSession();


        ImageDAO imageDAO = new ImageDAO();
        imageDAO.del(id);


    }
}