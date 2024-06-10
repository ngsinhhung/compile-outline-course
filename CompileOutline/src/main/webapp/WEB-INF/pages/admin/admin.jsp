<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/3/2024
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .card {
        border: none;
        border-radius: 10px;
        height: 150px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .card-body {
        text-align: center;
        font-size: 20px;
        height: 150px;
    }
</style>
<div class="container">
    <div class=" card shadow-sm rounded-sm">
        <div class="card-body">
            <h1 class="card-title">Chào mừng trở lại Nguyễn Sinh Hùng 👋</h1>
            <div class="row">
                <div class="col-md-4 mb-3">
                    <div class="card shadow" style="background-color: #f3f4f6;">
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
