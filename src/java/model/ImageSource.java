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

    public ImageSource(int imageID, String imageURL, String description, int chapterID) {
        this.imageID = imageID;
        this.imageURL = imageURL;
        this.description = description;
        this.chapterID = chapterID;
    }

    @Override
    public String toString() {
        return "ImageSource{" + "imageID=" + imageID + ", imageURL=" + imageURL + ", description=" + description + ", chapterID=" + chapterID + '}';
    }

    public ImageSource() {
    }
    
}
