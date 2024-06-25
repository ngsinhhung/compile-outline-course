<%--
  Created by IntelliJ IDEA.
  User: Hùng's Dell
  Date: 11/06/2024
  Time: 5:59 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="d-flex justify-content-between mt-4 mb-4">
    <h1 class="h3">Quản lý tài khoản sinh viên</h1>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#createStudentAccount">
        Tạo tài khoản sinh viên
    </button>
</div>
<c:if test="${errorMessage != null}">
    <div class="alert alert-danger">${errorMessage}</div>
</c:if>
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
                <img class="img-thumbnail img-fluid h-auto rounded-circle" style="width: 50px"
                     src="${s.user.profile.avatar}" alt="Profile Picture">
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
</div>

<div class="modal" id="createStudentAccount">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Đăng kí tài khoản sinh viên</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
                <c:url value="/users/student" var="action"/>
                <form:form method="post" modelAttribute="student" action="${action}">
                    <div class="form-floating mb-3 mt-3">
                        <form:input path="user.username" type="text" class="form-control" id="username"/>
                        <label for="username">Username</label>
                        <form:errors path="user.username" id="formUsername" cssClass="text-danger"/>
                    </div>
                    
                    <div class="form-floating mb-3 mt-3">
                        <form:input path="user.profile.email" type="email" class="form-control" id="email"/>
                        <label for="email">Email</label>
                        <form:errors path="user.profile.email" id="formEmail" cssClass="text-danger"/>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <form:select path="faculty" class="form-select" id="faculty">
                            <option hidden="hidden" disabled selected>Chọn khoa</option>
                            <c:forEach items="${faculties}" var="f">
                                <option value="${f.id}">${f.facultyName}</option>
                            </c:forEach>
                        </form:select>
                        <form:errors path="faculty" id="formFaculty" cssClass="text-danger"/>
                    </div>
                    
                    <div class="form-floating mt-3 mb-3">
                        <form:input path="user.password" type="password" class="form-control" id="password"/>
                        <form:errors path="user.password" id="formPassword" cssClass="text-danger"/>
                        <label for="password">Mật khẩu</label>
                    </div>
                    <div class="d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form:form>
            </div>
        
        
        </div>
    </div>
</div>

<script src="<c:url value="/resources/JS/manageAccount.js" />"></script>
