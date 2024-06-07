<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="container mt-4">
    <h1 class="h3 mb-4">Quản lý tài khoản</h1>
    <ul class="nav nav-tabs" id="accountTabs" role="tablist">
        <li class="nav-item ">
            <a class="nav-link active" id="students-tab" data-bs-toggle="tab" href="#students" role="tab" aria-controls="students" aria-selected="true">Tài khoản sinh viên</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="teachers-tab" data-bs-toggle="tab" href="#teachers" role="tab" aria-controls="teachers" aria-selected="false">Tài khoản giảng viên</a>
        </li>
    </ul>
    <div class="tab-content" id="accountTabsContent">
        <div class="tab-pane fade show active" id="students" role="tabpanel" aria-labelledby="students-tab">
            <div class="mt-4">
                <h2 class="h5">Danh sách tài khoản sinh viên</h2>
                <button type="button" class="btn btn-primary mb-3" id="addStudentAccount">Thêm tài khoản sinh viên</button>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">User Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>John Doe</td>
                        <td>john@example.com</td>
                        <td>
                            <span class="badge bg-success text-white">Active</span>
                        </td>
                        <td class="action-icons">
                            <i class="fas fa-toggle-on text-success" title="Deactivate"></i>
                            <i class="fas fa-trash-alt text-danger" title="Delete"></i>
                        </td>
                    </tr>
                    <tr>
                        <td>Jane Doe</td>
                        <td>jane@example.com</td>
                        <td>
                            <span class="badge bg-danger text-white">Inactive</span>
                        </td>
                        <td class="action-icons">
                            <i class="fas fa-toggle-off text-secondary" title="Activate"></i>
                            <i class="fas fa-trash-alt text-danger" title="Delete"></i>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="tab-pane fade" id="teachers" role="tabpanel" aria-labelledby="teachers-tab">
            <div class="mt-4">
                <h2 class="h5">Danh sách tài khoản giảng viên</h2>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">User Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>David Smith</td>
                        <td>david@example.com</td>
                        <td>
                            <span class="badge bg-success text-white">Active</span>
                        </td>
                        <td class="action-icons">
                            <i class="fas fa-toggle-on text-success" title="Deactivate"></i>
                            <i class="fas fa-trash-alt text-danger" title="Delete"></i>
                        </td>
                    </tr>
                    <tr>
                        <td>Emily Johnson</td>
                        <td>emily@example.com</td>
                        <td>
                            <span class="badge bg-warning text-dark">Inactive</span>
                        </td>
                        <td class="action-icons">
                            <i class="fas fa-toggle-off text-secondary" title="Activate"></i>
                            <i class="fas fa-trash-alt text-danger" title="Delete"></i>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="studentAccountModal" tabindex="-1" role="dialog" aria-labelledby="studentAccountModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="studentAccountModalLabel">Thêm tài khoản sinh viên</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" placeholder="Username">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Password">
                    </div>
                    <div class="mb-3">
                        <label for="role" class="form-label">Role</label>
                        <input type="text" class="form-control" id="role" value="STUDENT" readonly>
                    </div>
                    <div class="form-check form-switch mb-3">
                        <input class="form-check-input" type="checkbox" id="is_active">
                        <label class="form-check-label" for="is_active">Is Active</label>
                    </div>
                    <button type="submit" class="btn btn-primary">Tạo</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value="/resources/JS/manageAccount.js" />"></script>
