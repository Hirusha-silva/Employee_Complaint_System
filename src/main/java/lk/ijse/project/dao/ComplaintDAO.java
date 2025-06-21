package lk.ijse.project.dao;

import lk.ijse.project.db.DBConnection;
import lk.ijse.project.model.Complaint;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComplaintDAO {
    public static void save(Complaint complaint) {
        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "INSERT INTO complaints (title, description, user_id, status) VALUES (?, ?, ?, 'Pending')"
             )) {
            ps.setString(1, complaint.getTitle());
            ps.setString(2, complaint.getDescription());
            ps.setInt(3, complaint.getUserId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Complaint> getAllComplaints() {
        List<Complaint> complaints = new ArrayList<>();
        String sql = "SELECT * FROM complaints";

        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Complaint c = new Complaint(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("user_id"),
                        rs.getString("status"),
                        rs.getString("solution")
                );
                complaints.add(c);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching all complaints: " + e.getMessage());
        }

        return complaints;
    }

    public static List<Complaint> getComplaintsUserId(int userId) {
        List<Complaint> list = new ArrayList<>();
        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "SELECT * FROM complaints WHERE user_id = ?"
             )) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Complaint c = new Complaint(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("user_id"),
                        rs.getString("status"),
                        rs.getString("solution")
                );
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean delete(int id) {
        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement("DELETE FROM complaints WHERE id = ?")) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean update(int complaintId,String status,String solution) {
        String sql = "UPDATE complaints SET status = ?, solution = ? WHERE id = ?";
        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setString(2, solution);
            ps.setInt(3, complaintId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
