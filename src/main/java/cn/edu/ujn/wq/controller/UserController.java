package cn.edu.ujn.wq.controller;

import java.io.IOException;
import java.net.http.HttpResponse;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.concurrent.SuccessCallback;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.HttpHeadersReturnValueHandler;

import cn.edu.ujn.wq.service.IHotelService;
import cn.edu.ujn.wq.service.INewService;
import cn.edu.ujn.wq.service.IOthersService;
import cn.edu.ujn.wq.service.IUserService;
import cn.edu.ujn.wq.dao.College;
import cn.edu.ujn.wq.dao.Hostel;
import cn.edu.ujn.wq.dao.News;
import cn.edu.ujn.wq.dao.User;
import cn.edu.ujn.wq.dao.teaUser;

@Controller
public class UserController {

	@Autowired
	private IUserService userService;
	/********************************************/
	@Autowired
	private INewService newService;
	@Autowired
	private IOthersService othersService;
	@Autowired
	private IHotelService hotelService;

	/********************************************/

	/************************ 其他控制层的函数 ********************************************/
	// 查询楼栋的宿舍信息
	public void findHotel(HttpSession session) {
		List<Hostel> findHoteList = hotelService.findHotel();
		session.setAttribute("findHotel", findHoteList);
	}

	// 查询所有的学院，专业，班级,并返回到注册界面
	public void findCollegeMajorClass(HttpSession session) {
		List<College> findCollegeMajorClass = othersService.findCollegeMajorClass();
		session.setAttribute("allCollege", findCollegeMajorClass);
	}

	// 校内新闻的查询
	public void newsFind(HttpSession session) {
		String new_flag="0";
		News news=new News(0, new_flag, new_flag, new_flag, new_flag, new_flag, new_flag, new_flag, new_flag);
		List<News> newsFindList = newService.newsFind(news);
		session.setAttribute("newsFindList", newsFindList);
		
	}
	   //班级新闻的查询
		public void classNewsFind(HttpSession session,String new_college,String new_major,String new_class)
		{
			String new_flag="1";
			News findClassNews=new News(0, null, null, null, new_college,new_major, new_class, null, new_flag);
			List <News> classNewsFindList=newService.classNewsFind(findClassNews);
			session.setAttribute("user_classNewsFindList", classNewsFindList);
		}
       //宿舍新闻的查询
		public void hotelNewsFind(HttpSession session,String new_college,String new_major,String new_class)
		{
			String new_flag="2";
			News findClassNews=new News(0, null, null, null, new_college,new_major, new_class, null, new_flag);
			List <News> hotelNewsFindList=newService.classNewsFind(findClassNews);
			session.setAttribute("user_hotelNewsFindList", hotelNewsFindList);
		}
		//查询班级公告
		@RequestMapping("findClassGongGao.action")
		public void findClassGongGao(HttpSession session,String new_college,String new_major,String new_class)
		{
			String new_flag="3";
			News findClassNews=new News(0, null, null, null, new_college,new_major, new_class, null, new_flag);
			List <News> gonggaoFindList=newService.findClassGongGao(findClassNews);
			session.setAttribute("findClassGongGao", gonggaoFindList);
		}

	/************************************************************************************/
	
	// 查询新闻、学院-专业、楼栋-宿舍
	public void find_news_college_hotel(HttpSession session) {
		findHotel(session);// 查询宿舍
		findCollegeMajorClass(session);// 查询学院-专业
		newsFind(session);// 查询新闻
	}

	@RequestMapping("/login.action")
	// 查询用户名和密码,并进入不同的界面
	public String login(String login_sel, String login_number, String login_password, HttpSession session,HttpServletResponse response) throws IOException {
		int flag;
		User findUser = userService.findUser(login_number, login_password);
		if (findUser == null) {
			teaUser findTeaUser = userService.findTeaUser(login_number, login_password);
			if (findTeaUser == null)
				return "logint";
			     //这是教师的身份，班主任和任课老师
			else if ((flag = Integer.parseInt(findTeaUser.getTea_flag())) == 1) {
				//查询所有的学院-专业，楼栋-宿舍
				find_news_college_hotel(session);
				session.setAttribute("tea_number", findTeaUser.getTea_number());
				session.setAttribute("teacher_number", findTeaUser);
				return "all";
			}else if((flag = Integer.parseInt(findTeaUser.getTea_flag())) == 2)
          {
				find_news_college_hotel(session);
				session.setAttribute("teacher_number", findTeaUser);
				return "All1";
          }
			else if ((flag = Integer.parseInt(findTeaUser.getTea_flag())) == 3) {
				find_news_college_hotel(session);
				return "adminMain";
			} else
				return "#";
		} else {
			find_news_college_hotel(session);
			//该学生所在班级的班级新闻的查询
		    classNewsFind(session,findUser.getStu_college(),findUser.getStu_major(),findUser.getStu_class());
		    //该学生所在班级宿舍新闻的查询
		    hotelNewsFind(session,findUser.getStu_college(),findUser.getStu_major(),findUser.getStu_class());
		    
		    findClassGongGao(session,findUser.getStu_college(),findUser.getStu_major(),findUser.getStu_class());
			// 把学生用户的班级传出去
			session.setAttribute("loginUserClass", findUser);
			// 把学生用户的信息传出去
			session.setAttribute("loginUser", findUser);
			// 把学生用户的学号传出去
			session.setAttribute("loginUserNumber", findUser.getStu_number());
			return "stuMain";
		}
	}
	
	
	// 学生身份注册新用户
	@RequestMapping("/userCreate")
	public String userCreate(String stu_name, String stu_number, String stu_gender, String College,
			String Major, String stu_class, String stu_house, String stu_housenum, String stu_job, String stu_card,
			String stu_password) {
		User stuUser = new User(0, stu_name, stu_number, stu_gender, College, Major, stu_class, stu_house,
				stu_housenum, stu_job, stu_card, stu_password);
		stuUser.setStu_id(0);
		stuUser.setStu_job("无");
		stuUser.setStu_card("#");
		int row = userService.userCreate(stuUser);
		if (row > 0) {
			return "regis";
		} else {
			{
				return "regis";
			}
		}
	}

	// 班主任账号的添加
	@RequestMapping("/bossUserCreate.action")
	public String bossUserCreate(String tea_name, String tea_number, String tea_gender, String College,String Major,
			String tea_class, String tea_card, String tea_password) {
		String tea_flag = "1";
		tea_password = tea_card.substring(12);
		teaUser bossTeaUser = new teaUser(0, tea_name, tea_number, tea_gender, College, Major, tea_class, tea_card, tea_password, tea_flag);
		// 取身份证后6位作为初始密码
		int bossRow = userService.bossUserCreate(bossTeaUser);
		if (bossRow > 0) {
			return "logint";
		} else {
			return "regis";
		}
	}

	// 任课老师账号的添加
	@RequestMapping("/teacherUserCreate.action")
	public String teacherUserCreate(String tea_name, String tea_number, String tea_gender, String College,String Major,
			String tea_class, String tea_card, String tea_password) {
		String tea_flag = "2";
		tea_password = tea_card.substring(12);
		tea_class = "#";
		teaUser teaTeaUser = new teaUser(0, tea_name, tea_number, tea_gender, College, Major, tea_class, tea_card, tea_password, tea_flag);
		// 取身份证后6位作为初始密码
		int teaRow = userService.teacherUserCreate(teaTeaUser);
		if (teaRow > 0) {
			return "logint";
		} else {
			return "regis";
		}
	}

	// 用户退出系统
	@RequestMapping("/outLogin.action")
	public String outLogin(HttpSession session) {
		session.invalidate();
		return "logint";
	}
	
	/*获取前端返回的班主任的id，进行对班主任账号的查询*/
	@RequestMapping("/findTeacherById.action")
	public void  findTeacherById(String hiddenBossId,HttpSession session)
	{
		int tea_id=Integer.parseInt(hiddenBossId);
		teaUser teaUser=userService.findTeacherById(tea_id);
		System.out.println(teaUser);
		session.setAttribute("findTeacherById", teaUser);
	}
}
