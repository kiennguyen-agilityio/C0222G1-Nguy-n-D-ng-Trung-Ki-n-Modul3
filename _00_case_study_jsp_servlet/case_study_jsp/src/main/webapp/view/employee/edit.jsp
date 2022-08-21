<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Furama Resort | Employee Update</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\style.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="container">
        <div class="row body-justify-center">
            <p class="font-weight-normal" style="font-size: 1.5rem; margin-top: 2rem; margin-bottom: 0">
                Update Employee</p>
        </div>
        <div class="row body-justify-center">
            <div class="bg-light p-3 border-radius">
                <form action="/employee?action=edit" method="post">
                    <div class="form-group">
                        <label for="inputEmployeeId">Employee Id</label>
                        <input type="text" name="id" class="form-control" id="inputEmployeeId"
                               aria-describedby="emailHelp" value="${employee.id}" readonly = "readonly">
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeName">Employee Name</label>
                        <input type="text" name="name" class="form-control" id="inputEmployeeName"
                               aria-describedby="emailHelp" value="${employee.name}" required>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeBirthday">Employee Birthday</label>
                        <input type="date" id="inputEmployeeBirthday" value="${employee.birthday}" name="birthday">
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeIdCard">Employee ID Card</label>
                        <input type="text" name="idCard" class="form-control" id="inputEmployeeIdCard"
                               aria-describedby="emailHelp" value="${employee.idCard}" required>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeSalary">Employee Salary</label>
                        <input type="text" name="salary" class="form-control" id="inputEmployeeSalary"
                               aria-describedby="emailHelp" value="${employee.salary}" required>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeePhone">Employee Phone</label>
                        <input type="text" name="phone" class="form-control" id="inputEmployeePhone"
                               aria-describedby="emailHelp" value="${employee.phone}" required>
                    </div>
                   <div class="form-group">
                        <label for="inputEmployeeEmail">Employee Email</label>
                        <input type="text" name="email" class="form-control" id="inputEmployeeEmail"
                               aria-describedby="emailHelp" value="${employee.email}" required>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeAddress">Employee Address</label>
                        <input type="text" name="address" class="form-control" id="inputEmployeeAddress"
                               aria-describedby="emailHelp" value="${employee.address}" required>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeePosition">Employee Position</label>
                        <select class="form-control" id="inputEmployeePosition" name="position">
                            <c:forEach items="${positionList}" var="position">
                                <c:if test="${employee.positionId == position.positionId}">
                                    <option selected value="${employee.positionId}">${employee.positionName}</option>
                                </c:if>
                                <c:if test="${employee.positionId != position.positionId}">
                                    <option value="${position.positionId}">${position.positionName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeDegree">Employee Degree</label>
                        <select class="form-control" id="inputEmployeeDegree" name="degree">
                            <c:forEach items="${educationDegreeList}" var="degree">
                                <c:if test="${employee.degreeId == degree.educationDegreeId}">
                                    <option selected value="${employee.degreeId}">${employee.degreeName}</option>
                                </c:if>
                                <c:if test="${employee.degreeId != degree.educationDegreeId}">
                                    <option value="${degree.educationDegreeId}">${degree.educationDegreeName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeDivision">Employee Division</label>
                        <select class="form-control" id="inputEmployeeDivision" name="division">
                            <c:forEach items="${divisionList}" var="division">
                                <c:if test="${employee.divisionId == division.divisionId}">
                                    <option selected value="${employee.divisionId}">${employee.divisionName}</option>
                                </c:if>
                                <c:if test="${employee.divisionId != division.divisionId}">
                                    <option value="${division.divisionId}">${division.divisionName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeUsername">Employee Username</label>
                        <input type="text" name="userName" class="form-control" id="inputEmployeeUsername"
                               aria-describedby="emailHelp" placeholder="${employee.userName}" readonly = "readonly">
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
