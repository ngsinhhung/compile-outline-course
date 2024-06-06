<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<div class="py-4">
    <div class="container">
        <div class="mt-4">
            <h2 class="h4">Danh sách môn học chưa có đề cương</h2>
            <p>Danh sách đề cương tổng cộng : 4</p>
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <!-- Dữ liệu môn học chưa có đề cương sẽ được thêm từ backend -->
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Ma Mon : CSE101</h5>
                            <p class="card-text">Ten Mon : Introduction to Computer Science</p>
                            <p class="card-text"> Khoa : Computer Science</p>
                            <select class="form-control mb-2">
                                <option>Giảng viên A</option>
                                <option>Giảng viên B</option>
                                <option>Giảng viên C</option>
                            </select>
                            <button class="btn btn-primary">Lưu</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Ma Mon : CSE101</h5>
                            <p class="card-text">Ten Mon : Introduction to Computer Science</p>
                            <p class="card-text"> Khoa : Computer Science</p>
                            <select class="form-control mb-2">
                                <option>Giảng viên A</option>
                                <option>Giảng viên B</option>
                                <option>Giảng viên C</option>
                            </select>
                            <button class="btn btn-primary">Lưu</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Ma Mon : CSE101</h5>
                            <p class="card-text">Ten Mon : Introduction to Computer Science</p>
                            <p class="card-text"> Khoa : Computer Science</p>
                            <select class="form-control mb-2">
                                <option>Giảng viên A</option>
                                <option>Giảng viên B</option>
                                <option>Giảng viên C</option>
                            </select>
                            <button class="btn btn-primary">Lưu</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Pagination -->
            <nav aria-label="Page navigation example" style="margin-top: 10px">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
