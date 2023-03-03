package vn.edu.hcmuaf.fit.filter;

import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthorizactionFilter implements Filter {
    private ServletContext context;


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();
        HttpSession session = request.getSession();

        if(request.getServletContext().getAttribute("listBrand") == null){
            request.getServletContext().setAttribute("listBrand", ProductService.getListBrand());
        }

        if (url.contains("admin")) {
            UserModel user = (UserModel) session.getAttribute("userlogin");
            if (user != null) {
                if (user.getId_type_user() == 2) {
                    filterChain.doFilter(servletRequest, servletResponse);
                } else {
                    response.sendRedirect(request.getContextPath() + "/signin");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/signin");
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }


    @Override
    public void destroy() {

    }
}
