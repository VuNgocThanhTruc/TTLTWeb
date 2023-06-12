package vn.edu.hcmuaf.fit.controller.admin;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.constant.APIConstants;
import vn.edu.hcmuaf.fit.constant.SystemConstant;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.dao.UserDAO;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.ProductModel;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.service.CategorySevice;
import vn.edu.hcmuaf.fit.service.ExportService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.LinkedList;
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
        HttpSession session = request.getSession();
        UserModel user =(UserModel) session.getAttribute("userlogin");

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
                ProductDAO.deleteProduct(Integer.parseInt(idProductParam));
                DBConnect.getInstall().insert(new Log(3,
                        Integer.parseInt(user == null ? "-1" : user.getId()),
                        request.getRemoteAddr(),request.getRequestURI(),
                        "Delete Product ID :" +idProductParam,
                        0));
            }
            request.setAttribute("listProduct", ProductService.getListProduct());
            view = "/view/admin/manage-product.jsp";
        } else if(SystemConstant.EXPORT.equals(typeParam)){
            //Export Data
            ExportService exportService = new ExportService();
            exportService.exportProduct(request, response);
            DBConnect.getInstall().insert(new Log(Log.INFO,Integer.parseInt(user == null ? "-1" : user.getId()), request.getRemoteAddr(),request.getRequestURI(),"Export Data :" +ProductService.getListProduct().toString(), 0));
            view = "/view/admin/manage-product.jsp";
        }else if (typeParam == null) {
            view = "/view/admin/manage-product.jsp";
            DBConnect.getInstall().insert(new Log(Log.INFO, Integer.parseInt(user == null ? "-1" : user.getId()), request.getRemoteAddr(), request.getRequestURI(),"Show list product: "+ProductService.getListProduct().toString(), 0));
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
        } else{
            doPost_EditBasic(request, response);
        }
    }
    private void doPost_Edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, FileUploadException {
        int pid = Integer.parseInt(request.getParameter("id-product"));
        String pName = request.getParameter("name_product");
        int pidTypeProduct = Integer.parseInt(request.getParameter("categoryTypeProduct"));
        int pidStatus = Integer.parseInt(request.getParameter("statusProduct"));
        int pBrand = Integer.parseInt(request.getParameter("categoryBrand"));
        int pPrice = Integer.parseInt(request.getParameter("price"));
//        int pQuantity = Integer.parseInt(request.getParameter("quantity"));

        int height = Integer.parseInt(request.getParameter("height"));
        int length = Integer.parseInt(request.getParameter("length"));
        int width = Integer.parseInt(request.getParameter("width"));
        int weight = Integer.parseInt(request.getParameter("weight"));
        String pDescription = request.getParameter("description");
        String avatar = request.getParameter("valueImage");
        List<String> listFileNameImage = uploadLibraryImage(request,"product");
        String imageFileName = uploadImageServer(request,"product")!=null && uploadImageServer(request,"product").length()>0?uploadImageServer(request,"product"):avatar;

        boolean checkUpdateProduct = ProductService.updateProduct(pid, pName,imageFileName, pidTypeProduct, pidStatus, pBrand, pPrice, pDescription, height,length,width,weight, listFileNameImage);
        request.setAttribute("message", checkUpdateProduct);
        request.setAttribute("categoryTypeProduct", CategorySevice.getListTypeProduct());
        request.setAttribute("categoryBrand", CategorySevice.getListBrand());
        request.setAttribute("listProduct", ProductService.getListProduct());
        response.sendRedirect(request.getRequestURI());
    }

    private void doPost_EditBasic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user =(UserModel) session.getAttribute("userlogin");
        int pid = Integer.parseInt(request.getParameter("idModal"));
        String pName = request.getParameter("nameModal");
        int pidTypeProduct = Integer.parseInt(request.getParameter("categoryModal"));
        int pidStatus = Integer.parseInt(request.getParameter("statusModal"));
        int pPrice = Integer.parseInt(request.getParameter("priceModal"));
        int brand = Integer.parseInt(request.getParameter("brandModal"));

        boolean checkUpdateProduct = ProductService.updateProductBasic(pid, pName, brand, pidStatus, pPrice, pidTypeProduct);
        DBConnect.getInstall().insert(
                new Log(0,
                        Integer.parseInt(user == null ? "-1" : user.getId()),
                        request.getRemoteAddr(),request.getRequestURI(),
                        "Edit Product id: " +pid+", Name: "+ pName +", Id Type Product: " +pidTypeProduct +", Status: " +pidStatus+", Price: "+ pPrice+", brand: " + brand ,
                        0));
        PrintWriter out = response.getWriter();
        if(checkUpdateProduct){
            out.println("success");
        }else{
            out.println("error");
        }
        out.close();
    }
    protected void doPost_Add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user =(UserModel) session.getAttribute("userlogin");
        String pName = request.getParameter("name_product");
        int pidTypeProduct = Integer.parseInt(request.getParameter("categoryTypeProduct"));
        int pidStatus = Integer.parseInt(request.getParameter("statusProduct"));
        int pBrand = Integer.parseInt(request.getParameter("categoryBrand"));
        int pPrice = Integer.parseInt(request.getParameter("price"));
        int pQuantity = Integer.parseInt(request.getParameter("quantity"));
        String pDescription = request.getParameter("description");
        int height = Integer.parseInt(request.getParameter("height"));
        int length = Integer.parseInt(request.getParameter("length"));
        int width = Integer.parseInt(request.getParameter("width"));
        int weight = Integer.parseInt(request.getParameter("weight"));
        int pidStore = Integer.parseInt("1");

        String imageFileName = uploadImageServer(request,"product");

        List<String> listFileNameImage = uploadLibraryImage(request,"product");

        boolean checkAddNew = new ProductService().addNewProduct(pName, imageFileName, pidTypeProduct, pidStatus, pBrand, pPrice, pQuantity, pDescription, pidStore, Integer.parseInt(user.getId()),height,length,width,weight,listFileNameImage);
        DBConnect.getInstall().insert(
                new Log(0,
                        Integer.parseInt(user == null ? "-1" : user.getId()),
                        request.getRemoteAddr(),
                        request.getRequestURI(),
                        "Add New Product " +"Name: "+ pName +", Id Type Product: " +pidTypeProduct +", Status: " +pidStatus + ", Brand: " + pBrand+", Price: "+ pPrice+", Quantity: " + pQuantity+", Description: " + pDescription+", Id Store: " + pidStore ,
                        0));
        request.setAttribute("message", checkAddNew);
        request.setAttribute("categoryTypeProduct", CategorySevice.getListTypeProduct());
        request.setAttribute("categoryBrand", CategorySevice.getListBrand());
        request.setAttribute("listProduct", ProductService.getListProduct());
        request.getRequestDispatcher("/view/admin/manage-product.jsp").forward(request, response);
    }

    protected List<String> uploadLibraryImage(HttpServletRequest request,String saveIntoPath) throws ServletException, IOException {
        List<String> listNameFileImage = new LinkedList<>();
        String uploadPath = getServletContext().getRealPath("") + File.separator +"/images/"+saveIntoPath+"/";  // upload path where we have to upload our actual image

        if(ServletFileUpload.isMultipartContent(request)){
            try {
                for (Part part : request.getParts()) {
                    if (part.getContentType() != null && part.getName().equals("uploadfilelibrary")) {
                        String fileName = part.getSubmittedFileName();
                        FileOutputStream fos = new FileOutputStream(uploadPath+fileName);
                        InputStream fileContent = part.getInputStream();

                        byte[] data = new byte[fileContent.available()];
                        fileContent.read(data);
                        fos.write(data);
                        fos.close();
                        listNameFileImage.add(fileName);
                    }
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        return listNameFileImage;
    }

    //        update image from client path to server
    protected String uploadImageServer(HttpServletRequest request, String saveIntoPath) throws ServletException, IOException {
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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return imageFileName;
    }
}
