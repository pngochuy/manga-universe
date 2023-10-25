/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author PC
 */
public class UserDAO extends DBContext {

    // get User
    public User getUserById(int userID) {
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM [Users] "
                    + "WHERE userID = ?;";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);

            rs = ps.executeQuery();
            User user = new User();

            while (rs.next()) {
                user.setUserId(rs.getInt("userID"));
                user.setAvatarUrl(rs.getString("avatarUrl"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phoneNumber"));
                user.setGender(rs.getBoolean("gender"));
                user.setRole(rs.getString("role"));
                user.setExpiredTime(rs.getTimestamp("expiredTime").toLocalDateTime());
                user.setCoinQuantity(rs.getInt("coinQuantity"));
                user.setCreateAt(rs.getTimestamp("createAt").toLocalDateTime());

                // return lap tuc!
                return user;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                ps.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return null;
    }
    // get User
    public User getUserByGmail(String email) {
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM [Users] "
                    + "WHERE email = ?;";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);

            rs = ps.executeQuery();
            User user = new User();

            while (rs.next()) {
                user.setUserId(rs.getInt("userID"));
                user.setAvatarUrl(rs.getString("avatarUrl"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phoneNumber"));
                user.setGender(rs.getBoolean("gender"));
                user.setRole(rs.getString("role"));
                user.setExpiredTime(rs.getTimestamp("expiredTime").toLocalDateTime());
                user.setCoinQuantity(rs.getInt("coinQuantity"));
                user.setCreateAt(rs.getTimestamp("createAt").toLocalDateTime());

                // return lap tuc!
                return user;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                ps.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return null;
    }
    // get User
    public User getUserByUsername(String username, String password) {
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM [Users] "
                    + "WHERE username = ? AND password = ?;";
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            rs = ps.executeQuery();
            User user = new User();

            while (rs.next()) {
                
                user.setUserId(rs.getInt("userID"));
                user.setAvatarUrl(rs.getString("avatarUrl"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phoneNumber"));
                user.setGender(rs.getBoolean("gender"));
                user.setRole(rs.getString("role"));
                user.setExpiredTime(rs.getTimestamp("expiredTime").toLocalDateTime());
                user.setCoinQuantity(rs.getInt("coinQuantity"));
                user.setCreateAt(rs.getTimestamp("createAt").toLocalDateTime());

                // return lap tuc!
                return user;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                ps.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return null;
    }

    // create User
    public void create(User user) {

        try {
            String sql = "INSERT INTO [Users] (avatarUrl, username, password, role, "
                    + "expiredTime, coinQuantity, createAt, name, email, phoneNumber, gender)\n"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, user.getAvatarUrl().trim());
            ps.setString(2, user.getUsername().trim());
            ps.setString(3, user.getPassword().trim());
            ps.setString(4, user.getRole().trim());
            ps.setTimestamp(5, Timestamp.valueOf(user.getExpiredTime())); // Convert LocalDateTime to Timestamp
            ps.setInt(6, user.getCoinQuantity());
            ps.setTimestamp(7, Timestamp.valueOf(user.getCreateAt())); // Convert LocalDateTime to Timestamp
            ps.setString(8, user.getName().trim());
            ps.setString(9, user.getEmail().trim());
            ps.setString(10, user.getPhone().trim());
            ps.setBoolean(11, user.isGender());
            
            ps.execute();
            
            ps.close();
            
//            int userId = getUserId(user.getUsername().trim(), user.getPassword().trim(), user.getEmail().trim());
//            return userId;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

//        return 0;
    }

    // Update 
    public void update(User user) {

        try {

            String sql = "UPDATE [Users]\n"
                    + "SET avatarUrl = ?,\n"
                    + "    username = ?,\n"
                    + "    password = ?,\n"
                    + "    role = ?,\n"
                    + "    expiredTime = ?,\n"
                    + "    coinQuantity = ?,\n"
                    + "    createAt = ?,\n"
                    + "    name = ?,\n"
                    + "    email = ?,\n"
                    + "    phoneNumber = ?,\n"
                    + "    gender = ?\n"
                    + "WHERE userID = ?;";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, user.getAvatarUrl().trim());
            ps.setString(2, user.getUsername().trim());
            ps.setString(3, user.getPassword().trim());
            ps.setString(4, user.getRole().trim());
            ps.setTimestamp(5, Timestamp.valueOf(user.getExpiredTime())); // Convert LocalDateTime to Timestamp
            ps.setInt(6, user.getCoinQuantity());
            ps.setTimestamp(7, Timestamp.valueOf(user.getCreateAt())); // Convert LocalDateTime to Timestamp
            ps.setString(8, user.getName().trim());
            ps.setString(9, user.getEmail().trim());
            ps.setString(10, user.getPhone().trim());
            ps.setBoolean(11, user.isGender());
            ps.setInt(12, user.getUserId());

            ps.execute();

            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    // Delete
    public void delete(int userId) {
        try {
            String sql = "DELETE FROM [Users] "
                    + "WHERE userId = ?;";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, userId);

            ps.execute();

            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // getUserId
    public int getUserId(String username, String password, String email) {
        try {
            String sql = "SELECT * FROM [Users]\n"
                    + "WHERE username = ? AND password = ? AND email = ?;";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);

            ResultSet rs = ps.executeQuery();
//            rs.next();
            if (rs.next()) {
                return rs.getInt("userId");
            }

            rs.close();
            ps.close();

//            return id;

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;

    }

    // check exist username
    public boolean isUsernameExists(String username) {
        try {
            String sql = "SELECT COUNT(*) FROM Users WHERE username = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);

            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }

            resultSet.close();
            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    // check exist email
    public boolean isEmailExists(String email) {
        String sql = "SELECT COUNT(*) FROM Users WHERE email = ?";

        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }

            resultSet.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
    // check exist phone
    public boolean isPhoneExists(String phone) {
        String sql = "SELECT COUNT(*) FROM Users WHERE phoneNumber = ?";

        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);

            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }

            resultSet.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    // check exist user
    public boolean isUserExists(String username, String password) {
        String sql = "SELECT COUNT(*) FROM Users "
                + "WHERE username = ? AND password = ?;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }

            resultSet.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

}
