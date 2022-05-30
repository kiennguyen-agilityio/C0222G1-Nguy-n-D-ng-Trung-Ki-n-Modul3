<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/5/2022
  Time: 4:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title> Update Product</title>
</head>
<body>
<h1> Update customer</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to product list</a>
</p>
<form  method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td> ID: </td>
                <td><input type="text" name="id" id="id" value="${requestScope["products"].getId()}"></td>
            </tr>
            <tr>
                <td> Name: </td>
                <td><input type="text" name="name" id="name" value="${requestScope["products"].getName()}"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="price" id="price" value="${requestScope["products"].getPrice()}"></td>
            </tr>
            <tr>
                <td>Status: </td>
                <td><input type="text" name="status" id="status" value="${requestScope["products"].getStatus()}"></td>
            </tr>
            <tr>
                <td>Date Produce: </td>
                <td><input type="text" name="dateProduce" id="dateProduce" value="${requestScope["products"].getDateProduce()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update products"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
