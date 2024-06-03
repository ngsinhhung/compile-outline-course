<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/3/2024
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="py-4">
    <div class="container">
        <div class="mt-4">
            <h2 class="h4">Danh sách môn học chưa có đề cương</h2>
            <p>Danh sách đề cương tổng cộng : 4</p>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Mã môn</th>
                    <th scope="col">Tên môn</th>
                    <th scope="col">Khoa</th>
                    <th scope="col">Giảng viên biên soạn</th>
                    <th scope="col">Thao Tác</th>
                </tr>
                </thead>
                <tbody>
                <!-- Dữ liệu môn học chưa có đề cương sẽ được thêm từ backend -->
                <tr>
                    <td>1</td>
                    <td>CSE101</td>
                    <td>Introduction to Computer Science</td>
                    <td>Computer Science</td>
                    <td>
                        <select class="form-control">
                            <option>Giảng viên A</option>
                            <option>Giảng viên B</option>
                            <option>Giảng viên C</option>
                        </select>
                    </td>
                    <td>
                        <button class="btn btn-primary">Lưu</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>MATH201</td>
                    <td>Calculus</td>
                    <td>Mathematics</td>
                    <td>
                        <select class="form-control">
                            <option>Giảng viên A</option>
                            <option>Giảng viên B</option>
                            <option>Giảng viên C</option>
                        </select>
                    </td>
                    <td>
                        <button class="btn btn-primary">Lưu</button>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>ENG101</td>
                    <td>English Composition</td>
                    <td>English</td>
                    <td>
                        <select class="form-control">
                            <option>Giảng viên A</option>
                            <option>Giảng viên B</option>
                            <option>Giảng viên C</option>
                        </select>
                    </td>
                    <td>
                        <button class="btn btn-primary">Lưu</button>
                    </td>
                </tr>
                </tbody>
            </table>
            <!-- Pagination -->
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script>
    // Toggle user menu
    $('#userMenuButton').on('click', function () {
        $(this).next('.dropdown-menu').toggle();
    });

    // Close user menu when clicking outside
    $(window).on('click', function (e) {
        if (!$(e.target).closest('#userMenuButton').length) {
            $('.dropdown-menu').hide();
        }
    });
</script>
</body>
</html>
