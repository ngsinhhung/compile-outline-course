<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/17/2024
  Time: 5:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

    .sidebar {
        background-color: #ffffff;
        color: #343a40;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: all 0.3s;
        width: 240px;
        min-height:calc(100vh - 65px);

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

    .sidebar-header {
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
            display: block !important;
        }

        .sidebar-header {
            display: block !important;
        }

        .name-app h5 {
            display: block;
        }
    }
</style>
<aside class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 sidebar">
    <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 ">
        <div class="name-app">
            <h5 class="fw-bold" style="font-size: 16px">
                <i class="fas fa-book" style="font-size: 16px"></i>
                Teacher Dashboard
            </h5>
        </div>
        <div class="sidebar-header  w-100 mb-3">
            <i class="fas fa-times close-icon" style="color: black" onclick="toggleSidebar()"></i>
        </div>
        <ul class="nav nav-pills " id="menu">
            <li class="nav-item w-100 my-1">
                <a href="#" class="nav-link align-middle px-0">
                    <i class="fas fa-file-alt"></i>
                    <span class="ms-1 ">Biên Soạn đề cương</span>
                </a>
            </li>
            <li class="nav-item w-100 my-1">
                <a href="<c:url value="/assignment/" />" class="nav-link px-0 align-middle">
                    <i class="fas fa-envelope"></i>
                    <span class="ms-1 ">Nhắn tin</span>
                </a>
            </li>
        </ul>
    </div>
</aside>

