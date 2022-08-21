<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Furama Resort | Service List</title>
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
            Service List</p>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <table class="table table-hover table-responsive" id="table-employee" width="100%" style="width: 100%;">
                <thead>
                <tr class="bg-frm-darkblue">
                    <th scope="col" class="text-white">ID</th>
                    <th scope="col" class="text-white">Name</th>
                    <th scope="col" class="text-white">Area</th>
                    <th scope="col" class="text-white">Cost</th>
                    <th scope="col" class="text-white">Max People</th>
                    <th scope="col" class="text-white">Rent Type</th>
                    <th scope="col" class="text-white">Service Type</th>
                    <th scope="col" class="text-white">Standard Room</th>
                    <th scope="col" class="text-white">Other Convenience</th>
                    <th scope="col" class="text-white">Pool Area</th>
                    <th scope="col" class="text-white">Grades</th>
                    <th scope="col" class="text-white">Edit</th>
                    <th scope="col" class="text-white">Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${serviceList}" var="service" varStatus="status">
                    <tr>
                        <td>${service.id}</td>
                        <td>${service.name}</td>
                        <td>${service.area}</td>
                        <td>${service.cost}</td>
                        <td>${service.maxPeople}</td>
                        <td>${service.rentTypeName}</td>
                        <td>${service.serviceTypeName}</td>
                        <td>${service.standardRoom}</td>
                        <td>${service.descriptionOtherConvenience}</td>
                        <td>${service.poolArea}</td>
                        <td>${service.numberOfFloors}</td>

                        <td>
                            <a class="text-white" href="/service?action=edit&id=${service.id}">
                                <button type="button" class="btn bg-frm-darkblue text-white" data-toggle="modal">
                                    Edit
                                </button>
                            </a>
                        <td>
                            <button type="button" class="btn bg-frm-darkblue text-white" data-toggle="modal"
                                    data-target="#c${service.id}">
                                Delete
                            </button>
                            <div class="modal fade" id="c${service.id}" tabindex="-1"
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
                                            <p>Are you sure to delete ${service.name}?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                                Close
                                            </button>
                                            <a class="text-white"
                                               href="/service?action=delete&id=${service.id}">
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
