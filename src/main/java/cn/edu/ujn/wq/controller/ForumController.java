package cn.edu.ujn.wq.controller;

import java.net.http.HttpResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.ujn.wq.dao.Forum;
import cn.edu.ujn.wq.dao.Forumt;
import cn.edu.ujn.wq.dao.User;
import cn.edu.ujn.wq.service.IForumService;

@Controller
public class ForumController {

	@Autowired
	private IForumService forumService;
     //发布帖子
	@RequestMapping("/formAdd.action")
	public String formAdd(String forum_name,String forum_number,String forum_text,String forum_date,HttpSession session)
	{
		   User user=( User)session.getAttribute("loginUser");
		   String forum_college=user.getStu_college();
		   String forum_major=user.getStu_major();
		   String forum_class=user.getStu_class();
		   //自动读取发帖子的用户的用户名
		   forum_number=user.getStu_number();
		  //获取发帖子的时间
		forum_date=getNowDate();
		Forum forum=new Forum(0, forum_name, forum_number, forum_text, forum_date, forum_college, forum_major, forum_class);
		forumService.formAdd(forum);
		//进行一遍查询
		findOneClassForums(session);
		return"shiyan";
	}
	
	//获取系统当前的年月日
		public String  getNowDate() {
			// TODO Auto-generated method stub
			 Date date = new Date();
		        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		        String str = simpleDateFormat.format(date);
		        return str.substring(0, 10);//获得系统当前时间的年月日
		}
		
	//查询某学院某专业某班级的论坛帖子
	   @RequestMapping("/findOneClassForums.action")
	   public String findOneClassForums(HttpSession session)
	   {
		   //获取学生登录的账号
		   User user=( User)session.getAttribute("loginUser");
		   String forum_college=user.getStu_college();
		   String forum_major=user.getStu_major();
		   String forum_class=user.getStu_class();
		   //查询某个学生账号的所有帖子和留言
		   List<Forum>findOneStuAllForum= findOneStuAllForum(user);
		   List<Forumt>findOneStuAllForumt= findOneStuAllForumt(user);
		   
		   Forum forum=new Forum(0, forum_class, forum_class, forum_class, forum_class, forum_college, forum_major, forum_class);
		   List<Forum>forums=forumService.findOneClassForums(forum);
		   //将查到的某学院某专业某班级的论坛帖子传到前端
		   session.setAttribute("findOneClassForums", forums);
		   //将某学生账号的所有留言和帖子传到前端
		   session.setAttribute("findOneStuAllForum", findOneStuAllForum);
		   session.setAttribute("findOneStuAllForumt", findOneStuAllForumt);
		   return"shiyan";
	   }
	   
	   //根据id查询某帖子的详细信息，并查询它的回复帖子
	   @RequestMapping("/findOneForums.action")
	   public String stringfindOneForums(String ID,HttpSession session)
	   {
		   int id=Integer.parseInt(ID);
		   Forum forum=forumService.findOneForums(id);
		   //把帖子的内容传到前端
		   session.setAttribute("findOneForums", forum);
		   //查询该帖子所有的回复
		   findAllHuiFu(forum.getId(),session);
		  /* List<Forumt> Forums=forumService.findOneAllHuiForums(id);
		   //把所有的回复帖子传到前端
		   session.setAttribute("findOneAllHuiForums", Forums);*/
		   return "ForumtShow";
	   }
	   
	   //查询某帖子的所有回复(管理员界面)
	   @RequestMapping("findAllHuiFu.action")
	   public String findAllHuiFut(String ID,HttpSession session)
	   {
		   int id=Integer.parseInt(ID);
		   session.setAttribute("getfindAllHuiFutID", id);//方便管理员删除留言的时候再次查询
		   List<Forumt> Forums=forumService.findOneAllHuiForums(id);
		   session.setAttribute("findAllHuiFut", Forums);
		   return "adminManageForumt";
	   }
	   
	   public void findAllHuiFu(int id,HttpSession session)
	   {
		   List<Forumt> Forums=forumService.findOneAllHuiForums(id);
		   session.setAttribute("findOneAllHuiForums", Forums);
	   }
	   
	   //发布留言的功能
	   @RequestMapping("/LiuYanAdd.action")
	   public String LiuYanAdd(String forumt_text,HttpSession session)
	   {
		   //赋值
		   String forum_date=getNowDate();
		   User user=( User)session.getAttribute("loginUser");
		   Forum forum=(Forum) session.getAttribute("findOneForums");
		   int id=forum.getId();
		   String forum_number=user.getStu_number();
		   Forumt forumt=new Forumt(id, forum_number, forumt_text, forum_date,0);
		   forumService.LiuYanAdd(forumt);
		   
		   findAllHuiFu(id,session);
		   
		   return "ForumtShow";
	   }
		
	  //查询某个学生账号的全部帖子
	   public List<Forum> findOneStuAllForum(User user)
	   {
		   String forum_number=user.getStu_number();
		   List<Forum>findOneStuAllForum=forumService.findOneStuAllForum(forum_number);
		   return findOneStuAllForum;
	   }
	  //查询某个学生账号的全部留言
	   public List<Forumt> findOneStuAllForumt(User user)
	   {
		   String forumt_number=user.getStu_number();
		   List<Forumt>findOneStuAllForumt=forumService.findOneStuAllForumt(forumt_number);
		   return findOneStuAllForumt;
	   }
	   
	   //管理员查询某学院某专业某班级的班级论坛帖子
	   @RequestMapping("adminFindOneClassForum.action")
	   public String adminFindOneClassForum(String College,String Major,String forum_class,HttpSession session)
	   {
		   Forum forum=new Forum(0, forum_class, forum_class, forum_class, forum_class, College, Major, forum_class);
		   session.setAttribute("getCMC", forum);
		   List<Forum>forums=forumService.findOneClassForums(forum);
		   session.setAttribute("adminFindOneClassForum", forums);
		   return "adminManageForumShow";
	   }
	   
	   //管理员删除某一条帖子
	   @RequestMapping("adminDeleteOneForum.action")
	   public String adminDeleteOneForum(String ID,HttpSession session)
	   {
		   int id=Integer.parseInt(ID);
		   //删除某一条帖子
		   forumService.adminDeleteOneForum(id);
		   //删除该帖子下的所有留言
		   forumService.adminDeleteAllForumt(id);
		  //再次进行查询
		   Forum forum=(Forum)session.getAttribute("getCMC");
		   List<Forum>forums=forumService.findOneClassForums(forum);
		   session.setAttribute("adminFindOneClassForum", forums);
		   return "adminManageForumShow";
	   }
	   
	   //删除某一条留言
	   @RequestMapping("adminDeleteOneForumt.action")
	   public String adminDeleteOneForumt(String id,HttpSession session)
	   {
		   int uni_id=Integer.parseInt(id);
	       Forumt forumt=new Forumt(uni_id, id, id, id, uni_id);
		   forumService.adminDeleteOneForumt(forumt);
		   //进行再次查询
		   int ID=(int)session.getAttribute("getfindAllHuiFutID");
		   List<Forumt> Forums=forumService.findOneAllHuiForums(ID);
		   session.setAttribute("findAllHuiFut", Forums);
		   return "adminManageForumt";
	   }
}
