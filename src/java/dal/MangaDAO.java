/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Manga;
import model.Post;

/**
 *
 * @author PC
 */
public class MangaDAO extends DBContext {

    // get all Manga
    public ArrayList<Manga> getAll() {
        try {
            String sql = "SELECT * FROM [Manga];";
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ResultSet res = ps.executeQuery();

            ArrayList<Manga> list = new ArrayList<>();
            while (res.next()) {
                Integer id = res.getInt("mangaID");
                String title = res.getString("title");
                String description = res.getString("description");
                Integer userID = res.getInt("userID");
                LocalDateTime createdAt = res.getTimestamp("createdAt").toLocalDateTime();
                Boolean isCopyright = res.getBoolean("isCopyright");
                Boolean isFree = res.getBoolean("isFree");
                String coverImage = res.getString("coverImage");
                Manga manga = new Manga(id, title, description, userID , createdAt, isCopyright,isFree,coverImage );

                list.add(manga);

            }

            res.close();
            ps.close();

            return list;
            
        } catch (SQLException ex) {
            Logger.getLogger(MangaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }

    // create
    public int create(Manga manga) {
        int generatedPostID = -1; // Giá trị mặc định nếu không có postID được tạo
        try {
            String sql = "INSERT INTO Manga (title, description, userID,"
                    + "createAt, isCopyRight, isFree, coverImage) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?);";

            // Sử dụng PreparedStatement với RETURN_GENERATED_KEYS để lấy postID
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setNString(1, manga.getTitle());
            ps.setNString(2, manga.getDescription());
            ps.setInt(3, manga.getUserID());
            ps.setTimestamp(4, Timestamp.valueOf(manga.getCreateAt()));
            ps.setBoolean(5, manga.isCopyRight());
            ps.setBoolean(6, manga.isFree());
            ps.setString(7, manga.getCoverImage());

            // Thực hiện lệnh SQL
            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                // Lấy các giá trị được sinh ra sau khi thêm dữ liệu
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    generatedPostID = generatedKeys.getInt(1); // Lấy giá trị postID
                }
            }

            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(MangaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return generatedPostID;
    }

}
