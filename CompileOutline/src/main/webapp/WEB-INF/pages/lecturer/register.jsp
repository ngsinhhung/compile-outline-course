<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/9/2024
  Time: 11:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Compile OutLine</title>--%>
<%--    <script src="https://cdn.tailwindcss.com"></script>--%>
<%--</head>--%>
<%--<body>--%>
<div class="min-h-screen bg-gray-100 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
    <div class="sm:mx-auto sm:w-full sm:max-w-md">
        <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
            Tạo Tài Khoản
        </h2>
    </div>
    <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
        <div class="bg-white py-4 px-4 shadow sm:rounded-lg sm:px-10">
            <form id="registerForm" class="space-y-2" method="post" enctype="multipart/form-data">
                <div>
                    <label for="avatar" class="block text-center text-lg font-medium text-gray-700">
                        Avatar
                    </label>
                    <div class="mt-1 flex items-center justify-center">
                        <img id="avatarPreview" src= "https://cdn-icons-png.flaticon.com/512/6596/6596121.png" class="h-20 w-20 rounded-full object-cover cursor-pointer" />
                        <input id="avatar" name="avatar" type="file" class="hidden" />
                    </div>
                    <div id="avatarError" class="text-red-500 text-center text-sm mt-1"></div>
                </div>
                <div class="grid grid-cols-1 gap-3 sm:grid-cols-2">
                    <div>
                        <label for="firstName" class="block text-sm font-medium text-gray-700">Họ</label>
                        <input type="text" id="firstName" name="firstName" placeholder="Nhập vào Họ" class="mt-1  p-2  block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                        <div id="firstNameError" class="text-red-500 text-sm mt-1"></div>
                    </div>
                    <div>
                        <label for="lastName" class="block text-sm font-medium text-gray-700">Tên</label>
                        <input type="text" id="lastName" name="lastName" placeholder="Nhập vào tên" class="mb-2 p-2  block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                        <div id="lastNameError" class="text-red-500 text-sm mt-1"></div>
                    </div>
                </div>
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                    <input type="email" id="email" name="email" placeholder="Nhập vào email" class="mt-1 p-2  block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                    <div id="emailError" class="text-red-500 text-sm mt-1"></div>
                </div>
                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700">Mật Khẩu</label>
                    <input type="password" id="password" name="password" placeholder="Nhập vào mật khẩu" class="mt-1 block p-2 w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                    <div id="passwordError" class="text-red-500 text-sm mt-1"></div>
                </div>
                <div>
                    <label for="confirmPassword" class="block text-sm font-medium text-gray-700">Nhập Lại Mật khẩu</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Nhập lại mật khẩu" class="mt-1 p-2  block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                    <div id="confirmPasswordError" class="text-red-500 text-sm mt-1"></div>
                </div>
                <div>
                    <button type="submit" class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        Đăng kí
                    </button>
                </div>
            </form>
            <div class="mt-6">
                <p class="mt-2 gap-2 text-center text-sm text-gray-600 max-w">
                    Bạn đã có tài khoản ?
                    <a  class="font-medium ml-2 text-blue-600 hover:text-blue-500">
                        Đăng nhập
                    </a>
                </p>
            </div>
        </div>
    </div>
</div>
<%--<script>--%>
<%--    // JavaScript for form handling and validation--%>
<%--    const form = document.getElementById('registerForm');--%>
<%--    const avatarInput = document.getElementById('avatar');--%>
<%--    const avatarPreview = document.getElementById('avatarPreview');--%>
<%--    const fields = ['firstName', 'lastName', 'email', 'password', 'confirmPassword'];--%>

<%--    avatarInput.addEventListener('change', (event) => {--%>
<%--        const file = event.target.files[0];--%>
<%--        const reader = new FileReader();--%>
<%--        reader.onloadend = () => {--%>
<%--            avatarPreview.src = reader.result;--%>
<%--        };--%>
<%--        if (file) {--%>
<%--            reader.readAsDataURL(file);--%>
<%--        }--%>
<%--    });--%>

<%--    form.addEventListener('submit', (event) => {--%>
<%--        event.preventDefault();--%>
<%--        const errors = {};--%>

<%--        fields.forEach((field) => {--%>
<%--            const input = document.getElementById(field);--%>
<%--            const errorDiv = document.getElementById(`${field}Error`);--%>
<%--            if (!input.value) {--%>
<%--                errors[field] = 'Required';--%>
<%--            } else {--%>
<%--                errorDiv.textContent = '';--%>
<%--            }--%>
<%--        });--%>

<%--        if (Object.keys(errors).length > 0) {--%>
<%--            Object.keys(errors).forEach((field) => {--%>
<%--                const errorDiv = document.getElementById(`${field}Error`);--%>
<%--                errorDiv.textContent = errors[field];--%>
<%--            });--%>
<%--        } else {--%>
<%--            alert('Form submitted successfully');--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>