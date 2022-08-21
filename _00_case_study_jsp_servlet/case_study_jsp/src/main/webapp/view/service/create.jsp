<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Furama Resort | Service Creation</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\style.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="container">
        <div class="row body-justify-center">
            <p class="font-weight-normal" style="font-size: 1.5rem; margin-top: 2rem; margin-bottom: 0">
                Add New Service</p>
        </div>
        <div class="row body-justify-center">
            <div class="bg-light p-3 border-radius">
                <form action="/service?action=add" method="post">
                    <div class="form-group">
                        <label for="inputServiceName">Service Name</label>
                        <input type="text" name="name" class="form-control" id="inputServiceName"
                               aria-describedby="emailHelp" placeholder="Enter service name" required>
                    </div>
                    <div class="form-group">
                        <label for="inputServiceArea">Service Area</label>
                        <input type="text"  class="form-control" id="inputServiceArea" name="area"
                               aria-describedby="emailHelp" placeholder="Enter service area"
                               pattern="^[1-9]+[0-9]*|[1-9][.]+[0-9]*$"
                               title="The area must be positive" required>
                    </div>
                    <div class="form-group">
                        <label for="inputServiceCost">Service Cost</label>
                        <input type="text" name="cost" class="form-control" id="inputServiceCost"
                               aria-describedby="emailHelp" placeholder="Enter service cost"
                               pattern="^[1-9]+[0-9]*|[1-9][.]+[0-9]*$"
                               title="The cost must be positive" required>
                    </div>
                    <div class="form-group">
                        <label for="inputMaxPeople">Max People</label>
                        <input type="number" name="maxPeople" class="form-control" id="inputMaxPeople"
                               aria-describedby="emailHelp" placeholder="Enter max people"
                               pattern="^[1-9]+[0-9]*$"
                               title="The people numbers must be positive" required>
                    </div>
                    <div class="form-group">
                        <label for="inputRentType">Rent Type</label>
                        <select class="form-control" id="inputRentType" name="rentType">
                            <c:forEach items="${rentTypeList}" var="rentType">
                                <option value="${rentType.rentTypeId}">${rentType.rentTypeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputServiceType">Service Type</label>
                        <select class="form-control" id="inputServiceType" name="serviceType">
                            <c:forEach items="${serviceTypeList}" var="serviceType">
                                <option value="${serviceType.serviceTypeId}">${serviceType.serviceTypeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputStandardRoom">Standard Room</label>
                        <select class="form-control" id="inputStandardRoom" name="standardRoom">
                            <option>President</option>
                            <option>Super Star</option>
                            <option>Vip</option>
                            <option>Normal</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputConvenience">Convenience</label>
                        <select class="form-control" id="inputConvenience" name="convenience">
                            <option>Free Kara</option>
                            <option>Free Breakfirst</option>
                            <option>Free Bus</option>
                            <option>Free Beverage</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputPoolArea">Pool Area</label>
                        <input type="text" name="poolArea" class="form-control" id="inputPoolArea"
                               aria-describedby="emailHelp" placeholder="Enter pool area"
                               pattern="^[1-9]+[0-9]*|[1-9][.]+[0-9]*$"
                               title="The pool area must be positive"
                               required>
                    </div>
                    <div class="form-group">
                        <label for="inputNumberOfFloors">Floors</label>
                        <input type="number" name="numberOfFloors" class="form-control" id="inputNumberOfFloors"
                               aria-describedby="emailHelp" placeholder="Enter floors"
                               pattern="^[1-9]+[0-9]*$"
                               title="The people numbers must be positive" required>
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
