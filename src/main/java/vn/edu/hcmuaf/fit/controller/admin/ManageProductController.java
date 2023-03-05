package vn.edu.hcmuaf.fit.controller.admin;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import vn.edu.hcmuaf.fit.constant.SystemConstant;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.service.CategorySevice;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.nio.file.Paths;
import java.util.List;

@MultipartConfig
@WebServlet(name = "ManageProductController", value = "/admin/manage-product")
public class ManageProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeParam = request.getParameter("type");
        String idProductParam = request.getParameter("id-product");
        String view = "";
        ProductService productService = new ProductService();

        if (SystemConstant.LIST.equals(typeParam)) {
            view = "/view/admin/manage-product.jsp";
        } else if (SystemConstant.ADD.equals(typeParam)) {
            String addStyleParam = request.getParameter("action");
            if (addStyleParam != null) {
                if (addStyleParam.equals("brand")) {
                    doGetAddBrand(request, response);
                } else if (addStyleParam.equals("type_product")) {
                    doGetAddTypeProduct(request, response);
                } else if (addStyleParam.equals("status")) {
                    doGetAddStatus(request, response);
                }
            }
            view = "/view/admin/add-product.jsp";
        } else if (SystemConstant.EDIT.equals(typeParam)) {
            int idProduct = Integer.parseInt(request.getParameter("id-product"));
            if (idProductParam != null) {
                request.setAttribute("product", productService.getDetailProduct(idProduct));
            }
            view = "/view/admin/edit-product.jsp";
        } else if (SystemConstant.DELETE.equals(typeParam)) {
            if (idProductParam != null) {
                System.out.println("delete");
                ProductDAO.deleteProduct(Integer.parseInt(idProductParam));
            }
            request.setAttribute("listProduct", ProductService.getListProduct());
            view = "/view/admin/manage-product.jsp";
        } else if (typeParam == null) {
            view = "/view/admin/manage-product.jsp";
            request.setAttribute("listProduct", ProductService.getListProduct());
        }

        request.setAttribute("listStatus", CategorySevice.getListStatus());

        request.setAttribute("categoryTypeProduct", CategorySevice.getListTypeProduct());

        request.setAttribute("categoryBrand", CategorySevice.getListBrand());

        request.getRequestDispatcher(view).forward(request, response);
    }

    private void doGetAddStatus(HttpServletRequest request, HttpServletResponse response) {
//        ProductService.insertStatus(name);
    }

    private void doGetAddTypeProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        request.setAttribute("checkInsert", ProductService.insertTypeProduct(name));
        response.sendRedirect(request.getRequestURI());
    }

    private void doGetAddBrand(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");

        request.setAttribute("checkInsert", ProductService.insertBrand(name));
        response.sendRedirect(request.getRequestURI());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeParam = request.getParameter("type");

        if (SystemConstant.ADD.equals(typeParam)) {
            doPost_Add(request, response);
        } else if (SystemConstant.EDIT.equals(typeParam)) {
            try {
                doPost_Edit(request, response);
            } catch (FileUploadException e) {
                throw new RuntimeException(e);
            }
        } else {
            doPost_EditBasic(request, response);
        }
    }


    private void doPost_Edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, FileUploadException {
//        System.out.println(request.getPart("idProduct").getSubmittedFileName());
        int pid = Integer.parseInt(request.getParameter("idProduct"));
        String pName = request.getParameter("name_product");
        int pidTypeProduct = Integer.parseInt(request.getParameter("categoryTypeProduct"));
        int pidStatus = Integer.parseInt(request.getParameter("statusProduct"));
        int pBrand = Integer.parseInt(request.getParameter("categoryBrand"));
        int pPrice = Integer.parseInt(request.getParameter("price"));
        int pQuantity = Integer.parseInt(request.getParameter("quantity"));
        String pDescription = request.getParameter("description");
        int pidStore = Integer.parseInt("1");
        String id = request.getParameter("idProduct");

        String imageFileName = updateImageServer(request,"product");

        boolean checkUpdateProduct = ProductService.updateProduct(pid, pName, imageFileName, pidTypeProduct, pidStatus, pBrand, pPrice, pQuantity, pDescription, pidStore);
        request.setAttribute("message", checkUpdateProduct);
        request.setAttribute("categoryTypeProduct", CategorySevice.getListTypeProduct());
        request.setAttribute("categoryBrand", CategorySevice.getListBrand());
        request.setAttribute("listProduct", ProductService.getListProduct());
        response.sendRedirect(request.getRequestURI());
    }

    private void doPost_EditBasic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("idModal"));
        String pName = request.getParameter("nameModal");
        int pidTypeProduct = Integer.parseInt(request.getParameter("categoryModal"));
        int pidStatus = Integer.parseInt(request.getParameter("statusModal"));
        int pPrice = Integer.parseInt(request.getParameter("priceModal"));
        int pQuantity = Integer.parseInt(request.getParameter("quantityModal"));

        boolean checkUpdateProduct = ProductService.updateProductBasic(pid, pName, pQuantity, pidStatus, pPrice, pidTypeProduct);
        request.setAttribute("message", checkUpdateProduct);
        request.setAttribute("categoryTypeProduct", CategorySevice.getListTypeProduct());
        request.setAttribute("categoryBrand", CategorySevice.getListBrand());
        request.setAttribute("listProduct", ProductService.getListProduct());
        request.getRequestDispatcher("/view/admin/manage-product.jsp").forward(request, response);
    }

    protected void doPost_Add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String pName = request.getParameter("name_product");
        String pAvatar = request.getParameter("ImageUpload");
        int pidTypeProduct = Integer.parseInt(request.getParameter("categoryTypeProduct"));
        int pidStatus = Integer.parseInt(request.getParameter("statusProduct"));
        int pBrand = Integer.parseInt(request.getParameter("categoryBrand"));
        int pPrice = Integer.parseInt(request.getParameter("price"));
        int pQuantity = Integer.parseInt(request.getParameter("quantity"));
        String pDescription = request.getParameter("description");
        int pidStore = Integer.parseInt("1");

        String imageFileName = updateImageServer(request,"product");

        boolean checkAddNew = new ProductService().addNewProduct(pName, imageFileName, pidTypeProduct, pidStatus, pBrand, pPrice, pQuantity, pDescription, pidStore);
        request.setAttribute("message", checkAddNew);
        request.setAttribute("categoryTypeProduct", CategorySevice.getListTypeProduct());
        request.setAttribute("categoryBrand", CategorySevice.getListBrand());
        request.setAttribute("listProduct", ProductService.getListProduct());
        request.getRequestDispatcher("/view/admin/manage-product.jsp").forward(request, response);
    }

    //        update image from client path to server
    protected String updateImageServer(HttpServletRequest request, String saveIntoPath) throws ServletException, IOException {
        Part file = request.getPart("ImageUpload");

        String imageFileName = file.getSubmittedFileName();  // get selected image file name
        System.out.println("Selected Image File Name : " + imageFileName);

        String uploadPath = getServletContext().getRealPath("") + File.separator +"/images/"+saveIntoPath+"/" + imageFileName;  // upload path where we have to upload our actual image
        System.out.println("Upload Path : " + uploadPath);

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

}
