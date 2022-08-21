<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Furama Resort | Customer List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}\datatables\css\dataTables.bootstrap4.min.css"/>
    <style>
        .page-item.active .page-link{
            background-color: #046056 !important;
            z-index: 1;
            color: #fff;
            border-color: #046056;
        }
    </style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<div class="container">
    <div class="row body-justify-center">
        <p class="font-weight-normal" style="font-size: 1.5rem; margin-top: 2rem; margin-bottom: 2rem">
            Customer List</p>
    </div>
    <div class="row">
        <form class="form-inline" action="/customer" method="get">
            <div class="form-group mx-sm-1">
                <input hidden type="text" name="action" value="search">
                <input type="text" class="form-control" name="nameSearch" placeholder="Search name">
            </div>
            <div class="form-group mx-sm-3">
                <select class="form-control" aria-label="Default select example" name="address">
                    <option value="">Select address</option>
                    <c:forEach items="${customers}" var="ctm">
                        <option value="${ctm.address}">${ctm.address}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn bg-frm-darkblue text-white">Search</button>
        </form>
    </div>
    <div class="row body-justify-center">
        <div class="col-lg-12 col-md-12">
            <table class="table table-hover table-responsive" id="table-customer" width="100%" style="width: 100%;">
                <thead>
                <tr class="bg-frm-darkblue">
                    <th scope="col" class="text-white">ID</th>
                    <th scope="col" class="text-white">Type</th>
                    <th scope="col" class="text-white">Name</th>
                    <th scope="col" class="text-white">Birthday</th>
                    <th scope="col" class="text-white">Gender</th>
                    <th scope="col" class="text-white">ID Card</th>
                    <th scope="col" class="text-white">Phone</th>
                    <th scope="col" class="text-white">Email</th>
                    <th scope="col" class="text-white">Address</th>
                    <th scope="col" class="text-white">Service</th>
                    <th scope="col" class="text-white">Attach Service</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${customerList}" var="customer" varStatus="status">
                    <tr>
                        <td>${customer.id}</td>
                        <td>${customer.type}</td>
                        <td>${customer.name}</td>
                        <td>${customer.birthDay}</td>
                        <td>${customer.gender}</td>
                        <td>${customer.idCard}</td>
                        <td>${customer.phone}</td>
                        <td>${customer.email}</td>
                        <td>${customer.address}</td>
                        <td>
                            <a class="text-dark" href="/service">${customer.service}</a>
                        </td>
                        <td>${customer.attachService}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
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
<script src="${pageContext.request.contextPath}\datatables\js\jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}\datatables\js\dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#table-customer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
