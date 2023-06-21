package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.model.*;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class ProductService {
    public static List<CategoryModel> getListBrand() {
        return ProductDAO.getListBrand();
    }

    public static List<ProductModel> getListProduct() {
        return ProductDAO.findAll();
    }

    public static List<ProductModel> getTop8() {
        return ProductDAO.getTop8();
    }

    public static List<ProductModel> getNextListProduct(int amount) {
        return ProductDAO.getNextListProduct(amount);
    }

    public static List<ProductModel> getListProductSortBy(int sortType, String brand) {
        List<ProductModel> listProductSort = null;
        if(brand == null || brand.equals("null")){
            listProductSort = ProductService.getTop8();
        }else{
            listProductSort = new ProductService().getListProductForBrand(brand);
        }
        if(sortType == 1){
            Collections.sort(listProductSort, new Comparator<ProductModel>() {
                @Override
                public int compare(ProductModel product1, ProductModel product2) {
                    return Long.compare(product1.getPrice(), product2.getPrice());
                }
            });
        } else if (sortType == 2){
            Collections.sort(listProductSort, new Comparator<ProductModel>() {
                @Override
                public int compare(ProductModel product1, ProductModel product2) {
                    return Long.compare(product2.getPrice(), product1.getPrice());
                }
            });
        } else if (sortType == 3){
            Collections.sort(listProductSort, new Comparator<ProductModel>() {
                @Override
                public int compare(ProductModel product1, ProductModel product2) {
                    return product1.getName().compareToIgnoreCase(product2.getName());
                }
            });
        } else if (sortType == 4){
            Collections.sort(listProductSort, Comparator.comparing(ProductModel::getName, Comparator.reverseOrder()));
        }else if (sortType == 5){
            Collections.sort(listProductSort, Comparator.comparing(ProductModel::getCreated_date));
        }else if (sortType == 6){
            Collections.sort(listProductSort, Comparator.comparing(ProductModel::getCreated_date, Comparator.reverseOrder()));
        }
        return listProductSort;
    }

    public static List<ProductModel> getSellerProduct() {
        return ProductDAO.newProduct();
    }

    public static List<ProductModel> getDifferentProduct() {
        return ProductDAO.getDifferentProduct();
    }


    public static ProductModel getDetailProduct(int idProduct) {
        return ProductDAO.getDetailProduct(idProduct);
    }

    public static InventoriesModel getInventores(int idProduct) {
        return ProductDAO.getInventoriesByID(idProduct);
    }



    public List<ProductModel> getListProductForBrand(String brandPram) {
        return ProductDAO.getlistProductForBrand(brandPram);
    }

    public static List<ProductModel> getListProductBySearch(String searchPram) {
        return ProductDAO.getListProductBySearch(searchPram);
    }

    public boolean addNewProduct(String name, String avatar, int idTypeProduct, int idStatusDevice, int idBrand, int price, int sumQuantity, String describe, int idStore, int idUser, int height,int length,int width,int weight,List<String> listFileNameImage) {
        return ProductDAO.addNewProduct(name, avatar, idTypeProduct, idStatusDevice, idBrand, price, sumQuantity, describe, idStore,idUser,height, length, width, weight,listFileNameImage);
    }

    public static boolean updateProductBasic(int id, String name, int brand, int id_status_device, int price, int id_type_product) {
        return ProductDAO.updateProductBasic(id, name, brand, id_status_device, price, id_type_product);
    }

    public static boolean updateProduct(int id, String name, String avatar, int id_type_product, int id_status_device, int id_brand, int price, String describe, int height,int length,int width,int weight,List<String> listFileNameImage) {
        return ProductDAO.updateProduct(id, name, avatar, id_type_product, id_status_device, id_brand, price, describe, height,length,width,weight, listFileNameImage);
    }

    public static boolean insertTypeProduct(String name) {
        return ProductDAO.insertTypeProduct(name);
    }

    public static boolean insertBrand(String name) {
        return ProductDAO.insertBrand(name);
    }

    public static boolean insertRateReview(int idProduct, int rate, int idUser, String content) {
        return ProductDAO.insertRateReview(idProduct, rate, idUser, content);
    }

    public static List<RateReviewModel> getListCommentByIdProduct(int idProduct) {
        return ProductDAO.getListCommentByIdProduct(idProduct);
    }public static List<Integer> getIncomeByYear(String year) {
        return ProductDAO.getIncomeByYear(year);
    }

}
