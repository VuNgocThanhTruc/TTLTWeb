package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.model.ProductModel;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "SortProductController", value = "/sort-product")
public class SortProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sortType = Integer.parseInt(request.getParameter("sortType"));
        String nameBrand = request.getParameter("nameBrand");
        List<ProductModel> listProduct = ProductService.getListProductSortBy(sortType, nameBrand);
        System.out.println("Sắp xếp :" + sortType + ", " + nameBrand);
        System.out.println("listProduct: "+listProduct);
        PrintWriter out = response.getWriter();
        DecimalFormat decimalFormat = new DecimalFormat("#,###");
        for (ProductModel p : listProduct) {
            String priceDiscountConvert = decimalFormat.format(p.getPriceDiscount());
            String priceConvert = decimalFormat.format(p.getPrice());
            if (p.getDateStart() != null || p.getDateEnd() != null) {
                Date serverTime = new Date();
                Timestamp timestamp = new Timestamp(serverTime.getTime());
                Timestamp dateStart = Timestamp.valueOf(p.getDateStart());
                Timestamp dateEnd = Timestamp.valueOf(p.getDateEnd());
                if (dateEnd.getTime() > timestamp.getTime() && dateStart.getTime() < timestamp.getTime())  {
                    out.println(
                            "<div class=\"product col-md-3 col-sm-6 col-xs-6 col-6 mb-5\">\n" +
                                    "                    <div class=\"block-banner-category\">\n" +
                                    "                        <div class=\"product-img fade-box\">\n" +
                                    "                            <a href=\"detail-product?id-product="+p.getId()+"\" title=\"\" class=\"img-resize\">\n" +
                                    "                                <img src=\"images/product/"+p.getAvatar()+"\"" +
                                    "                                     alt=\"\" class=\"lazyloaded\">\n" +
                                    "                            </a>\n" +
                                    "                        </div>\n" +
                                    "                        <div class=\"product-detail clearfix\">\n" +
                                    "\n" +
                                    "                            <button class=\"btn\" onclick=\"addToCartAJAX("+p.getId()+")\"><i\n" +
                                    "                                    class=\"icon-header fas fa-shopping-cart\"></i>\n" +
                                    "                            </button>\n" +
                                    "\n" +
                                    "                            <div class=\"pro-text\">\n" +
                                    "                                <a style=\" color: black;font-size: 20px;text-decoration: none;font-weight: bold; \"\n" +
                                    "                                   href=\"detail-product?id-product="+p.getId()+"\"" +
                                    "                                   title=\"\" inspiration pack>\n" +
                                    "                                    "+p.getName()+"" +
                                    "                                </a>\n" +
                                    "                            </div>\n" + " <div class=\"product-price\" style=\" text-align: center;\">\n" +
                                    "                                    <span class=\"pro-price\">"+priceDiscountConvert+"₫</span>\n" +
                                    "                                    <span class=\"\"\n" +
                                    "                                          style=\"text-decoration: line-through;\">"+priceConvert+"₫</span>\n" +
                                    "\n" +
                                    "                                    <span class=\"pro-sale\"\n" +
                                    "                                          style=\"background-color: #ff6600;color: white;border: dashed;border-radius: 8px; \"> -"+priceDiscountConvert+"</span>\n" +
                                    "\n" +
                                    "                                </div>" +
                                    "                        </div>\n" +
                                    "                    </div>\n" +
                                    "                </div>"


                    );
                }else{
                    out.println(
                            "<div class=\"product col-md-3 col-sm-6 col-xs-6 col-6 mb-5\">\n" +
                                    "                    <div class=\"block-banner-category\">\n" +
                                    "                        <div class=\"product-img fade-box\">\n" +
                                    "                            <a href=\"detail-product?id-product="+p.getId()+"\" title=\"\" class=\"img-resize\">\n" +
                                    "                                <img src=\"images/product/"+p.getAvatar()+"\"" +
                                    "                                     alt=\"\" class=\"lazyloaded\">\n" +
                                    "                            </a>\n" +
                                    "                        </div>\n" +
                                    "                        <div class=\"product-detail clearfix\">\n" +
                                    "\n" +
                                    "                            <button class=\"btn\" onclick=\"addToCartAJAX("+p.getId()+")\"><i\n" +
                                    "                                    class=\"icon-header fas fa-shopping-cart\"></i>\n" +
                                    "                            </button>\n" +
                                    "\n" +
                                    "                            <div class=\"pro-text\">\n" +
                                    "                                <a style=\" color: black;font-size: 20px;text-decoration: none;font-weight: bold; \"\n" +
                                    "                                   href=\"detail-product?id-product="+p.getId()+"\"" +
                                    "                                   title=\"\" inspiration pack>\n" +
                                    "                                    "+p.getName()+"" +
                                    "                                </a>\n" +
                                    "                            </div>\n" +
                                    "                                <div class=\"product-price\" style=\" text-align: center;\">\n" +
                                    "                                    <span class=\"pro-price\">"+priceConvert+"₫</span>\n" +
                                    "                                </div>" +
                                    "                        </div>\n" +
                                    "                    </div>\n" +
                                    "                </div>"

                    );
                }
            }else{
                out.println(
                        "<div class=\"product col-md-3 col-sm-6 col-xs-6 col-6 mb-5\">\n" +
                                "                    <div class=\"block-banner-category\">\n" +
                                "                        <div class=\"product-img fade-box\">\n" +
                                "                            <a href=\"detail-product?id-product="+p.getId()+"\" title=\"\" class=\"img-resize\">\n" +
                                "                                <img src=\"images/product/"+p.getAvatar()+"\"" +
                                "                                     alt=\"\" class=\"lazyloaded\">\n" +
                                "                            </a>\n" +
                                "                        </div>\n" +
                                "                        <div class=\"product-detail clearfix\">\n" +
                                "\n" +
                                "                            <button class=\"btn\" onclick=\"addToCartAJAX("+p.getId()+")\"><i\n" +
                                "                                    class=\"icon-header fas fa-shopping-cart\"></i>\n" +
                                "                            </button>\n" +
                                "\n" +
                                "                            <div class=\"pro-text\">\n" +
                                "                                <a style=\" color: black;font-size: 20px;text-decoration: none;font-weight: bold; \"\n" +
                                "                                   href=\"detail-product?id-product="+p.getId()+"\"" +
                                "                                   title=\"\" inspiration pack>\n" +
                                "                                    "+p.getName()+"" +
                                "                                </a>\n" +
                                "                            </div>\n" + "<div class=\"product-price\" style=\" text-align: center;\">\n" +
                                "                                    <span class=\"pro-price\">"+priceConvert+"₫</span>\n" +
                                "                                </div>"+
                                "                        </div>\n" +
                                "                    </div>\n" +
                                "                </div>"
                );
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
