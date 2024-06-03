<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/3/2024
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<header class="bg-primary text-white shadow-sm">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center py-3">
            <a href="/CompileOutline" class="text-white h4 mb-0">Admin Dashboard</a>
            <nav>
                <a href="/CompileOutline/admin/manage-outlines" class="text-white ml-3">Quản lý đề cương</a>
                <a href="/CompileOutline/admin/manage-accounts" class="text-white ml-3">Quảng lý tài khoản sinh viên</a>
                <a href="/CompileOutline/admin/manage-courses" class="text-white ml-3">Quản lý các môn học</a>
                <a href="/CompileOutline/admin/assignment-teacher" class="text-white ml-3">Phân công biên soạn</a>
            </nav>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="userMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="https://www.svgrepo.com/show/382095/female-avatar-girl-face-woman-user-4.svg" class="rounded-circle" alt="User Avatar" width="30" height="30">
                </button>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userMenuButton">
                    <a class="dropdown-item" href="#">Thông tin cá nhân</a>
                    <a class="dropdown-item" href="#">Đăng xuất</a>
                </div>
            </div>
        </div>
    </div>
</header>

<div class="py-4">
    <div class="container">
        <div class="mt-4">
            <h2 class="h4">Danh sách môn học chưa có đề cương</h2>
            <p>Danh sách đề cương tổng cộng : 4</p>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Mã môn</th>
                    <th scope="col">Tên môn</th>
                    <th scope="col">Khoa</th>
                    <th scope="col">Giảng viên biên soạn</th>
                    <th scope="col">Thao Tác</th>
                </tr>
                </thead>
                <tbody>
                <!-- Dữ liệu môn học chưa có đề cương sẽ được thêm từ backend -->
                <tr>
                    <td>1</td>
                    <td>CSE101</td>
                    <td>Introduction to Computer Science</td>
                    <td>Computer Science</td>
                    <td>
                        <select class="form-control">
                            <option>Giảng viên A</option>
                            <option>Giảng viên B</option>
                            <option>Giảng viên C</option>
                        </select>
                    </td>
                    <td>
                        <button class="btn btn-primary">Lưu</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>MATH201</td>
                    <td>Calculus</td>
                    <td>Mathematics</td>
                    <td>
                        <select class="form-control">
                            <option>Giảng viên A</option>
                            <option>Giảng viên B</option>
                            <option>Giảng viên C</option>
                        </select>
                    </td>
                    <td>
                        <button class="btn btn-primary">Lưu</button>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>ENG101</td>
                    <td>English Composition</td>
                    <td>English</td>
                    <td>
                        <select class="form-control">
                            <option>Giảng viên A</option>
                            <option>Giảng viên B</option>
                            <option>Giảng viên C</option>
                        </select>
                    </td>
                    <td>
                        <button class="btn btn-primary">Lưu</button>
                    </td>
                </tr>
                </tbody>
            </table>
            <!-- Pagination -->
            <nav aria-label="Page navigation example">
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

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    // Toggle user menu
    $('#userMenuButton').on('click', function () {
        $(this).next('.dropdown-menu').toggle();
    });

    // Close user menu when clicking outside
    $(window).on('click', function (e) {
        if (!$(e.target).closest('#userMenuButton').length) {
            $('.dropdown-menu').hide();
        }
    });
</script>
</body>
</html>
