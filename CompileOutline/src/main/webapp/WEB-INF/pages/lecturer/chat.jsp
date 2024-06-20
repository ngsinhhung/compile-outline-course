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

    .message {
        padding: 10px;
        border-radius: 8px;
        margin: 5px 0;
        max-width: 70%;
        word-wrap: break-word;
        overflow: hidden; /* Đảm bảo các message không bị overflow khi chứa ảnh */
    }

    .message .message-content {
        display: flex;
        align-items: center;
        position: relative; /* Để chứa image và text bên trong message */
    }

    .message .message-content p {
        margin: 0;
    }

    .message .message-content img {
        max-width: 100%;
        border-radius: 8px;
        margin-top: 10px;
        background-color: white;
    }

    .message-outgoing {
        color: black;
        border-radius: 10px; /* Rounded corners */
        max-width: 70%;
        margin-bottom: 10px; /* Bottom margin */
        align-self: flex-end; /* Align to the right (end) of the container */
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2); /* Box shadow for a subtle effect */
    }

    .message-incoming {
        color: #333;
        align-self: flex-start;
    }

    .message-time {
        font-size: 12px;
        color: #999;
        margin-left: 10px;
        align-self: flex-end;
    }

    .chat-messages {
        height: calc(100vh - 250px);
        overflow-y: auto;
        padding: 10px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

</style>

<section >
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
                        <ul class="list-unstyled mb-0">
                            <!-- Chat List Items (Example) -->
                            <li class="p-2 border-bottom">
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
<script type="module" src="<c:url value="/JS/chat.js" />"></script>
