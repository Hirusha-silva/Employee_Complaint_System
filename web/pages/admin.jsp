<%@ page import="java.util.*, lk.ijse.project.model.Complaint,lk.ijse.project.dao.ComplaintDAO" %>
<%@ page import="lk.ijse.project.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Complaint> allComplaints = ComplaintDAO.getAllComplaints();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Complaints - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f4fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .card-container {
            max-width: 1100px;
            margin: 50px auto;
        }

        .card {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
            border: 1px solid #dbe4f0;
        }

        .card-header {
            background-color: #0d6efd;
            color: white;
            font-size: 22px;
            font-weight: 600;
            border-radius: 15px 15px 0 0;
            padding: 20px 30px;
        }

        .card-body {
            padding: 30px;
        }

        table thead th {
            background-color: #0d6efd;
            color: white;
            vertical-align: middle;
        }

        table tbody tr:hover {
            background-color: #e9f2ff;
        }

        .btn {
            border-radius: 8px !important;
            font-size: 14px;
            padding: 6px 14px;
        }

        .form-select, .form-control {
            border-radius: 8px;
            font-size: 13px;
        }

        .btn-warning {
            background-color: #ffc107;
            border: none;
            color: black;
        }

        .btn-warning:hover {
            background-color: #e0a800;
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
        }

        .btn-danger:hover {
            background-color: #bb2d3b;
        }

        .btn-outline-secondary {
            border-radius: 25px;
            padding: 6px 20px;
        }

        .action-card {
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            padding: 10px 12px;
            border-radius: 10px;
            margin-bottom: 10px;
        }

        .action-cell {
            min-width: 300px;
        }

        textarea.form-control {
            resize: none;
        }
    </style>
</head>
<body>

<div class="card-container">
    <div class="card">
        <div class="card-header">
            All Complaints
        </div>
        <div class="card-body">
            <table class="table table-bordered table-hover align-middle text-center">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>User ID</th>
                    <th>Status</th>
                    <th>Solution</th>
                    <th class="action-cell">Action</th>
                </tr>
                </thead>
                <tbody>
                <% for (Complaint c : allComplaints) { %>
                <tr>
                    <td><%= c.getId() %></td>
                    <td><%= c.getTitle() %></td>
                    <td><%= c.getDescription() %></td>
                    <td><%= c.getUserId() %></td>
                    <td><%= c.getStatus() %></td>
                    <td><%= c.getSolution() != null ? c.getSolution() : "" %></td>
                    <td>
                        <!-- Update Form Card -->
                        <div class="action-card">
                            <form action="../UpdateServlet" method="post">
                                <input type="hidden" name="id" value="<%= c.getId() %>" />

                                <select name="status" class="form-select form-select-sm mb-2" required>
                                    <option value="Pending" <%= "Pending".equalsIgnoreCase(c.getStatus()) ? "selected" : "" %>>Pending</option>
                                    <option value="In Progress" <%= "In Progress".equalsIgnoreCase(c.getStatus()) ? "selected" : "" %>>In Progress</option>
                                    <option value="Resolved" <%= "Resolved".equalsIgnoreCase(c.getStatus()) ? "selected" : "" %>>Resolved</option>
                                </select>

                                <textarea name="solution" class="form-control form-control-sm mb-2"
                                          rows="2" placeholder="Add solution..."><%= c.getSolution() != null ? c.getSolution() : "" %></textarea>

                                <button type="submit" class="btn btn-warning btn-sm w-100">Update</button>
                            </form>
                        </div>

                        <!-- Delete Form Card -->
                        <div class="action-card">
                            <form action="../AdminServlet" method="post"
                                  onsubmit="return confirm('Are you sure you want to delete this complaint?');">
                                <input type="hidden" name="id" value="<%= c.getId() %>" />
                                <button type="submit" class="btn btn-danger btn-sm w-100">Delete</button>
                            </form>
                        </div>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>

            <div class="text-end">
                <a href="dashboard.jsp" class="btn btn-outline-secondary mt-4">Back</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
