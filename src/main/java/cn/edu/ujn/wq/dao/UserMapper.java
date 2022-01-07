package cn.edu.ujn.wq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.ujn.wq.dao.User;

public interface UserMapper {
   
    //根据用户名、密码查询用户
    //@Param指定参数名称，用在xml文件中
    public User findUser(@Param("login_number") String login_number,@Param("login_password") String login_password);
    
    // 创建新用户
  	public int createUser(User stuUser);
  	
 
  	
 
}