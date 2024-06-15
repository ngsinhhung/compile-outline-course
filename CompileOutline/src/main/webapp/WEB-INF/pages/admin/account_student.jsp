<%--
  Created by IntelliJ IDEA.
  User: Hùng's Dell
  Date: 11/06/2024
  Time: 5:59 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="d-flex justify-content-between mt-4 mb-4">
    <h1 class="h3">Quản lý tài khoản quản trị</h1>
    <button type="button" class="btn btn-primary mb-3" id="addStudentAccount">Thêm tài khoản sinh viên</button>
</div>

<table class="table">
    <thead>
    <tr>
        <th scope="col">User Name</th>
        <th scope="col">Email</th>
        <th scope="col">Số điện thoại</th>
        <th scope="col">Khoa</th>
        <th scope="col">Trạng thái</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>John Doe</td>
        <td>john@example.com</td>
        <td>
            <span class="badge bg-success text-white">Active</span>
        </td>
        <td class="action-icons">
            <i class="fas fa-toggle-on text-success" title="Deactivate"></i>
            <i class="fas fa-trash-alt text-danger" title="Delete"></i>
        </td>
    </tr>
    <tr>
        <td>Jane Doe</td>
        <td>jane@example.com</td>
        <td>
            <span class="badge bg-danger text-white">Inactive</span>
        </td>
        <td class="action-icons">
            <i class="fas fa-toggle-off text-secondary" title="Activate"></i>
            <i class="fas fa-trash-alt text-danger" title="Delete"></i>
        </td>
    </tr>
    </tbody>
</table>


<script src="<c:url value="/resources/JS/manageAccount.js" />"></script>