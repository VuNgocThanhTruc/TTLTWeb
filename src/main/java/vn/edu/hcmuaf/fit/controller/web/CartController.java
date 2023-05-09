package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.model.ProductCartModel;
import vn.edu.hcmuaf.fit.model.ProductModel;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        HashMap<Integer, ProductCartModel> cart = (HashMap<Integer, ProductCartModel>) session.getAttribute("cart");
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("view/web/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int numCart = session.getAttribute("numCart") == null ? 0 : (int) session.getAttribute("numCart");
        String actionParam = request.getParameter("action");
        String view = "";
        if ("add-to-cart".equals(actionParam)) {
            doPostAddToCart(request, response);
            view = request.getContextPath() + "/cart";
        } else if (actionParam.equals("update-cart")) {
            doPostUpdateCart(request, response);
            view = request.getContextPath() + "/cart";
        } else {
            view = request.getContextPath() + "/list-product";
        }

        session.setAttribute("numCart", numCart++);
        List<ProductModel> listProduct = ProductService.getTop8();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("activeProduct", "active");
        request.getRequestDispatcher("/view/web/product.jsp").forward(request, response);

//        response.sendRedirect(request.getContextPath() + "/list-product");
    }

    private void doPostUpdateCart(HttpServletRequest request, HttpServletResponse response) {
        String typeUpdate = request.getParameter("btn_update");
        int id = Integer.parseInt(request.getParameter("id_item"));
        if (typeUpdate != null) {
            if (typeUpdate.equals("delete")) {
//            delete item in cart
                HttpSession session = request.getSession();
                HashMap<Integer, ProductCartModel> cart = (HashMap<Integer, ProductCartModel>) session.getAttribute("cart");

                cart.remove(id);
                session.setAttribute("cart", cart);

            } else if (typeUpdate.equals("update")) {
//            update quantity in cart
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                HttpSession session = request.getSession();
                HashMap<Integer, ProductCartModel> cart = (HashMap<Integer, ProductCartModel>) session.getAttribute("cart");
                ProductModel productModel = ProductService.getDetailProduct(id);
                ProductCartModel productCartModel;

                if (cart == null) {
                    cart = new HashMap<>();
                    productCartModel = new ProductCartModel(quantity, productModel);
                    cart.put(id, productCartModel);
                } else {
//            has item in cart
                    if (cart.containsKey(id)) {
                        if (quantity <= 0) {
                            cart.remove(id);
                        } else {
                            productCartModel = cart.get(id);
                            productCartModel.setQuantity(quantity);
                        }
                    } else {
                        //not has item in cart
                        productCartModel = new ProductCartModel(quantity, productModel);
                        cart.put(id, productCartModel);
                    }
                }
                session.setAttribute("cart", cart);

            }
        }
    }

    private void doPostAddToCart(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id_item"));
        ProductModel productModel = ProductService.getDetailProduct(id);
        ProductCartModel productCartModel;

        HttpSession session = request.getSession();
        HashMap<Integer, ProductCartModel> cart = (HashMap<Integer, ProductCartModel>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            productCartModel = new ProductCartModel(1, productModel);
            cart.put(id, productCartModel);
        } else {
//            has item in cart
            if (cart.containsKey(id)) {
                productCartModel = cart.get(id);
                productCartModel.increaseQuantity();
            } else {//not has item in cart
                productCartModel = new ProductCartModel(1, productModel);
                cart.put(id, productCartModel);
            }
        }
        session.setAttribute("cart", cart);
        for (Map.Entry<Integer, ProductCartModel> entry : cart.entrySet()) {
            System.out.println(entry.getValue().getProductModel().getName() + " quantity: " + entry.getValue().getQuantity());
        }
    }

}
