/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package dal;

import java.time.LocalDateTime;

import java.util.ArrayList;
import java.util.List;
import model.UserDemo;

/**
 *
 * @author PC
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        UserDemo admin = new UserDemo("ngochuy", "12345", "huy@gmail.con", "0935950665");
        UserDemoDAO adminDAO = new UserDemoDAO();
        
//        adminDAO.createUserDemo(admin);
        System.out.println(admin);
        System.out.println(adminDAO.createUserDemo(admin));
        System.out.println(adminDAO.getUserDemo("ngochuy", "12345"));

    }

}
