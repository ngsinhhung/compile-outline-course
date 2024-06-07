<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container mt-4">
    <h1 class="h3 mb-4">Quản lý</h1>
    
    <!-- Tabs navigation -->
    <ul class="nav nav-tabs" id="managementTabs" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="courses-tab" data-bs-toggle="tab" href="#courses" role="tab" aria-controls="courses" aria-selected="true">Môn học</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="departments-tab" data-bs-toggle="tab" href="#departments" role="tab" aria-controls="departments" aria-selected="false">Khoa</a>
        </li>
    </ul>
    
    <div class="tab-content" id="managementTabsContent">
        <!-- Courses Tab -->
        <div class="tab-pane fade show active" id="courses" role="tabpanel" aria-labelledby="courses-tab">
            <h2 class="h4 mt-4">Quản lý môn học</h2>
            <!-- Form to add new course -->
            <form id="addCourseForm" class="mb-4">
                <div class="row mb-2">
                    <div class="form-group col-md-6">
                        <label for="courseName">Tên môn học:</label>
                        <input type="text" class="form-control" id="courseName" name="courseName" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="department">Khoa:</label>
                        <select class="form-select" id="department" name="department" required>
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
        
        <!-- Departments Tab -->
        <div class="tab-pane fade" id="departments" role="tabpanel" aria-labelledby="departments-tab">
            <h2 class="h4 mt-4">Quản lý khoa</h2>
            <!-- Form to add new department -->
            <form id="addDepartmentForm" class="mb-4">
                <div class="row mb-2">
                    <div class="form-group col-md-6">
                        <label for="departmentName">Tên khoa:</label>
                        <input type="text" class="form-control" id="departmentName" name="departmentName" required>
                    </div>
                </div>
                <div id="editDepartmentButtonGroup" class="d-none">
                    <button type="button" class="btn btn-primary mr-2" onclick="confirmDepartmentEdit()">Xác nhận chỉnh sửa</button>
                    <button type="button" class="btn btn-secondary" onclick="cancelDepartmentEdit()">Hủy</button>
                </div>
                <button type="submit" class="btn btn-primary mr-2" id="addDepartmentButton">Thêm khoa</button>
            </form>
            <!-- Table to display department list -->
            <table id="departmentTable" class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên khoa</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Khoa A</td>
                    <td>
                        <button class="btn btn-info btn-sm" onclick="editDepartment(1)">Chỉnh sửa</button>
                        <button class="btn btn-danger btn-sm">Xóa</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Khoa B</td>
                    <td>
                        <button class="btn btn-info btn-sm" onclick="editDepartment(2)">Chỉnh sửa</button>
                        <button class="btn btn-danger btn-sm">Xóa</button>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Khoa C</td>
                    <td>
                        <button class="btn btn-info btn-sm" onclick="editDepartment(3)">Chỉnh sửa</button>
                        <button class="btn btn-danger btn-sm">Xóa</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script>
    // Function to handle editing course
    function editCourse(courseId) {
        var courseTable = document.getElementById("courseTable");
        var courseName = courseTable.rows[courseId].cells[1].innerText;
        var department = courseTable.rows[courseId].cells[2].innerText;

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
    }

    // Function to cancel edit
    function cancelEdit() {
        document.getElementById("courseName").value = "";
        document.getElementById("department").value = "";
        document.getElementById("editButtonGroup").classList.add("d-none");
        document.getElementById("addCourseButton").classList.remove("d-none");
    }

    // Function to handle editing department
    function editDepartment(departmentId) {
        var departmentTable = document.getElementById("departmentTable");
        var departmentName = departmentTable.rows[departmentId].cells[1].innerText;

        document.getElementById("departmentName").value = departmentName;
        document.getElementById("editDepartmentButtonGroup").classList.remove("d-none");
        document.getElementById("addDepartmentButton").classList.add("d-none");
    }

    // Function to confirm department edit
    function confirmDepartmentEdit() {
        // Code to handle confirmation of department edit
        document.getElementById("addDepartmentButton").classList.remove("d-none");
        document.getElementById("editDepartmentButtonGroup").classList.add("d-none");
        document.getElementById("departmentName").value = "";
    }

    // Function to cancel department edit
    function cancelDepartmentEdit() {
        document.getElementById("departmentName").value = "";
        document.getElementById("editDepartmentButtonGroup").classList.add("d-none");
        document.getElementById("addDepartmentButton").classList.remove("d-none");
    }

    </script>