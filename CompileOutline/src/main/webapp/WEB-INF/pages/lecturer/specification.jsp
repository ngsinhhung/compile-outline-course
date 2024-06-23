<%--
  Created by IntelliJ IDEA.
  User: Hùng's Dell
  Date: 21/06/2024
  Time: 9:31 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="toast"></div>
<div class="" style="min-height:calc(100vh - 65px);">
    <div class="d-flex justify-content-between">
        <div class="d-flex align-items-center mb-4">
            <img src="https://png.pngtree.com/png-vector/20221023/ourmid/pngtree-paper-publish-document-media-vector-png-image_34370374.png"
                 style="height: 50px;" alt="icon-specification">
            <p class="fs-5 fw-bold ms-3 mb-0">Biên soạn đề cương chi tiết</p>
        </div>
        <button onclick="submitSpecification()" class="btn btn-danger my-2">
            <i class="fa-solid fa-file-arrow-up"></i>
            Nộp đề cương
        </button>
    </div>
    
    <div class="header px-2 py-2 mb-4 border-bottom border-gray">
        <p class="text-center fs-5 mb-0">BỘ GIÁO DỤC VÀ ĐÀO TẠO</p>
        <p class="text-center fs-5 mb-0">MINISTRY OF EDUCATION AND TRAINING</p>
        <p class="text-center fs-5 fw-bold mb-0">TRƯỜNG ĐẠI HỌC MỞ THÀNH PHỐ HỒ CHÍ MINH</p>
        <p class="text-center fs-5 fw-bold ">HO CHI MINH CITY OPEN UNIVERSITY</p>
    </div>
    <!-- Course Specification Section -->
    <div class="name-specification-subject mb-4">
        <p class="text-center fw-bold fs-5 mb-0">Đề cương Môn Học</p>
        <p class="text-center fw-bold fs-5 mb-0">COURSE SPECIFICATION</p>
    </div>
    <!-- Form Section -->
    <div class="container-content">
        <c:url value="/specification/update" var="action"/>
        <form:form method="post" modelAttribute="specification" action="${action}">
            <form:hidden path="id"/>
            <form:hidden path="lecturerUser"/>
            <form:hidden path="subject"/>
            <h5 class="fw-bold mt-4">I. Thông tin tổng quát - General information</h5>
            <p>1. Thông tin/Information </p>
            <div class="name-subject mb-2 d-flex align-items-center">
                <p class="mb-0 me-2">Tên môn: <span
                        class="fw-bold mb-0">${specification.subject.subjectName}</span></p>
                <p class="mb-0 me-2"> - Mã Môn học: <span
                        class="fw-bold mb-0">MH${specification.subject.id}</span></p>
            </div>
            <div class="department-info mb-2 d-flex align-items-center">
                <p class="mb-0 me-2">Khoa phụ trách:</p>
                <p class="fw-bold mb-0">${specification.subject.faculty.facultyName}</p>
            </div>
            <div class="instructor-info mb-2 d-flex align-items-center">
                <p class="mb-0 me-2">Giáo viên biên soạn:</p>
                <p class="fw-bold mb-0">${specification.lecturerUser.user.profile.fullname}</p>
            </div>
            <div class="instructor-email mb-2 d-flex align-items-center">
                <p class="mb-0 me-2">Email của giảng viên:</p>
                <p class="fw-bold mb-0">${specification.lecturerUser.user.profile.email}</p>
            </div>
            <p>2. Số tín chỉ/Credits </p>
            <div class="mb-3 d-flex align-items-center">
                <label for="credits" class="form-label mb-0 me-2">Số tín chỉ:</label>
                <div class="col-2">
                    <form:input path="credits" type="number" min="1" max="5" step="0.5"
                                class="form-control form-control-sm" id="credits" style="width: 70px;" placeholder="1"/>
                </div>
            </div>
            <div class="course-info mt-4">
                <h5 class="fw-bold">II. Thông tin về môn học-Course overview</h5>
                <div>
                    <div class="d-flex justify-content-between">
                        <p>1.Mô Tả Đề Cương</p>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save me-2"></i>Lưu thông tin
                        </button>
                    </div>
                    <div class="description mb-2">
                        <form:textarea path="description" class="form-control" rows="5"
                                       placeholder="Nhập mô tả đề cương ở đây..."/>
                    </div>
                </div>
                <div>
                    <div class="d-flex justify-content-between">
                        <p>2. Môn học điều kiện/Requirements:</p>
                        <a href="<c:url value="/specification/${specification.id}/requirement"/>"
                           class="btn btn-primary mb-2"><i class="fas fa-plus me-2"></i>Thêm môn học điều kiện</a>
                    </div>
                    <table class="table" id="courseTable" border="1">
                        <thead>
                        <tr>
                            <th scope="col">STT/No.</th>
                            <th scope="col">Môn học điều kiện/Requirements</th>
                            <th scope="col">Mã môn học/Code</th>
                            <th scope="col"></th> <!-- New column for delete button -->
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requirements}" var="r">
                            <tr>
                                <td>${r.id}</td>
                                <td>${r.type}</td>
                                <td></td>
                                <td></td>
                            </tr>
                            <c:forEach items="${specification.subject.subjectRequirements}" var="sR">
                                <c:choose>
                                    <c:when test="${sR.requirements.id == r.id}">
                                        <tr id="MH${sR.subjectRequirements.id}">
                                            <td></td>
                                            <td>${sR.subjectRequirements.subjectName}</td>
                                            <td>MH${sR.subjectRequirements.id}</td>
                                            <td>
                                                <c:url value="/api/specification/${specification.subject.id}/${sR.subjectRequirements.id}"
                                                       var="urlDeleteSubjectRequirement"/>
                                                <button onclick="deleteComponent('${urlDeleteSubjectRequirement}', 'MH${sR.subjectRequirements.id}')"
                                                        type="button" class="btn btn-danger"><i
                                                        class="fas fa-trash"></i></button>
                                            </td>
                                        </tr>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div>
                    <div class="d-flex justify-content-between">
                        <p>3. Mục tiêu môn học/Course objectives:</p>
                        <a href="<c:url value="/specification/${specification.id}/edit/objectives" />"
                           class="btn btn-primary mb-2"><i class="fas fa-plus me-2"></i>Thêm mục tiêu môn học</a>
                    </div>
                    <table class="table" id="objectivesTable" border="1">
                        <thead>
                        <tr>
                            <th scope="col">Mục tiêu môn học / Course objectives</th>
                            <th scope="col">Mô tả - Description</th>
                            <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${specification.objectives}" var="o" varStatus="status">
                            <tr id="objective${o.id}">
                                <td>${status.index + 1}</td>
                                <td>${o.description}</td>
                                <td>
                                    <a href="<c:url value="/specification/objectives/${o.id}"/> "
                                       class="btn btn-primary"><i class="fas fa-edit"></i></a>
                                    <c:url value="/api/specification/objectives/${o.id}" var="urlDeleteObjectives"/>
                                    <button type="button" class="btn btn-danger"
                                            onclick="deleteComponent('${urlDeleteObjectives}', 'objective${o.id}')"><i
                                            class="fas fa-trash"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div>
                    <div class="d-flex justify-content-between">
                        <p>4. Chuẩn đầu ra (CĐR) môn học – Course learning outcomes (CLOs)</p>
                        <a href="<c:url value="/specification/${specification.id}/edit/outcomes" />"
                           class="btn btn-primary mb-2"><i class="fas fa-plus me-2"></i>Thêm đầu ra môn học</a>
                    </div>
                    <table class="table table-bordered" id="outcomesTable">
                        <thead>
                        <tr>
                            <th scope="col">Mục tiêu môn học/Course objectives
                            </th>
                            <th scope="col">Mô tả - Description</th>
                            <th scope="col"></th> <!-- New column for delete button -->
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${specification.outcomes}" var="o" varStatus="status">
                            <tr id="outcomes${o.id}">
                                <td>${status.index + 1}</td>
                                <td>${o.description}</td>
                                <td>
                                    <a href="<c:url value="/specification/outcomes/${o.id}"/> " class="btn btn-primary"><i
                                            class="fas fa-edit"></i></a>
                                    <c:url value="/api/specification/outcomes/${o.id}" var="urlDeleteOutcomes"/>
                                    <button type="button" class="btn btn-danger"
                                            onclick="deleteComponent('${urlDeleteOutcomes}', 'outcomes${o.id}')"><i
                                            class="fas fa-trash"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div>
                    <div class="d-flex justify-content-between">
                        <p>5. Điểm đánh giá/Rating:</p>
                        <button type="button" class="btn btn-primary mb-2" data-bs-toggle="modal"
                                data-bs-target="#modalRating">
                            <i class="fas fa-plus me-2"></i>Thêm cột điểm đánh giá
                        </button>
                    </div>
                    <table class="table" id="tableRating">
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Bài đánh giá Assessment methods</th>
                            <th scope="col">Tỷ lệ % Weight %</th> <!-- New column for assessment score -->
                            <th scope="col"></th> <!-- New column for delete button -->
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${specification.specificationRatings}" var="rating" varStatus="status">
                            <tr id="spec-${specification.id}-rate-${rating.rating.id}">
                                <td>${status.index + 1}</td>
                                <td>${rating.rating.method}</td>
                                <td class="percent-cell">${rating.percent}%</td>
                                <td>
                                    <c:url value="/api/specification/${specification.id}/rating/${rating.rating.id}"
                                           var="urlDeleteRating"/>
                                    <button onclick="deleteComponent('${urlDeleteRating}', 'spec-${specification.id}-rate-${rating.rating.id}')"
                                            type="button" class="btn btn-danger"><i
                                            class="fas fa-trash"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </form:form>
    </div>
</div>

<div class="modal" id="modalRating">
    <div class="modal-dialog">
        <div class="modal-content">
            
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Thêm đánh giá</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
                <c:url value="/specification/rating/save" var="action"/>
                <form:form method="post" modelAttribute="specificationRating" action="${action}">
                    <form:hidden path="specification" value="${specification.id}"/>
                    <div class="mb-3">
                        <label for="rating" class="form-label">Chọn bài đánh giá:</label>
                        <form:select path="rating" class="form-select" id="rating">
                            <option hidden="hidden" selected>Chọn phương pháp đánh giá</option>
                            <c:forEach var="r" items="${ratingMethods}">
                                <option value="${r.id}">${r.method}</option>
                            </c:forEach>
                        </form:select>
                    </div>
                    <div class="mb-3">
                        <label for="percent" class="form-label">Chọn tỉ lệ bài:</label>
                        <form:input path="percent" type="number" min="0" step="5" max="100" id="percent"
                                    class="form-control"/>
                    </div>
                    <div class="d-flex  justify-content-end">
                        <button type="submit" class="btn btn-success">Thêm</button>
                    </div>
                </form:form>
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

    function toastCustom(heading, message, icon) {
        $.toast({
            heading: heading,
            text: message,
            showHideTransition: 'fade',
            icon: icon,
            position: "top-right",

        })
    }

    function validateSpecification() {
        let objectives = document.querySelector("#objectivesTable tbody")
        if (objectives.children.length === 0) {
            toastCustom("Error", "Không có mục tiêu môn học", "error")
            return false;
        }
        let outcomes = document.querySelector("#outcomesTable tbody")
        if (outcomes.children.length === 0) {
            toastCustom("Error", "Không có đầu ra môn học", "error")
            return false;
        }
        let ratingRow = document.querySelector("#tableRating tbody")
        if (ratingRow.children.length >= 2 && ratingRow.children.length <= 5) {
            let percentCells = document.querySelectorAll('.percent-cell');
            let total = 0;
            percentCells.forEach(function (cells) {
                let value = parseFloat(cells.textContent.trim().replace('%', ''));
                total += value;
            })
            if (total == 100) {

                console.log("Đủ 100%")
                return true;
            } else {
                toastCustom("Error", "Đánh giá môn học buộc phải 100%", "error")
                return false;
            }
        } else {
            toastCustom("Warning", "Đề cương phải có tối thiểu 2 cột điểm đánh gía và tối đa 5 cột điểm đánh giá", "warning")
            return false;
        }

        return true;
    }

    function submitSpecification() {
        if (validateSpecification() == true) {
            toastCustom("Success", "Đã nộp đề cương", "success")
        }
    }
</script>
<script src="<c:url value="/resources/JS/specification.js" />"></script>
