<%--
  Created by IntelliJ IDEA.
  User: Hùng's Dell
  Date: 03/06/2024
  Time: 12:48 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <tiles:insertAttribute name="title"/>
    </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
          integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
          crossorigin="anonymous"/>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
    />
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        html ::-webkit-scrollbar {
            width: 10px;
        }
        html ::-webkit-scrollbar-thumb {
            border-radius: 4px;
            background-color: rgba(22, 24, 35, 0.06);
        }
        body {
            font-family: 'Roboto', sans-serif;
            background-color: rgb(231 229 228);
            color: #343a40;
            font-size: 16px;
        }

        .sidebar {
            background-color: #ffffff;
            color: #343a40;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s;
            height: 100vh;
           
        }

        .sidebar a {
            color: #343a40;
            text-decoration: none;
            font-size: 1.1rem;
            transition: color 0.3s;
        }

        .sidebar a:hover {
            color: #007bff;
        }

        .sidebar .nav-link.active {
            background-color: rgba(0, 123, 255, 0.1);
            color: #007bff;
        }

        .sidebar .collapse .nav-link {
            padding-left: 30px;
        }

        .sidebar .collapse.show .nav-link {
            background-color: rgba(0, 123, 255, 0.2);
            color: #007bff;
        }

        .content {
            background-color: #ffffff;
            padding: 30px;
            height: 100vh;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s;
        }
        .sidebar-header{
            display: none !important;
        }

        @media (max-width: 767px) {
            .sidebar {
                width: 100%;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1000;
                display: none;
            }

            .sidebar.active {
                display: block;
                width: 90%;
            }

            .content {
                margin-left: 0;
            }

            .sidebar-header {
                display: block !important;
            }
            .name-app {
                display: none;
            }

            .sidebar-header h4 {
                display: block !important;;
            }
            .sidebar-header{
                display: block !important;;
            }
            .name-app h5 {
                display: block;
            }
        }


    </style>
</head>
<body>
<tiles:insertAttribute name="header"/>
<div class="container-fluid">
    <div class="row">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 sidebar">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 min-vh-100">
                <div class="name-app">
                    <h5 class="fw-bold" style="font-size: 23px">
                        <i class="fas fa-book"></i>
                        Quản lý đề cương
                    </h5>
                </div>
                <div class="sidebar-header  w-100 mb-3">
                    <i class="fas fa-times close-icon" style="color: black" onclick="toggleSidebar()"></i>
                </div>
                <ul class="nav nav-pills " id="menu">
                    <li class="nav-item w-100 my-1">
                        <a href="#" class="nav-link align-middle px-0">
                            <i class="fas fa-th-large"></i>
                            <span class="ms-1 ">Quản lý đề cương</span>
                        </a>
                    </li>
                    <li class="nav-item w-100 my-1">
                        <a href="#" class="nav-link px-0 align-middle">
                            <i class="fas fa-tasks"></i>
                            <span class="ms-1 ">Phân công biên soạn</span>
                        </a>
                    </li>
                    <li class="nav-item w-100 my-1">
                        <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fas fa-graduation-cap"></i>
                            <span class="ms-1 ">Quản lý đào tạo</span>
                        </a>
                        <ul class="collapse show nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="<c:url value="/faculty/"/>" class="nav-link p-2 mb-3">
                                    <i class="fas fa-university"></i>
                                    <span class="">Khoa</span>
                                </a>
                            </li>
                            <li>
                                <a href="<c:url value="/subject/"/>" class="nav-link p-2 mb-3">
                                    <i class="fas fa-book"></i>
                                    <span class="">Môn học</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item w-100 my-1">
                        <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fas fa-user"></i>
                            <span class="ms-1 ">Quản lý tài khoản</span>
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link p-2 mb-3">
                                    <i class="fas fa-user-shield"></i>
                                    <span class="">Tài khoản quản trị</span>
                                </a>
                            </li>
                            <li class="w-100">
                                <a href="<c:url value="/users/lecturer" />" class="nav-link p-2 mb-3">
                                    <i class="fas fa-chalkboard-teacher"></i>
                                    <span class="">Tài khoản giảng viên</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link p-2 mb-3">
                                    <i class="fas fa-user-graduate"></i>
                                    <span class="">Tài khoản sinh viên</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <%--                    <li class="nav-item w-100 my-1">--%>
                    <%--                        <a href="#submenu3" data-bs-toggle="collapse" class="nav-link px-0 align-middle">--%>
                    <%--                            <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline">Products</span> </a>--%>
                    <%--                        <ul class="collapse nav flex-column ms-1" id="submenu3" data-bs-parent="#menu">--%>
                    <%--                            <li class="w-100">--%>
                    <%--                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Product</span> 1</a>--%>
                    <%--                            </li>--%>
                    <%--                            <li>--%>
                    <%--                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Product</span> 2</a>--%>
                    <%--                            </li>--%>
                    <%--                            <li>--%>
                    <%--                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Product</span> 3</a>--%>
                    <%--                            </li>--%>
                    <%--                            <li>--%>
                    <%--                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Product</span> 4</a>--%>
                    <%--                            </li>--%>
                    <%--                        </ul>--%>
                    <%--                    </li>--%>

                </ul>
            </div>
        </div>
        <div class="col content">
            <tiles:insertAttribute name="content"/>
        </div>
    </div>
</div>
<tiles:insertAttribute name="footer"/>
</body>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"
></script>
<script>
    function toggleSidebar() {
        document.querySelector('.sidebar').classList.toggle('active');
    }


</script>
</body>
</html>

