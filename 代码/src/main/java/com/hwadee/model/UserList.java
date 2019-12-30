package com.hwadee.model;

public class UserList {

    public UserList(){}

    private String userId;
    private String name;
    private String password;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    private String picUrl;
    private String userType;
    private String phoneNum;
    private String address;
    /*允许修改 password picUrl phoneNum address*/

    public UserList(String userId, String name, String userType, String password, String picUrl, String phoneNum, String address) {
        this.address=address;
        this.password=password;
        this.phoneNum=phoneNum;
        this.picUrl=picUrl;
        this.name=name;
        this.userId=userId;
        this.userType=userType;
    }

    @Override
    public String toString() {
        return "user [userId="+userId+"name="+name+"password="+password
                +"userType="+userType+"phoneNum="+phoneNum+"address="+address+"]";
    }

}
