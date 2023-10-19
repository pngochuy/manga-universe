/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Category {
    public int categoryID;
    public String type, description;
    public int mangaID;

    public Category() {
    }

    public Category(int categoryID, String type, String description, int mangaID) {
        this.categoryID = categoryID;
        this.type = type;
        this.description = description;
        this.mangaID = mangaID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getMangaID() {
        return mangaID;
    }

    public void setMangaID(int mangaID) {
        this.mangaID = mangaID;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryID=" + categoryID + ", type=" + type + ", description=" + description + ", mangaID=" + mangaID + '}';
    }
    
}
