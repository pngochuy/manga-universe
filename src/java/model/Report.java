/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.time.LocalDateTime;
/**
 *
 * @author ADMIN
 */
public class Report {
    private int reportID;
    private int userID;
    private int mangaID;
    private String reason;
    private LocalDateTime Dateofreport;
    
    
    public Report() {
    }

    public Report(int reportID, int userID, int mangaID, String reason, LocalDateTime Dateofreport) {
        this.reportID = reportID;
        this.userID = userID;
        this.mangaID = mangaID;
        this.reason = reason;
        this.Dateofreport = Dateofreport;
    }

    public int getReportID() {
        return reportID;
    }

    public void setReportID(int reportID) {
        this.reportID = reportID;
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

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public LocalDateTime getDateofreport() {
        return Dateofreport;
    }

    public void setDateofreport(LocalDateTime Dateofreport) {
        this.Dateofreport = Dateofreport;
    }
    
}
