<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/6/2024
  Time: 9:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section class="h-100">
    <div class="container-fluid p-0">
        <div class="row g-0">
            <div class="col-md-4 col-lg-3">
                <div class="card chat-container">
                   
                    <div class="card-body p-0">
                        <div class="input-group p-3 rounded-0">
                            <input type="search" class="form-control" placeholder="Search" aria-label="Search" aria-describedby="search-addon"/>
                            <span class="input-group-text border-0" id="search-addon">
                                <i class="fas fa-search"></i>
                            </span>
                        </div>
                        <div class="chat-list p-3">
                            <ul class="list-unstyled mb-0">
                                <li class="p-2 border-bottom">
                                    <a href="#!" class="d-flex justify-content-between">
                                        <div class="d-flex flex-row">
                                            <div>
                                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" alt="avatar" class="d-flex align-self-center me-3" width="45">
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
                                <!-- Additional chat list items -->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-lg-9">
                <div class="card chat-container">
                    
                    <div class="card-body d-flex flex-column">
                        <div class="chat-messages d-flex flex-column flex-grow-1">
                            <div class="d-flex flex-row justify-content-start mb-3">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava6-bg.webp" alt="avatar 1" style="width: 45px; height: 45px;" class="rounded-circle me-2">
                                <div>
                                    <p class="message message-incoming">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                    <p class="small text-muted">12:00 PM | Aug 13</p>
                                </div>
                            </div>
                            <div class="d-flex flex-row justify-content-end mb-3">
                                <div>
                                    <p class="message message-outgoing">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                    <p class="small text-muted text-end">12:00 PM | Aug 13</p>
                                </div>
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" alt="avatar 1" style="width: 45px; height: 45px;" class="rounded-circle ms-2">
                            </div>
                        </div>
                        <div class="chat-footer p-3 d-flex align-items-center">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava6-bg.webp" alt="avatar 3" style="width: 40px; height: 40px;" class="rounded-circle me-2">
                            <input type="text" class="form-control form-control-lg me-2" placeholder="Type message">
                            <a class="btn btn-primary" href="#!"><i class="fas fa-paper-plane text-white"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

