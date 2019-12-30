package com.hwadee.service.impl;

import com.hwadee.dao.CommentListDao;
import com.hwadee.model.CommentList;
import com.hwadee.model.UserList;
import com.hwadee.service.CommentListService;
import com.hwadee.service.UserListService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CommentListServiceImpl implements CommentListService {

    @Resource
    private CommentListDao commentlistDao;

    @Override
    public CommentList findByID(int id) {
        CommentList commentList = commentlistDao.findByID(id);
        return commentList;
    }

    @Override
    public int delete(int id) {
        commentlistDao.delete(id);
        return 0;
    }

    @Override
    public int insert(CommentList a) {
        commentlistDao.insert(a);
        return 0;
    }

    @Override
    public int update(CommentList a) {
        commentlistDao.update(a);
        return 0;
    }

    @Override
    public List<CommentList> findAll() {

        return commentlistDao.findAll();
    }
}
