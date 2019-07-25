package com.lxs.myarticle.dao;

import com.lxs.myarticle.pojo.User;
import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);

    /**
     * 通过username 返回user
     * @param username
     * @return
     */
    User selectByName(String username);
}