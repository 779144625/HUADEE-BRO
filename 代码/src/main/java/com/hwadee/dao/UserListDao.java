package com.hwadee.dao;

import java.util.List;

import com.hwadee.model.UserList;
import org.springframework.stereotype.Repository;

@Repository
public interface UserListDao {
    UserList findByID(String id);

    List<UserList> findAll();

    int insert(UserList a);

    int delete(String id);

    int update(UserList a);

}
