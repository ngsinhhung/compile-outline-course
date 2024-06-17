<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/16/2024
  Time: 9:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <div class="d-flex align-items-center mb-4">
        <img src="https://png.pngtree.com/png-vector/20221023/ourmid/pngtree-paper-publish-document-media-vector-png-image_34370374.png" style="height: 50px;" alt="icon-specification">
        <p class="fs-5 fw-bold ms-3 mb-0">Biên soạn đề cương chi tiết</p>
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
        <form:form modelAttribute="specifications">
            <h5 class="fw-bold mt-4">I. Thông tin tổng quát - General information</h5>
            <p>1. Thông tin/Information </p>
            <div class="name-subject mb-2 d-flex align-items-center">
                <p class="mb-0 me-2">Tên môn:</p>
                <p class="fw-bold mb-0"> - Mã Môn học: ITEC3408</p>
            </div>
            <div class="department-info mb-2 d-flex align-items-center">
                <p class="mb-0 me-2">Khoa phụ trách:</p>
                <p class="fw-bold mb-0">Khoa Công nghệ thông tin</p>
            </div>
            <div class="instructor-info mb-2 d-flex align-items-center">
                <p class="mb-0 me-2">Giáo viên biên soạn:</p>
                <p class="fw-bold mb-0">Dương Hữu Thành</p>
            </div>
            <div class="instructor-email mb-2 d-flex align-items-center">
                <p class="mb-0 me-2">Email của giảng viên:</p>
                <p class="fw-bold mb-0">dtthanh@gmail.com</p>
            </div>
            <p>2. Số tín chỉ/Credits </p>
            <div class="mb-3 d-flex align-items-center">
                <label for="credits" class="form-label mb-0 me-2">Số tín chỉ:</label>
                <div class="col-2">
                    <input type="number" class="form-control form-control-sm" id="credits" style="width: 70px;" placeholder="1">
                </div>
            </div>
            <div class="course-info mt-4">
                <h5 class="fw-bold">II. Thông tin về môn học-Course overview</h5>
                <div>
                    <p>1.Mô Tả Đề Cương</p>
                    <div class="description mb-2">
                        <textarea class="form-control" rows="5" placeholder="Nhập mô tả đề cương ở đây..."></textarea>
                    </div>
                </div>
                <div>
                    <p>2. Môn học điều kiện/Requirements:</p>
                    <button type="button" class="btn btn-primary mb-2" onclick="openModal('Thêm môn học', courseFormContent, saveCourse)">
                        <i class="fas fa-plus me-2"></i>Thêm yêu cầu
                    </button>
                    <table class="table" id="courseTable" border="1">
                        <thead>
                        <tr>
                            <th scope="col">STT/No.</th>
                            <th scope="col">Môn học điều kiện/ Requirements</th>
                            <th scope="col"></th> <!-- New column for delete button -->
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>Math</td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="deleteRow(this)"><i class="fas fa-trash"></i></button>
                                <button type="button" class="btn btn-primary" onclick="editRow(this)"><i class="fas fa-edit"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div>
                    <p>3. Mục tiêu môn học/Course objectives:</p>
                    <button type="button" class="btn btn-primary mb-2" onclick="openModal('Thêm mục tiêu môn học', objectiveFormContent, saveCourseObject)">
                        <i class="fas fa-plus me-2"></i>Thêm mục tiêu
                    </button>
                    <table class="table" id="course-object" border="1">
                        <thead>
                        <tr>
                            <th scope="col">Mục tiêu môn học / Course objectives</th>
                            <th scope="col">Mô tả - Description</th>
                            <th scope="col"></th> <!-- New column for delete button -->
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>Understand basic calculus concepts</td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="deleteRow(this)"><i class="fas fa-trash"></i></button>
                                <button type="button" class="btn btn-primary" onclick="editRow(this)"><i class="fas fa-edit"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div>
                    <p>4. Chuẩn đầu ra (CĐR) môn học – Course learning outcomes (CLOs)</p>
                    <button type="button" class="btn btn-primary mb-2" onclick="openModal('Thêm đầu ra', courseOutComes, saveCourseObjectOutCome)">
                        <i class="fas fa-plus me-2"></i>Thêm nội dung
                    </button>
                    <table class="table table-bordered" id="course-outcome">
                        <thead>
                        <tr>
                            <th scope="col">Mục tiêu môn
                                học/Course
                                objectives
                            </th>
                            <th scope="col">Mô tả - Description</th>
                            <th scope="col"></th> <!-- New column for delete button -->
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div><div>
                <p>5. Điểm đánh giá/Rating:</p>
                <button type="button" class="btn btn-primary mb-2" onclick="openModal('Điểm dánh giá', courseRating, saveCourseObjectRating)">
                    <i class="fas fa-plus me-2"></i>Thêm mục
                </button>
                <table class="table" id="otherTable" >
                    <thead>
                    <tr>
                        <th scope="col">Thành phần đánh
                            giá/Type of
                            assessment</th>
                        <th scope="col">Bài đánh giá
                            Assessment
                            methods</th>
                        <th scope="col">Tỷ lệ %
                            Weight %
                        </th> <!-- New column for assessment score -->
                        <th scope="col"></th> <!-- New column for delete button -->
                    </tr>
                    </thead>
                    <tbody>
                    
                    </tbody>
                </table>
            </div>
            
            
            </div>
            
            <div>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save me-2"></i>Lưu thông tin
                </button>
                <button type="submit" class="btn btn-success">
                    <i class="fas fa-paper-plane me-2"></i>Gửi đề cương
                </button>
            
            </div>
        </form:form>
    </div>
    <div class="modal fade" id="universalModal" tabindex="-1" aria-labelledby="universalModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="universalModalLabel">Modal Title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="universalForm">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary" id="universalSaveButton">Lưu</button>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="<c:url value="/resources/JS/specification.js" />"></script>