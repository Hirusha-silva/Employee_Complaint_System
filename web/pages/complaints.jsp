<%@ page import="java.util.*, lk.ijse.project.model.User, lk.ijse.project.model.Complaint, lk.ijse.project.dao.ComplaintDAO" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Complaint> complaints = ComplaintDAO.getComplaintsUserId(user.getId());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Complaints</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f5f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .card-container {
            max-width: 900px;
            margin: 60px auto;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #0d6efd;
            color: white;
            font-size: 20px;
            font-weight: bold;
            border-radius: 12px 12px 0 0;
            padding: 20px;
        }

        .card-body {
            padding: 30px;
            background-color: white;
            border-radius: 0 0 12px 12px;
        }

        .btn-rounded {
            border-radius: 20px;
            padding: 8px 20px;
            font-size: 15px;
        }

        table thead th {
            background-color: #0d6efd;
            color: white;
        }

        table tbody tr:hover {
            background-color: #e3f2fd;
        }
    </style>
</head>
<body>

<div class="card-container">
    <div class="card">
        <div class="card-header">
             Complaints
        </div>
        <div class="card-body">
            <table class="table table-bordered table-hover table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <% for (Complaint c : complaints) { %>
                <tr>
                    <td><%= c.getId() %></td>
                    <td><%= c.getTitle() %></td>
                    <td><%= c.getDescription() %></td>
                    <td><%= c.getStatus() %></td>
                </tr>
                <% } %>
                </tbody>
            </table>

            <div class="text-end">
                <a href="dashboard.jsp" class="btn btn-outline-secondary btn-rounded mt-3">Back</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

