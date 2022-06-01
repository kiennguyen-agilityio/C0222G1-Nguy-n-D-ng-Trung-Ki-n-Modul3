<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/5/2022
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search</title>
</head>
<body>
<c:forEach items='${products}' var="product">
    <tr>
        <td><a href="/products?action=search=${product.getId()}">${product.getName()}</a></td>
        <td>${product.getPrice()}</td>
        <td>${product.getStatus()}</td>
        <td>${product.getDateProduce()}</td>
    </tr>
</c:forEach>
</body>
</html>
