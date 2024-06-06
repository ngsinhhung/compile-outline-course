<%--
  Created by IntelliJ IDEA.
  User: Hùng's Dell
  Date: 03/06/2024
  Time: 12:50 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <a class="nav-link text-white fs-5"  href="/CompileOutline/admin/manage-outlines">Quản lý đề cương</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white fs-5"  href="/CompileOutline/admin/manage-accounts">Quản lý tài khoản</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white fs-5"  href="/CompileOutline/admin/manage-courses">Quản lý các môn học</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white fs-5"  href="/CompileOutline/admin/assignment-teacher">Phân công biên soạn</a>
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
