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
    <h1 class="h3">Quản lý tài khoản sinh viên</h1>
</div>

<table class="table">
    <thead>
    <tr>
        <th scope="col">Ảnh đại điên</th>
        <th scope="col">Username</th>
        <th scope="col">Họ và Tên</th>
        <th scope="col">Khoa</th>
        <th scope="col">Email</th>
        <th scope="col">Số điện thoại</th>
        <th scope="col">Trạng thái</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${students}" var="s">
        <tr>
            <td>
                <img class="img-thumbnail img-fluid h-auto rounded-circle" style="width: 50px" src="${s.user.profile.avatar}"  alt="Profile Picture">
            </td>
            <td>${s.user.username}</td>
            <td>${s.user.profile.fullname}</td>
            <td>${s.faculty.facultyName}</td>
            <td>${s.user.profile.email}</td>
            <td>${s.user.profile.phone}</td>
            <td>
                <c:choose>
                    <c:when test="${s.user.isActive == true}">
                        <span class="badge bg-success text-white p-2">Active</span>
                    </c:when>
                    <c:otherwise>
                        <span class="badge bg-danger text-white p-2">Inactive</span>
                    </c:otherwise>
                </c:choose>
            </td>
            <td class="action-icons">
                <a href="<c:url value="/users/${s.user.id}" />">
                    <span>
                        <i class='fas fa-edit' style='font-size:24px'></i>
                    </span>
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<script src="<c:url value="/resources/JS/manageAccount.js" />"></script>