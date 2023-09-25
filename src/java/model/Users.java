/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author PC
 */
public class Users {
    private String username;
    private String password;
    private String name;
    private String email;
    private String phoneNumber;
    private boolean gender;
    private String role;
    private LocalDateTime expiredTime;
    private int coinQuantity;
    private LocalDateTime createAt;

    public Users() {
    }

    public Users(String username, String password, String name, String email, String phoneNumber, boolean gender, String role, LocalDateTime expiredTime, int coinQuantity, LocalDateTime createAt) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
        this.role = role;
        this.expiredTime = expiredTime;
        this.coinQuantity = coinQuantity;
        this.createAt = createAt;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public LocalDateTime getExpiredTime() {
        return expiredTime;
    }

    public void setExpiredTime(LocalDateTime expiredTime) {
        this.expiredTime = expiredTime;
    }

    public int getCoinQuantity() {
        return coinQuantity;
    }

    public void setCoinQuantity(int coinQuantity) {
        this.coinQuantity = coinQuantity;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "Users{" + "username=" + username + ", password=" + password + ", name=" + name + ", email=" + email + ", phoneNumber=" + phoneNumber + ", gender=" + gender + ", role=" + role + ", expiredTime=" + expiredTime + ", coinQuantity=" + coinQuantity + ", createAt=" + createAt + '}';
    }
    
    
}
