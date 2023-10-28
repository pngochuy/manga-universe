/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package model;

import dal.MangaDAO;
import java.time.format.DateTimeFormatter;


/**
 *
 * @author PC
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        MangaDAO dao = new MangaDAO();
        
        System.out.println(dao.searchCategoryByID(1));
    }
    
}
