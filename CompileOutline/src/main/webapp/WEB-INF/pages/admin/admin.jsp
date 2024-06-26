<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/3/2024
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <p class="text-danger">Cập nhật đến ${updateTime}</p>
    <div class=" card shadow-sm rounded-sm">
        <div class="card-body">
            <h1 class="card-title">
                Chào mừng trở lại, <sec:authentication property="principal.username"/>
                👋</h1>
            <div class="row">
                <div class="col-md-4 mb-3">
                    <div class="card shadow" style="background-color: #f3f4f6;">
                        <div class="card-body rounded-sm">
                            <h5 class="card-title font-weight-bold text-dark">Tổng học sinh</h5>
                            <p class="card-text h3 text-dark">${countStudent}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card shadow bg-success text-white">
                        <div class="card-body">
                            <h5 class="card-title font-weight-bold">Tổng các môn học</h5>
                            <p class="card-text h3">${countSubject}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card shadow bg-warning text-white">
                        <div class="card-body">
                            <h5 class="card-title font-weight-bold">Đề cương Đã Nộp</h5>
                            <p class="card-text h3">${countSpecSubmitted}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row d-flex align-items-center" style="margin-top: 80px">
    <div class="col">
        <form>
            <div class="form-floating mb-3 mt-3">
                <input type="text" value="${param.year}" class="form-control" id="year" placeholder="Năm" name="year">
                <label for="year">Năm</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <select class="form-select" id="period" name="period">
                    <option value="MONTH" selected>Theo tháng</option>
                    <option value="QUARTER" >Theo quý</option>
                </select>
                <label for="period" class="form-label">Chọn thời gian</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <button class="btn btn-success">Lọc</button>
            </div>
        </form>
        <div>
            <canvas id="statsSpecSubmit"></canvas>
        </div>
    </div>
    <div class="col">
        <canvas id="statsEmotionFeedbackBySpec"></canvas>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    function drawChart(ctx, labels, data, title) {
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: title,
                    data: data,
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

    let labels1 = []
    let data1 = []
    <c:forEach items="${statsSpecSubmit}" var="s">
        labels1.push("${s[0]}")
        data1.push(${s[1]})
    </c:forEach>
    console.log(labels1)
    console.log(data1)



    window.onload = function (){
        let ctx1 = document.getElementById('statsSpecSubmit');
        drawChart(ctx1, labels1, data1, 'Thống kê số lượng đề cương nộp theo tháng');

        let ctx2 = document.getElementById('myChart2');


    }
</script>
