<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
    /* Custom styles */
    body {
        background-color: #f8f9fa;
        color: #343a40;
    }

    .card {
        background-color: #ffffff;
        border-radius: 15px;
        border: none;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .card-title {
        font-size: 1.25rem;
        color: #007bff;
        font-weight: bold;
    }

    .card-subtitle {
        font-size: 0.875rem;
        color: #6c757d;
    }

    .btn {
        border-radius: 10px;
        font-weight: bold;
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }

    .btn-success {
        background-color: #28a745;
        border-color: #28a745;
    }

    .btn-success:hover {
        background-color: #218838;
        border-color: #218838;
    }

    .page-link:hover {
        color: #007bff;
        text-decoration: none;
        background-color: #f8f9fa;
        border-color: #dee2e6;
    }

    .page-link:focus {
        box-shadow: none;
    }

</style>

<div class="container-fluid mt-5 py-4">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h6 class="text-center fs-5 mb-4">Soạn đề cương chi tiết</h6>
                <div class="card shadow">
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="selectSubject" class="form-label"><i class="fas fa-bookmark text-danger"></i>
                                Chọn môn học *</label>
                            <form action="${pageContext.request.contextPath}/specification/create" method="get">
                                <select class="form-select" id="selectSubject" name="assigmentId" aria-label="Chọn môn học">
                                    <c:forEach var="assigment" items="${assigment}">
                                        <option value="${assigment.id}">Môn Học :${assigment.subject.subjectName} - Khoa ${assigment.subject.faculty.facultyName}</option>
                                    </c:forEach>
                                </select>
                                <div class="d-grid mt-3">
                                    <button type="submit" class="btn btn-success">Biên soạn đề cương</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container mt-4">
        <h2 class="mb-4 text-center">Đề Cương của bạn</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="card mb-4 shadow">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Đề cương 1</h5>
                        <div class="card-text">
                            <p class="mb-2"><strong>Tên môn học:</strong> Toán học</p>
                            <p class="mb-2"><strong>Mã học:</strong> MATH101</p>
                            <p class="mb-2"><strong>Khoa:</strong> Khoa học tự nhiên</p>
                        
                        </div>
                        <div class="d-flex justify-content-between mt-3">
                            <a href="#" class="btn btn-primary d-flex align-items-center">
                                <i class="fas fa-eye me-1"></i> Xem chi tiết
                            </a>
                            <a href="#" class="btn btn-success d-flex align-items-center">
                                <i class="fas fa-edit me-1"></i> Sửa đề cương
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card mb-4 shadow">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Đề cương 2</h5>
                        <div class="card-text">
                            <p class="mb-2"><strong>Tên môn học:</strong> Vật lý</p>
                            <p class="mb-2"><strong>Mã học:</strong> PHYS101</p>
                            <p class="mb-2"><strong>Khoa:</strong> Khoa học tự nhiên</p>
                        </div>
                        <div class="d-flex justify-content-between mt-3">
                            <a href="#" class="btn btn-primary d-flex align-items-center">
                                <i class="fas fa-eye me-1"></i> Xem chi tiết
                            </a>
                            <a href="#" class="btn btn-success d-flex align-items-center">
                                <i class="fas fa-edit me-1"></i> Sửa đề cương
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card mb-4 shadow">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Đề cương 3</h5>
                        <div class="card-text">
                            <p class="mb-2"><strong>Tên môn học:</strong> Hóa học</p>
                            <p class="mb-2"><strong>Mã học:</strong> CHEM101</p>
                            <p class="mb-2"><strong>Khoa:</strong> Khoa học tự nhiên</p>
                        </div>
                        <div class="d-flex justify-content-between mt-3">
                            <a href="xemChiTiet.jsp?deCuongId=3" class="btn btn-primary d-flex align-items-center">
                                <i class="fas fa-eye me-1"></i> Xem chi tiết
                            </a>
                            <a href="suaDeCuong.jsp?deCuongId=3" class="btn btn-success d-flex align-items-center">
                                <i class="fas fa-edit me-1"></i> Sửa đề cương
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">« Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next »</a>
                </li>
            </ul>
        </nav>
    
</div>
