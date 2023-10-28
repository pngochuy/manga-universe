/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package dal;

import java.time.LocalDateTime;

import java.util.ArrayList;
import java.util.List;
import model.User;
import ultils.EncryptPassword;

/**
 *
 * @author PC
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
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
          CategoryDAO cate = new CategoryDAO();
          System.out.println(cate.getAllCategorys());
        
        
//        System.out.println(encryptPassword.toSHA1("123"));
        
        
    }

}
