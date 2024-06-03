<%--
  Created by IntelliJ IDEA.
  User: Hùng's Dell
  Date: 03/06/2024
  Time: 12:48 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <title>
        <tiles:insertAttribute name="title"/>
    </title>
</head>
<body>
    <tiles:insertAttribute name="header"/>
    <section class="container">
        <tiles:insertAttribute name="content"/>
    </section>
    <tiles:insertAttribute name="footer"/>
</body>
</html>
