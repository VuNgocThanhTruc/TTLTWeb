package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.model.ProductModel;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "LoadDataAJAX", value = "/LoadDataAJAX")
public class LoadDataAJAX extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int amountNextParam = Integer.parseInt(request.getParameter("amountNext"));
        List<ProductModel> listProduct = ProductService.getNextListProduct(amountNextParam);
        PrintWriter out = response.getWriter();

        for (ProductModel p : listProduct) {
            out.println(
                    "                <div class=\"product col-md-3 col-sm-6 col-xs-6 col-6 mb-5\">\n" +
                            "                    <div class=\"block-banner-category\">\n" +
                            "                        <div class=\"product-img fade-box\">\n" +
                            "                            <a href=\"detail-product?id-product=" + p.getId() + "\" title=\"\" class=\"img-resize\">\n" +
                            "                                <img src=\"images/product/" + p.getAvatar() + "\" alt=\"\" class=\"lazyloaded\">\n" +
                            "                            </a>\n" +
                            "                        </div>\n" +
                            "                        <div class=\"product-detail clearfix\">\n" +
                            "                            <form class=\"mini-cart\" action=\"" + request.getContextPath() + "/cart?action=add-to-cart\"\n" +
                            "                                  method=\"post\">\n" +
                            "                                <fieldset>\n" +
                            "                                    <input type=\"hidden\" name=\"cmd\" value=\"_cart\">\n" +
                            "                                    <input type=\"hidden\" name=\"add\" value=\"1\">\n" +
                            "                                    <input type=\"hidden\" name=\"business\" value=\"\">\n" +
//                            "                                    <input type=\"hidden\" name=\"image\" value=\"" + p.getAvatar() + "\">\n" +
                            "                                    <input type=\"hidden\" name=\"item_name\" value=\"" + p.getName() + "\">\n" +
                            "                                    <input type=\"hidden\" name=\"amount\" value=" + p.getPrice() + ">\n" +
                            "                                    <input type=\"hidden\" name=\"discount_amount\" value=\"10000\">\n" +
                            "                                    <input type=\"hidden\" name=\"currency_code\" value=\"VND\">\n" +
                            "                                    <input type=\"hidden\" name=\"id_item\" value=" + p.getId() + ">\n" +
                            "                                    <input type=\"hidden\" name=\"return\" value=\" \">\n" +
                            "                                    <input type=\"hidden\" name=\"cancel_return\" value=\" \">\n" +
                            "                                    <button class=\"btn btn-cart\" type=\"submit\"><i\n" +
                            "                                            class=\"icon-header fas fa-shopping-cart\"\n" +
                            "                                            aria-hidden=\"true\" onclick=\"addBtnCart()\"></i>\n" +
                            "                                    </button>\n" +
                            "                                </fieldset>\n" +
                            "                            </form>\n" +
                            "\n" +
                            "                            <div class=\"pro-text\">\n" +
                            "                                <a style=\" color: black;\n" +
                            "                                                    font-size: 14px;text-decoration: none;\"\n" +
                            "                                   href=\"detail-product?id-product=" + p.getId() +
                            "                                   title=\"\" inspiration pack>\n" + p.getName() +
                            "                                </a>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"pro-price\">\n" +
                            "                                <p>\n" + p.getPrice() +
                            "                                </p>\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                </div>\n" +
                            "                ");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
