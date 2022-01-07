package cn.edu.ujn.wq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.ujn.wq.dao.teaUser;

public interface teaUserMapper {

	//班主任账号的添加
  	public int createBossUser(teaUser bossUser);
  	
  	//管理员账号的添加
  	public int createTeacherUser(teaUser teacherUser);
  	
  	//
	public List<teaUser>findAllBoss(@Param("tea_flag")String tea_flag);
	
	public List<teaUser>findAllTea(@Param("tea_flag")String tea_flag);
	
 	//findTeaUser
	public teaUser findTeaUser(@Param("login_number") String login_number,@Param("login_password") String login_password);
	
	public List<teaUser> findAllClassName();
	
	public void deleteBoss(int inthiddInteger);
	
	public List<Stu_TeaUser>bossManageClass(@Param("tea_number")String tea_number);
	//查询某个id的教师信息
	public teaUser findTeacherById(int tea_id);
	
	public void updateBoss(teaUser teaUser);
	
	public void updateTeacher(teaUser teaUser);
	
	public void adminClassAdd(Stu_TeaUser stu_TeaUser);
	
	public List<Stu_TeaUser>findadminCMClassTea();
	
	//管理员更新某学院某专业某班级某班主任的信息
	public void updateadminCMClassTea(Stu_TeaUser stu_TeaUser);
	
    //通过教师编号去查教师的姓名
	public String findTeaNameByNumber(@Param("tea_number")String tea_number);
}
