package com.lxs.myarticle.service.impl;

import com.lxs.myarticle.dao.ArticleMapper;
import com.lxs.myarticle.pojo.Article;
import com.lxs.myarticle.pojo.PageBean;
import com.lxs.myarticle.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Mr.Li
 * @date 2019/7/24 - 23:03
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;


    @Override
    public PageBean<Article> findByPage(int pageCode, int pageSize, Map<String, Object> comMap) {

        Map<String, Object> map = new HashMap<>();
        PageBean<Article> pageBean = new PageBean<>();

        //数据封装
        pageBean.setPageCode(pageCode);
        pageBean.setPageSize(pageSize);

        //查询数据总条数, 封装
        Integer totalCount = articleMapper.selectCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数, 向上取整  Math.ceil(ceil);
        double ceil = totalCount / pageSize + 1;
        int ceilINT = (int)ceil;
        System.out.println(ceilINT);
        pageBean.setTotalPage(ceilINT);

        //设置limit起始位置和终止位置
        map.put("start", (pageCode-1)*pageSize);
        map.put("size", pageBean.getPageSize());

        //返回当前页需要显示的数据
        List<Article> list =  articleMapper.findByPage(map);
        pageBean.setBeanList(list);

        System.out.println("================分页查找结果==============");
        for (Article article : list) {
            System.out.println(article);
        }

        //条件查询的封装
        comMap.put("start", (pageCode-1)*pageSize);
        comMap.put("size", pageBean.getPageSize());

        List<Article> conList = articleMapper.findBycomMapPage(map);
        for (Article article : conList) {
            System.out.println(article);
        }
        pageBean.setBeanList(conList);
        return pageBean;
    }
}
