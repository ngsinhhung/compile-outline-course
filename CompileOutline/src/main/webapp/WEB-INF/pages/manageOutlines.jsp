<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Outlines</title>
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

<main class="p-6">
    <div class="bg-white p-6 rounded-lg ">
        <h1 class="text-2xl font-semibold mb-4">Quản lý đề cương </h1>
        <div class="flex items-center space-x-4 mb-4">
            <select class="w-48 p-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-400" id="searchFilter">
                <option value="all">Tất cả</option>
                <option value="lecturer">Giảng viên</option>
                <option value="status">Tình trạng</option>
                <option value="outlineCode">Mã đề cương</option>
            </select>
            <input type="text" class="w-[500px] p-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-400" id="searchInput" placeholder="Search...">
            
            <button class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 focus:outline-none" onclick="searchOutlines()">Search</button>
        </div>
        
        <table class="w-full border-collapse border border-gray-300">
            <thead>
            <tr>
                <th class="py-2 px-4 border border-gray-300">Id</th>
                <th class="py-2 px-4 border border-gray-300">Mã đề cương</th>
                <th class="py-2 px-4 border border-gray-300">Tên môn học</th>
                <th class="py-2 px-4 border border-gray-300">Tình trạng đề cương</th>
                <th class="py-2 px-4 border border-gray-300">Giảng viên biên soạn</th>
                <th class="py-2 px-4 border border-gray-300">Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="py-2 px-4 border border-gray-300">1</td>
                <td class="py-2 px-4 border border-gray-300">DC001</td>
                <td class="py-2 px-4 border border-gray-300">Môn học 1</td>
                <td class="py-2 px-4 border border-gray-300">Đã nộp</td>
                <td class="py-2 px-4 border border-gray-300">Nguyễn Văn A</td>
                <td class="py-2 px-4 border border-gray-300">
                    <button class="text-red-600 bg-red-200 hover:bg-red-300 hover:text-red-900 ml-4 px-2 py-1 rounded">Delete</button>
                </td>
            
            </tr>
            <tr>
                <td class="py-2 px-4 border border-gray-300">2</td>
                <td class="py-2 px-4 border border-gray-300">DC002</td>
                <td class="py-2 px-4 border border-gray-300">Môn học 2</td>
                <td class="py-2 px-4 border border-gray-300">Chưa nộp</td>
                <td class="py-2 px-4 border border-gray-300">Trần Thị B</td>
            </tr>
            </tbody>
        </table>
    </div>
</main>

<script>
    // Search function
    function searchOutlines() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput").value.toUpperCase();
        var filterBy = document.getElementById("searchFilter").value;
        table = document.getElementsByTagName("table")[0];
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            var match = false;
            td = tr[i].getElementsByTagName("td");
            for (var j = 0; j < td.length; j++) {
                var cell = td[j];
                if (cell) {
                    txtValue = cell.textContent || cell.innerText;
                    if (filterBy === "all" || filterBy === "lecturer" && j === 4 || filterBy === "status" && j === 3 || filterBy === "outlineCode" && j === 1) {
                        if (txtValue.toUpperCase().indexOf(input) > -1) {
                            match = true;
                            break;
                        }
                    }
                }
            }
            if (match) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }

</script>
</body>
</html>
