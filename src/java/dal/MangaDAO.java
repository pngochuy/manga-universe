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
    
    @Override
    public List<Manga> getAllMangas() {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
        try{
            cnt = connection;
            String sql = "select * from Manga";
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
                    + "createAt, isCopyRight, isFree, coverImage) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
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

//    @Override
//    public Manga findManga(Predicate<Manga> p) {
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet res = null;
//        Manga product = null;
//
//        try {
//            conn = connection;
//            String sql = "SELECT * FROM Manga";
//            stmt = conn.prepareStatement(sql);
//            res = stmt.executeQuery();
//
//            while (res.next()) {
//                Integer id = res.getInt("product_id");
//                String type = res.getString("product_type");
//                String name = res.getString("product_name");
//                BigDecimal price = res.getBigDecimal("product_price");
//                Integer numberof = res.getInt("product_numberof");
//                Integer available = res.getInt("product_available");
//                String detail = res.getString("product_detail");
//                String img = res.getString("product_img");
//                String brand = res.getString("product_brand");
//                Integer review = res.getInt("product_review");
//
////                Manga currentManga = new Manga(id, type, name, price, numberof, available, detail, img, brand, review);
//
////                if (p.test(currentManga)) {
////                    product = currentManga;
////                    break;
////                }
//            }
//        } catch (SQLException e) {
//            System.out.println("Error occurred while searching for product: " + e.getMessage());
//        } finally {
//            try {
//                if (res != null) {
//                    res.close();
//                }
//                if (stmt != null) {
//                    stmt.close();
//                }
//                if (conn != null) {
//                    conn.close();
//                }
//            } catch (SQLException e) {
//                System.out.println("Error occurred while closing database resources: " + e.getMessage());
//            }
//        }
//
//        return product;
//    }
//    public int getTotalRows() throws Exception {
//        int rows = 0;
//        Connection conn = null;
//        PreparedStatement ps = null; 
//        ResultSet rs = null;
//
//        String query = "select count(*) from product";
//
//        try {
//            conn = connection;
//            ps = conn.prepareStatement(query);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                rows = rs.getInt(1);
//            }
//        } catch (Exception ex) {
//            throw ex;
//        } finally {
//            DBContext.close(conn, ps, rs);
//        }
//        return rows;
//    }
    public List<Manga> getMangaPaging(int index) throws
            Exception {
        
        List<Manga> products = new ArrayList<>();
        String query = "SELECT * FROM product \n" 
                + "ORDER BY product_id \n" 
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

        String query = "select count(*) from product where product_name like ?";

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
        } finally {
            DBContext.close(conn, ps, rs);
        }
        return 0;
    }
//                                                        , int index, int size
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
                listOfMangas.add(new Manga(id, title, description, userID, createdAt, isCopyright, isFree,coverImage));
            }
            return list;
        } catch (Exception ex) {
            throw ex;
        } finally {
            DBContext.close(conn, ps, rs);
        }

    }
    public List<Manga> searchMangaByCategory(String cate) throws Exception {
        List<Manga> mg = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT Manga.*\n"
                + "FROM Manga\n"
                + "JOIN Category ON Manga.mangaID = Category.mangaID\n"
                + "WHERE Category.type = ?";
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

        }
        return mg;
    }
    
    public ArrayList<Category> searchCategoryByID(String id) throws Exception {
        ArrayList<Category> cate = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT *\n"
                + "FROM Category\n"
                + "WHERE mangaID = ?";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                cate.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
            }
        } catch (Exception e) {

        }
        return cate;
    }
}
