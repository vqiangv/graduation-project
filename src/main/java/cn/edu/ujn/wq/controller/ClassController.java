package cn.edu.ujn.wq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;

import cn.edu.ujn.wq.dao.ClassIntroduction;
import cn.edu.ujn.wq.dao.College;
import cn.edu.ujn.wq.dao.Stu_TeaUser;
import cn.edu.ujn.wq.dao.User;
import cn.edu.ujn.wq.dao.teaUser;
import cn.edu.ujn.wq.service.IClassService;
import cn.edu.ujn.wq.service.IUserService;
import net.sf.json.JSONArray;

@Controller
public class ClassController {
	
	@Autowired
	private IClassService classService;
	@Autowired
	private IUserService userService;
	
	//查询所在班级全部人员
	@RequestMapping("/findAllClassPreson.action")
	public String findAllClassPerson(HttpSession session,HttpServletResponse resp) throws IOException
	{
	   User findUser=(User) session.getAttribute("loginUserClass");
		List<User> findAllClassList=classService.findAllClassPerson(findUser);
		session.setAttribute("findAllClassPerson", findAllClassList);
		return "stuClass";
	}
	
	//查询所在班级的宿舍信息
	@RequestMapping("findAllHotelPreson.action")
	public String findAllHotelPreson(HttpSession session)
	{
		User findUser=(User) session.getAttribute("loginUserClass");
		List<User> findAllhotelList=classService.findAllClassPerson(findUser);
		session.setAttribute("findAllHotelPreson", findAllhotelList);
		return "stuHotel";
	}
	
	//管理员查询班主任的信息
	@RequestMapping("/findAllBoss.action")
	public String findAllBoss(HttpSession session)
	{
		String tea_flag="1";
		List<teaUser>findAllBossList=classService.findAllBoss(tea_flag);
		session.setAttribute("findAllBoss", findAllBossList);
		return "adminBossManage";
	}
	
	//管理员查询任课老师的信息
	@RequestMapping("/findAlltea.action")
	public String findAlltea(HttpSession session,String tea_flag)
	{
		tea_flag="2";
		List<teaUser>findAllTeaList=classService.findAllTea(tea_flag);
		session.setAttribute("findAllTea", findAllTeaList);
		return "adminTeaManage";
	}
	
	//查询所有的班级名称
	@RequestMapping("/findAllClassName.action")
	public String findAllClassName(HttpSession session)
	{
		List<teaUser> findAllTeaList=classService.findAllClassName();
		
		session.setAttribute("findAllClassName", findAllTeaList);
		return "adminStuManage";
	}
	
	//管理员选择学院-专业-班级，查看这个班级的所有成员
	@RequestMapping("/findAllClassNameStu.action")
	public String findAllClassNameStu(HttpSession session,String College,String Major,String stu_class)
	{
		User user=new User(0, null, null, null, College, Major, 
				stu_class, null, null,null, null, null);
		List<User>findAllClassNameStu=classService.findAllClassNameStu(user);
		//把查询到的班级列表成员传出去
		session.setAttribute("findAllClassNameStu", findAllClassNameStu);
		//把学院-专业-班级传出去
		session.setAttribute("college_major_class", user);
		return "findAllClassNameStu";
	}
	
	//班主任进入每个班级的管理界面,进行这个班级全部学生成员的查询
	@RequestMapping("/bossManageOneClass.action")
	public String bossManageOneClass(HttpSession session,String stu_id)
	{
		int id=Integer.parseInt(stu_id);
		//根据id进行多表联合查询
		List<User>findOneClassNameStu=classService.findOneClassNameStu(id);
		session.setAttribute("bossManageOneClassByid", id);
		//把某个班级的所有学生的信息传到前端
		session.setAttribute("bossManageOneClass", findOneClassNameStu);
		return "bossManageOneClass";
	}
	
	//管理员删除班主任的身份
	@RequestMapping("/deleteBoss.action")
	public String  deleteBoss(String BossId,HttpSession session)
	{
		if(BossId=="")
		{
			BossId="19";
		}
		int inthiddInteger=Integer.parseInt(BossId);
		classService.deleteBoss(inthiddInteger);
		findAllBoss(session);
		return "adminBossManage";
	}
	
	//班主任查询管理的班级名称
	@RequestMapping("/bossManageClass.action")
	public String bossManageClass(HttpSession session)
	{
	   
	   teaUser teaUser=(teaUser)session.getAttribute("teacher_number");
	   String tea_number=teaUser.getTea_number();
	   
	 //  List<teaUser> bossManageList=classService.bossManageClass(tea_number);
	   List<Stu_TeaUser> stu_TeaUsers=classService.bossManageClass(tea_number);
	  session.setAttribute("bossManageClass",stu_TeaUsers);
		/*
		 * for(int i=0;i<bossManageList.get(0).getClassTeas().size();i++) {
		 * System.out.println(bossManageList.get(0).getClassTeas().get(i).getStu_class()
		 * ); }
		 */
	   return "bossManageClass";
	}
	
	//管理员查看某院某专业某班级由某班主任管理,查询所有的
	@RequestMapping("/findadminCMClassTea.action")
	public String findadminCMClassTea(HttpSession session)
	{
		List<Stu_TeaUser> TeaUsers=classService.findadminCMClassTea();
		//通过教师编号查询教师的名字
		List teaNamesList=new ArrayList();
		for(int i=0;i<TeaUsers.size();i++)
		{
			String tea_number=TeaUsers.get(i).getTea_number();
			//通过教师编号去查教师的名字
		    String tea_name=userService.findTeaNameByNumber(tea_number);
		    teaNamesList.add(tea_name);
		}
		//将教师姓名传输到前端
		session.setAttribute("findadminCMClassTeaByNumber", teaNamesList);
		//把查询到的结果传到前端
		session.setAttribute("findadminCMClassTea", TeaUsers);
		return"adminCMClassTea";
	}
	
	//管理员更新某学院某专业某班级某班主任的信息
	@RequestMapping("/updateadminCMClassTea.action")
	//@ResponseBody
	public String updateadminCMClassTea(String id,String College,String Major,String stu_class,String tea_number,HttpSession session)
	{
	  int ID=Integer.parseInt(id);
	  Stu_TeaUser stu_TeaUser=new Stu_TeaUser(ID, College, Major, stu_class, tea_number);
	  classService.updateadminCMClassTea(stu_TeaUser);
	  //进行重新查询
	  findadminCMClassTea(session);
	  return"adminCMClassTea";
	}
	
	//管理员对班主任账号的更新
	@RequestMapping("/updateBoss.action")
	@ResponseBody
	public void updateBoss(String tea_id,String tea_name,String tea_number,String tea_gender,String tea_card,String tea_flag)
	{
		int id=Integer.parseInt(tea_id);
		teaUser teaUser=new teaUser(id, tea_name, tea_number, tea_gender, null, null, null, tea_card, null, tea_flag);
		classService.updateBoss(teaUser);
	}
	
	//管理员对任课老师账号的更新
	@RequestMapping("/updateTeacher.action")
	@ResponseBody
	public void updateTeacher(String tea_id,String tea_name,String tea_number,String tea_gender,String College,String Major,
			String tea_card,String tea_flag)
	{
		int id=Integer.parseInt(tea_id);
		teaUser teaUser=new teaUser(id, tea_name, tea_number, tea_gender, College, Major, null, tea_card, null, tea_flag);
		classService.updateTeacher(teaUser);
	}
	
	//管理员删除学生账号
	@RequestMapping("/deleteStu.action")
	@ResponseBody
	public void deleteStu(String stu_id)
	{
		int id=Integer.parseInt(stu_id);
		classService.deleteStu(id);
	}
	
	//管理员更新学生的账号
	@RequestMapping("/updateStu.action")
	@ResponseBody
	public void updateStu(String stu_id,String stu_name,String stu_number,String stu_gender,String Hotel,String HotelNum,
			String stu_card,String stu_job)
	{
		int id=Integer.parseInt(stu_id);
		User user=new User(id, stu_name, stu_number, stu_gender, null, null, null, Hotel, HotelNum, stu_job, stu_card, null);
		classService.updateStu(user);
	}
	
	//班主任更新学生的账号
	@RequestMapping("/updateStu1.action")
	public String updateStu1(String stu_id,String stu_name,String stu_number,String stu_gender,String Hotel,String HotelNum,
			String stu_card,String stu_job,HttpSession session)
	{
		int id=Integer.parseInt(stu_id);
		User user=new User(id, stu_name, stu_number, stu_gender, null, null, null, Hotel, HotelNum, stu_job, stu_card, null);
		classService.updateStu(user);
		int Id=(int)session.getAttribute("bossManageOneClassByid");
		List<User>findOneClassNameStu=classService.findOneClassNameStu(Id);
		//把某个班级的所有学生的信息传到前端
		session.setAttribute("bossManageOneClass", findOneClassNameStu);
		return "findOneClassNameStu";
	}
	//管理员创建某学院某专业的新班级
	@RequestMapping("/adminClassAdd.action")
	@ResponseBody
	public void adminClassAdd(String College,String Major,String stu_class,String tea_number)
	{
		Stu_TeaUser stuTeaUser=new Stu_TeaUser(0,College, Major, stu_class, tea_number);
		classService.adminClassAdd(stuTeaUser);
	}
	
	/*
	 * 查询班级介绍
	 * 查询某学院某专业某班级的班级介绍
	 */
	@RequestMapping("/findClassIntroduction.action")
	public String findClassIntroduction(String college,String major,String classs,String introduction,HttpSession session)
	{
		//获取班主任登录的是某学院某专业某班级
		List<User> findList = (List<User>) session.getAttribute("bossManageOneClass");
		college=findList.get(0).getStu_college();
		major=findList.get(0).getStu_major();
		classs=findList.get(0).getStu_class();
		ClassIntroduction classIntroduction=new ClassIntroduction(0, college, major, classs, null);
		ClassIntroduction classIntroduction2=classService.findClassIntroduction(classIntroduction);
		session.setAttribute("findClassIntroduction", classIntroduction2);
		return "ClassIntroduction";
	}
	
	//根据宿舍号查询宿舍成员的信息
	@RequestMapping("findAllPresonByHousenum.action")
	public String findAllPresonByHousenum(String stu_housenum,HttpSession session)
	{
		User findUser=(User) session.getAttribute("loginUserClass");
		findUser.setStu_housenum(stu_housenum);
		List<User>findAllHotelList=classService.findAllPresonByHousenum(findUser);
		session.setAttribute("findAllHotelPreson", findAllHotelList);
		return "stuHotel";
	}
}
