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
public class Report {
    private int reportID;
    private int userID;
    private int mangaID;
    private String reason;
    private Date reportTime;

    // Constructors, getters, and setters go here

    public Report() {
    }

    public Report(int reportID, int userID, int mangaID, String reason, Date reportTime) {
        this.reportID = reportID;
        this.userID = userID;
        this.mangaID = mangaID;
        this.reason = reason;
        this.reportTime = reportTime;
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

    public Date getReportTime() {
        return reportTime;
    }

    public void setReportTime(Date reportTime) {
        this.reportTime = reportTime;
    }

    @Override
    public String toString() {
        return "Report{" + "reportID=" + reportID + ", userID=" + userID + ", mangaID=" + mangaID + ", reason=" + reason + ", reportTime=" + reportTime + '}';
    }
    
    
}

