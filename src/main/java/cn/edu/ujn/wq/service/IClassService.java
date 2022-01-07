package cn.edu.ujn.wq.service;


import java.util.List;

import cn.edu.ujn.wq.dao.ClassIntroduction;
import cn.edu.ujn.wq.dao.Stu_TeaUser;
import cn.edu.ujn.wq.dao.User;
import cn.edu.ujn.wq.dao.teaUser;

public interface IClassService {


	
	//数据库中查询所有的数据，返回列表
	public List<User> findAllClassPerson(User findUser);
	
	//数据库中查询所有的班主任信息
	public List<teaUser>findAllBoss(String tea_flag);
	
	public List<teaUser>findAllTea(String tea_flag);
	
	public List<teaUser> findAllClassName();
	
	public List<User>findAllClassNameStu(User user);
	
	//根据id进行多表联合查询，查询某学院某专业某班级的所有成员，由班主任进行查询，进入所管辖的班级
	public List<User>findOneClassNameStu(int id);
	
	public void deleteBoss(int inthiddInteger);
	
	public List<Stu_TeaUser>bossManageClass(String tea_number);
	
	public void updateBoss(teaUser teaUser);
	
	public void updateTeacher(teaUser teaUser);
	
	public void updateStu(User user);
	
	public void deleteStu(int stu_id);
	//管理员创建某专业下的班级
	public void adminClassAdd(Stu_TeaUser stu_TeaUser);
	//查询某学院某专业某班级是由某班主任管理
	public List<Stu_TeaUser>findadminCMClassTea();
	//更新某学院某专业某班级是由某班主任管理
	public void updateadminCMClassTea(Stu_TeaUser stu_TeaUser);
	
	//班级公告的查询
	public ClassIntroduction findClassIntroduction(ClassIntroduction classIntroduction);
	//根据宿舍号查询宿舍成员的信息
	public List<User>findAllPresonByHousenum(User user);
}
