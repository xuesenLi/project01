package com.lxs.myarticle.service.impl;

import com.lxs.myarticle.dao.UserMapper;
import com.lxs.myarticle.pojo.User;
import com.lxs.myarticle.service.UserService;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Mr.Li
 * @date 2019/7/24 - 11:14
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User findByName(String username) {
        return userMapper.selectByName(username);
    }

    @Override
    public Integer insert(User user) {
        //对密码进行加密
        Md5Hash md5Hash = new Md5Hash(user.getPassword(), user.getUsername(), 1000);
        user.setPassword(md5Hash.toString());
        return userMapper.insert(user);
    }

    @Override
    public User login(String username, String password) {
        //通过用户名去数据库查找对的用户
        User user = userMapper.selectByName(username);
        //如果用户不为nyll, 则直接进行密码对比
        //如果密码为空, 则不需要进行密码对比， 直接返回null
        if(user != null){
            Md5Hash md5Hash = new Md5Hash(password, username, 1000);
            if(user.getPassword().equals(md5Hash.toString())){
                return user;
            }
        }
        return null;
    }
}
