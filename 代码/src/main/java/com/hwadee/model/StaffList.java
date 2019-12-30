package com.hwadee.model;

public class StaffList {

    public StaffList(){}
    private int staffId;

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getWorkStatus() {
        return workStatus;
    }

    public void setWorkStatus(String workStatus) {
        this.workStatus = workStatus;
    }

    private String staffName;
    private String workStatus;

    public StaffList(int staffId, String staffName, String workStatus) {
        this.staffId=staffId;
        this.staffName=staffName;
        this.workStatus=workStatus;
    }


}
