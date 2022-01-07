package cn.edu.ujn.wq.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.ujn.wq.dao.Course;
import cn.edu.ujn.wq.dao.Scores;
import cn.edu.ujn.wq.dao.TeaCourse;
import cn.edu.ujn.wq.dao.Tea_course;
import cn.edu.ujn.wq.dao.User;
import cn.edu.ujn.wq.dao.teaUser;
import cn.edu.ujn.wq.service.IClassService;
import cn.edu.ujn.wq.service.ICourseService;
import cn.edu.ujn.wq.service.IUserService;

@Controller
public class CourseController {

	@Autowired
	private ICourseService courseService;
	@Autowired
	private IUserService userService;
	@Autowired
	private IClassService classService;

	// 管理员课程信息的添加
	@RequestMapping("/adminCourseAdd.action")
	public void courseAdd(String course_year, String course_term, String course_number, String course_name,
			String course_score) {
		Course courseAdd = new Course(0, course_year, course_term, course_number, course_name, course_score);
		int courseAddRow = courseService.courseAdd(courseAdd);
		
	}

	//任课老师发布课程信息
	@RequestMapping("/teaCourseAdd.action")
	public void teaCourseAdd(String course_number, String tea_number, String course_name, String College,
			String Major, String course_class, String course_time, String course_address)
	{
		
		 Tea_course tea_course=new Tea_course(course_number, tea_number);
		 courseService.tea_CourseAdd(tea_course);
		TeaCourse teaCourse=new TeaCourse(course_number, tea_number, course_name, College, Major, course_class, course_time, course_address);
		
		courseService.teaCourseAdd(teaCourse);
		
	}
	
	// 学生查询自己的课表
	@RequestMapping("/findPersonCourse.action")
	public String findPersonCourse(HttpSession session) {
		List<TeaCourse>teaCourses=new ArrayList<TeaCourse>();
		 String course_number="";
		  String course_college="";
	       String course_major="";
	       String course_class="";
	     //获取学生登录的用户信息
	    User user=	( User)session.getAttribute("loginUser");
		//对课表进行查询
		List<TeaCourse> findPersonCourseList = courseService.findPersonCourse(user.getStu_college(),user.getStu_major(),user.getStu_class());
		/*
		for(int i=0;i<findPersonCourseList.get(0).getCourses().size();i++)
		{
	       course_number=findPersonCourseList.get(0).getCourses().get(i).getCourse_number();
	       course_college=user.getStu_college();
	       course_major=user.getStu_major();
	       course_class=user.getStu_class();
	       TeaCourse teaCourse=findCourseTimeAddress(course_number,course_college,course_major,course_class);
	       teaCourses.add(teaCourse);
		}*/
		//把查询到的上课时间和上课地点传到前端
		//session.setAttribute("findCourseTimeAddress", teaCourses);
		List teaNamesList=new ArrayList();
		for(int i=0;i<findPersonCourseList.size();i++)
		{
			String tea_number=findPersonCourseList.get(i).getTea_number();
			//通过教师编号去查教师的名字
		    String tea_name=userService.findTeaNameByNumber(tea_number);
		    teaNamesList.add(tea_name);
		}
		//将教师姓名传输到前端
		session.setAttribute("findTeaNameByNumber", teaNamesList);
		
		session.setAttribute("findPersonCourse", findPersonCourseList);
		
		/*
		 * for (int i = 0; i < findPersonCourseList.get(0).getCourses().size(); i++) {
		 * System.out.println(findPersonCourseList.get(0).getCourses().get(i).
		 * getCourse_number());
		 * System.out.println(findPersonCourseList.get(0).getCourses().get(i).
		 * getCourse_name());
		 * System.out.println(findPersonCourseList.get(0).getCourses().get(i).
		 * getCourse_score());
		 * System.out.println(findPersonCourseList.get(0).getTeaUsers().get(0).
		 * getTea_name());
		 * System.out.println(findPersonCourseList.get(0).getStu_number());
		 * System.out.println(findPersonCourseList.get(0).getStu_name()); }
		 */
		return "findPersonCourse";
	}
	
	//根据课程号，学院，专业，班级查询上课时间和上课地点
	public TeaCourse findCourseTimeAddress(String course_number,String course_college,String course_major,String course_class)
	{
		TeaCourse teaCourse=new TeaCourse(course_number, null,null, course_college,
				course_major, course_class, null, null);
		
		TeaCourse FindTimeAddress=courseService.FindCourseTimeAddress(teaCourse);
		
		return FindTimeAddress;
	}
	
	/////////
	//根据课程号，教师号查询上课时间和上课地点
	public List<TeaCourse> teaFindCourseTimeAddress(String tea_number )
	{
		List<TeaCourse> teaFindTimeAddress=courseService.teaFindCourseTimeAddress(tea_number);
		return teaFindTimeAddress;
	}
	
	//任课老师查看自己的课表
	@RequestMapping("/teaFindCourse.action")
	public String teaFindCourse(String tea_number,HttpSession session)
	{
		//系统自动读取教师的课程编号
		tea_number="20201222";
		List<Course> teaFindCourselist=courseService.teaFindCourse(tea_number);
		/*查询这个老师发布的课程信息，从而获得上课时间，上课地点，
		因为任课发布课程信息的时候，是一对一的关系，所以查出所有的信息，按照顺序输出就可以了
		*/
	   List<TeaCourse> teaFindTimeAddress=teaFindCourseTimeAddress(tea_number);
	   //向前端传输课程的信息
		session.setAttribute("teaFindTimeAddress", teaFindTimeAddress);
		//向前端传送上课时间和上课地点的信息
		session.setAttribute("teaFindCourse", teaFindCourselist);
		return "teaFindCourse";
	}
	
	//任课老师管理自己的教学班级
	@RequestMapping("/teaManageClass.action")
	public String teaManageClass(String tea_number,HttpSession session)
	{
		teaUser teaUser=(teaUser)session.getAttribute("teacher_number");
		tea_number=teaUser.getTea_number();
		List<TeaCourse> teaFindCourselist=teaFindCourseTimeAddress(tea_number);
		System.out.println(teaFindCourselist);
		session.setAttribute("teaManageClass", teaFindCourselist);
		return "teaManageClass";
	}
	//任课老师根据学年、学期查询自己的课表
	@RequestMapping("/teaFindCourseYearTerm.action")
	public String teaFindCourseYearTerm(String tea_number,String course_year,String course_term,HttpSession session)
	{
		//tea_number="20201222";
		teaUser teaUser=(teaUser)session.getAttribute("teacher_number");
		tea_number=teaUser.getTea_number();
		
		//查询课程表中的课程信息  
		if("--请选择年份--".equals(course_year))
		{course_year=null;}
		if("--请选择学期--".equals(course_term))
		{course_term=null;}
		System.out.println(course_year);
		System.out.println(course_term);
		List<Course> teaFindCourselist=courseService.teaFindCourseYearTerm(tea_number, course_year, course_term);
		//查询上课时间和上课地点
		 List<TeaCourse> teaFindTimeAddress=courseService.teaFindCYTtimeaddress(tea_number, course_year, course_term);
		 //向前端传输课程的信息
		 session.setAttribute("teaFindTimeAddress", teaFindTimeAddress);
		//向前端传送上课时间和上课地点的信息
		session.setAttribute("teaFindCourse", teaFindCourselist);
		return "teaFindCourse";
	}
	
    //任课老师发布教学效果
	@RequestMapping("teaFindAddCourseXiaoguo.action")
	public String teaFindAddCourseXiaoguo(String course_college,String course_major,String course_class,String course_number,String course_name,String stu_name,String stu_number,String score)
	{
		Scores scores=new Scores(0, course_college, course_major, course_class, course_number, course_name, stu_number, stu_name, score);
		courseService.teaFindAddCourseXiaoguo(scores);
		return "teaAddScore";
	}
	
	//任课老师进入发布教学效果的界面
	@RequestMapping("teaTOFindAddCourseXiaoguo.action")
	public String teaTOFindAddCourseXiaoguo(HttpSession session,String course_college,String course_major,String course_class,String course_number,String course_name)
	{
		List numberNameList=new ArrayList();
		numberNameList.add(course_number);
		numberNameList.add(course_name);
		 User findUser=new User(0, course_name, course_number, course_name, course_college, course_major, course_class, course_college, course_major, course_class, course_number, course_name);
		 List<User> findAllClassList=classService.findAllClassPerson(findUser);
		 //传输班级成员的信息
		 session.setAttribute("teaTOFindAddCourseXiaoguoList", findAllClassList);
		 //传输课程号和课程名
		 session.setAttribute("teaTOFindAddCourseXiaoguoNNList", numberNameList);
		return "teaAddScore";
	}
}
