<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/5/2022
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>

</head>
<body>
<h1>Delete product</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Name:</td>
                <td>${requestScope["products"].getName()}</td>

            </tr>
            <tr>
                <td>Price :</td>
                <td>${requestScope["products"].getPrice()}</td>
            </tr>
            <tr>
                <td>Status:</td>
                <td>${requestScope["products"].getStatus()}</td>
            </tr>

            <tr>
                <td>Date Produce:</td>
                <td>${requestScope["products"].getDateProduce()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete products"></td>
                <td><a href="/customer">Back to products list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
