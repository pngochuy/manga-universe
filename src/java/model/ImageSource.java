/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class ImageSource {
    public int imageID;
    public String imageURL;
    public String description;
    public int chapterID;
    public int mangaID;

    public ImageSource(int imageID, String imageURL, String description, int chapterID, int mangaID) {
        this.imageID = imageID;
        this.imageURL = imageURL;
        this.description = description;
        this.chapterID = chapterID;
        this.mangaID = mangaID;
    }

    public ImageSource(String imageURL, String description, int chapterID, int mangaID) {
        this.imageURL = imageURL;
        this.description = description;
        this.chapterID = chapterID;
        this.mangaID = mangaID;
    }


    
    

    public int getImageID() {
        return imageID;
    }

    public void setImageID(int imageID) {
        this.imageID = imageID;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getChapterID() {
        return chapterID;
    }

    public void setChapterID(int chapterID) {
        this.chapterID = chapterID;
    }

    public int getMangaID() {
        return mangaID;
    }

    public void setMangaID(int mangaID) {
        this.mangaID = mangaID;
    }

    @Override
    public String toString() {
        return "ImageSource{" + "imageID=" + imageID + ", imageURL=" + imageURL + ", description=" + description + ", chapterID=" + chapterID + ", mangaID=" + mangaID + '}';
    }



    
}