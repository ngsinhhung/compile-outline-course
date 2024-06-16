<%--
  Created by IntelliJ IDEA.
  User: Hùng's Dell
  Date: 12/06/2024
  Time: 4:31 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container-xl px-4 mt-4">
    <c:url value="/users/" var="action"/>
    <form:form method="post" modelAttribute="profileDto" action="${action}" enctype="multipart/form-data">
        <form:hidden path="id"/>
        <div class="row">
            <div class="col-xl-4">
                <!-- Profile picture card-->
                <div class="card mb-4 mb-xl-0">
                    <div class="card-header">Ảnh hồ sơ</div>
                    <div class="card-body text-center">
                        <!-- Profile picture image-->
                        <img class="img-account-profile rounded-circle mb-2 h-auto" style="width: 300px" src="${profileDto.avatar}" alt="">
                        <!-- Profile picture upload button-->
                        <form:input path="file" type="file" class="form-control"/>
<%--                        <button class="btn btn-primary" type="button">Chỉnh sửa ảnh</button>--%>
                    </div>
                </div>
            </div>
            <div class="col-xl-8">
                <!-- Account details card-->
                <div class="card mb-4">
                    <div class="card-header">Chi tiết hồ sơ</div>
                    <div class="card-body">
                        <!-- Form Group (username)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="inputUsername">Username</label>
                            <form:input path="username" class="form-control" id="inputUsername" type="text"/>
                        </div>
                        <!-- Form Group (fullname)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="inputFullname">Họ và Tên</label>
                            <form:input path="fullname" class="form-control" id="inputFullname" type="text"/>
                        </div>
                        <!-- Form Row -->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (email)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputEmail">Email</label>
                                <form:input path="email" class="form-control" id="inputEmail" type="text"/>
                            </div>
                            <!-- Form Group (phone)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputPhone">Số điện thoại</label>
                                <form:input path="phone" class="form-control" id="inputPhone" type="text"/>
                            </div>
                        </div>
                        <!-- Form Group (role)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="showRole">Vai trò</label>
                            <form:input path="role" value="${profileDto.role}" class="form-control" id="showRole" readonly="true" type="text"/>
                        </div>
                        <!-- Form Group (is active)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="isActive">Đang hoạt động</label>
                            <form:select path="isActive" class="form-select" id="isActive">
                                <c:choose>
                                    <c:when test="${profileDto.isActive == true}">
                                        <option value="1" selected>Bật</option>
                                        <option value="0">Tắt</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="1">Bật</option>
                                        <option value="0" selected>Tắt</option>
                                    </c:otherwise>
                                </c:choose>
                            </form:select>
                        </div>
                        <!-- Form Group (faculty)-->
                        <div class="mb-3">
                            <label for="faculty">Khoa:</label>
                            <form:select path="facultyId" class="form-select" id="faculty">
                                <option hidden="hidden" disabled selected>Chọn khoa</option>
                                <c:forEach items="${faculties}" var="f">
                                    <c:choose>
                                        <c:when test="${f.id==profileDto.facultyId}">
                                            <option value="${f.id}" selected>${f.facultyName}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${f.id}">${f.facultyName}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </form:select>
                        </div>
                        <!-- Save changes button-->
                        <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                    </div>
                </div>
            </div>
        </div>
    </form:form>
</div>