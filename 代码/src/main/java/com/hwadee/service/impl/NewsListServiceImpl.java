package com.hwadee.service.impl;

import com.hwadee.model.NewsList;
import com.hwadee.service.NewsListService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class NewsListServiceImpl implements NewsListService {

    @Resource
    private com.hwadee.dao.NewsListDao newslistDao;

    @Override
    public NewsList findByID(int id) {
        return newslistDao.findByID(id);
    }

    @Override
    public int delete(int id) {
        newslistDao.delete(id);
        return 0;
    }

    @Override
    public List<NewsList> findAll() {
        return newslistDao.findAll();
    }

    @Override
    public int insert(NewsList a) {
        newslistDao.insert(a);
        return 0;
    }

    @Override
    public int update(NewsList a) {
        newslistDao.update(a);
        return 0;
    }
}
