package dal;


import java.math.BigDecimal;
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
import model.Category;
import model.Manga;


public class MangaDAO extends DBContext implements mangaInterface  {
    List<Manga> listOfMangas = new ArrayList<>();
    List<Category> listOfCategorys = new ArrayList<>();
    
    @Override
    public List<Manga> getAllMangas() {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
        try{
            cnt = connection;
            String sql = "SELECT * FROM MANGA";
            stm = cnt.prepareStatement(sql);    
            res = stm.executeQuery();
            while(res.next()){
                Integer id = res.getInt("mangaID");
                String title = res.getString("title");
                String description = res.getString("description");
                Integer userID = res.getInt("userID");
                Date createdAt = res.getDate("createdAt");
                Boolean isCopyright = res.getBoolean("isCopyright");
                Boolean isFree = res.getBoolean("isFree");
                String coverImage = res.getString("coverImage");
                Manga manga = new Manga(id, title, description, userID , createdAt, isCopyright,isFree,coverImage );
                listOfMangas.add(manga);
            }
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try {
                cnt.close();
                stm.close();
                res.close();
            } catch (SQLException ex) {
                Logger.getLogger(MangaDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listOfMangas;    
    }
    
    public List<Manga> getMangasDescByDate() {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
        try{
            cnt = connection;
            String sql = "SELECT * FROM MANGA "
                    + "ORDER BY createdAt DESC";
            stm = cnt.prepareStatement(sql);    
            res = stm.executeQuery();
            while(res.next()){
                Integer id = res.getInt("mangaID");
                String title = res.getString("title");
                String description = res.getString("description");
                Integer userID = res.getInt("userID");
                Date createdAt = res.getDate("createdAt");
                Boolean isCopyright = res.getBoolean("isCopyright");
                Boolean isFree = res.getBoolean("isFree");
                String coverImage = res.getString("coverImage");
                Manga manga = new Manga(id, title, description, userID , createdAt, isCopyright,isFree,coverImage );
                listOfMangas.add(manga);
            }
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try {
                cnt.close();
                stm.close();
                res.close();
            } catch (SQLException ex) {
                Logger.getLogger(MangaDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listOfMangas;    
    }
    
    public List<Manga> getRandomMangas() {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
        try{
            cnt = connection;
            String sql = "SELECT * FROM Manga "
                    + "ORDER BY NEWID()";
            stm = cnt.prepareStatement(sql);    
            res = stm.executeQuery();
            while(res.next()){
                Integer id = res.getInt("mangaID");
                String title = res.getString("title");
                String description = res.getString("description");
                Integer userID = res.getInt("userID");
                Date createdAt = res.getDate("createdAt");
                Boolean isCopyright = res.getBoolean("isCopyright");
                Boolean isFree = res.getBoolean("isFree");
                String coverImage = res.getString("coverImage");
                Manga manga = new Manga(id, title, description, userID , createdAt, isCopyright,isFree,coverImage );
                listOfMangas.add(manga);
            }
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try {
                cnt.close();
                stm.close();
                res.close();
            } catch (SQLException ex) {
                Logger.getLogger(MangaDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listOfMangas;    
    }

    @Override
    public void addManga(String title, String description,int userID, 
            Date createAt, boolean isCopyRight,boolean isFree,String coverImage) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = connection;
            String sql = "INSERT INTO Manga (title, description, userID,"
                    + "createAt, isCopyRight, isFree, coverImage) VALUES (?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, title);
            stmt.setString(2, description);
            stmt.setInt(3, userID);
            stmt.setDate(4, (java.sql.Date) createAt);
            stmt.setBoolean(5, isCopyRight);
            stmt.setBoolean(6, isFree);
            stmt.setString(7, coverImage);
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

    @Override
    public void updateManga(String title, String description,int userID, 
            Date createAt, boolean isCopyRight,boolean isFree,String coverImage, int id) {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            String sql = "UPDATE Manga SET title = ?, description = ?,"
                    + " userID = ?, createAt = ?, isCopyRight = ?, "
                    + " isFree = ?, coverImage = ? WHERE mangaID = ?";

            conn = connection;
            stm = conn.prepareStatement(sql);
            
            stm.setString(1, title);
            stm.setString(2, description);
            stm.setInt(3, userID);
            stm.setDate(4, (java.sql.Date) createAt);
            stm.setBoolean(5, isCopyRight);
            stm.setBoolean(6, isFree);
            stm.setString(7, coverImage);
            stm.setInt(8, id);

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

    @Override
    public void deleteManga(Integer id) {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
         try{
            String sql = "delete from Manga where mangaID = ?";
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

    public int getTotalRows() throws Exception {
        int rows = 0;
        Connection conn = null;
        PreparedStatement ps = null; 
        ResultSet rs = null;

        String query = "select count(*) from Manga";

        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBContext.close(conn, ps, rs);
        }
        return rows;
    }
    public List<Manga> getMangaPaging(int index) throws
            Exception {
        
        List<Manga> products = new ArrayList<>();
        String query = "SELECT * FROM Manga \n" 
                + "ORDER BY mangaID \n" 
                + "OFFSET ? ROWS FETCH NEXT 8 ROWS ONLY;";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 8);
   
            rs = ps.executeQuery();
            while (rs.next()) {
                Integer id = rs.getInt("1");
                String title = rs.getString("2");
                String description = rs.getString("3");
                Integer userID = rs.getInt("4");
                Date creatAt = rs.getDate("5");
                Boolean isCopyright = rs.getBoolean("6");
                Boolean isFree = rs.getBoolean("7");
                String coverImage = rs.getString("8");
                Manga manga = new Manga(id, title, description, userID , creatAt, isCopyright,isFree,coverImage);
                listOfMangas.add(manga);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBContext.close(conn, ps, rs);
        }
        return products;
    }
    
    public int getCountSearch(String txtSearch) throws Exception {
        
        Connection conn = null;
        PreparedStatement ps = null; 
        ResultSet rs = null;

        String query = "select count(*) from Manga where title like ?";

        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            throw ex;
        } 
        return 0;
    }
//                                                        
    public List<Manga> searchMangaByTitle(String txtSearch, int index, int size) throws
            Exception {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            List<Manga> list = new ArrayList<>();
            String query = "with x as(select ROW_NUMBER() over (order by mangaID asc) as r\n"
                    + ",* from Manga where title like ?)\n"
                    + "select * from x where r between (?-1)*8+1 and ?*8";
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setInt(2, index);
            ps.setInt(3, index);
//            String query = "select * from Manga where title like ?";
//            conn = DBContext.getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Integer id = rs.getInt(2);
                String title = rs.getString(3);
                String description = rs.getString(4);
                Integer userID = rs.getInt(5);
                Date createdAt = rs.getDate(6);
                Boolean isCopyright = rs.getBoolean(7);
                Boolean isFree = rs.getBoolean(8);
                String coverImage = rs.getString(9);
                list.add(new Manga(id, title, description, userID, createdAt, isCopyright, isFree,coverImage));
            }
            return list;
        } catch (SQLException e) {
            // Xử lý lỗi SQL
                e.printStackTrace();
            throw new Exception("SQL Error: " + e.getMessage());
        }
        catch (Exception ex) {
            throw ex;
        } 

    }
    public List<Manga> searchMangaByCategory(String cate) throws Exception {
        List<Manga> mg = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT *\n" +
                    "FROM Manga\n" +
                    "INNER JOIN MangaCategory ON Manga.MangaID = MangaCategory.MangaID\n" +
                    "INNER JOIN Category ON MangaCategory.CategoryID = Category.CategoryID\n" +
                    "WHERE Category.type = ?";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, cate);
            rs = ps.executeQuery();
            while (rs.next()) {
                mg.add(new Manga(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), 
                        rs.getDate(5), rs.getBoolean(6), rs.getBoolean(7),rs.getString(8)));
            }
        } catch (Exception e) {
             e.printStackTrace(); // In ra lỗi để bạn biết vấn đề là gì.
        }
    
        return mg;
    }
    
    public ArrayList<Category> searchCategoryByID(int id) throws Exception {
        ArrayList<Category> cate = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT *\n" +
                        "FROM MangaCategory\n" +
                        "INNER JOIN Category ON MangaCategory.CategoryID = Category.CategoryID\n" +
                        "WHERE MangaCategory.MangaID = ?";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                cate.add(new Category( rs.getInt("categoryID"),rs.getString("type"),
                        rs.getString("description")));
            }
        } catch (Exception e) {

        }
        return cate;
    }
     public static void main(String[] args) throws Exception {
//        LocalDateTime dateCreated = LocalDateTime.now();
//        UserDAO userDAO = new UserDAO();
//        EncryptPassword encryptPassword = new EncryptPassword();
        
//        userDAO.create(new User("image/3.png", "fpt", "123", "", "sieunhangao@gmail.com", "", 
//                false, "Author", dateCreated, 9999, dateCreated));
//        User user = new User("", "demo", encryptPassword.toSHA1("123"), "", "demo123@gmail.com", "", true, "Author", dateCreated, 0, dateCreated);
//        userDAO.create(user);
//        int userId = userDAO.getUserId("demo", "123", "demo123@gmail.com");
//        userDAO.update(user, userId);
//        userDAO.delete(12);
          MangaDAO dao = new MangaDAO();
          dao.getCountSearch("Boku");
          System.out.println(dao.searchCategoryByID(1));
          System.out.println(dao.searchMangaByTitle("Boku", 1, 2));
          System.out.println(dao.searchMangaByCategory("Action"));
//          System.out.println(dao.getRandomMangas());
          System.out.println(dao.getMangasDescByDate());
        
//        System.out.println(encryptPassword.toSHA1("123"));
        
        
    }
}
