<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Furama Resort | Customer Creation</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\style.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="container">
        <div class="row body-justify-center">
            <p class="font-weight-normal" style="font-size: 1.5rem; margin-top: 2rem; margin-bottom: 0">
                Edit Customer</p>
        </div>
        <div class="row body-justify-center">
            <div class="bg-light p-3 border-radius">
                <form action="/customer?action=edit" method="post">
                    <div class="form-group">
                        <label for="inputCustomerId">Customer Id</label>
                        <input type="text" name="id" class="form-control" id="inputCustomerId"
                               aria-describedby="emailHelp" value="${customer.id}" readonly = "readonly">
                    </div>
                    <div class="form-group">
                        <label for="inputCustomerType">Customer Type</label>
                        <select class="form-control" id="inputCustomerType" name="type">
                            <c:forEach items="${customerTypeList}" var="customerType">
                                <c:if test="${customer.typeId == customerType.customerTypeId}">
                                    <option selected value="${customer.typeId}">${customer.type}</option>
                                </c:if>
                                <c:if test="${customer.typeId != customerType.customerTypeId}">
                                    <option value="${customerType.customerTypeId}">${customerType.customerTypeName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputCustomerName">Customer Name</label>
                        <input type="text" name="name" class="form-control" id="inputCustomerName"
                               aria-describedby="emailHelp" value="${customer.name}" required>
                    </div>
                    <div class="form-group">
                        <label for="inputCustomerBirthday">Customer Birthday</label>
                        <input type="date" id="inputCustomerBirthday" name="birthday" value="${customer.birthDay}">
                    </div>
                    <div class="form-group">
                        <label for="inputCustomerGender">Customer Gender</label>
                        <select class="form-control" id="inputCustomerGender" name="gender">
                            <c:choose>
                                <c:when test="${customer.gender == 'Male'}">
                                    <option selected>Male</option>
                                    <option>Female</option>
                                </c:when>
                                <c:otherwise>
                                    <option>Male</option>
                                    <option selected>Female</option>
                                </c:otherwise>
                            </c:choose>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputCustomerIdCard">Customer ID Card</label>
                        <input type="text" name="idcard" class="form-control" id="inputCustomerIdCard"
                               aria-describedby="emailHelp" value="${customer.idCard}" required>
                    </div>
                    <div class="form-group">
                        <label for="inputCustomerPhone">Customer Phone</label>
                        <input type="text" name="phone" class="form-control" id="inputCustomerPhone"
                               aria-describedby="emailHelp" value="${customer.phone}" required>
                    </div>
                    <div class="form-group">
                        <label for="inputCustomerEmail">Customer Email</label>
                        <input type="text" name="email" class="form-control" id="inputCustomerEmail"
                               aria-describedby="emailHelp" value="${customer.email}" required>
                    </div>
                    <div class="form-group">
                        <label for="inputCustomerAddress">Customer Address</label>
                        <input type="text" name="address" class="form-control" id="inputCustomerAddress"
                               aria-describedby="emailHelp" value="${customer.address}" required>
                    </div>

                    <button type="submit" class="btn bg-frm-darkblue text-white">Submit</button>
                    <button type="reset" class="btn btn-secondary">Reset</button>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}\boostrap\js\bootstrap.min.js"></script>
</body>
</html>
