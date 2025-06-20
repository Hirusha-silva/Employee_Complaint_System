<%--
  Created by IntelliJ IDEA.
  User: hirushasilva
  Date: 2025-06-20
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      height: 100vh;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #e0e5ec;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .login-container {
      background: #e0e5ec;
      padding: 40px;
      border-radius: 20px;
      box-shadow: 10px 10px 30px #c3c8d0, -10px -10px 30px #ffffff;
      width: 360px;
      max-width: 90%;
    }

    h2 {
      text-align: center;
      color: #333;
      margin-bottom: 30px;
      font-size: 24px;
    }

    label {
      display: block;
      margin-bottom: 8px;
      font-size: 14px;
      font-weight: 600;
      color: #555;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 12px;
      margin-bottom: 20px;
      border: none;
      border-radius: 10px;
      font-size: 15px;
      background: #e0e5ec;
      box-shadow: inset 5px 5px 10px #c3c8d0, inset -5px -5px 10px #ffffff;
      color: #333;
      transition: all 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
      box-shadow: inset 2px 2px 6px #c3c8d0, inset -2px -2px 6px #ffffff;
      outline: none;
    }

    input[type="submit"] {
      width: 100%;
      padding: 12px;
      background: #e0e5ec;
      border: none;
      border-radius: 10px;
      font-weight: bold;
      font-size: 15px;
      color: #333;
      cursor: pointer;
      box-shadow: 5px 5px 15px #c3c8d0, -5px -5px 15px #ffffff;
      transition: 0.3s;
    }

    input[type="submit"]:hover {
      background: blue;
    }

    .error-message {
      margin-top: 15px;
      background-color: #ffefef;
      border-left: 5px solid #ff4c4c;
      color: #c00;
      padding: 10px;
      border-radius: 8px;
      font-size: 13px;
      box-shadow: 0 2px 6px rgba(255, 0, 0, 0.1);
    }
  </style>


</head>
<body>
<div class="login-container">
  <h2>Login</h2>
  <form method="post" action="../LoginServlet">
    <label for="username">Username</label>
    <input type="text" id="username" name="username" required />

    <label for="password">Password</label>
    <input type="password" id="password" name="password" required />

    <input type="submit" value="Login" />
  </form>

  <% if (request.getParameter("error") != null) { %>
  <div class="error-message">Invalid username or password!</div>
  <% } %>
</div>
</body>
</html>
