<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/5/2022
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1" width="500px">
    <tr>
        <th> Tên</th>
        <th> Ngày Sinh</th>
        <th> Địa chỉ</th>
        <th> Ảnh</th>
    </tr>
    <c:forEach items="${listCustomer}" var="customer" varStatus="kiendn">
        <tr>
            <td> ${customer.name} </td>
            <td>${customer.dayOfBirth}</td>
            <td>${customer.Address}</td>
            <td>${customer.path}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
