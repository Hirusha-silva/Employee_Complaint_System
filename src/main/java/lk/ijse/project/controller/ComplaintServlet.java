package lk.ijse.project.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.project.dao.ComplaintDAO;
import lk.ijse.project.model.Complaint;
import lk.ijse.project.model.User;

import java.io.IOException;

@WebServlet("/ComplaintServlet")
public class ComplaintServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user != null) {
            String title = req.getParameter("title");
            String description = req.getParameter("description");

            Complaint c = new Complaint(title, description, user.getId());
            ComplaintDAO.save(c);

            resp.sendRedirect("pages/complaints.jsp");

        } else {
            resp.sendRedirect("pages/login.jsp");
        }
    }
}
