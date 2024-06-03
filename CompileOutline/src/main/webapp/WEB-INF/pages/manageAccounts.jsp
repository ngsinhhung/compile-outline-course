<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/3/2024
  Time: 1:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container mt-4">
    <h1 class="h3 mb-4">Quản lý tài khoản sinh viên</h1>
    
    <div class="mb-4">
        <h2 class="h5">Danh sách tài khoản sinh viên</h2>
        <ul class="list-group">
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <div class="d-flex align-items-center">
                    <img class="rounded-circle mr-2" src="https://randomuser.me/api/portraits/men/1.jpg" alt="Student Avatar" style="height: 40px;">
                    <span class="font-weight-bold">Nguyễn Văn A</span>
                </div>
                <div>
                    <button class="btn btn-primary btn-sm mr-2">Sửa</button>
                    <button class="btn btn-danger btn-sm">Xóa</button>
                </div>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <div class="d-flex align-items-center">
                    <img class="rounded-circle mr-2" src="https://randomuser.me/api/portraits/women/2.jpg" alt="Student Avatar" style="height: 40px;">
                    <span class="font-weight-bold">Trần Thị B</span>
                </div>
                <div>
                    <button class="btn btn-primary btn-sm mr-2">Sửa</button>
                    <button class="btn btn-danger btn-sm">Xóa</button>
                </div>
            </li>
        </ul>
    </div>
    
    <button class="btn btn-primary" onclick="openModal()">Tạo tài khoản sinh viên</button>
</div>

<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tạo tài khoản sinh viên</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="avatar">Avatar:</label>
                        <input type="file" class="form-control" id="avatar" name="avatar">
                    </div>
                    <div class="form-group">
                        <label for="firstName">Họ:</label>
                        <input type="text" class="form-control" id="firstName" name="firstName">
                    </div>
                    <div class="form-group">
                        <label for="lastName">Tên:</label>
                        <input type="text" class="form-control" id="lastName" name="lastName">
                    </div>
                    <div class="form-group">
                        <label for="username">Tên Tài Khoản:</label>
                        <input type="text" class="form-control" id="username" name="username">
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu:</label>
                        <input type="password" class="form-control" id="password" name="password">
                    </div>
                    <div class="text-right">
                        <button type="submit" class="btn btn-primary">Tạo tài khoản</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function openModal() {
        $('#myModal').modal('show');
    }

    function closeModal() {
        $('#myModal').modal('hide');
    }
</script>
