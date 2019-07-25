package com.lxs.myarticle.dao;

import com.lxs.myarticle.pojo.Article;
import java.util.List;
import java.util.Map;

public interface ArticleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    Article selectByPrimaryKey(Integer id);

    List<Article> selectAll();

    int updateByPrimaryKey(Article record);

    /**
     * 返回文章的总条数
     * @return
     */
    Integer selectCount();

    /**
     * 分页查找
     * @param map
     * @return
     */
    List<Article> findByPage(Map<String, Object> map);

    /**
     * 多条件分页查询
     * @param map
     * @return
     */
    List<Article> findBycomMapPage(Map<String, Object> map);
}