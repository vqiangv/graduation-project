package cn.edu.ujn.wq.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.ujn.wq.dao.News;
import cn.edu.ujn.wq.dao.User;
import cn.edu.ujn.wq.dao.teaUser;
import cn.edu.ujn.wq.service.INewService;

@Controller
public class NewsController {

	@Autowired
	private INewService newService;
	
	
	///////////////////////////////////////////////需要修改函数的返回类型
	
	/*新闻发布
	 * 管理员发布校内新闻
	 * */
	@RequestMapping("/newsAdd.action")
	public void newsAdd(String new_home,String new_author,String new_context,String new_college,
			String new_major,String new_class,String new_date,String new_flag)
	{
		new_date=getNowDate();
		new_college="all";
		new_major="all";
		new_class="all";
		new_flag="0";
		News news=new News(0, new_home, new_author, new_context, new_college, new_major, new_class, new_date, new_flag);
		int newRow=newService.newsAdd(news);
	}
	
	//班主任发布班级新闻
	@RequestMapping("/newsClassAdd.action")
	public String newsClassAdd(String new_home,String new_author,String new_context,String College,
			String Major,String new_class,String new_date,String new_flag,HttpSession session)
	{
		teaUser teaUser=(teaUser)session.getAttribute("teacher_number");
		new_author=teaUser.getTea_name();
		new_date=getNowDate();
		new_flag="1";
		News news=new News(0, new_home, new_author, new_context, College, Major, new_class, new_date, new_flag);
		int newRow=newService.newsAdd(news);
		return "boosClassNewsAdd";
	}
	
	//班主任发布宿舍新闻
	@RequestMapping("/newsHotelAdd.action")
	public String newsHotelAdd(String new_home,String new_author,String new_context,String College,
			String Major,String new_class,String new_date,String new_flag,HttpSession session)
	{
		teaUser teaUser=(teaUser)session.getAttribute("teacher_number");
		new_author=teaUser.getTea_name();
		new_date=getNowDate();
		new_flag="2";
		News news=new News(0, new_home, new_author, new_context, College, Major, new_class, new_date, new_flag);
		int newRow=newService.newsAdd(news);
		return "boosHotelNewsAdd";
	}
	
	//获取系统当前的年月日
	public String  getNowDate() {
		// TODO Auto-generated method stub
		 Date date = new Date();
	        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String str = simpleDateFormat.format(date);
	        return str.substring(0, 10);//获得系统当前时间的年月日
	}
	
	//校内新闻的查询
	@RequestMapping("action.action")
	public void newsFind(HttpSession session) {
		String new_flag="0";
		News news=new News(0, new_flag, new_flag, new_flag, new_flag, new_flag, new_flag, new_flag, new_flag);
		List<News> newsFindList = newService.newsFind(news);
		session.setAttribute("newsFindList", newsFindList);
	}
	
	//班级新闻的查询,查询的是某个学院某个专业某个班级的---班级新闻
	@RequestMapping("classNewsFind.action")
	public String classNewsFind(HttpSession session)
	{
		List<User> findstuList = (List<User>) session.getAttribute("bossManageOneClass");
		String new_college=findstuList.get(0).getStu_college();
		String new_major=findstuList.get(0).getStu_major();
		String new_class=findstuList.get(0).getStu_class();
		String new_flag="1";
		News findClassNews=new News(0, null, null, null, new_college,new_major, new_class, null, new_flag);
		List <News> classNewsFindList=newService.classNewsFind(findClassNews);
		session.setAttribute("classNewsFindList", classNewsFindList);
		return "bossManageClassNews";
	}
	
	//班级新闻的查询,查询的是某个学院某个专业某个班级的---宿舍新闻
	@RequestMapping("hotelNewsFind.action")
	public String hotelNewsFind(HttpSession session)
	{
		List<User> findstuList = (List<User>) session.getAttribute("bossManageOneClass");
		String new_college=findstuList.get(0).getStu_college();
		String new_major=findstuList.get(0).getStu_major();
		String new_class=findstuList.get(0).getStu_class();
		String new_flag="2";
		News findClassNews=new News(0, null, null, null, new_college,new_major, new_class, null, new_flag);
		List <News> hotelNewsFindList=newService.classNewsFind(findClassNews);
		session.setAttribute("hotelNewsFindList", hotelNewsFindList);
		return "bossManageHotelNews";
	}
	
	//班主任删除班级新闻
	@RequestMapping("deleteClassNews.action")
	public String deleteClassNews(String newsID,HttpSession session)
	{
		int intnewsID=Integer.parseInt(newsID);
		newService.deleteNews(intnewsID);
		 classNewsFind(session);
		 return "bossManageClassNews";
	}
	
	//班主任删除宿舍新闻
	@RequestMapping("deleteHotelNews.action")
	public String deleteHotelNews(String newsID,HttpSession session)
	{
		int intnewsID=Integer.parseInt(newsID);
		newService.deleteNews(intnewsID); 
		hotelNewsFind(session);
		return"bossManageHotelNews";
	}
	
	//根据获取的id进行查询，进入新闻的展示界面
	@RequestMapping("actionid.action")
	public void newsFindID(String newsID,HttpSession session)
	{
		//把string的id转化为int的id
		int intnewsID=Integer.parseInt(newsID);
		//执行查询新闻，通过id
		News newsIDListNews=newService.newsFindID(intnewsID);
		//把查询到的结果返回前端
		session.setAttribute("newsIDListNews", newsIDListNews);
		//把查询的id号传前端
		session.setAttribute("intnewsID", intnewsID);
	}
	
	//管理员执行删除新闻的操作
	@RequestMapping("deleteNews.action")
	public String deleteNews(String newsID,HttpSession session)
	{
		int intnewsID=Integer.parseInt(newsID);
		newService.deleteNews(intnewsID);
		newsFind(session);
		return "adminDeleteNews";
	}
	
	@RequestMapping("newsFindTwo.action")
	public String newsFindTwo(HttpSession session)
	{
		newsFind(session);
		return "adminDeleteNews";
	}
	
	//班级公告的发布
	@RequestMapping("bossNoticesAdd.action")
	public void bossNoticesAdd(String new_home,String new_author,String new_context,String new_college,
			String new_major,String new_class,String new_date,String new_flag)
	{
		new_date=getNowDate();
		new_flag="3";
		News notices=new News(0, new_home, new_author, new_context, new_college, new_major, new_class, new_date, new_flag);
		int noticeRow=newService.bossNoticesAdd(notices);
	}
	
	//班级公告的查询,查询的是某个学院某个专业某个班级的---班级公告
	@RequestMapping("classNoticesFind.action")
	public String classNoticesFind(HttpSession session)
	{
		//获取班主任登录的是某学院某专业某班级
		List<User> findstuList = (List<User>) session.getAttribute("bossManageOneClass");
		String new_college=findstuList.get(0).getStu_college();
		String new_major=findstuList.get(0).getStu_major();
		String new_class=findstuList.get(0).getStu_class();
		String new_flag="3";
		News findClassNotices=new News(0, null, null, null, new_college,new_major, new_class, null, new_flag);
		List <News> classNoticesFindList=newService.classNoticesFind(findClassNotices);
		session.setAttribute("classNoticesFind", classNoticesFindList);
		return "bossManageNotice";
	}
	
	//班主任对班级公告的删除
	@RequestMapping("deleteClassNotice.action")
	public String deleteClassNotice(String new_id,HttpSession session)
	{
		int id=Integer.parseInt(new_id);
		newService.deleteClassNotice(id);
		//重新对班级公告进行查询
		classNoticesFind(session);
		 return "bossManageNotice";
	}
	//班主任对班级公告的修改
	@RequestMapping("updateClassNotice.action")
	public String updateClassNotice(String new_id,String new_home,String new_author,String new_context,String new_date,HttpSession session)
	{
		int id=Integer.parseInt(new_id);
		News notice=new News(id, new_home, new_author, new_context, null, null, null, new_date, null);
		newService.updateClassNotice(notice);
		//重新对班级公告进行查询
		classNoticesFind(session);
		return "bossManageNotice";
	}
}
