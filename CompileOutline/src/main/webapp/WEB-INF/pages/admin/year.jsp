<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Hùng's Dell
  Date: 24/06/2024
  Time: 1:11 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <div class="d-flex justify-content-between">
        <h2 class="h4 my-auto">Quản lý khóa học</h2>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalYear">
            Thêm mới khóa học
        </button>
    </div>
    <!-- Table to display department list -->
    <table id="departmentTable" class="table">
        <thead>
        <tr>
            <th>Khóa</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${years}" var="y">
            <tr id="${y.id}">
                <td>${y.year}</td>
                <td class="d-flex justify-content-end">
                    <a type="button" href="<c:url value="/year/${y.id}"/>" class="btn btn-info btn-sm">Chỉnh sửa</a>
                    <c:url value="/api/year/${y.id}" var="deleteYear"/>
                    <button onclick="deleteComponent('${deleteYear}','${y.id}')" class="btn btn-danger btn-sm ms-2">Xóa</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="modal" id="modalYear">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Thêm năm học</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <c:url value="/year/" var="action"/>
                    <form:form method="post" modelAttribute="year" action="${action}">
                        <label for="year">Năm học:</label>
                        <form:input id="year" type="number" min="0" path="year" class="form-control"/>
                        <div class="d-flex justify-content-end mt-2">
                            <button type="submit" class="btn btn-success">Thêm</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function deleteComponent(url, elementId) {
        fetch(url, {
            method: 'delete'
        }).then(res => {
            if (res.status === 204) {
                let element = document.getElementById(elementId)
                element.remove()
                // location.reload();
            }
        })
    }
</script>
