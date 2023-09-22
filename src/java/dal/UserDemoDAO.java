/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import model.UserDemo;

/**
 *
 * @author PC
 */
public class UserDemoDAO extends DBContext {

    // get UserDemo
    public UserDemo getUserDemo(String username, String password) {
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM UserDemo WHERE username = ? AND password = ?;";
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            rs = ps.executeQuery();
            UserDemo userDemo = new UserDemo();

            while (rs.next()) {
                userDemo.setUsername(rs.getString("username"));
                userDemo.setPassword(rs.getString("password"));
                userDemo.setEmail(rs.getString("email"));
                userDemo.setPhone(rs.getString("phone"));

                // return lap tuc!
                return userDemo;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDemoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                ps.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDemoDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return null;
    }

    // create UserDemo
    public int createUserDemo(UserDemo userDemo) {
        
        try {
            String sql = "INSERT INTO UserDemo (username, password, email, phone)\n"
                    + "VALUES (?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userDemo.getUsername().trim());
            ps.setString(2, userDemo.getPassword().trim());
            ps.setString(3, userDemo.getEmail().trim());
            ps.setString(4, userDemo.getPhone().trim());

            int rowCount = ps.executeUpdate();
            ps.close();
            return rowCount;

        } catch (SQLException ex) {
            Logger.getLogger(UserDemoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
//        finally {
//            try {
//                ps.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(UserDemoDAO.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }

        return -1;
    }
}
