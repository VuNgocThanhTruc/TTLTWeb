<%--
  Created by IntelliJ IDEA.
  User: vutru
  Date: 12/8/2022
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.model.User" %>
<%@ page import="vn.edu.hcmuaf.fit.service.AuthoritiesService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.ComponentModel" %>
<%@ page import="vn.edu.hcmuaf.fit.model.FunctionModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.fit.model.RoleModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en"><head>
</head>
<body>
<%
    AuthoritiesService auth = new AuthoritiesService();
    User user = (User) session.getAttribute("userlogin");
    ArrayList<ComponentModel> components = (ArrayList<ComponentModel>) auth.getAllComponent();
    ArrayList<FunctionModel> functions =(ArrayList<FunctionModel>) auth.getAllFunction();
    String idRole = user.getIdRole();
    RoleModel role = auth.getRoleById(idRole);
%>
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="images/admin.png" width="50px" alt="User Image">
        <div>
            <p class="app-sidebar__user-name">
                <b>
                    <%=user !=null ? user.getName() : "Guest"%>
                </b>
            </p>
            <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
        </div>
    </div>
    <hr>
    <ul class="app-menu">
        <li><a class="app-menu__item active " href="index"><i class='app-menu__icon bx bx-tachometer'></i><span
                class="app-menu__label">Bảng điều khiển</span></a></li>

        <% for(ComponentModel component : components) { %>
                <%
                    String idComponent = component.getId();
                    Boolean isGrant = auth.getDecentralizeFuncOfRole(idRole, idComponent, "1");
                %>
                <% if(isGrant == true) {%>
                    <li><a class="app-menu__item" href="<%=component.getHref()%>"><i class='<%=component.getIcon()%>'></i><span
                         class="app-menu__label"><%=component.getName()%></span></a></li>
                <%}%>
        <%}%>
    </ul>
</aside>
</body>
</html>