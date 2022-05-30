<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/5/2022
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add Product</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Add new products</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="products">Back to products list</a>
</p>
<form action="products?action=create" method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="price" id="price"></td>
            </tr>
            <tr>
                <td>Status: </td>
                <td><input type="text" name="status" id="status"></td>
            </tr>
            <tr>
                <td>Date Produce: </td>
                <td><input type="text" name="dateProduce" id="dateProduce"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create product "></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
