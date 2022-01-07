package cn.edu.ujn.wq.service;

import cn.edu.ujn.wq.dao.User;
import cn.edu.ujn.wq.dao.teaUser;


public interface IUserService {
	
	//数据库中的查询学生用户
	public User findUser(String login_number,String login_password);
	
	//数据库中查询教职工账号
	public teaUser findTeaUser(String login_number,String login_password);
	
	//注册学生新用户
	public int userCreate(User stuUser);
	
	//管理员添加班主任账号
	public int bossUserCreate(teaUser bossTeaUser);
	
	//管理员添加任课老师账号
	public int teacherUserCreate(teaUser teaUser);
	
	public teaUser findTeacherById(int tea_id);
	
	 //通过教师编号去查教师的姓名
	public String findTeaNameByNumber(String tea_number);
}
