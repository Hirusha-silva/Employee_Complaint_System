<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Complaint Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f5f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .card-login {
            background-color: white;
            border: none;
            border-radius: 50px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        .card-header {
            background-color: #0d6efd;
            color: white;
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            border-radius: 12px 12px 0 0;
            padding: 20px;
        }

        .card-body {
            padding: 30px;
        }

        label {
            font-size: 14px;
            color: #444;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .btn-login {
            width: 100%;
            padding: 10px;
            font-size: 15px;
            border: none;
            border-radius: 6px;
            background-color: #0d6efd;
            color: white;
            transition: background-color 0.3s ease;
        }

        .btn-login:hover {
            background-color: #084dbf;
        }

        .error-message {
            color: red;
            text-align: center;
            font-size: 13px;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<div class="card-login">
    <div class="card-header">
        Login
    </div>
    <div class="card-body">
        <form method="post" action="${pageContext.request.contextPath}/LoginServlet">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required />

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required />

            <input type="submit" value="Login" class="btn-login" />
        </form>

        <% if (request.getParameter("error") != null) { %>
        <div class="error-message">Invalid username or password!</div>
        <% } %>
    </div>
</div>

</body>
</html>

