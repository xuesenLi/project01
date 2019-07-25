package com.lxs.myarticle.service;

import com.lxs.myarticle.pojo.User;

/**
 * @author Mr.Li
 * @date 2019/7/24 - 11:14
 */
public interface UserService {
    /**
     * 通过username返回user
     * @param username
     * @return
     */
    User findByName(String username);

    Integer insert(User user);

    /**
     * 登录验证
     * @param username
     * @param password
     * @return
     */
    User login(String username, String password);
}
