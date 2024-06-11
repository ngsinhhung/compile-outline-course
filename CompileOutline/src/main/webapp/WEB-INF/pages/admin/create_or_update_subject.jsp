<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Hùng's Dell
  Date: 11/06/2024
  Time: 12:03 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h4 class="title">
    <c:choose>
        <c:when test="${subject.id > 0}">Cập nhật môn học</c:when>
        <c:otherwise>
            Thêm môn học
        </c:otherwise>
    </c:choose>
</h4>
<c:url value="/subject/create" var="action"/>
<form:form method="post" modelAttribute="subject" action="${action}">
    <div class="form-group">
        <label for="subjectName">Tên môn học:</label>
        <form:input path="subjectName" type="text" class="form-control" name="subjectName"/>
    </div>
    <div class="form-group">
        <label for="faculty">Khoa:</label>
        <form:select path="faculty" class="form-select" id="department" name="faculty">
            <option hidden="hidden" disabled selected>Chọn khoa</option>
            <c:forEach items="${faculties}" var="f">
                <c:choose>
                    <c:when test="${f.id==subject.faculty.id}">
                        <option value="${f.id} " selected>${f.facultyName}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${f.id}">${f.facultyName}</option>
                    </c:otherwise>
                </c:choose>
<%--                <option value="${f.id}">${f.facultyName}</option>--%>
            </c:forEach>
        </form:select>
    </div>
    <button type="submit" class="btn btn-success float-end mt-3">
        <c:choose>
            <c:when test="${subject.id > 0}">Cập nhật môn học</c:when>
            <c:otherwise>
                Thêm môn học
            </c:otherwise>
        </c:choose>
    </button>
    <form:hidden path="id"/>
</form:form>
