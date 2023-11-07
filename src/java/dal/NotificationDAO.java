/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Notification;

/**
 *
 * @author Admin
 */
public class NotificationDAO {


    public List<Notification> getAllNotifications() {
        Connection con = null;
        PreparedStatement ps = null;
        DBContext dbContext = new DBContext();
        con = dbContext.connection;
        List<Notification> notifications = new ArrayList<>();
        String query = "SELECT * FROM Notification Where userID = ?";
        
        try ( PreparedStatement statement = con.prepareStatement(query);  ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Notification notification = new Notification();
                notification.setNotificationID(resultSet.getInt("notificationID"));
                notification.setUserID(resultSet.getInt("userID"));
                notification.setMessage(resultSet.getString("message"));
                notification.setNotificationDate(resultSet.getDate("notificationDate"));
                notification.setIsRead(resultSet.getBoolean("isRead"));
                notifications.add(notification);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;

        
    }
    
    public List<Notification> getNotificationsByUserId(int userId) {
    Connection con = null;
    PreparedStatement ps = null;
    DBContext dbContext = new DBContext();
    con = dbContext.connection;
    List<Notification> notifications = new ArrayList<>();
    String query = "SELECT * FROM Notification WHERE userID = ?";
    
    try (PreparedStatement statement = con.prepareStatement(query)) {
        statement.setInt(1, userId);
        try (ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Notification notification = new Notification();
                notification.setNotificationID(resultSet.getInt("notificationID"));
                notification.setUserID(resultSet.getInt("userID"));
                notification.setMessage(resultSet.getString("message"));
                notification.setNotificationDate(resultSet.getDate("notificationDate"));
                notification.setIsRead(resultSet.getBoolean("isRead"));
                notifications.add(notification);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return notifications;
}


    public boolean insertNotification(Notification notification) {
        Connection con = null;
        PreparedStatement ps = null;
        DBContext dbContext = new DBContext();
        con = dbContext.connection;
        String query = "INSERT INTO Notification (userID, message, notificationDate, isRead) VALUES (?, ?, ?, ?)";
        try ( PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, notification.getUserID());
            statement.setString(2, notification.getMessage());
            statement.setDate(3, new java.sql.Date(notification.getNotificationDate().getTime()));
            statement.setBoolean(4, notification.isIsRead());
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
