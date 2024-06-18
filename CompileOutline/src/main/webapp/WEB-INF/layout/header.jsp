<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    a {
        text-decoration: none;
    }

    .nav-header .nav-link-header {
        color: white;
        transition: color 0.3s ease;
        padding: 10px 15px;
        margin-right: 10px;
    }

    .nav-header .nav-link-header:hover {
        background-color: rgba(255, 255, 255, 0.1);
        border-radius: 20px;
        color: #ffffff;
        text-decoration: none;
    }

    .nav-header .nav-link-header i {
        margin-right: 8px;
    }

    .nav-header .nav-item {
        margin-bottom: 10px;
    }
</style>
</head>
<body>
<header class="bg-dark py-3">
    <div class="mx-2">
        <div class="d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center">
                <sec:authorize access="hasRole('ADMIN')">
                    <a class="navbar-brand text-white" href="<c:url value="/" />">Admin Dashboard</a>
                </sec:authorize>
                <sec:authorize access="hasRole('LECTURER')">
                    <a class="navbar-brand text-white" href="<c:url value="/specification/" />">Biên soạn đề cương</a>
                    <div class="d-none d-md-block ms-3"> <!-- Show this div only on medium and larger screens -->
                        <div class="nav nav-header" style="margin-top: 10px">
                            <p class="nav-item">
                                <a href="<c:url value="/specification/"/> " class="nav-link-header">
                                    <i class="fas fa-file-alt"></i>
                                    <span class="ms-1">Biên Soạn đề cương</span>
                                </a>
                            </p>
                            <p class="nav-item">
                                <a href="<c:url value="/assignment/" />" class="nav-link-header">
                                    <i class="fas fa-envelope"></i>
                                    <span class="ms-1">Nhắn tin</span>
                                </a>
                            </p>
                        </div>
                    </div>
                </sec:authorize>

            </div>
            <sec:authorize access="hasRole('ADMIN')">
            
            <div class="d-flex align-items-center">
                <button class="btn d-md-none" onclick="toggleSidebar()">
                    <i class="fas fa-bars menu-icon fs-5 text-white"></i>
                </button>
            </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <div class="dropdown my-auto ms-3">
                        <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
                           id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="d-none d-sm-inline fw-bolder">
                                Chào mừng  <sec:authentication property="principal.username"/>
                            </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right p-2 rounded-sm"
                             aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">Thông tin hồ sơ</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="<c:url value="/logout" />">Đăng xuất</a>
                        </div>
                    </div>
                </sec:authorize>
                <sec:authorize access="!isAuthenticated()">
                    <a class="btn btn-success" href="<c:url value='/login' />">Đăng nhập</a>
                </sec:authorize>
            </div>
        </div>
    </div>
</header>


