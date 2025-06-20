package lk.ijse.project.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.project.dao.UserDAO;
import lk.ijse.project.model.User;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = UserDAO.checkUser(username, password);

        if (user != null) {

            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            resp.sendRedirect("pages/dashboard.jsp");
        }else {
            resp.sendRedirect("pages/login.jsp");
        }
    }
}
