<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/assignment/add" var="action"/>
<form:form id="editAssignmentForm" modelAttribute="assignments" method="post" action="${action}">
    <form:hidden path="id"/>
    <div class="mb-3">
        <label for="subjectSelect" class="form-label">Chọn Môn Học:</label>
        <form:select path="subject" class="form-select" id="subjectSelect" name="subjectId">
            <c:forEach var="subject" items="${allSubject}">
                <c:choose>
                    <c:when test="${subject == assignment.subject.id}">
                        <option value="${subject.id}" selected label="${subject.subjectName} - ${subject.faculty.facultyName}"></option>
                    </c:when>
                    <c:otherwise>
                        <option value="${subject.id}" label="${subject.subjectName} - ${subject.faculty.facultyName}"></option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
    </div>
    <div class="mb-3">
        <label for="lecturerSelect" class="form-label">Chọn Giáo Viên:</label>
        <form:select path="lecturerUser" class="form-select" id="lecturerSelect" name="lecturerId">
            <c:forEach var="lecturer" items="${lecturers}">
                <option value="${lecturer.id}"
                        <c:if test="${lecturer.id eq assignments.lecturerUser.id}">selected</c:if>>${lecturer.user.profile.fullname}</option>
            </c:forEach>
        </form:select>
    </div>
    <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
</form:form>

