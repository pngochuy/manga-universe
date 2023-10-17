/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import model.Post;

/**
 *
 * @author PC
 */
public class PostDAO extends DBContext {

    // get Post
    public Post getPost(int id) {

        try {
            String sql = "SELECT * FROM [Post] "
                    + "WHERE postId = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            Post blog = new Post();

            if (rs.next()) {
                blog.setUserId(rs.getInt("userID"));
                blog.setImgUrl(rs.getString("imgUrl"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setCreateAt(rs.getTimestamp("createdAt").toLocalDateTime());

            }

            rs.close();
            ps.close();

            return blog;

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    // get all Post
    public ArrayList<Post> getAll() {

        try {
            String sql = "SELECT * FROM [Post]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            ArrayList<Post> list = new ArrayList<>();
            while (rs.next()) {
                Post blog = new Post();
                blog.setUserId(rs.getInt("userID"));
                blog.setImgUrl(rs.getString("imgUrl"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setCreateAt(rs.getTimestamp("createdAt").toLocalDateTime());

                list.add(blog);

            }

            rs.close();
            ps.close();

            return list;

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    // create Post
    public void create(Post blog) {
        try {
            String sql = "INSERT INTO [Post] (userId, imgUrl, title, description, createdAt)\n"
                    + "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ps.setInt(1, blog.getUserId());
            ps.setString(2, blog.getImgUrl());
            ps.setString(3, blog.getTitle());   
            ps.setString(4, blog.getDescription());
            ps.setTimestamp(5, Timestamp.valueOf(blog.getCreateAt())); // Convert LocalDateTime to Timestamp
            
            ps.execute();
            
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    // update Post
    public void update(Post blog, int blogId) {
        try {
            String sql = "UPDATE [Post]\n"
                    + "SET userId = ?,\n"
                    + "    imgUrl = ?,\n"
                    + "    title = ?,\n"
                    + "    description = ?,\n"
                    + "    createdAt = ?\n"
                    + "WHERE blogId = ?;";

            PreparedStatement ps = connection.prepareStatement(sql);
            
            ps.setInt(1, blog.getUserId());
            ps.setString(2, blog.getImgUrl());
            ps.setString(3, blog.getTitle());
            ps.setString(4, blog.getDescription());
            ps.setTimestamp(5, Timestamp.valueOf(blog.getCreateAt())); // Convert LocalDateTime to Timestamp
            ps.setInt(6, blogId);
            
            ps.execute();
            
            ps.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    // Delete
    public void delete(int userId) {
    }
}
