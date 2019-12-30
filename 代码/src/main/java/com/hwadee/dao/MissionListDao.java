package com.hwadee.dao;

import java.util.List;

import com.hwadee.model.MissionList;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MissionListDao {


    MissionList findByID(int id);

    List<MissionList> findAll();

    int insert(MissionList a);

    int delete(int id);

    int update(MissionList a);

    List<MissionList> findByUserId(@Param("userId")String userId);

    public List<MissionList> findMission();
}
