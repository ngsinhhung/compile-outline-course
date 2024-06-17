<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                <a class="navbar-brand text-white" href="<c:url value="/" />">Admin Dashboard</a>
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
            </div>
            <div class="d-flex align-items-center">
                <button class="btn d-md-none" onclick="toggleSidebar()">
                    <i class="fas fa-bars menu-icon fs-5 text-white" ></i>
                </button>
                <div class="dropdown my-auto ms-3">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://github.com/mdo.png" alt="hugenerd" width="30" height="30" class="rounded-circle me-2">
                        <span class="d-none d-sm-inline fw-bolder">Ngô Trịnh Minh Tâm</span>
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


