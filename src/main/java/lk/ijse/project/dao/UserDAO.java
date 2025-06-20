package lk.ijse.project.dao;

import lk.ijse.project.db.DBConnection;
import lk.ijse.project.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    public static User checkUser(String username, String password) {
        try (Connection connection = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = connection.prepareStatement("select * from user where username=? and password=?");
        ){
         ps.setString(1, username);
         ps.setString(2, password);
         ResultSet rs = ps.executeQuery();

         if(rs.next()){
             return new User(rs.getInt(1),rs.getString(2),rs.getString(3));
         }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
