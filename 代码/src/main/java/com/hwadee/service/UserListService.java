package com.hwadee.service;

import com.hwadee.model.UserList;

import java.util.List;

public interface UserListService {
    UserList findByID(String id);

    List<UserList> findAll();

    int insert(UserList a);

    int delete(String id);

    int update(UserList a);

    UserList getUser(UserList a);

    boolean checkLogin(UserList a);
}
