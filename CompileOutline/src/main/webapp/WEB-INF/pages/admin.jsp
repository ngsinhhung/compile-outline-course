<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/3/2024
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
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
                    </a> <a href="/CompileOutline/admin/assignment-teacher" class="inline-flex items-center px-1 pt-1 text-sm font-medium leading-5 hover:text-gray-200">
                        Phân công biên soạn
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

<div class="py-10">
    <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
        <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
            <div class="p-6 bg-white border-b border-gray-200">
                <h1 class="text-2xl font-semibold mb-4">Chào mừng trở lại Nguyễn Sinh Hùng 👋 </h1>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                    <div class="bg-blue-100 p-4 rounded-lg shadow-md">
                        <h2 class="text-lg font-semibold">Tổng học sinh</h2>
                        <p class="text-2xl font-bold">1,234</p>
                    </div>
                    <div class="bg-green-100 p-4 rounded-lg shadow-md">
                        <h2 class="text-lg font-semibold">Tổng các môn học</h2>
                        <p class="text-2xl font-bold">56</p>
                    </div>
                    <div class="bg-yellow-100 p-4 rounded-lg shadow-md">
                        <h2 class="text-lg font-semibold">Đề cương Đã Nộp</h2>
                        <p class="text-2xl font-bold">12</p>
                    </div>
                </div>
            </div>
        </div>
        
        
    </div>
</div>

<script>
    // Toggle user menu
    document.getElementById('user-menu-button').addEventListener('click', function() {
        const menu = document.querySelector('[role="menu"]');
        menu.style.display = menu.style.display === 'none' ? 'block' : 'none';
    });

    // Close user menu when clicking outside
    window.addEventListener('click', function(e) {
        const menuButton = document.getElementById('user-menu-button');
        const menu = document.querySelector('[role="menu"]');
        if (!menuButton.contains(e.target) && !menu.contains(e.target)) {
            menu.style.display = 'none';
        }
    });
</script>
</body>
</html>
