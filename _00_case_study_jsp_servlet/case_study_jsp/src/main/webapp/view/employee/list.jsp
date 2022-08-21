<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Furama Resort | Employee List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}\datatables\css\dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}\boostrap\css\style.css">
    <style>
        .page-item.active .page-link {
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
                Employee List</p>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 body-justify-center">
            <form class="form-inline" action="/employee" method="get">
                <div class="form-group mx-sm-1">
                    <input hidden type="text" name="action" value="search">
                    <input type="text" class="form-control" name="nameSearch" placeholder="Search name">
                </div>
                <div class="form-group mx-sm-3">
                    <select class="form-control" aria-label="Default select example" name="address">
                        <option value="">Select address</option>
                        <c:forEach items="${employees}" var="employee">
                            <option value="${employee.address}">${employee.address}</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn bg-frm-darkblue text-white">Search</button>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <table class="table table-hover table-responsive" id="table-employee" width="100%" style="width: 100%;">
                <thead>
                <tr class="bg-frm-darkblue">
                    <th scope="col" class="text-white">ID</th>
                    <th scope="col" class="text-white">Name</th>
                    <th scope="col" class="text-white">Birthday</th>
                    <th scope="col" class="text-white">ID Card</th>
                    <th scope="col" class="text-white">Salary</th>
                    <th scope="col" class="text-white">Phone</th>
                    <th scope="col" class="text-white">Email</th>
                    <th scope="col" class="text-white">Address</th>
                    <th scope="col" class="text-white">Position</th>
                    <th scope="col" class="text-white">Education</th>
                    <th scope="col" class="text-white">Division</th>
                    <th scope="col" class="text-white">Username</th>
                    <th scope="col" class="text-white">Edit</th>
                    <th scope="col" class="text-white">Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${employeeList}" var="employee" varStatus="status">
                    <tr>
                        <td>${employee.id}</td>
                        <td>${employee.name}</td>
                        <td>${employee.birthday}</td>
                        <td>${employee.idCard}</td>
                        <td>${employee.salary}</td>
                        <td>${employee.phone}</td>
                        <td>${employee.email}</td>
                        <td>${employee.address}</td>
                        <td>${employee.positionName}</td>
                        <td>${employee.degreeName}</td>
                        <td>${employee.divisionName}</td>
                        <td>${employee.userName}</td>
                        <td>
                            <a class="text-white" href="/employee?action=edit&id=${employee.id}">
                                <button type="button" class="btn bg-frm-darkblue text-white" data-toggle="modal">
                                    Edit
                                </button>
                            </a>
                        <td>
                            <button type="button" class="btn bg-frm-darkblue text-white" data-toggle="modal"
                                    data-target="#c${employee.id}">
                                Delete
                            </button>
                            <div class="modal fade" id="c${employee.id}" tabindex="-1"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Danger</h5>
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Are you sure to delete ${employee.name}?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                                Close
                                            </button>
                                            <a class="text-white"
                                               href="/employee?action=delete&id=${employee.id}">
                                                <button type="button" class="btn bg-frm-darkblue text-white">Yes
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
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
        $('#table-employee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

</body>
</html>
