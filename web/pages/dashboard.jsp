<%@ page import="lk.ijse.project.model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Complaint Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e3f2fd; /* Light blue background */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #0d47a1;
        }

        .navbar-blue {
            background-color: #0d47a1;
        }

        .navbar-blue .navbar-brand,
        .navbar-blue .nav-link,
        .navbar-blue .text-white {
            color: #ffffff;
        }

        .dashboard-section {
            padding: 60px 0;
        }

        .section-box {
            background-color: #bbdefb; /* Soft blue block */
            padding: 25px 30px;
            margin-bottom: 25px;
            border-left: 6px solid #1976d2;
            border-radius: 5px;
            transition: all 0.2s ease-in-out;
        }

        .section-box:hover {
            background-color: #90caf9;
            transform: scale(1.01);
        }

        .section-title {
            font-size: 22px;
            margin-bottom: 5px;
            color: #0d47a1;
        }

        .section-desc {
            font-size: 14px;
            color: #1565c0;
        }

        .section-action {
            margin-top: 15px;
        }

        .btn-blue {
            background-color: #1565c0;
            border: none;
            color: white;
            padding: 8px 20px;
            border-radius: 20px;
            transition: background 0.3s ease;
        }

        .btn-blue:hover {
            background-color: #0d47a1;
        }

        footer {
            font-size: 14px;
            color: #0d47a1;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-blue">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Complaint Management System</a>
        <div class="d-flex text-white align-items-center">
            Hi : <b>&nbsp;<%= user.getUsername() %></b>
            <a href="../AdminServlet" class="btn btn-outline-light btn-sm ms-3">Logout</a>
        </div>
    </div>
</nav>

<div class="container dashboard-section">
    <div class="section-box">
        <div class="section-title">New Complaint</div>
        <div class="section-action">
            <a href="submit.jsp" class="btn btn-blue">Add Complaint</a>
        </div>
    </div>

    <div class="section-box">
        <div class="section-title">View Complaints</div>
        <div class="section-action">
            <a href="complaints.jsp" class="btn btn-blue">Complaints</a>
        </div>
    </div>

    <% if ("Admin".equalsIgnoreCase(user.getRole())) { %>
    <div class="section-box">
        <div class="section-title">Admin Controls</div>
        <div class="section-action">
            <a href="admin.jsp" class="btn btn-blue">Manage Complaints</a>
        </div>
    </div>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



