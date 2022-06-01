<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/5/2022
  Time: 3:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/products?action=create">Create new product</a>
</p>
<form action="/products?action=search" method="get">
    <input type="text" name="name">
    <input type="submit" value="search">
</form>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Status</td>
        <td>Date Produce</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${products}' var="product">
    <tr>
        <td><a href="/products?action=details&id=${product.getId()}">${product.getName()}</a></td>
        <td>${product.getPrice()}</td>
        <td>${product.getStatus()}</td>
        <td>${product.getDateProduce()}</td>
        <td><a href="/products?action=edit&id=${product.getId()}">edit</a></td>
        <td><a href="/products?action=delete&id=${product.getId()}">delete</a></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
