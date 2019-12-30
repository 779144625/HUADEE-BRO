package com.hwadee.service;

import com.hwadee.model.MissionList;

import java.util.List;

public interface MissionListService {


    public void update(MissionList missionList);

    public void delete (int missionId);

    public List<MissionList> findAll();

    public void insert(MissionList missionList);

    public MissionList MissionDelivery();

    public MissionList findByMissionId(int missionId);

    public List<MissionList> findByUserId(String userId);

    public List<MissionList> findMission();

}
