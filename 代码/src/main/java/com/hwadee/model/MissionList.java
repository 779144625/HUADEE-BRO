package com.hwadee.model;

public class MissionList {
    public String getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(String finishTime) {
        this.finishTime = finishTime;
    }

    public String getStaffCost() {
        return staffCost;
    }

    public void setStaffCost(String staffCost) {
        this.staffCost = staffCost;
    }

    public int getMissionId() {
        return missionId;
    }

    public void setMissionId(int missionId) {
        this.missionId = missionId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public String getMissionStatus() {
        return missionStatus;
    }

    public void setMissionStatus(String missionStatus) {
        this.missionStatus = missionStatus;
    }

    public String getMissionTime() {
        return missionTime;
    }

    public void setMissionTime(String missionTime) {
        this.missionTime = missionTime;
    }

    public String getMissionType() {
        return missionType;
    }

    public void setMissionType(String missionType) {
        this.missionType = missionType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    private int missionId;
    private String userId;
    private int staffId;
    private String missionStatus;
    private String missionTime;
    private String missionType;
    private String description;
    private String finishTime;
    private String staffCost;
    private String address;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public MissionList(){}
    public MissionList(int missionId, String userId, int staffId, String missionStatus, String missionTime,String missionType,String description, String finishTime,String staffCost) {
        this.missionId=missionId;
        this.userId=userId;
        this.staffId=staffId;
        this.missionStatus=missionStatus;
        this.missionTime=missionTime;
        this.missionType=missionType;
        this.description=description;
        this.finishTime=finishTime;
        this.staffCost=staffCost;
    }


}
