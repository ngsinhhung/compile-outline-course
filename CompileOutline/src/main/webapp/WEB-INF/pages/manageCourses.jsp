<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container mt-4">
    <h1 class="h3 mb-4">Quản lý môn học</h1>
    <!-- Form to add new course -->
    <form id="addCourseForm" class="mb-4">
        <div class="row mb-2">
            <div class="form-group col-md-6">
                <label for="courseName">Tên môn học:</label>
                <input type="text" class="form-control" id="courseName" name="courseName" required>
            </div>
            <div class="form-group col-md-6">
                <label for="department">Khoa:</label>
                <select class="form-control" id="department" name="department" required>
                    <option value="" disabled selected>Chọn khoa</option>
                    <option value="Khoa A">Khoa A</option>
                    <option value="Khoa B">Khoa B</option>
                    <option value="Khoa C">Khoa C</option>
                </select>
            </div>
        </div>
        <div id="editButtonGroup" class="d-none">
            <button type="button" class="btn btn-primary mr-2" onclick="confirmEdit()">Xác nhận chỉnh sửa</button>
            <button type="button" class="btn btn-secondary" onclick="cancelEdit()">Hủy</button>
        </div>
        <button type="submit" class="btn btn-primary mr-2" id="addCourseButton">Thêm môn học</button>
    </form>
    <!-- Table to display course list -->
    <table id="courseTable" class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên môn học</th>
            <th>Khoa</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td>Môn học 1</td>
            <td>Khoa A</td>
            <td>
                <button class="btn btn-info btn-sm" onclick="editCourse(1)">Chỉnh sửa</button>
                <button class="btn btn-danger btn-sm">Xóa</button>
            </td>
        </tr>
        <tr>
            <td>2</td>
            <td>Môn học 2</td>
            <td>Khoa B</td>
            <td>
                <button class="btn btn-info btn-sm" onclick="editCourse(2)">Chỉnh sửa</button>
                <button class="btn btn-danger btn-sm">Xóa</button>
            </td>
        </tr>
        <tr>
            <td>3</td>
            <td>Môn học 3</td>
            <td>Khoa C</td>
            <td>
                <button class="btn btn-info btn-sm" onclick="editCourse(3)">Chỉnh sửa</button>
                <button class="btn btn-danger btn-sm">Xóa</button>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<script>
    // Function to handle editing course
    function editCourse(courseId) {
        var courseName = document.getElementById("courseTable").rows[courseId].cells[1].innerText;
        var department = document.getElementById("courseTable").rows[courseId].cells[2].innerText;

        document.getElementById("courseName").value = courseName;
        document.getElementById("department").value = department;
        document.getElementById("editButtonGroup").classList.remove("d-none");
        document.getElementById("addCourseButton").classList.add("d-none");
    }

    // Function to confirm edit
    function confirmEdit() {
        // Code to handle confirmation of course edit
        document.getElementById("addCourseButton").classList.remove("d-none");
        document.getElementById("editButtonGroup").classList.add("d-none");
        document.getElementById("courseName").value = "";
        document.getElementById("department").value = "";
        document.getElementById("editButtonGroup").classList.add("d-none");
        document.getElementById("addCourseButton").classList.remove("d-none");
    }

    // Function to cancel edit
    function cancelEdit() {
        document.getElementById("courseName").value = "";
        document.getElementById("department").value = "";
        document.getElementById("editButtonGroup").classList.add("d-none");
        document.getElementById("addCourseButton").classList.remove("d-none");
    }
</script>


