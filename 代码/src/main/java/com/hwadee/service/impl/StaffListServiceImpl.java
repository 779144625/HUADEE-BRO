package com.hwadee.service.impl;

import com.hwadee.model.StaffList;
import com.hwadee.service.StaffListService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StaffListServiceImpl implements StaffListService {

    @Resource
    private com.hwadee.dao.StaffListDao stafflistDao;

    @Override
    public List<StaffList> findAll() {
        List<StaffList> x=stafflistDao.findAll();
        return x;
    }

    @Override
    public int delete(int id) {
        return 0;
    }

    @Override
    public StaffList findByID(int id) {
        return stafflistDao.findByID(id);
    }

    @Override
    public int insert(StaffList a) {
        return 0;
    }

    @Override
    public int update(StaffList a) {
        stafflistDao.update(a);
        return 0;
    }
}
