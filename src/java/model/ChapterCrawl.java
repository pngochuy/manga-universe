/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class ChapterCrawl {
    private String chapterID;
    private String title, description;
    private String mangaID;
    private String createAt;

    public ChapterCrawl() {
    }

    public ChapterCrawl(String chapterID, String title, String description, String mangaID, String createAt) {
        this.chapterID = chapterID;
        this.title = title;
        this.description = description;
        this.mangaID = mangaID;
        this.createAt = createAt;
    }

    public String getChapterID() {
        return chapterID;
    }

    public void setChapterID(String chapterID) {
        this.chapterID = chapterID;
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

    public String getMangaID() {
        return mangaID;
    }

    public void setMangaID(String mangaID) {
        this.mangaID = mangaID;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }
    
    public String getCreateAtFormat() {
        return createAt;
    }

    @Override
    public String toString() {
        return "ChapterCrawl{" + "chapterID=" + chapterID + ", title=" + title + ", description=" + description + ", mangaID=" + mangaID + ", createAt=" + createAt + '}';
    }
    
}
