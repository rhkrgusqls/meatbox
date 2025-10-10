package com.user.login.db;

public class LoginResultBean {
    private int userIndex;
    private int role; // 1: 일반, 2: 사업자, 3: 관리자

    public LoginResultBean(int userIndex, int role) {
        this.userIndex = userIndex;
        this.role = role;
    }

    public int getUserIndex() {
        return userIndex;
    }

    public int getRole() {
        return role;
    }
}
