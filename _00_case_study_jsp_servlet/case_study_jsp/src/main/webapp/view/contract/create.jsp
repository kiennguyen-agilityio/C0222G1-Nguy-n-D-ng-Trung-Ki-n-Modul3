<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Furama Resort | Contract Creation</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\style.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="container">
        <div class="row body-justify-center">
            <p class="font-weight-normal" style="font-size: 1.5rem; margin-bottom: 0">
                Add New Contract</p>
        </div>
        <div class="row body-justify-center">
            <c:if test="${mess != null}">
                <p class="font-weight-normal" style="font-size: 1.5rem; margin-bottom: 0">
                ${mess}</p>
            </c:if>
        </div>
        <div class="row body-justify-center">
            <div class="bg-light p-3 border-radius">
                <form action="/contract?action=add" method="post">
                    <div class="form-group">
                        <label for="inputStartDate">Contract Start Date</label>
                        <input type="date" name="startDate" class="form-control" id="inputStartDate"
                               aria-describedby="emailHelp" placeholder="Pick start date" required>
                    </div>
                    <div class="form-group">
                        <label for="inputEndDate">Contract End Date</label>
                        <input type="date" name="endDate" class="form-control" id="inputEndDate"
                               aria-describedby="emailHelp" placeholder="Pick end date" required>
                    </div>
                    <div class="form-group">
                        <label for="inputContractDeposit">Contract Deposit</label>
                        <input type="text" name="deposit" class="form-control" id="inputContractDeposit"
                               aria-describedby="emailHelp" placeholder="Enter contract deposit" required>
                    </div>
                    <div class="form-group">
                        <label for="inputTotalMoney">Contract Total Money</label>
                        <input type="text" name="totalMoney" class="form-control" id="inputTotalMoney"
                               aria-describedby="emailHelp" placeholder="Enter total money" required>
                    </div>
                    <div class="form-group">
                        <label for="inputEmployeeId">Employee ID</label>
                        <input type="number" name="employeeId" class="form-control" id="inputEmployeeId"
                               aria-describedby="emailHelp" placeholder="Enter employee id" required>
                    </div>
                    <div class="form-group">
                        <label for="inputCustomerId">Customer ID</label>
                        <input type="text" name="customerId" class="form-control" id="inputCustomerId"
                               aria-describedby="emailHelp" placeholder="Enter customer id" required>
                    </div>
                    <div class="form-group">
                        <label for="inputServiceId">Service ID</label>
                        <input type="text" name="serviceId" class="form-control" id="inputServiceId"
                               aria-describedby="emailHelp" placeholder="Enter service id" required>
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
