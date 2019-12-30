package com.hwadee.service.impl;

import com.hwadee.model.UserList;
import com.hwadee.service.UserListService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserListServiceImpl implements UserListService {

    @Resource
    private com.hwadee.dao.UserListDao userlistDao;

    @Override
    public List<UserList> findAll() {
        return null;

    }

    @Override
    public int delete(String id) {
        return 0;
    }

    @Override
    public int insert(UserList a) {
        userlistDao.insert(a);
        return 0;
    }

    @Override
    @Transactional
    public int update(UserList userList) {
        int count = userlistDao.update(userList);
        return count;
    }

    @Override
    public UserList findByID(String id) {
        return userlistDao.findByID(id);
    }

    @Override
    public UserList getUser(UserList a){
        String userid=a.getUserId();
        UserList user1=userlistDao.findByID(userid);
        return user1;
    }

    @Override
    public boolean checkLogin(UserList a){
        String userid=a.getUserId();
        UserList user=userlistDao.findByID(userid);
        if(user!=null&&a.getPassword().equals(user.getPassword())){
            return true;
        }
        return false;
    }


}
