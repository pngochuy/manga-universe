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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Chapter;

/**
 *
 * @author OS
 */
public class CategoryDAO extends  DBContext{
    List<Category> listOfCategorys = new ArrayList<>();
    
    public List<Category> getAllCategorys() {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
        try{
            cnt = connection;
            String sql = "select * from Category ";
            
            stm = cnt.prepareStatement(sql);  
            res = stm.executeQuery();
            while(res.next()){
                Integer id = res.getInt("categoryID");
                String type = res.getString("type");
      
                String description = res.getString("description");
               
                
                Category cateL = new Category(id, type, description);
                listOfCategorys.add(cateL);
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
        return listOfCategorys;    
    }
}
