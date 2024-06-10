<%--
  Created by IntelliJ IDEA.
  User: Hùng's Dell
  Date: 03/06/2024
  Time: 12:48 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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
</head>
<style>

</style>
<body>
<tiles:insertAttribute name="header"/>
<div class="container-fluid">
    <div class="row flex-nowrap" style="color: #000;">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center text-decoration-none align-items-sm-start px-3 pt-2 min-vh-100">
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item w-100 my-1">
                        <a href="#" class="nav-link align-middle px-0">
                            <span class="ms-1 d-none d-sm-inline">Quản lý đề cương</span>
                        </a>
                    </li>
                    <li class="nav-item w-100 my-1">
                        <a href="#" class="nav-link px-0 align-middle">
                            <span class="ms-1 d-none d-sm-inline">Phân công biên soạn</span>
                        </a>
                    </li>
                    <li class="nav-item w-100 my-1">
                        <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <span class="ms-1 d-none d-sm-inline">Quản lý đào đạo</span> </a>
                        <ul class="collapse show nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0 ms-3"> <span class="d-none d-sm-inline">Khoa</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0 ms-3"> <span class="d-none d-sm-inline">Môn học</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item w-100 my-1">
                        <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
                            <span class="ms-1 d-none d-sm-inline">Quản lý tài khoản</span></a>
                        <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0 ms-3"> <span class="d-none d-sm-inline">Tài khoản quản trị</span></a>
                            </li>
                            <li class="w-100">
                                <a href="#" class="nav-link px-0 ms-3"> <span class="d-none d-sm-inline">Tài khoản giảng viên</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0 ms-3"> <span class="d-none d-sm-inline">Tài khoản sinh viên</span></a>
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
        <div class="col py-3">
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
</html>
