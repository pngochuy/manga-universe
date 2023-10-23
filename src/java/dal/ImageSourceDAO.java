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
import model.ImageSource;

public class ImageSourceDAO extends DBContext{
    List<ImageSource> listOfImageS = new ArrayList<>();
    
    public List<ImageSource> getImgSourceByID(int chapterID,int mangaID) {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
        try{
            cnt = connection;
            String sql = "select * from ImageSource where chapterID = ? "
                    + "and mangaID = ?";
            
            stm = cnt.prepareStatement(sql);  
            stm.setInt(1, chapterID);
            stm.setInt(2, mangaID);
            res = stm.executeQuery();
            while(res.next()){
                Integer id = res.getInt("imageID");
                String imgUrl = res.getString("imageUrl");
                String description = res.getString("description");
                Integer chapterId = res.getInt("chapterID");
                Integer mangaId = res.getInt("mangaID");
                
                ImageSource imageSource = new ImageSource(id,imgUrl,description,chapterId,mangaId);
                listOfImageS.add(imageSource);
            }
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try {
                cnt.close();
                stm.close();
                res.close();
            } catch (SQLException ex) {
                Logger.getLogger(ImageSourceDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listOfImageS;    
    }
}
