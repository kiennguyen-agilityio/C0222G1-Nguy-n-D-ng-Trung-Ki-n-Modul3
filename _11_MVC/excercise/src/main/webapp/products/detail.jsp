<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>detail product</title>
</head>
<body>
<label> Name : </label>
<p>
    <c:out value="${product.name}"></c:out><br>
</p>

<label> Status : </label>
<p>
    <c:out value="${product.status}"></c:out><br>
</p>

<label> Price : </label>
<p>
    <c:out value="${product.price}"></c:out><br>
</p>

<label> Date Produce : </label>
<p>
    <c:out value="${product.dateProduce}"></c:out><br>
</p>
</body>
</html>
