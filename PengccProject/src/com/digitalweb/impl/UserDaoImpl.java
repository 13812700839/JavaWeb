package com.digitalweb.impl;

import com.digitalweb.dao.UserDao;
import com.digitalweb.model.User;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl extends SuperOpr implements UserDao {

    @Override
    public int verify(String username, String password) {

        sql = " select password from user_info where userName='" + username + "';";
        // 设置标志位表示执行结果
        int flag=-1;

        try {
            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();
            if (rs.next()) {
                // 将密码读出进行比较对比
                if (rs.getString("password").equals(password))
                    // 登录成功，用户名密码均正确
                    flag=3;
                else
                    // 密码错误
                    flag=2;
            }else
                // 用户名不存在
                flag=1;

//            rs.close();
//            psmt.close();
//            con.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return flag;
    }

    @Override
    public User getUserByName(String username) {

        User user=new User();

        sql="select * from user_info where userName='"+username+"';";

        try {
            psmt=con.prepareStatement(sql);
            rs=psmt.executeQuery();
            if (rs.next()){
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setRealName(rs.getString("realName"));
                user.setSex(rs.getString("sex"));
                user.setAddress(rs.getString("address"));
                user.setQuestion(rs.getString("question"));
                user.setAnswer(rs.getString("answer"));
                user.setEmail(rs.getString("email"));
                user.setFavorate(rs.getString("favorate"));
                user.setScore(rs.getInt("score"));
            }

            System.out.println(user.getUserName());

//            rs.close();
//            psmt.close();
//            con.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return user;
    }

    @Override
    public List<User> list() {

        List<User> userList = new ArrayList<User>();

        sql="select * from user_info;";

        try {
            psmt=con.prepareStatement(sql);
            rs=psmt.executeQuery();
            while (rs.next()){
                User user=new User();
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setRealName(rs.getString("realName"));
                user.setSex(rs.getString("sex"));
                user.setAddress(rs.getString("address"));
                user.setQuestion(rs.getString("question"));
                user.setAnswer(rs.getString("answer"));
                user.setEmail(rs.getString("email"));
                user.setFavorate(rs.getString("favorate"));
                user.setScore(rs.getInt("score"));
                user.setDate(rs.getString("regDate"));
                userList.add(user);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return userList;
    }
}
