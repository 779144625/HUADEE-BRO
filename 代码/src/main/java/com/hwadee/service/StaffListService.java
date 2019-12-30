package com.hwadee.service;

import com.hwadee.model.StaffList;

import java.util.List;

public interface StaffListService {

    StaffList findByID(int id);

    List<StaffList> findAll();

    int insert(StaffList a);

    int delete(int id);

    int update(StaffList a);


}
