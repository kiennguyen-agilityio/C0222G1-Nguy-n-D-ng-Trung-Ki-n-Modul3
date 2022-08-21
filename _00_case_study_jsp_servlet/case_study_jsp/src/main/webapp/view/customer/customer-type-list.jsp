<%--
  Created by IntelliJ IDEA.
  User: kayli
  Date: 02/06/2022
  Time: 9:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Furama Resort | Customer Type</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\style.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="container">
        <div class="row body-justify-center">
            <p class="font-weight-normal" style="font-size: 1.5rem; margin-top: 2rem; margin-bottom: 2rem">
                Customer Type</p>
        </div>
        <div class="row body-justify-center">
            <div class="bg-light p-3 border-radius">
                <table class="table">
                    <tr class="bg-frm-darkblue">
                        <th scope="col" class="text-white">Customer Type ID</th>
                        <th scope="col" class="text-white">Customer Type Name</th>
                    </tr>
                    <c:forEach items="${customerTypeList}" var="customerType" varStatus="status">
                        <tr>
                            <td>${customerType.customerTypeId}</td>
                            <td>${customerType.customerTypeName}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}\boostrap\js\bootstrap.min.js"></script>
</html>
