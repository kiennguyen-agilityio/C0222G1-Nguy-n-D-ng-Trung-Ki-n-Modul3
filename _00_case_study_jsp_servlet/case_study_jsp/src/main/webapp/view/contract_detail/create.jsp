<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Furama Resort | Contract Detail Creation</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\style.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="container">
        <div class="row body-justify-center">
            <p class="font-weight-normal" style="font-size: 1.5rem; margin-bottom: 0">
                Add New Contract Detail</p>
        </div>
        <div class="row body-justify-center">
            <c:if test="${mess != null}">
                <p class="font-weight-normal" style="font-size: 1.5rem; margin-bottom: 0">
                        ${mess}</p>
            </c:if>
        </div>
        <div class="row body-justify-center">
            <div class="bg-light p-3 border-radius">
                <form action="/contract_detail?action=add" method="post">
                    <div class="form-group">
                        <label for="inputContractId">Contract ID</label>
                        <input type="text" name="contractId" class="form-control" id="inputContractId"
                               aria-describedby="emailHelp" placeholder="Enter contract ID" required>
                    </div>
                    <div class="form-group">
                        <label for="inputAttachServiceId">Attach Service ID</label>
                        <input type="text" name="attachServiceId" class="form-control" id="inputAttachServiceId"
                               aria-describedby="emailHelp" placeholder="Enter attach service ID" required>
                    </div>
                    <div class="form-group">
                        <label for="inputQuantity">Quantity</label>
                        <input type="number" name="quantity" class="form-control" id="inputQuantity"
                               aria-describedby="emailHelp" placeholder="Enter quantity" required>
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
