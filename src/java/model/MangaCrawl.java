 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class MangaCrawl {
    
    private String mangaID;
    private String title, description, author;
    private boolean copyRight, free;
    private String coverImage;

    public MangaCrawl() {
    }

    public MangaCrawl(String mangaID, String title, String description, String author, boolean copyRight, boolean free, String coverImage) {
        this.mangaID = mangaID;
        this.title = title;
        this.description = description;
        this.author = author;
        this.copyRight = copyRight;
        this.free = free;
        this.coverImage = coverImage;
    }

    public String getMangaID() {
        return mangaID;
    }

    public void setMangaID(String mangaID) {
        this.mangaID = mangaID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public boolean isCopyRight() {
        return copyRight;
    }

    public void setCopyRight(boolean copyRight) {
        this.copyRight = copyRight;
    }

    public boolean isFree() {
        return free;
    }

    public void setFree(boolean free) {
        this.free = free;
    }

    public String getCoverImage() {
        return coverImage;
    }

    public void setCoverImage(String coverImage) {
        this.coverImage = coverImage;
    }

    @Override
    public String toString() {
        return "MangaCrawl{" + "mangaID=" + mangaID + ", title=" + title + ", description=" + description + ", author=" + author + ", copyRight=" + copyRight + ", free=" + free + ", coverImage=" + coverImage + '}';
    }
    
    
    
}
