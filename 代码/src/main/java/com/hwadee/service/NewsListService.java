package com.hwadee.service;

import com.hwadee.model.NewsList;

import java.util.List;

public interface NewsListService {

    NewsList findByID(int id);

    List<NewsList> findAll();

    int insert(NewsList a);

    int delete(int id);

    int update(NewsList a);

}
