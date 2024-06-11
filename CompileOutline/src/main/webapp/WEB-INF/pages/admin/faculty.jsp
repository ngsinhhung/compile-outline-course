<%--
  Created by IntelliJ IDEA.
  User: Hùng's Dell
  Date: 10/06/2024
  Time: 1:31 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- Button to Open the Modal -->
<div class="d-flex justify-content-between">
    <h2 class="h4 my-auto">Quản lý khoa</h2>
    <a type="button" href="<c:url value="/faculty/create"/>"  class="btn btn-primary h-75" >Thêm khoa</a>
</div>
<!-- Table to display department list -->
<table id="departmentTable" class="table">
    <thead>
    <tr>
        <th>Tên khoa</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${faculties}" var="f">
        <tr id="${f.id}">
            <td>${f.facultyName}</td>
            <td>
                <a type="button" href="<c:url value="/faculty/${f.id}"/>" class="btn btn-info btn-sm">Chỉnh sửa</a>
                <button class="btn btn-danger btn-sm">Xóa</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>




