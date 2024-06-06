<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .form-switch .form-check-input {
        width: 2.5em;
        height: 1.5em;
    }
    .form-switch .form-check-input:checked {
        background-color: #0d6efd;
        border-color: #0d6efd;
    }
</style>

<div class="container mt-4">
    <h1 class="h3 mb-4">Quản lý tài khoản</h1>
    <ul class="nav nav-tabs" id="accountTabs" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="students-tab" data-toggle="tab" href="#students" role="tab" aria-controls="students" aria-selected="true">Tài khoản sinh viên</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="teachers-tab" data-toggle="tab" href="#teachers" role="tab" aria-controls="teachers" aria-selected="false">Tài khoản giảng viên</a>
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
                            <span class="badge badge-success">Active</span>
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
                            <span class="badge badge-danger ui-state-active" >Inactive</span>
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
                            <span class="badge badge-success">Active</span>
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
                            <span class="badge badge-warning">Inactive</span>
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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" placeholder="Username">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Password">
                    </div>
                    <div class="mb-3">
                        <label for="role" class="form-label">Role</label>
                        <input type="text" class="form-control" id="role" value="STUDENT" readonly>
                    </div>
                    <div class="form-check form-switch mb-3 d-flex align-items-center">
                        <label class="form-check-label me-3" for="is_active">Is Active</label>
                        <input class="form-check-input" type="checkbox" id="is_active">
                    </div>
                    <button type="submit" class="btn btn-primary">Tạo</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/resources/JS/manageAccount.js" />"></script>
