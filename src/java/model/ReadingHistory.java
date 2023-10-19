/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author OS
 */
public class ReadingHistory {
    private int historyID;
    private int userID;
    private int mangaID;
    private Date readAt;
    
    // Constructors, getters, and setters go here

    public ReadingHistory() {
    }

    public ReadingHistory(int historyID, int userID, int mangaID, Date readAt) {
        this.historyID = historyID;
        this.userID = userID;
        this.mangaID = mangaID;
        this.readAt = readAt;
    }

    public int getHistoryID() {
        return historyID;
    }

    public void setHistoryID(int historyID) {
        this.historyID = historyID;
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

    public Date getReadAt() {
        return readAt;
    }

    public void setReadAt(Date readAt) {
        this.readAt = readAt;
    }

    @Override
    public String toString() {
        return "ReadingHistory{" + "historyID=" + historyID + ", userID=" + userID + ", mangaID=" + mangaID + ", readAt=" + readAt + '}';
    }
    
}
