package com.lxs.myarticle.service;

import com.lxs.myarticle.pojo.Article;
import com.lxs.myarticle.pojo.PageBean;

import java.util.Map; /**
 * @author Mr.Li
 * @date 2019/7/24 - 23:03
 */
public interface ArticleService {

    /**
     * 分页查找，传入当前页， 页面大小， 还有文章的三个状态
     * @param pageCode
     * @param pageSize
     * @param comMap
     * @return
     */
    PageBean<Article> findByPage(int pageCode, int pageSize, Map<String, Object> comMap);
}
