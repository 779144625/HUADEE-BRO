package com.hwadee.dao;

import java.util.List;

import com.hwadee.model.CommentList;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentListDao {


    CommentList findByID(@Param("commentID") int comentID);

    List<CommentList> findAll();

    int insert(CommentList a);

    int delete(int id);

    int update(CommentList a);
}

