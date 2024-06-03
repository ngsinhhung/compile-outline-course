<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/3/2024
  Time: 1:40 PM
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

<div class="container mx-auto mt-8">
    <div class="mb-8">
        <h2 class="text-xl font-semibold mb-2">Danh sách môn học chưa có đề cương</h2>
        <p class="mb-2">Danh sách đề cương tổng cộng : 4</p>
        <table class="table-auto w-full">
            <thead>
            <tr>
                <th class="px-4 py-2 border">STT</th>
                <th class="px-4 py-2 border">Mã môn</th>
                <th class="px-4 py-2 border">Tên môn</th>
                <th class="px-4 py-2 border">Khoa</th>
                <th class="px-4 py-2 border">Giảng viên biên soạn</th>
                <th class="px-4 py-2 border">Thao Tác</th>
            </tr>
            </thead>
            <tbody>
            <!-- Dữ liệu môn học chưa có đề cương sẽ được thêm từ backend -->
            <tr>
                <td class="border px-4 py-2">1</td>
                <td class="border px-4 py-2">CSE101</td>
                <td class="border px-4 py-2">Introduction to Computer Science</td>
                <td class="border px-4 py-2">Computer Science</td>
                <td class="border px-4 py-2">
                    <select class="bg-white shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                        <option>Giảng viên A</option>
                        <option>Giảng viên B</option>
                        <option>Giảng viên C</option>
                    </select>
                </td>
                <td class="border px-4 py-2">
                    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Lưu</button>
                </td>
                
            </tr>
            <tr>
                <td class="border px-4 py-2">2</td>
                <td class="border px-4 py-2">MATH201</td>
                <td class="border px-4 py-2">Calculus</td>
                <td class="border px-4 py-2">Mathematics</td>
                <td class="border px-4 py-2">
                    <select class="bg-white shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                        <option>Giảng viên A</option>
                        <option>Giảng viên B</option>
                        <option>Giảng viên C</option>
                    </select>
                </td>
                <td class="border px-4 py-2">
                    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Lưu</button>
                </td>
            </tr>
            <tr>
                <td class="border px-4 py-2">3</td>
                <td class="border px-4 py-2">ENG101</td>
                <td class="border px-4 py-2">English Composition</td>
                <td class="border px-4 py-2">English</td>
                <td class="border px-4 py-2">
                    <select class="bg-white shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                        <option>Giảng viên A</option>
                        <option>Giảng viên B</option>
                        <option>Giảng viên C</option>
                    </select>
                </td>
                <td class="border px-4 py-2">
                    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Lưu</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    
</div>
<div class="flex justify-center">
    <nav class="inline-flex">
        <a href="#" class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4">1</a>
        <a href="#" class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4">2</a>
        <a href="#" class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4">3</a>
        <a href="#" class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded-r">Next</a>
    </nav>
</div>
</body>
</html>
