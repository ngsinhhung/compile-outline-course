<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Outlines</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<header class="bg-primary text-white shadow-md">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center py-3">
            <div class="d-flex align-items-center">
                <a href="/CompileOutline" class="h4 text-white mb-0">
                    Admin Dashboard
                </a>
                <nav class="ml-4 d-none d-sm-flex">
                    <a href="/CompileOutline/admin/manage-outlines" class="nav-link text-white">Quản lý đề cương</a>
                    <a href="/CompileOutline/admin/manage-accounts" class="nav-link text-white">Quản lý tài khoản sinh viên</a>
                    <a href="/CompileOutline/admin/manage-courses" class="nav-link text-white">Quản lý các môn học</a>
                </nav>
            </div>
            <div class="d-flex align-items-center">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="userMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="https://www.svgrepo.com/show/382095/female-avatar-girl-face-woman-user-4.svg" alt="" class="rounded-circle" style="height: 30px;">
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userMenuButton">
                        <a class="dropdown-item" href="#">Thông tin cá nhân</a>
                        <a class="dropdown-item" href="#">Đăng xuất</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<main class="container mt-4">
    <div class="bg-white p-4 rounded-lg shadow-sm">
        <h1 class="h4 mb-4">Quản lý đề cương</h1>
        <div class="d-flex mb-4">
            <select class="custom-select w-25 mr-2" id="searchFilter">
                <option value="all">Tất cả</option>
                <option value="lecturer">Giảng viên</option>
                <option value="status">Tình trạng</option>
                <option value="outlineCode">Mã đề cương</option>
            </select>
            <input type="text" class="form-control w-50 mr-2" id="searchInput" placeholder="Search...">
            <button class="btn btn-primary" onclick="searchOutlines()">Search</button>
        </div>
        
        <table class="table table-bordered">
            <thead class="thead-light">
            <tr>
                <th>Id</th>
                <th>Mã đề cương</th>
                <th>Tên môn học</th>
                <th>Tình trạng đề cương</th>
                <th>Giảng viên biên soạn</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>DC001</td>
                <td>Môn học 1</td>
                <td>Đã nộp</td>
                <td>Nguyễn Văn A</td>
                <td>
                    <button class="btn btn-danger btn-sm">Delete</button>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>DC002</td>
                <td>Môn học 2</td>
                <td>Chưa nộp</td>
                <td>Trần Thị B</td>
                <td>
                    <button class="btn btn-danger btn-sm">Delete</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</main>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    // Search function
    function searchOutlines() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput").value.toUpperCase();
        var filterBy = document.getElementById("searchFilter").value;
        table = document.getElementsByTagName("table")[0];
        tr = table.getElementsByTagName("tr");
        for (i = 1; i < tr.length; i++) {
            var match = false;
            td = tr[i].getElementsByTagName("td");
            for (var j = 0; j < td.length; j++) {
                var cell = td[j];
                if (cell) {
                    txtValue = cell.textContent || cell.innerText;
                    if (filterBy === "all" || filterBy === "lecturer" && j === 4 || filterBy === "status" && j === 3 || filterBy === "outlineCode" && j === 1) {
                        if (txtValue.toUpperCase().indexOf(input) > -1) {
                            match = true;
                            break;
                        }
                    }
                }
            }
            if (match) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
</script>
</body>
</html>
