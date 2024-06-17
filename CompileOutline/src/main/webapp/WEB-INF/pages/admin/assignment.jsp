<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="py-4">
    <div class="container">

        <div class="modal fade" id="addAssignmentModal" tabindex="-1" aria-labelledby="addAssignmentModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addAssignmentModalLabel">Thêm Phân Công Mới</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <c:url value="/assignment/add" var="action"/>
                        <form:form id="addAssignmentForm" modelAttribute="assignment" method="post" action="${action}">
                            <div class="mb-3">
                                <label for="subjectSelect" class="form-label">Chọn Môn Học:</label>
                                <c:url value="/api/getLecturersByFaculty/" var="urlload">
                                    <c:param name="facultyId" value="${facultyId}" />
                                </c:url>
                                <form:select path="subject" class="form-select" id="subjectSelect" name="subjectId" onchange="loadLecturers('${urlload}')">
                                    <option>Chon mon hoc</option>
                                    <c:forEach var="subject" items="${subjects}">
                                        <option value="${subject.id}" data-faculty-id="${subject.faculty.id}">Môn học: ${subject.subjectName} - Khoa: ${subject.faculty.facultyName}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div class="mb-3">
                                <label for="lecturerSelect" class="form-label">Chọn Giáo Viên:</label>
                                
                                <form:select path="lecturerUser" class="form-select" id="lecturerSelect" name="lecturerId">
                                    <option>Chon giang vien</option>
<%--                                    <c:forEach var="lecturer" items="${lecturers}">--%>
<%--                                        <option value="${lecturer.userId}">${lecturer.user.profile.fullname}</option>--%>
<%--                                    </c:forEach>--%>
                                </form:select>
                            </div>
                            <button type="submit" class="btn btn-primary">Lưu</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="mt-4">
            <div class="d-flex justify-content-between">
                <h2 class="h4">Danh Sách Phân Công</h2>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addAssignmentModal">
                    Thêm Phân Công
                </button>
                </div>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Mã Môn Học</th>
                    <th scope="col">Tên Môn Học</th>
                    <th scope="col">Khoa</th>
                    <th scope="col">Giáo Viên Phân Công</th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="assignment" items="${assignments}">
                    <tr>
                        <td>MH${assignment.subject.id}</td>
                        <td>${assignment.subject.subjectName}</td>
                        <td>${assignment.subject.faculty.facultyName}</td>
                        <td>${assignment.lecturerUser.user.profile.fullname}</td>
                        <td>
                            <a href="<c:url value='/assignment/${assignment.id}/update' />" class="btn btn-primary">
                                <i class="fas fa-edit"></i> Sửa
                            </a>
                            <c:url value="/api/${assignment.id}/delete/" var="url"/>
                            <button onclick="deleteAssignment('${url}', ${assignment.id})" class="btn btn-danger">Xoá</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function loadLecturers(urlload) {
        const subjectSelect = document.getElementById('subjectSelect');
        const facultyId = subjectSelect.options[subjectSelect.selectedIndex].getAttribute('data-faculty-id');
        console.log(facultyId);
        fetch(urlload + facultyId)
            .then(response => response.json())
            .then(data => {
                let lecturerSelect = document.getElementById('lecturerSelect');
                lecturerSelect.innerHTML = "";

                const lecturers = data.map(lecturer => ({
                    fullname: lecturer[0],
                    id: lecturer[1]
                }));

                // Populate options
                lecturers.forEach(lecturer => {
                    let option = document.createElement('option');
                    option.value = lecturer.id;
                    option.textContent = lecturer.fullname;
                    lecturerSelect.appendChild(option);
                    console.log(option)
                });
            })
            .catch(error => console.error('Error loading lecturers:', error));
    }
    function deleteAssignment(url, id) {
        fetch(url, {
            method: 'DELETE'
        }).then(res => {
            if (res.status === 204) {
                location.reload();
            } else {
                alert("ERROR");
            }
        });
    }
</script>
