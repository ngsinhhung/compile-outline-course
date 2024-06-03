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
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="/CompileOutline">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                       <a class="nav-link text-white"  href="/CompileOutline/admin/manage-outlines">Quản lý đề cương</a>
                    </li>
                    <li class="nav-item">
                       <a class="nav-link text-white"  href="/CompileOutline/admin/manage-accounts">Quản lý tài khoản sinh viên</a>
                    </li>
                    <li class="nav-item">
                       <a class="nav-link text-white"  href="/CompileOutline/admin/manage-courses">Quản lý các môn học</a>
                    </li>
                    <li class="nav-item">
                       <a class="nav-link text-white"  href="/CompileOutline/admin/assignment-teacher">Phân công biên soạn</a>
                    </li>
                </ul>
                <div class="dropdown">
                    <button class="btn btn-primary dropdown-toggle" type="button" id="userMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="https://www.svgrepo.com/show/382095/female-avatar-girl-face-woman-user-4.svg" class="rounded-circle" alt="User Avatar" width="30" height="30">
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userMenuButton">
                        <a class="dropdown-item" href="#">Thông tin cá nhân</a>
                        <a class="dropdown-item" href="#">Đăng xuất</a>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</header>

<div class="py-4">
    <div class="container">
        <div class="container mt-4">
            <div class="card shadow-sm rounded-sm">
                <div class="card-body">
                    <h1 class="card-title">Chào mừng trở lại Nguyễn Sinh Hùng 👋</h1>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <div class="card shadow" style="background-color: #3b82f680;">
                                <div class="card-body rounded-sm">
                                    <h5 class="card-title font-weight-bold text-dark">Tổng học sinh</h5>
                                    <p class="card-text h3 text-dark">1,234</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="card shadow bg-success text-white">
                                <div class="card-body">
                                    <h5 class="card-title font-weight-bold">Tổng các môn học</h5>
                                    <p class="card-text h3">56</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="card shadow bg-warning text-white">
                                <div class="card-body">
                                    <h5 class="card-title font-weight-bold">Đề cương Đã Nộp</h5>
                                    <p class="card-text h3">12</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
