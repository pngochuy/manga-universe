/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class ImageSourceCrawl {
    private String imageSourceID;
    private String imageURL;
    private String chapterID;
    private String mangaID;

    public ImageSourceCrawl(String imageSourceID, String imageURL, String chapterID, String mangaID) {
        this.imageSourceID = imageSourceID;
        this.imageURL = imageURL;
        this.chapterID = chapterID;
        this.mangaID = mangaID;
    }

    public String getImageSourceID() {
        return imageSourceID;
    }

    public void setImageSourceID(String imageSourceID) {
        this.imageSourceID = imageSourceID;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getChapterID() {
        return chapterID;
    }

    public void setChapterID(String chapterID) {
        this.chapterID = chapterID;
    }

    public String getMangaID() {
        return mangaID;
    }

    public void setMangaID(String mangaID) {
        this.mangaID = mangaID;
    }

    @Override
    public String toString() {
        return "ImageSourceCrawl{" + "imageSourceID=" + imageSourceID + ", imageURL=" + imageURL + ", chapterID=" + chapterID + ", mangaID=" + mangaID + '}';
    }
    
    
}
