package lk.ijse.project.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.project.dao.ComplaintDAO;
import lk.ijse.project.model.User;

import java.io.IOException;
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect("pages/login.jsp");
            return;
        }

        int id = Integer.parseInt(req.getParameter("id"));
        String status = req.getParameter("status");
        String solution = req.getParameter("solution");
        boolean updated = ComplaintDAO.update(id, status, solution);

        if (updated) {
            resp.sendRedirect("pages/admin.jsp?success=update");
        } else {
            resp.sendRedirect("pages/admin.jsp?error=update");
        }
    }
}
