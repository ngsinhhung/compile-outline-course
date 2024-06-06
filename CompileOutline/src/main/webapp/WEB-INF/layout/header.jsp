<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/CompileOutline">Admin Dashboard</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link text-white" href="/CompileOutline/admin/manage-outlines">Quản lý đề cương</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/CompileOutline/admin/manage-accounts">Quản lý tài khoản</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/CompileOutline/admin/manage-courses">Quản lý các môn học</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/CompileOutline/admin/assignment-teacher">Phân công biên soạn</a>
                </li>
            </ul>
            <div class="dropdown">
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userMenuButton">
                    <li><a class="dropdown-item" href="#">Thông tin cá nhân</a></li>
                    <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                </ul>
                <button class="btn btn-primary dropdown-toggle" type="button" id="userMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="https://www.svgrepo.com/show/382095/female-avatar-girl-face-woman-user-4.svg" class="rounded-circle" alt="User Avatar" width="30" height="30">
                </button>
            </div>
        
        
        
        </div>
    </div>
</nav>
