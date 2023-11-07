package model;

import java.util.Date;

public class Notification {
    private int notificationID;
    private int userID;
    private String message;
    private Date notificationDate;
    private boolean isRead;

    public int getNotificationID() {
        return notificationID;
    }

    public void setNotificationID(int notificationID) {
        this.notificationID = notificationID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getNotificationDate() {
        return notificationDate;
    }

    public void setNotificationDate(Date notificationDate) {
        this.notificationDate = notificationDate;
    }

    public boolean isIsRead() {
        return isRead;
    }

    public void setIsRead(boolean isRead) {
        this.isRead = isRead;
    }

    @Override
    public String toString() {
        return "Notification{" + "notificationID=" + notificationID + ", userID=" + userID + ", message=" + message + ", notificationDate=" + notificationDate + ", isRead=" + isRead + '}';
    }

    
}
