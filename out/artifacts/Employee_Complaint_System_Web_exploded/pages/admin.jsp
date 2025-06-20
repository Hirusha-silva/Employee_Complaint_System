<%--<%@ page import="java.util.*, model.Complaint, dao.ComplaintDAO" %>--%>
<%--<%@ page import="model.User" %>--%>
<%--<%--%>
<%--    User user = (User) session.getAttribute("user");--%>
<%--    if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {--%>
<%--        response.sendRedirect("login.jsp");--%>
<%--        return;--%>
<%--    }--%>

<%--    List<Complaint> allComplaints = ComplaintDAO.getAllComplaints();--%>
<%--%>--%>
<%--<html>--%>
<%--<head><title>All Complaints - Admin</title></head>--%>
<%--<body>--%>
<%--<h2>All Complaints</h2>--%>
<%--<table border="1">--%>
<%--    <tr>--%>
<%--        <th>ID</th><th>Title</th><th>Description</th><th>User ID</th><th>Status</th>--%>
<%--    </tr>--%>
<%--    <% for (Complaint c : allComplaints) { %>--%>
<%--    <tr>--%>
<%--        <td><%= c.getId() %></td>--%>
<%--        <td><%= c.getTitle() %></td>--%>
<%--        <td><%= c.getDescription() %></td>--%>
<%--        <td><%= c.getUserId() %></td>--%>
<%--        <td><%= c.getStatus() %></td>--%>
<%--    </tr>--%>


<%--    <td>--%>
<%--        <form action="../DeleteComplaintServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this complaint?');">--%>
<%--            <input type="hidden" name="id" value="<%= c.getId() %>" />--%>
<%--            <input type="submit" value="Delete" class="btn btn-danger btn-sm" />--%>
<%--        </form>--%>
<%--    </td>--%>

<%--    <% } %>--%>

<%--</table>--%>


<%--<p><a href="dashboard.jsp">Back to Dashboard</a></p>--%>
<%--</body>--%>
<%--</html>--%>


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
            background-color: #f1f5f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .card-container {
            max-width: 1000px;
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

        .action-form {
            display: inline;
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
            <table class="table table-bordered table-hover table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>User ID</th>
                    <th>Status</th>
                    <th>Action</th>
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
                    <td>
                        <form class="action-form" action="../DeleteComplaintServlet" method="post"
                              onsubmit="return confirm('Are you sure you want to delete this complaint?');">
                            <input type="hidden" name="id" value="<%= c.getId() %>" />
                            <input type="submit" value="Delete" class="btn btn-danger btn-sm btn-rounded" />
                        </form>
                    </td>
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

