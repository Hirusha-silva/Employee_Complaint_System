
<%@ page import="lk.ijse.project.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submit Complaint</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f5f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .card-container {
            max-width: 600px;
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
        }

        .btn-rounded {
            border-radius: 20px;
            padding: 8px 20px;
            font-size: 15px;
        }
    </style>
</head>
<body>

<div class="card-container">
    <div class="card">
        <div class="card-header">New Complaint</div>
        <div class="card-body">
            <form method="post" action="<%= request.getContextPath() %>/ComplaintServlet">
                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" name="title" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <textarea name="description" class="form-control" rows="4" required></textarea>
                </div>

                <div class="d-flex justify-content-between">
                    <input type="submit" value="Submit" class="btn btn-primary btn-rounded" />
                    <a href="dashboard.jsp" class="btn btn-outline-secondary btn-rounded">Back</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

