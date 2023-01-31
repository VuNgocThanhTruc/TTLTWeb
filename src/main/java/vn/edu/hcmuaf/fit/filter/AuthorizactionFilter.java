package vn.edu.hcmuaf.fit.filter;

import vn.edu.hcmuaf.fit.model.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


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

        if (url.startsWith("/WebProgramming_war_exploded/admin/")) {
            User user = (User) session.getAttribute("userlogin");
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
