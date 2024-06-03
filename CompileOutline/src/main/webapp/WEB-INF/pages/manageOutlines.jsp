<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
