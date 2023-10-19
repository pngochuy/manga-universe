/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class Comment {
    public int commentID, userID, mangaID;
    public String description;
    public Date createdAt;    

    @Override
    public String toString() {
        return "Comment{" + "commentID=" + commentID + ", userID=" + userID + ", mangaID=" + mangaID + ", description=" + description + ", createdAt=" + createdAt + '}';
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getMangaID() {
        return mangaID;
    }

    public void setMangaID(int mangaID) {
        this.mangaID = mangaID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Comment(int commentID, int userID, int mangaID, String description, Date createdAt) {
        this.commentID = commentID;
        this.userID = userID;
        this.mangaID = mangaID;
        this.description = description;
        this.createdAt = createdAt;
    }

    public Comment() {
    }
}
