/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Manga;
import model.Post;

/**
 *
 * @author PC
 */
public class MangaDAO extends DBContext {

    // get a Manga
    public Manga getManga(int mangaID) {
        try {
            String sql = "SELECT * FROM [Manga]"
                    + "WHERE mangaID = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, mangaID);

            ResultSet res = ps.executeQuery();

            Manga manga = new Manga();
            if (res.next()) {
                Integer id = res.getInt("mangaID");
                String title = res.getString("title");
                String description = res.getString("description");
                Integer userID = res.getInt("userID");
                LocalDateTime createdAt = res.getTimestamp("createAt").toLocalDateTime();
                Boolean isCopyright = res.getBoolean("isCopyright");
                Boolean isFree = res.getBoolean("isFree");
                String coverImage = res.getString("coverImage");
                Manga m = new Manga(id, title, description, userID, createdAt, isCopyright, isFree, coverImage);

                manga = m;
            }

            res.close();
            ps.close();

            return manga;

        } catch (SQLException ex) {
            Logger.getLogger(MangaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    // get all Manga => for home.jsp
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
                LocalDateTime createdAt = res.getTimestamp("createAt").toLocalDateTime();
                Boolean isCopyright = res.getBoolean("isCopyright");
                Boolean isFree = res.getBoolean("isFree");
                String coverImage = res.getString("coverImage");
                Manga manga = new Manga(id, title, description, userID, createdAt, isCopyright, isFree, coverImage);

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

    // get all Manga by userID => for mangaSinglePage, ...
    public ArrayList<Manga> getAllByUserID(int i) {
        try {
            String sql = "SELECT * FROM [Manga]\n"
                    + "  WHERE userID = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, i);

            ResultSet res = ps.executeQuery();

            ArrayList<Manga> list = new ArrayList<>();
            while (res.next()) {
                Integer id = res.getInt("mangaID");
                String title = res.getString("title");
                String description = res.getString("description");
                Integer userID = res.getInt("userID");
                LocalDateTime createdAt = res.getTimestamp("createAt").toLocalDateTime();
                Boolean isCopyright = res.getBoolean("isCopyright");
                Boolean isFree = res.getBoolean("isFree");
                String coverImage = res.getString("coverImage");
                Manga manga = new Manga(id, title, description, userID, createdAt, isCopyright, isFree, coverImage);

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

    // get all Manga by categoryID => advancedSearch.jsp
    public ArrayList<Manga> getMangasByCategoryID(int categoryID) {
        try {
            String sql = "SELECT * FROM [Manga] m \n"
                    + "  INNER JOIN [MangaCategory] mc ON m.MangaID = mc.MangaID\n"
                    + "  WHERE mc.CategoryID = ?"
                    + "  ORDER BY m.mangaID ASC;";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, categoryID);

            ResultSet res = ps.executeQuery();

            ArrayList<Manga> list = new ArrayList<>();
            while (res.next()) {
                Integer id = res.getInt("mangaID");
                String title = res.getString("title");
                String description = res.getString("description");
                Integer userID = res.getInt("userID");
                LocalDateTime createdAt = res.getTimestamp("createAt").toLocalDateTime();
                Boolean isCopyright = res.getBoolean("isCopyright");
                Boolean isFree = res.getBoolean("isFree");
                String coverImage = res.getString("coverImage");
                Manga manga = new Manga(id, title, description, userID, createdAt, isCopyright, isFree, coverImage);

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
            String sql = "INSERT INTO [Manga] "
                    + "(title, description, userID, createAt, isCopyRight, isFree, coverImage) "
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

    // update Manga
    public void update(Manga manga) {

        try {
            String sql = "UPDATE [Manga]\n"
                    + "SET title = ?,\n"
                    + "    description = ?,\n"
                    + "    userID = ?,\n"
                    + "    createAt = ?,\n"
                    + "    isCopyRight = ?,\n"
                    + "    isFree = ?,\n"
                    + "    coverImage = ?\n"
                    + "WHERE mangaID = ?;";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setNString(1, manga.getTitle());
            ps.setNString(2, manga.getDescription());
            ps.setInt(3, manga.getUserID());
            ps.setTimestamp(4, Timestamp.valueOf(manga.getCreateAt()));
            ps.setBoolean(5, manga.isCopyRight());
            ps.setBoolean(6, manga.isFree());
            ps.setString(7, manga.getCoverImage());
            ps.setInt(8, manga.getMangaID());

            ps.execute();

            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(MangaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    // Delete
    public String delete(Manga manga) {
        try {
            String sql = "DECLARE @mangaID INT;"
                    + "SET @mangaID = ?;"
                    + "DELETE FROM [ImageSource] WHERE mangaID = @mangaID;"
                    + "DELETE FROM [Chapter] WHERE mangaID = @mangaID;"
                    + "DELETE FROM [MangaCategory] WHERE mangaID = @mangaID;"
                    + "DELETE FROM [Manga] WHERE mangaID = @mangaID;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, manga.getMangaID());
            int rowsDeleted = ps.executeUpdate();

            if (rowsDeleted > 0) {
                return "OKAY ALL!"; // Xóa thành công
            }

            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(MangaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "failed ALL"; // Xóa không thành công
    }

    public boolean delete2(int mangaID) {

        try {
            String sql = "DELETE FROM [Manga] "
                    + "WHERE mangaID = ?;";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, mangaID);

            ps.execute();

            ps.close();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(MangaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // check Title is exist
    public boolean isTitleExist(String title) {
        try {
            String sql = "SELECT COUNT(*) FROM [Manga] WHERE title = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);

            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }

            resultSet.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(MangaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    // get 1 username by mangaID
    public int getUserIDByMangaID(int mangaID) {

        try {
            String sql = "SELECT TOP 1 userID FROM [Manga] m\n"
                    + "  WHERE m.mangaID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, mangaID);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("userID");
            }

            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(MangaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return -1;
    }

    // 
    public ArrayList<Manga> getTop4MangaList() {
        try {
            String sql = "SELECT TOP 4 * FROM [Manga];";
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet res = ps.executeQuery();

            ArrayList<Manga> list = new ArrayList<>();
            while (res.next()) {
                Integer id = res.getInt("mangaID");
                String title = res.getString("title");
                String description = res.getString("description");
                Integer userID = res.getInt("userID");
                LocalDateTime createdAt = res.getTimestamp("createAt").toLocalDateTime();
                Boolean isCopyright = res.getBoolean("isCopyright");
                Boolean isFree = res.getBoolean("isFree");
                String coverImage = res.getString("coverImage");
                Manga manga = new Manga(id, title, description, userID, createdAt, isCopyright, isFree, coverImage);

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

    public ArrayList<Manga> searchMangaByTitle(String txtSearch, int index) {

        ResultSet rs = null;

        try {
            ArrayList<Manga> list = new ArrayList<>();
            String query = "with x as(select ROW_NUMBER() over (order by mangaID asc) as r\n"
                    + ",* from Manga where title like ?)\n"
                    + "select * from x where r between (?-1)*12+1 and ?*12";

            PreparedStatement ps = connection.prepareStatement(query);
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
                LocalDateTime createdAt = rs.getTimestamp(6).toLocalDateTime();
                Boolean isCopyright = rs.getBoolean(7);
                Boolean isFree = rs.getBoolean(8);
                String coverImage = rs.getString(9);
                list.add(new Manga(id, title, description, userID, createdAt, isCopyright, isFree, coverImage));
            }

            ps.close();
            rs.close();

            return list;
        } catch (SQLException e) {
            // Xử lý lỗi SQL
            e.printStackTrace();
        } catch (Exception ex) {
            throw ex;
        }

        return null;

    }

    public int getCountSearch(String txtSearch) {

        ResultSet rs = null;

        String query = "select count(*) from Manga where title like ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
            ps.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(MangaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Manga> searchMangaByCategory(ArrayList<String> categories) throws Exception {
        ArrayList<Manga> mg = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // Tạo danh sách dấu chấm hỏi, ví dụ: "?, ?, ?, ?" tương ứng với số lượng thẻ
        String questionMarks = String.join(", ", Collections.nCopies(categories.size(), "?"));

        String query = "SELECT M.* FROM Manga AS M "
                + "WHERE NOT EXISTS ("
                + "SELECT C.type "
                + "FROM Category AS C "
                + "WHERE C.type IN (" + questionMarks + ") "
                + "EXCEPT "
                + "SELECT C.type "
                + "FROM MangaCategory AS MC "
                + "INNER JOIN Category AS C ON MC.CategoryID = C.CategoryID "
                + "WHERE MC.MangaID = M.MangaID"
                + ")";
        try {
            conn = connection;
            ps = conn.prepareStatement(query);

            // Đặt giá trị cho từng dấu chấm hỏi
            int parameterIndex = 1;
            for (String category : categories) {
                ps.setString(parameterIndex++, category);
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                int mangaID = rs.getInt(1);
                String title = rs.getString(2);
                String description = rs.getString(3);
                int userID = rs.getInt(4);

                LocalDateTime createdAt = rs.getTimestamp(5).toLocalDateTime();

//                Date createDate = rs.getDate(5);
//                LocalDateTime createAt = rs.getDate(5).toLocalDate().atTime(LocalTime.MIN);
                boolean isCopyRight = rs.getBoolean(6);
                boolean isFree = rs.getBoolean(7);
                String coverImage = rs.getString(8);

                mg.add(new Manga(mangaID, title, description, userID, createdAt, isCopyRight, isFree, coverImage));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mg;
    }

    public List<Manga> getMangasDescByDate() {
        Connection cnt = null;
        PreparedStatement stm = null;
        ResultSet res = null;
        List<Manga> listOfMangas = new ArrayList<>();
        try {
            cnt = connection;
            String sql = "SELECT * FROM MANGA "
                    + "ORDER BY createAt DESC";
            stm = cnt.prepareStatement(sql);
            res = stm.executeQuery();
            while (res.next()) {
                Integer id = res.getInt("mangaID");
                String title = res.getString("title");
                String description = res.getString("description");
                Integer userID = res.getInt("userID");
                
                LocalDateTime createdAt = res.getTimestamp("createAt").toLocalDateTime();
                
//                Date createdAt = res.getDate("createdAt");
                Boolean isCopyright = res.getBoolean("isCopyright");
                Boolean isFree = res.getBoolean("isFree");
                String coverImage = res.getString("coverImage");
                
                Manga manga = new Manga(id, title, description, userID, createdAt, isCopyright, isFree, coverImage);
                listOfMangas.add(manga);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
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
        List<Manga> listOfMangas = new ArrayList<>();
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
                
                LocalDateTime createdAt = res.getTimestamp("createAt").toLocalDateTime();
                
//                Date createdAt = res.getDate("createdAt");
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
}
