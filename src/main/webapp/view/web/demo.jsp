<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>index</title>
</head>
<body>
<h1>Index</h1>
<%--<%--%>
<%--    String idFB = request.getAttribute("id-fb").toString();--%>
<%--    String nameFB = request.getAttribute("name-fb").toString();--%>
<%--    out.print("Id fb: " + idFB);--%>
<%--    out.print("<br/>Name fb: " + nameFB);--%>

<%--%>--%>

<%
    String idGG = request.getAttribute("id-gg").toString();
    String nameGG = request.getAttribute("name-gg").toString();
    String emailGG = request.getAttribute("email-gg").toString();
    String avatarGG = request.getAttribute("avatar-gg").toString();
    out.print("<br/>id gg: " + idGG);
    out.print("<br/>Name gg: " + nameGG);
    out.print("<br/>email gg: " + emailGG);
    out.print("<br/>avatar gg: " + avatarGG);
%>
</body>
</html>