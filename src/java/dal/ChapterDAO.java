package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.function.Predicate;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Chapter;

public class ChapterDAO extends DBContext  {
    
    List<Chapter> listOfChapter = new ArrayList<>();
    
    public List<Chapter> getAllChapter() {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
        try{
            cnt = connection;
            String sql = "select * from Chapter ";
            
            stm = cnt.prepareStatement(sql);  
            res = stm.executeQuery();
            while(res.next()){
                Integer id = res.getInt("chapterID");
                String title = res.getString("title");
//                nhớ xoá imageID
                Integer imgId = res.getInt("imageID");
                String description = res.getString("description");
                Integer mangaId = res.getInt("mangaID");
                
                Chapter chapter = new Chapter(id, title,imgId, description, mangaId );
                listOfChapter.add(chapter);
            }
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try {
                cnt.close();
                stm.close();
                res.close();
            } catch (SQLException ex) {
                Logger.getLogger(ChapterDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listOfChapter;    
    }
    
    public List<Chapter> getChapterByID(int mangaID) {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
        try{
            cnt = connection;
            String sql = "select * from Chapter where mangaID = ?";
            
            stm = cnt.prepareStatement(sql);  
            stm.setInt(1, mangaID);
            res = stm.executeQuery();
            while(res.next()){
                Integer id = res.getInt("chapterID");
                String title = res.getString("title");
//                nhớ xoá imageID
                Integer imgId = res.getInt("imageID");
                String description = res.getString("description");
                Integer mangaId = res.getInt("mangaID");
                
                Chapter chapter = new Chapter(id, title,imgId, description, mangaId );
                listOfChapter.add(chapter);
            }
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try {
                cnt.close();
                stm.close();
                res.close();
            } catch (SQLException ex) {
                Logger.getLogger(ChapterDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listOfChapter;    
    }
    
    public void addChapter(String title,int imageID, String description,int mangaID) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = connection;
            String sql = "INSERT INTO Manga (title,imageID, description, mangaID,"
                    + " VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, title);
            stmt.setInt(2, imageID);
            stmt.setString(3, description);
            stmt.setInt(4, mangaID);
            stmt.executeUpdate();
            System.out.println("Inserted successfully!");

        } catch (SQLException e) {
            System.out.println("Error occurred while inserting: " + e.getMessage());
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println("Error occurred while closing database resources: " + e.getMessage());
            }
        }
    }
    
    public void updateChapter(String title,int imageID, String description,int mangaID,int chapterID) {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            String sql = "UPDATE Manga SET title = ?, imageID = ?,"
                    + " description = ?, mangaID = ? WHERE chapterID = ?";

            conn = connection;
            stm = conn.prepareStatement(sql);
            
            stm.setString(1, title);
            stm.setInt(2, imageID);
            stm.setString(3, description);
            stm.setInt(4, mangaID);
            stm.setInt(5, chapterID);

            int rowsUpdated = stm.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Updated successfully.");
            } else {
                System.out.println("Not found with the provided ID.");
            }
        } catch (SQLException e) {
            System.out.println("Error occurred while updating: " + e.getMessage());
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public void deleteChapter(Integer id) {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
         try{
            String sql = "delete from Chapter where chapterID = ?";
            cnt = connection;
            cnt.setAutoCommit(false); 
            stm = cnt.prepareStatement(sql);
            stm.setInt(1,id);
            stm.executeUpdate();
            cnt.commit();
            System.err.println("Delete!");
        }catch(SQLException e){
            System.out.println(e.getMessage());
            try{
                cnt.rollback();
            }catch(SQLException e1){
                e1.printStackTrace();
            }
        }finally{
            try{
                if (cnt != null){
                   cnt.close();
               }
               if (stm != null){
                   stm.close();
               }
            }catch(Exception e2){
                e2.printStackTrace();
            }
        }
    }
}
