package cn.edu.ujn.wq.service;

import java.util.List;

import cn.edu.ujn.wq.dao.Forum;
import cn.edu.ujn.wq.dao.Forumt;

public interface IForumService {

	//发布帖子
	public void formAdd(Forum forum);
	
	//查询某学院某专业某班级的论坛帖子
	public List<Forum> findOneClassForums(Forum forum);
	
	//通过id查询某一个帖子
	public Forum findOneForums(int id);
	
	//查询一个帖子的所有回复
	public List<Forumt> findOneAllHuiForums(int id);
	
	//发布留言
	public void LiuYanAdd(Forumt forumt);
	
	//查询某个学生账号的全部帖子
	public List<Forum>findOneStuAllForum(String forum_number);
	
	//查询某个学生账号的全部留言
	public List<Forumt>findOneStuAllForumt(String forumt_number);
	
	//删除某一条帖子
	public void adminDeleteOneForum(int id);
	
	//删除某条帖子下的所有留言
	public void adminDeleteAllForumt(int id);
	
	//删除某一条留言
	public void adminDeleteOneForumt( Forumt forumt);
}
