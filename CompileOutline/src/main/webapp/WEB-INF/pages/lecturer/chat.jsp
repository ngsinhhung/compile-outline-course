<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
    }

    .chat-list {
        height: calc(100vh - 250px);
        overflow-y: auto;
        border-right: 1px solid #dee2e6;
    }

    .chat-messages {
        overflow-y: auto; /* Cho phép cuộn khi nội dung vượt quá chiều cao */
        padding: 10px;
        min-height: calc(100vh - 250px);
    }

    .message {
        margin-bottom: 10px;
        display: flex;
        flex-direction: row;
        align-items: flex-start;
    }

    .message-content {
        max-width: 70%; /* Giới hạn chiều rộng của nội dung tin nhắn */
        padding: 8px;
        border-radius: 8px;
    }

    .message-outgoing {
        align-self: flex-end; /* Căn tin nhắn gửi đi sang phải */
        background-color: #dcf8c6; /* Màu nền tin nhắn gửi đi */
    }

    .message-incoming {
        align-self: flex-start; /* Căn tin nhắn nhận sang trái */
        background-color: #f0f0f0; /* Màu nền tin nhắn nhận */
    }

    .message-content p {
        margin: 0;
    }

    .message-time {
        font-size: 12px;
        color: #777;
    }

    .chat-input {
        display: flex;
        align-items: center;
        background-color: #fff;
        padding: 10px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
    }

    .chat-input input[type="text"] {
        flex: 1;
        margin-right: 10px;
        padding: 10px;
        border: 1px solid #ced4da;
        border-radius: 5px;
        outline: none; /* Remove default focus outline */
    }

    .chat-input input[type="file"] {
        display: none; /* Hide the file input */
    }

    .chat-input .upload-label {
        font-size: 20px;
        color: #007bff;
        cursor: pointer;
        margin-right: 10px;
    }

    .chat-input .upload-label:hover {
        color: #0056b3;
    }

    .chat-input .send-button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .chat-input .send-button:hover {
        background-color: #0056b3;
    }

    .user-item {
        text-decoration: none;
        color: #333;
        transition: background-color 0.3s ease, color 0.3s ease;
        padding: 10px;
        border-radius: 8px;
    }

    .user-item:hover {
        background-color: #f0f0f0;
    }

    .user-item .user-details {
        display: flex;
        align-items: center;
    }

    .user-item .user-details img {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid #fff; /* Add a white border for better contrast */
    }

    .user-item .user-details .user-info {
        margin-left: 15px;
    }

    .user-item .user-info p {
        margin: 0;
    }

    .user-item .user-info .username {
        font-weight: bold;
        font-size: 16px;
    }

    .user-item .user-info .last-message {
        font-size: 14px;
        color: #777;
    }

</style>

<section>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <!-- Sidebar/Chat list -->
                <div class="p-3">
                    <div class="input-group rounded mb-3">
                        <input type="search" class="form-control rounded" placeholder="Search"
                               aria-label="Search" aria-describedby="search-addon"/>
                        <span class="input-group-text border-0" id="search-addon">
                            <i class="fas fa-search"></i>
                        </span>
                    </div>
                    <div class="chat-list">
                        <ul class="list-unstyled mb-0" style="list-style-type: none;">
                            <!-- Chat List Items (Example) -->
                            <li class="p-2 border-bottom" style="list-style-type: none !important;">
                                <a href="#!" class="d-flex justify-content-between">
                                    <div class="d-flex flex-row">
                                        <div>
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
                                                 alt="avatar" class="d-flex align-self-center me-3 rounded-circle"
                                                 width="60">
                                            <span class="badge bg-success badge-dot"></span>
                                        </div>
                                        <div class="pt-1">
                                            <p class="fw-bold mb-0">Marie Horwitz</p>
                                            <p class="small text-muted">Hello, Are you there?</p>
                                        </div>
                                    </div>
                                    <div class="pt-1">
                                        <p class="small text-muted mb-1">Just now</p>
                                        <span class="badge bg-danger rounded-pill float-end">3</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <!-- Chat Messages -->
                <div class="chat-messages" id="chat-messages">
                    <!-- Chat Messages will be dynamically added here -->
                </div>
                <!-- Chat Input -->
                <div class="chat-input">
                    <input type="text" class="form-control" id="message-input" placeholder="Type message...">
                    <label for="file-input" class="upload-label"><i class="fas fa-paperclip"></i></label>
                    <input type="file" id="file-input" accept="image/*" style="display: none;">
                    <button class="btn send-button" id="send-button"><i class="fas fa-paper-plane"></i> Send</button>
                </div>
            
            </div>
        </div>
    </div>
</section>
<script>
    localStorage.setItem("username", "${username}")
</script>
<script type="module" src="<c:url value="/JS/chat.js" />"></script>
