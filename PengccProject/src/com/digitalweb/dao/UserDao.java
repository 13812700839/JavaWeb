package com.digitalweb.dao;

import com.digitalweb.model.User;

import java.util.List;

public interface UserDao {

    // 1.完成用户名密码的验证
    public int verify(String username, String password);

    // 2.注册用户


    // 3.根据用户名查找用户
    public User getUserByName(String username);

    // 4.删除用户


    // 5.修改用户信息


    // 6.查询用户信息
    public List<User> list();

}
