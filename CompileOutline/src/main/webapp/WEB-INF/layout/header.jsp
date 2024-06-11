<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hùng's Dell
  Date: 10/06/2024
  Time: 12:38 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header  style="height: 60px;background-color: rgb(15 23 42)">
    <div class="container-fluid pt-2 pb-2">
        <div class="d-flex justify-content-between align-items-center">
            <a class="navbar-brand text-white "  style="color: black" href="<c:url value="/" /> ">Admin Dashboard</a>
            <div class="d-flex align-items-center">
                <button class="btn d-md-none">
                    <i class="fas fa-bars menu-icon fs-5"  style="color: white" onclick="toggleSidebar()"></i>
                </button>
                <div class="dropdown my-auto me-5" style=" padding: 5px;">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://github.com/mdo.png" alt="hugenerd" width="30" height="30" class="rounded-circle me-2">
                        <span class="d-none d-sm-inline fw-bolder " style="color: white">Ngô Trịnh Minh Tâm</span>
                    </a>
                    
                    <div class="dropdown-menu dropdown-menu-right p-2 rounded-sm" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">Thông tin hồ sơ</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Đăng xuất</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
