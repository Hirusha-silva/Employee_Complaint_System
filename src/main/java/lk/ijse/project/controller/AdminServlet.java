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
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user != null && "Admin".equalsIgnoreCase(user.getRole())) {
            try {
                int complaintId = Integer.parseInt(req.getParameter("id"));
                ComplaintDAO.delete(complaintId);
                resp.sendRedirect("pages/admin.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                resp.sendRedirect("pages/admin.jsp?error=true");
            }
        } else {
            resp.sendRedirect("pages/login.jsp");
        }
    }
//logout
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        resp.sendRedirect("pages/login.jsp");
    }
}
