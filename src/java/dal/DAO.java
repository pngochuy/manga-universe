/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author Admin
 */
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import entity.Users;
import entity.manga;

public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void editUser(String userID, String username, String name, String email, String password, String role,
            Date expiredDate, Date createDate, String coins, String phoneNumber, String gender) {
        String query = "UPDATE [MangaUniverse].[dbo].[Users]\n"
                + "SET\n"
                + "    [userName] = ?,\n"
                + "    [password] = ?,\n"
                + "    [role] = ?,\n"
                + "    [coinQuantity] = ?, \n"
                + "    [name] = ?,\n"
                + "    [email] = ?,\n"
                + "    [phoneNumber] = ?,\n"
                + "    [gender] = ?\n"
                + "WHERE\n"
                + "    [userID] = ?; ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, role);
            ps.setString(4, coins);
            ps.setString(5, name);
            ps.setString(6, email);
            ps.setString(7, phoneNumber);
            ps.setString(8, gender);
            ps.setString(9, userID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    ////////////////////////////////////////////////////////////////////////////
    public List<Users> getAllUsers() {
        List<Users> list = new ArrayList<>();
        String query = "Select * from Users";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Users(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getString(11)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    ////////////////////////////////////////////////////////////////////////////
    public void deleteUsers(String userID) {
        String query = "Delete from Users\n"
                + "Where userID=?;";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, userID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    ////////////////////////////////////////////////////////////////////////////
    public List<manga> getAllFreeManga(boolean isFree) {
        List<manga> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "FROM [MangaUniverse].[dbo].[Manga]\n"
                + "WHERE [isFree] = ?;";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps.setBoolean(1, isFree);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new manga(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getBoolean(6),
                        rs.getBoolean(7)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    ////////////////////////////////////////////////////////////////////////////
    public List<manga> getAllPremiumManga(boolean isFree) {
        List<manga> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "FROM [MangaUniverse].[dbo].[Manga]\n"
                + "WHERE [isFree] = ?;";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps.setBoolean(1, isFree);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new manga(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getBoolean(6),
                        rs.getBoolean(7)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
