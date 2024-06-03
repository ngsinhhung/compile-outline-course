<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/3/2024
  Time: 1:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<header class="bg-blue-600 text-white shadow-md">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
            <div class="flex">
                <div class="flex-shrink-0 flex items-center">
                    <a href="/CompileOutline" class="text-xl font-bold">
                        Admin Dashboard
                    </a>
                </div>
                <nav class="hidden sm:-my-px sm:ml-6 sm:flex sm:space-x-8">
                    <a href="/CompileOutline/admin/manage-outlines" class="inline-flex items-center px-1 pt-1 text-sm font-medium leading-5 hover:text-gray-200">
                        Quản lý đề cương
                    </a>
                    <a href="/CompileOutline/admin/manage-accounts" class="inline-flex items-center px-1 pt-1 text-sm font-medium leading-5 hover:text-gray-200">
                        Quảng lý tài khoản sinh viên
                    </a>
                    <a href="/CompileOutline/admin/manage-courses" class="inline-flex items-center px-1 pt-1 text-sm font-medium leading-5 hover:text-gray-200">
                        Quản lý các môn học
                    </a>
                </nav>
            </div>
            <div class="flex items-center">
                <div class="relative">
                    <button type="button" class="flex text-sm border-2 border-transparent rounded-full focus:outline-none focus:border-white transition duration-150 ease-in-out" id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                        <span class="sr-only">Open user menu</span>
                        <img class="h-8 w-8 rounded-full" src="https://www.svgrepo.com/show/382095/female-avatar-girl-face-woman-user-4.svg" alt="">
                    </button>
                    <div class="origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5" role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button" tabindex="-1" style="display:none;">
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-0">Thông tin cá nhân</a>
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-2">Đăng xuất</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="bg-white p-6 rounded-lg">
    <h1 class="text-3xl font-bold mb-6">Quản lý tài khoản sinh viên</h1>
    
    <div class="mb-6">
        <h2 class="text-xl font-semibold mb-4">Danh sách tài khoản sinh viên</h2>
        <ul>
            <li class="flex items-center justify-between py-2 border-b">
                <div class="flex items-center">
                    <img class="h-8 w-8 rounded-full mr-2" src="https://randomuser.me/api/portraits/men/1.jpg" alt="Student Avatar">
                    <span class="text-gray-800 text-lg font-semibold">Nguyễn Văn A</span>
                </div>
                <div>
                    <button class="text-white hover:text-red-900 bg-blue-500
                        hover:bg-blue-200 px-3 py-1 rounded mr-2">Sửa</button>
                    <button class="text-red-600 hover:text-red-900 bg-red-100 hover:bg-red-200 px-3 py-1 rounded">Xóa</button>
                </div>
            
            </li>
            <li class="flex items-center justify-between py-2 border-b">
                <div class="flex items-center">
                    <img class="h-8 w-8 rounded-full mr-2" src="https://randomuser.me/api/portraits/women/2.jpg" alt="Student Avatar">
                    <span class="text-gray-800 text-lg font-semibold">Trần Thị B</span>
                </div>
                <div>
                    <button class="text-white hover:text-red-900 bg-blue-500
                                            hover:bg-blue-200 px-3 py-1 rounded mr-2">Sửa</button>
                    <button class="text-red-600 hover:text-red-900 bg-red-100 hover:bg-red-200 px-3 py-1 rounded">Xóa</button>
                </div>
            
            </li>
        </ul>
    </div>
    
    <button class="bg-blue-600 text-white py-2 px-4 rounded hover:bg-blue-700" onclick="openModal()">Tạo tài khoản sinh viên</button>
</div>
<div id="myModal" class="fixed inset-0 z-10 overflow-y-auto bg-black bg-opacity-50 flex items-center justify-center " style="display: none;">
    <div class="bg-white rounded-lg shadow-md p-6 max-w-md w-full mx-auto my-auto">
        <div class="flex justify-end">
            <button onclick="closeModal()" class="text-gray-400 hover:text-gray-600 focus:outline-none">
                <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                </svg>
            </button>
        </div>
        <h2 class="text-xl font-semibold mb-4">Tạo tài khoản sinh viên</h2>
        <form>
            <div class="mb-4 flex items-center">
                <label for="avatar" class="block text-sm font-medium text-gray-700">Avatar:</label>
                <input type="file" id="avatar" name="avatar" class="ml-2 mt-1 p-2 border
            focus:ring-blue-500 focus:border-blue-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
            </div>
            <div class="mb-4">
                <label for="firstName" class="block text-sm font-medium text-gray-700">Họ:</label>
                <input type="text" id="firstName" name="firstName" class="mt-1 border p-2 focus:ring-blue-500 focus:border-blue-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
            </div>
            <div class="mb-4">
                <label for="lastName" class="block text-sm font-medium text-gray-700">Tên:</label>
                <input type="text" id="lastName" name="lastName" class="mt-1 border p-2 focus:ring-blue-500 focus:border-blue-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
            </div>
            <div class="mb-4">
                <label for="username" class="block text-sm font-medium text-gray-700">Tên Tài Khoản:</label>
                <input type="text" id="username" name="username" class="mt-1 p-2 border
focus:ring-blue-500 focus:border-blue-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
            </div>
            <div class="mb-4">
                <label for="password" class="block text-sm font-medium text-gray-700">Mật khẩu:</label>
                <input type="password" id="password" name="password" class="mt-1 p-2 border
focus:ring-blue-500 focus:border-blue-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
            </div>
            <div class="text-right">
                <button type="submit" class="inline-flex justify-center py-2 px-4 p-2 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">Tạo tài khoản</button>
            </div>
        </form>
    </div>
</div>


<script>
    function openModal() {
        document.getElementById("myModal").style.display = "block";
        document.body.classList.add("overflow-hidden");
    }

    // Close the modal
    function closeModal() {
        document.getElementById("myModal").style.display = "none";
        document.body.classList.remove("overflow-hidden");
    }
</script>
</body>
</html>
