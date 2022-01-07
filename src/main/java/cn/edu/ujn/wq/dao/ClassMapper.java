package cn.edu.ujn.wq.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ClassMapper {

	
	public List<User> findAllClassPerson(User findUser);
	
	public List<User> findAllClassNameStu(User user);
	
	public List<User>findOneClassNameStu(int id);
	
	public void updateStu(User user);

	public void deleteStu(int stu_id);
	
	//班级公告的查询
	public ClassIntroduction findClassIntroduction(ClassIntroduction classIntroduction);
	//根据宿舍号查询宿舍成员的信息
	public List<User>findAllPresonByHousenum(User user);
}
