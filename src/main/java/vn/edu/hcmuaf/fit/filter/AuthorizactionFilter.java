package vn.edu.hcmuaf.fit.filter;

import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.service.AuthoritiesService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.management.relation.Role;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Set;

@WebFilter("/*")
public class AuthorizactionFilter implements Filter {
    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding("UTF-8");
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();
        HttpSession session = request.getSession();

        if(request.getServletContext().getAttribute("listBrand") == null){
            request.getServletContext().setAttribute("listBrand", ProductService.getListBrand());
        }

        // kiem tra quyen truy cap admin
        if (url.contains("admin")) {
            UserModel user = (UserModel) session.getAttribute("userlogin");
            if (user != null) {
                if (user.getId_type_user() == 2) {
                    //kiem tra co yeu cau relogin
                    Boolean isRelogin = false;
                    Boolean requiredLogin = (Boolean) context.getAttribute("requiredLogin");
                    if(requiredLogin != null && requiredLogin){
                        String idRoleEdit = (String) context.getAttribute("idRoleEdit");
                        Set<UserModel> listUserNeedRelogin =(Set<UserModel>) context.getAttribute("listUserNeedRelogin");
                        for (UserModel userNeedRelogin : listUserNeedRelogin) {
                            if(userNeedRelogin.getId().equals(user.getId())){
                                isRelogin = true;
                                break;
                            }
                        }
                        if(isRelogin){
                            session.invalidate();
                            response.sendRedirect(request.getContextPath() + "/view/common/error-relogin.jsp");
                        }else{
                            filterChain.doFilter(servletRequest, servletResponse);
                        }
                    }else{
                        filterChain.doFilter(servletRequest, servletResponse);
                    }
                } else {
                    String urlCurrent = request.getRequestURL().toString();
                    String queryString = request.getQueryString();
                    if (queryString != null) {
                        urlCurrent += "?" + queryString + "&back=true";
                    }
                    session.setAttribute("URL-current", urlCurrent);
                    response.sendRedirect(request.getContextPath() + "/signin");
                }
            } else {
                String urlCurrent = request.getRequestURL().toString();
                String queryString = request.getQueryString();
                if (queryString != null && !queryString.contains("back=true")) {
                    urlCurrent += "?" + queryString + "&back=true";
                }
                session.setAttribute("URL-current", urlCurrent);
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
