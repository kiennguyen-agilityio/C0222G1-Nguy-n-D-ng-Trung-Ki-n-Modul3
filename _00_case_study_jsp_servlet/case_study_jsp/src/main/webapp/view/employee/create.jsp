<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Furama Resort | Employee Creation</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\style.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="container">
        <div class="row body-justify-center">
            <p class="font-weight-normal" style="font-size: 1.5rem; margin-top: 2rem; margin-bottom: 0">
                Add New Employee</p>
        </div>
        <div class="row body-justify-center">
            <div class="bg-light p-3 border-radius">
                <form action="/employee?action=add" method="post">
                    <div class="form-group">
                        <label for="inputEmployeeName">Employee Name</label>
                        <input type="text" name="name" class="form-control" id="inputEmployeeName"
                               aria-describedby="emailHelp" placeholder="Enter employee name" required>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeBirthday">Employee Birthday</label>
                        <input type="date" id="inputEmployeeBirthday" name="birthday">
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeIdCard">Employee ID Card</label>
                        <input type="text" name="idCard" class="form-control" id="inputEmployeeIdCard"
                               aria-describedby="emailHelp" placeholder="Enter employee id card" required>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeSalary">Employee Salary</label>
                        <input type="text" name="salary" class="form-control" id="inputEmployeeSalary"
                               aria-describedby="emailHelp" placeholder="Enter employee salary" required>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeePhone">Employee Phone</label>
                        <input type="text" name="phone" class="form-control" id="inputEmployeePhone"
                               aria-describedby="emailHelp" placeholder="Enter employee phone" required>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeEmail">Employee Email</label>
                        <input type="text" name="email" class="form-control" id="inputEmployeeEmail"
                               aria-describedby="emailHelp" placeholder="Enter employee email" required>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeAddress">Employee Address</label>
                        <input type="text" name="address" class="form-control" id="inputEmployeeAddress"
                               aria-describedby="emailHelp" placeholder="Enter employee address" required>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeePosition">Employee Position</label>
                        <select class="form-control" id="inputEmployeePosition" name="position">
                            <c:forEach items="${positionList}" var="position">
                                <option value="${position.positionId}">${position.positionName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeDegree">Employee Degree</label>
                        <select class="form-control" id="inputEmployeeDegree" name="degree">
                            <c:forEach items="${educationDegreeList}" var="degree">
                                <option value="${degree.educationDegreeId}">${degree.educationDegreeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeDivision">Employee Position Name</label>
                        <select class="form-control" id="inputEmployeeDivision" name="division">
                            <c:forEach items="${divisionList}" var="division">
                                <option value="${division.divisionId}">${division.divisionName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeUsername">Employee Username</label>
                        <input type="text" name="userName" class="form-control" id="inputEmployeeUsername"
                               aria-describedby="emailHelp" placeholder="Enter employee username" required>
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
