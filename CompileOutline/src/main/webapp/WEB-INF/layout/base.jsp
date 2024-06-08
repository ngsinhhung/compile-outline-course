<%--
  Created by IntelliJ IDEA.
  User: Hùng's Dell
  Date: 03/06/2024
  Time: 12:48 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <tiles:insertAttribute name="title"/>
    </title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        *{
            font-size: 17px;
        }
        .nav-tabs .nav-link {
            color: #007bff;
            border: none;
            border-bottom: 3px solid transparent;
        }
        .nav-tabs .nav-link.active {
            border-color: #007bff;
            font-weight: bold;
        }
        .nav-tabs .nav-link:hover {
            border-color: #007bff;
        }

        .action-icons i {
            cursor: pointer;
            margin-right: 10px;
        }
        .action-icons i:hover {
            color: #007bff;
        }
        
        
        .chat-list {
            height: calc(90vh - 130px);
            overflow-y: auto;
            border-right: 1px solid #dee2e6;
        }
        .chat-messages {
            height: calc(90vh - 130px);
            overflow-y: auto;
        }
       
        .message-incoming {
            background-color: #e9ecef;
            color: #333;
            align-self: flex-start;
        }
        .message-outgoing {
            background-color: #007bff;
            color: white;
            align-self: flex-end;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
      
    
    </style>
</head>
<body>
    <tiles:insertAttribute name="header"/>
    <section>
        <tiles:insertAttribute name="content"/>
    </section>
    <tiles:insertAttribute name="footer"/>
</body>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    $('#userMenuButton').on('click', function () {
        $(this).next('.dropdown-menu').toggle();
    });

    $(window).on('click', function (e) {
        if (!$(e.target).closest('#userMenuButton').length) {
            $('.dropdown-menu').hide();
        }
    });
    
    
</script>
</html>
