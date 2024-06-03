<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/3/2024
  Time: 1:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<header class="bg-primary text-white shadow-md">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center py-3">
            <div class="d-flex align-items-center">
                <a href="/CompileOutline" class="text-xl font-bold text-white">
                    Admin Dashboard
                </a>
                <nav class="ml-4 d-none d-sm-flex">
                    <a href="/CompileOutline/admin/manage-outlines" class="nav-link text-white">Quản lý đề cương</a>
                    <a href="/CompileOutline/admin/manage-accounts" class="nav-link text-white">Quảng lý tài khoản sinh viên</a>
                    <a href="/CompileOutline/admin/manage-courses" class="nav-link text-white">Quản lý các môn học</a>
                </nav>
            </div>
            <div class="d-flex align-items-center">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="userMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="https://www.svgrepo.com/show/382095/female-avatar-girl-face-woman-user-4.svg" alt="" class="rounded-circle" style="height: 30px;">
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userMenuButton">
                        <a class="dropdown-item" href="#">Thông tin cá nhân</a>
                        <a class="dropdown-item" href="#">Đăng xuất</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="container mt-4">
    <h1 class="h3 mb-4">Quản lý tài khoản sinh viên</h1>
    
    <div class="mb-4">
        <h2 class="h5">Danh sách tài khoản sinh viên</h2>
        <ul class="list-group">
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <div class="d-flex align-items-center">
                    <img class="rounded-circle mr-2" src="https://randomuser.me/api/portraits/men/1.jpg" alt="Student Avatar" style="height: 40px;">
                    <span class="font-weight-bold">Nguyễn Văn A</span>
                </div>
                <div>
                    <button class="btn btn-primary btn-sm mr-2">Sửa</button>
                    <button class="btn btn-danger btn-sm">Xóa</button>
                </div>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <div class="d-flex align-items-center">
                    <img class="rounded-circle mr-2" src="https://randomuser.me/api/portraits/women/2.jpg" alt="Student Avatar" style="height: 40px;">
                    <span class="font-weight-bold">Trần Thị B</span>
                </div>
                <div>
                    <button class="btn btn-primary btn-sm mr-2">Sửa</button>
                    <button class="btn btn-danger btn-sm">Xóa</button>
                </div>
            </li>
        </ul>
    </div>
    
    <button class="btn btn-primary" onclick="openModal()">Tạo tài khoản sinh viên</button>
</div>

<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tạo tài khoản sinh viên</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="avatar">Avatar:</label>
                        <input type="file" class="form-control" id="avatar" name="avatar">
                    </div>
                    <div class="form-group">
                        <label for="firstName">Họ:</label>
                        <input type="text" class="form-control" id="firstName" name="firstName">
                    </div>
                    <div class="form-group">
                        <label for="lastName">Tên:</label>
                        <input type="text" class="form-control" id="lastName" name="lastName">
                    </div>
                    <div class="form-group">
                        <label for="username">Tên Tài Khoản:</label>
                        <input type="text" class="form-control" id="username" name="username">
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu:</label>
                        <input type="password" class="form-control" id="password" name="password">
                    </div>
                    <div class="text-right">
                        <button type="submit" class="btn btn-primary">Tạo tài khoản</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function openModal() {
        $('#myModal').modal('show');
    }

    function closeModal() {
        $('#myModal').modal('hide');
    }
</script>
</body>
</html>
