package com.hwadee.dao;

import java.util.List;

import com.hwadee.model.NewsList;
import org.springframework.stereotype.Repository;

@Repository
public interface NewsListDao {

    NewsList findByID(int id);

    List<NewsList> findAll();

    int insert(NewsList a);

    int delete(int id);

    int update(NewsList a);
}
