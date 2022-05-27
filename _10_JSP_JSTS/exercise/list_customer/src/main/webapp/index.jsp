<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/5/2022
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>$Title$</title>
</head>
<body>
<table width="500px" border="1" >
    <caption style="caption-side:top"><h1>Danh sách khách hàng</h1></caption>
    <tr>
        <th> Tên</th>
        <th> Ngày Sinh</th>
        <th> Địa chỉ</th>
        <th> Ảnh</th>
    </tr>
    <c:forEach items="${listCustomer}" var="customer" varStatus="kiendn">
        <tr>
            <td> ${customer.name} </td>
            <td> ${customer.dateOfBirth} </td>
            <td> ${customer.address} </td>
            <td style="width: 100px"><img style="width: 100%" src="${customer.path}"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
