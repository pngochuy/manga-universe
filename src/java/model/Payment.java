/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author OS
 */
public class Payment {
    private int paymentID;
    private int userID;
    private BigDecimal totalAmount;
    private String transactionType;
    private Date createAt;
    private String description;

    // Constructors, getters, and setters go here

    public Payment() {
    }

    public Payment(int paymentID, int userID, BigDecimal totalAmount, String transactionType, Date createAt, String description) {
        this.paymentID = paymentID;
        this.userID = userID;
        this.totalAmount = totalAmount;
        this.transactionType = transactionType;
        this.createAt = createAt;
        this.description = description;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Payment{" + "paymentID=" + paymentID + ", userID=" + userID + ", totalAmount=" + totalAmount + ", transactionType=" + transactionType + ", createAt=" + createAt + ", description=" + description + '}';
    }
    
}

