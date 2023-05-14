package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.ConnectToDatabase;
import vn.edu.hcmuaf.fit.db.DBConnect;
import vn.edu.hcmuaf.fit.model.*;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class ProductDAO {

    public static List<ProductModel> findAll() {
        LinkedList<ProductModel> list = new LinkedList<ProductModel>();

        String sql = "select p.id,name,id_type-product, id_status_device,id_brand,price, p.describe,l.url from products p";


        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ResultSet rs = ps.executeQuery(sql);
            while (rs.next()) {
                String sql2 = "select url from library_images l where id_product=" + rs.getInt(1);
                PreparedStatement ps2 = DBConnect.getInstall().preStatement(sql2);
                ResultSet rs2 = ps2.executeQuery(sql2);
                LinkedList<LibraryImageModel> listImage = new LinkedList<>();


                while (rs2.next()) {
                    listImage.add(new LibraryImageModel(rs2.getString(1)));
                }

                ProductModel productModel = new ProductModel();
                productModel.setId(rs.getInt("id"));
                productModel.setName(rs.getString("name"));
                productModel.setPrice(rs.getInt("price"));
                productModel.setIdBrand(rs.getInt("id_brand"));
                productModel.setIdTypeProduct(rs.getInt("id_type_product"));
                productModel.setIdStatusDevice(rs.getInt("id_status_device"));
                productModel.setDescribe(rs.getString("describe"));
                productModel.setListImage(listImage);

                list.add(productModel);
            }
            return list;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    public static List<ProductModel> getTop8() {
        LinkedList<ProductModel> list = new LinkedList<ProductModel>();

        String sql = "select p.id ,p.`name`,p.id_type_product,p.id_status_device,p.id_brand,p.price,p.avatar,p.`describe`,p.created_by,p.created_date,p.modified_date,p.modified_by,p.height, p.length, p.width, p.weight,d.date_start,d.date_end,d.percent_discount from products p LEFT JOIN  discounts d on p.id= d.id_product\n" +
                "UNION\n" +
                "select p.id ,p.`name`,p.id_type_product,p.id_status_device,p.id_brand,p.price,p.avatar,p.`describe`,p.created_by,p.created_date,p.modified_date,p.modified_by,p.height, p.length, p.width, p.weight,d.date_start,d.date_end,d.percent_discount from products p RIGHT JOIN   discounts d on p.id= d.id_product\n" +
                "\n" +
                "WHERE p.id_status_device =1 ORDER BY id desc LIMIT 0,8";

        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ResultSet rs = ps.executeQuery(sql);
            while (rs.next()) {
                String sql2 = "select url from library_images l where id_product=" + rs.getInt(1);
                PreparedStatement ps2 = DBConnect.getInstall().preStatement(sql2);
                ResultSet rs2 = ps2.executeQuery(sql2);
                LinkedList<LibraryImageModel> listImage = new LinkedList<>();


                while (rs2.next()) {
                    listImage.add(new LibraryImageModel(rs2.getString(1)));
                }
                ProductModel productModel = new ProductModel();
                productModel.setId(rs.getInt("id"));
                productModel.setName(rs.getString("name"));
                productModel.setPrice(rs.getInt("price"));
                productModel.setIdBrand(rs.getInt("id_brand"));
                productModel.setIdTypeProduct(rs.getInt("id_type_product"));
                productModel.setIdStatusDevice(rs.getInt("id_status_device"));
                productModel.setDescribe(rs.getString("describe"));
                productModel.setHeight(rs.getInt("height"));
                productModel.setLength(rs.getInt("length"));
                productModel.setWidth(rs.getInt("width"));
                productModel.setWeight(rs.getInt("weight"));
                productModel.setDateStart(rs.getString("date_start"));
                productModel.setDateEnd(rs.getString("date_end"));
                productModel.setPercentDiscount(rs.getInt("percent_discount"));
                productModel.setListImage(listImage);

                list.add(productModel);
            }
            return list;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    public static List<ProductModel> getNextListProduct(int amount) {
        LinkedList<ProductModel> list = new LinkedList<ProductModel>();

        String sql = "select p.id ,`name`,id_type_product,id_status_device,id_brand,price,avatar,`describe`,created_by,created_date,modified_date,modified_by from products p \n" +
                "WHERE p.id_status_device =1 ORDER BY id desc LIMIT ?,4";

        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setInt(1, amount);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String sql2 = "select url from library_images l where id_product=" + rs.getInt(1);
                PreparedStatement ps2 = DBConnect.getInstall().preStatement(sql2);
                ResultSet rs2 = ps2.executeQuery(sql2);
                LinkedList<LibraryImageModel> listImage = new LinkedList<>();


                while (rs2.next()) {
                    listImage.add(new LibraryImageModel(rs2.getString(1)));
                }
                ProductModel productModel = new ProductModel();
                productModel.setId(rs.getInt("id"));
                productModel.setName(rs.getString("name"));
                productModel.setPrice(rs.getInt("price"));
                productModel.setIdBrand(rs.getInt("id_brand"));
                productModel.setIdTypeProduct(rs.getInt("id_type_product"));
                productModel.setIdStatusDevice(rs.getInt("id_status_device"));
                productModel.setDescribe(rs.getString("describe"));
                productModel.setListImage(listImage);

                list.add(productModel);
            }
            return list;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    public static List<ProductModel> newProduct() {
        LinkedList<ProductModel> list = new LinkedList<ProductModel>();

        String sql = "select * from products order by id desc limit 7";
        Statement statement = DBConnect.getInstall().get();
        if (statement != null) {
            ResultSet rs = null;
            try {
                rs = statement.executeQuery(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                while (rs.next()) {
                    String sql2 = "select url from library_images l where id_product=" + rs.getInt(1);
                    PreparedStatement ps2 = DBConnect.getInstall().preStatement(sql2);
                    ResultSet rs2 = ps2.executeQuery(sql2);
                    LinkedList<LibraryImageModel> listImage = new LinkedList<>();


                    while (rs2.next()) {
                        System.out.println(rs2.getString(1));
                        listImage.add(new LibraryImageModel(rs2.getString(1)));
                    }
                    ProductModel productModel = new ProductModel();
                    productModel.setId(rs.getInt("id"));
                    productModel.setName(rs.getString("name"));
                    productModel.setPrice(rs.getInt("price"));
                    productModel.setIdBrand(rs.getInt("id_brand"));
                    productModel.setIdTypeProduct(rs.getInt("id_type_product"));
                    productModel.setIdStatusDevice(rs.getInt("id_status_device"));
                    productModel.setDescribe(rs.getString("describe"));
                    productModel.setListImage(listImage);

                    list.add(productModel);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return list;
        } else {
            System.out.println("Không có kết nối");
        }
        return null;
    }

    public static void deleteProduct(int id) {
        String sql = "delete from products where id = ? ";
        Connection connection = new ConnectToDatabase().getConnect();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void deleteAllProduct(int id) {
        String sql = "delete from products ";

        Connection connection = new ConnectToDatabase().getConnect();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public static ProductModel getDetailProduct(int idProduct) {

        String sql = "select * from products " + "where id= ?";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setInt(1, idProduct);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String sql2 = "select url from library_images l where id_product=" + rs.getInt(1);
                PreparedStatement ps2 = DBConnect.getInstall().preStatement(sql2);
                ResultSet rs2 = ps2.executeQuery(sql2);
                LinkedList<LibraryImageModel> listImage = new LinkedList<>();


                while (rs2.next()) {
                    listImage.add(new LibraryImageModel(rs2.getString(1)));
                }
                ProductModel productModel = new ProductModel();
                productModel.setId(rs.getInt("id"));
                productModel.setName(rs.getString("name"));
                productModel.setPrice(rs.getInt("price"));
                productModel.setIdBrand(rs.getInt("id_brand"));
                productModel.setIdTypeProduct(rs.getInt("id_type_product"));
                productModel.setIdStatusDevice(rs.getInt("id_status_device"));
                productModel.setDescribe(rs.getString("describe"));
                productModel.setHeight(rs.getInt("height"));
                productModel.setLength(rs.getInt("length"));
                productModel.setWidth(rs.getInt("width"));
                productModel.setWeight(rs.getInt("weight"));
                productModel.setListImage(listImage);

                return productModel;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }


    public static List<CategoryModel> getListBrand() {
        LinkedList<CategoryModel> list = new LinkedList<>();

        String sql = "select id, name from brands";

        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CategoryModel(rs.getInt(1), rs.getString(2)));
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<ProductModel> getlistProductForBrand(String brandPram) {
        LinkedList<ProductModel> list = new LinkedList<>();

        String sql = "select * from products " + "join brands on brands.id = products.id_brand " + "where brands.name=?";

        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, brandPram);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String sql2 = "select url from library_images l where id_product=" + rs.getInt(1);
                PreparedStatement ps2 = DBConnect.getInstall().preStatement(sql2);
                ResultSet rs2 = ps2.executeQuery(sql2);
                LinkedList<LibraryImageModel> listImage = new LinkedList<>();


                while (rs2.next()) {
                    listImage.add(new LibraryImageModel(rs2.getString(1)));
                }

                ProductModel productModel = new ProductModel();
                productModel.setId(rs.getInt("id"));
                productModel.setName(rs.getString("name"));
                productModel.setPrice(rs.getInt("price"));
                productModel.setIdBrand(rs.getInt("id_brand"));
                productModel.setIdTypeProduct(rs.getInt("id_type_product"));
                productModel.setIdStatusDevice(rs.getInt("id_status_device"));
                productModel.setDescribe(rs.getString("describe"));
                productModel.setListImage(listImage);

                list.add(productModel);
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<ProductModel> getListProductBySearch(String searchPram) {
        LinkedList<ProductModel> list = new LinkedList<>();

        String sql = "SELECT * FROM products " + "WHERE name like ? " + "order by id desc ";
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, "%" + searchPram + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String sql2 = "select url from library_images l where id_product=" + rs.getInt(1);
                PreparedStatement ps2 = DBConnect.getInstall().preStatement(sql2);
                ResultSet rs2 = ps2.executeQuery(sql2);
                LinkedList<LibraryImageModel> listImage = new LinkedList<>();


                while (rs2.next()) {
                    listImage.add(new LibraryImageModel(rs2.getString(1)));
                }
                ProductModel productModel = new ProductModel();
                productModel.setId(rs.getInt("id"));
                productModel.setName(rs.getString("name"));
                productModel.setPrice(rs.getInt("price"));
                productModel.setIdBrand(rs.getInt("id_brand"));
                productModel.setIdTypeProduct(rs.getInt("id_type_product"));
                productModel.setIdStatusDevice(rs.getInt("id_status_device"));
                productModel.setDescribe(rs.getString("describe"));
                productModel.setHeight(rs.getInt("height"));
                productModel.setLength(rs.getInt("length"));
                productModel.setWidth(rs.getInt("width"));
                productModel.setWeight(rs.getInt("weight"));
                productModel.setListImage(listImage);

                list.add(productModel);
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
//    INSERT INTO `products` (`id`, `name`, `avatar`, `id_type_product`, `id_status_device`, `id_brand`, `price`, `sum_quantity`, `describe`, `id_store`)
//    VALUES (NULL, 'Test2', 'thay-cam-ung-asus-zenfone-max-plus-m1-zb570tl_1667468452.png\r\n', '3', '1', '5', '350000', '44', '', '2');

    public static boolean addNewProduct(String name, String avatar, int id_type_product, int id_status_device, int id_brand, int price, int sum_quantity, String describe, int id_store) {
        String sql = "INSERT INTO products (`id`, `name`, `avatar`, `id_type_product`, `id_status_device`, `id_brand`, `price`, `sum_quantity`, `describe`, `id_store`, `created_by`) " + "VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, name);
            ps.setString(2, avatar);
            ps.setInt(3, id_type_product);
            ps.setInt(4, id_status_device);
            ps.setInt(5, id_brand);
            ps.setInt(6, price);
            ps.setInt(7, sum_quantity);
            ps.setString(8, describe);
            ps.setInt(9, id_store);
            ps.setInt(10, 1);//set id user

            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean updateProductBasic(int id, String name, int sumQuantity, int id_status_device, int price, int id_type_product) {
//        UPDATE products SET name = 'Test' WHERE products.id = ;
        String sql = "UPDATE PRODUCTS SET NAME=?, sum_quantity=?, id_status_device=?,price=?, id_type_product=? WHERE PRODUCTS.ID=?";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, sumQuantity);
            ps.setInt(3, id_status_device);
            ps.setInt(4, price);
            ps.setInt(5, id_type_product);
            ps.setInt(6, id);

            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean updateProduct(int id, String name, String avatar, int id_type_product, int id_status_device, int id_brand, int price, int sum_quantity, String describe, int id_store) {
        System.out.println(avatar);
        String sql = "UPDATE PRODUCTS SET NAME=?, avatar=?,id_type_product=?,  id_status_device=?,id_brand=?,price=?, sum_quantity=?,`describe`=?,id_store=? WHERE ID=?";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, name);
            ps.setString(2, avatar);
            ps.setInt(3, id_type_product);
            ps.setInt(4, id_status_device);
            ps.setInt(5, id_brand);
            ps.setInt(6, price);
            ps.setInt(7, sum_quantity);
            ps.setString(8, describe);
            ps.setInt(9, id_store);
            ps.setInt(10, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<ProductModel> getDifferentProduct() {
        LinkedList<ProductModel> list = new LinkedList<ProductModel>();

        String sql = "select * from products " + "ORDER BY RAND() " + "limit 4 ";

        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ResultSet rs = ps.executeQuery(sql);
            while (rs.next()) {
                String sql2 = "select url from library_images l where id_product=" + rs.getInt(1);
                PreparedStatement ps2 = DBConnect.getInstall().preStatement(sql2);
                ResultSet rs2 = ps2.executeQuery(sql2);
                LinkedList<LibraryImageModel> listImage = new LinkedList<>();


                while (rs2.next()) {
                    listImage.add(new LibraryImageModel(rs2.getString(1)));
                }
                ProductModel productModel = new ProductModel();
                productModel.setId(rs.getInt("id"));
                productModel.setName(rs.getString("name"));
                productModel.setPrice(rs.getInt("price"));
                productModel.setIdBrand(rs.getInt("id_brand"));
                productModel.setIdTypeProduct(rs.getInt("id_type_product"));
                productModel.setIdStatusDevice(rs.getInt("id_status_device"));
                productModel.setDescribe(rs.getString("describe"));
                productModel.setHeight(rs.getInt("height"));
                productModel.setLength(rs.getInt("length"));
                productModel.setWidth(rs.getInt("width"));
                productModel.setWeight(rs.getInt("weight"));
                productModel.setListImage(listImage);

                list.add(productModel);
            }
            return list;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    public static boolean insertBrand(String name) {
        LinkedList<ProductModel> list = new LinkedList<ProductModel>();

        String sql = "Insert into brands values (null,?)";

        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, name);
            ps.executeUpdate();
            return true;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    public static boolean insertTypeProduct(String name) {
        LinkedList<ProductModel> list = new LinkedList<ProductModel>();

        String sql = "Insert into type_products values (null,?)";

        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setString(1, name);
            ps.executeUpdate();
            return true;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    public static List<RateReviewModel> getListCommentByIdProduct(int idProduct) {
        LinkedList<RateReviewModel> list = new LinkedList<>();

        String sql = "select u.avatar avatar, u.name name, r.rate rate, c.content content, c.create_at createAt from " +
                "rate_products r join users u on r.id_user=u.id " +
                "join comments c on c.id_rate_product=r.id " +
                "where r.id_product=" + idProduct +
                " order by r.id desc";

        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
//            ps.setInt(1,idProduct);
            ResultSet rs = ps.executeQuery(sql);
            while (rs.next()) {

                UserModel user = new UserModel();
                user.setAvatar(rs.getString("avatar"));
                user.setName(rs.getString("name"));

                CommentModel comment = new CommentModel();
                comment.setContent(rs.getString("content"));
                comment.setCreateAt(rs.getTimestamp("createAt"));

                RateReviewModel rateReviewModel = new RateReviewModel();
                rateReviewModel.setRate(rs.getInt("rate"));
                rateReviewModel.setUser(user);
                rateReviewModel.setIdProduct(idProduct);
                rateReviewModel.setCommentModel(comment);

                list.add(rateReviewModel);
            }
            return list;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    //    rate & review product
    public static boolean insertRateReview(int idProduct, int rate, int idUser, String content) {
        String sql = "Insert into rate_products(`id_product`,`rate`,`id_user`) " + "values (?,?,?)";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ps.setInt(1, idProduct);
            ps.setInt(2, rate);
            ps.setInt(3, idUser);
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            int lastInsertId = 0;
            if (rs.next()) {
                lastInsertId = rs.getInt(1);
            }

            sql = "Insert into comments(`id_rate_product`,`content`,`create_by`) " + "values (?,?,?)";

            ps = DBConnect.getInstall().preStatement(sql);
            ps.setInt(1, lastInsertId);
            ps.setString(2, content);
            ps.setInt(3, idUser);
            ps.executeUpdate();

            return true;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
    // Lấy tồn kho
    public static InventoriesModel getInventoriesByID(int id) {

        InventoriesModel inventories =new InventoriesModel();

        String sql = "select id_product,quantity,modified_date,modified_by from inventories " +
                "where id_product="+id;
        try {

            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idProduct = Integer.parseInt(rs.getString(1));
                int quantity = Integer.parseInt(rs.getString(2));
                String modifiedDate = rs.getString(3);
                String modifiedBy = rs.getString(4);
                inventories = new InventoriesModel( idProduct,  quantity, modifiedDate,  modifiedBy);
            }
            return inventories;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
//    // Lấy giảm giá
//    public static DiscountModel getDicount(int id) {
//
//        DiscountModel discounts =new DiscountModel();
//
//        String sql = "select id,id_type_product,id_product,date_start,date_end,percent_discount from discounts " +
//                "where id_product="+id;
//        try {
//
//            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
//
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                int idDiscount = Integer.parseInt(rs.getString(1));
//                int idTypeProduct = Integer.parseInt(rs.getString(2));
//                int idProduct = Integer.parseInt(rs.getString(3));
//                String dateStart= rs.getString(4);
//                String dateEnd= rs.getString(5);
//                int percentDiscount = Integer.parseInt(rs.getString(6));
//                discounts = new DiscountModel( idDiscount,idTypeProduct,idProduct,dateStart,dateEnd,percentDiscount);
//            }
//            return discounts;
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//    }


    public static void main(String[] args) {
//        System.out.println(ProductDAO.getDifferentProduct());
        System.out.println(ProductDAO.getTop8());
//        System.out.println(ProductDAO.updateProduct(2, "Thay cụm đuôi sạc Samsung Galaxy A02 A022F","thay-cum-duoi-sac-samsung-galaxy-a02-a022f_1667623123.png",4,1,1,  500000,100,"test", 1));
    }
}
