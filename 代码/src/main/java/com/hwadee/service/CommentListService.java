package com.hwadee.service;

import com.hwadee.model.CommentList;

import java.util.List;

public interface CommentListService {

    CommentList findByID(int id);

    List<CommentList> findAll();

    int insert(CommentList a);

    int delete(int id);

    int update(CommentList a);
}
