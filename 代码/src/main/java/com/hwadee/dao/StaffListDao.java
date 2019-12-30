package com.hwadee.dao;

import java.util.List;

import com.hwadee.model.StaffList;
import org.springframework.stereotype.Repository;

@Repository
public interface StaffListDao {

    StaffList findByID(int id);

    List<StaffList> findAll();

    int insert(StaffList a);

    int delete(int id);

    int update(StaffList a);
}
