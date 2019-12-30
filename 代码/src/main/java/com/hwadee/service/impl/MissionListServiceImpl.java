package com.hwadee.service.impl;

import com.hwadee.dao.MissionListDao;
import com.hwadee.dao.StaffListDao;
import com.hwadee.model.MissionList;
import com.hwadee.model.StaffList;
import com.hwadee.service.MissionListService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MissionListServiceImpl implements MissionListService {


    @Resource
    private com.hwadee.dao.MissionListDao missionListDao;

    @Resource
    private StaffListDao staffListDao;

    @Override
    public List<MissionList> findAll() {
        List<MissionList> NewList = missionListDao.findAll();
        return NewList;
    }

    @Override
    public void update(MissionList missionList) {
        missionListDao.update(missionList);
    }

    @Override
    public void delete(int missionId) {
        missionListDao.delete(missionId);
    }

    @Override
    public void insert(MissionList missionList) {
        missionListDao.insert(missionList);
    }

    @Override
    public MissionList MissionDelivery() {
        List<StaffList> allStaff = staffListDao.findAll();
        MissionList missionList = new MissionList();
        missionList.setMissionStatus("UnDelivery");

        String a = "0";

//      自动分配任务，每个组员最多可分配3个任务,确保任务从最少的员工开始分配

        loop:
        switch (a) {
            case "0":
                for (int i = 0; i < allStaff.size(); i++) {
                    if (allStaff.get(i).getWorkStatus().equals(a)) {
                        a = "1";
                        missionList.setMissionStatus("Deliveried");
                        allStaff.get(i).setWorkStatus(a);
                        staffListDao.update(allStaff.get(i));
                        missionList.setStaffId(allStaff.get(i).getStaffId());
                        break loop;
                    }
                }
                a = "1";
            case "1":
                for (int i = 0; i < allStaff.size(); i++) {
                    if (allStaff.get(i).getWorkStatus().equals(a)) {
                        a = "2";
                        missionList.setMissionStatus("Deliveried");
                        allStaff.get(i).setWorkStatus(a);
                        staffListDao.update(allStaff.get(i));
                        missionList.setStaffId(allStaff.get(i).getStaffId());
                        break loop;
                    }
                }
                a = "2";
            case "2":
                for (int i = 0; i < allStaff.size(); i++) {
                    if (allStaff.get(i).getWorkStatus().equals(a)) {
                        a = "3";
                        missionList.setMissionStatus("Deliveried");
                        allStaff.get(i).setWorkStatus(a);
                        staffListDao.update(allStaff.get(i));
                        missionList.setStaffId(allStaff.get(i).getStaffId());
                        break loop;
                    }
                }
                a = "3";
            case "3":
                missionList.setStaffId(0);
                break loop;
            default:break loop;
        }
        return missionList;
    }

    @Override
    public MissionList findByMissionId(int missionId) {
        MissionList missionList =missionListDao.findByID(missionId);
        return missionList;
    }

    @Override
    public List<MissionList> findByUserId(String userId) {
        List<MissionList> missionLists = missionListDao.findByUserId(userId);
        return missionLists;
    }

    @Override
    public List<MissionList> findMission() {
        List<MissionList> missionLists = missionListDao.findMission();
        return missionLists;
    }


}
