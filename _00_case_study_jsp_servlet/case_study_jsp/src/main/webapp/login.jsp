<%--
  Created by IntelliJ IDEA.
  User: kayli
  Date: 01/06/2022
  Time: 9:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Furama Resort | Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\style.css">
</head>
<body>
<jsp:include page="view/header.jsp"></jsp:include>
<div class="container">
    <div class="row" style="justify-content: center">
        <c:if test="${mess != null}">
            <p>${mess}</p>
        </c:if>
    </div>
    <div class="row" style="justify-content: center">
        <form action="/login?action=login" method="post" style="background-color: whitesmoke; padding: 1.5rem; border-radius: 0.5rem">
            <div class="form-group">
                <label for="inputUserName">User Name</label>
                <input type="text" name="username" value="${name}" class="form-control" id="inputUserName" aria-describedby="emailHelp" placeholder="Enter username">
                <small id="userHelp" class="form-text text-muted">We'll never share your information with anyone else.</small>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password"  name="password" value="${pass}" class="form-control" id="exampleInputPassword1" placeholder="Password">
            </div>
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1" name="rememberMe" value="true">
                <label class="form-check-label" for="exampleCheck1">Check me out</label>
            </div>
            <button type="submit" class="btn bg-frm-darkblue text-white">Submit</button>
        </form>
    </div>
</div>
<jsp:include page="view/footer.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}\boostrap\js\bootstrap.min.js"></script>
</body>
</html>
