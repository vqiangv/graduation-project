package cn.edu.ujn.wq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.ujn.wq.dao.Forumt;

public interface ForumMapper {

	//发布帖子
   public void formAdd(Forum forum);
   
	public List<Forum> findOneClassForums(Forum forum);
	
	public Forum findOneForums(int id);
	
	public List<Forumt> findOneAllHuiForums(int id);
	
	public void LiuYanAdd(Forumt forumt);
	
	//查询某个学生账号的全部帖子
	public List<Forum>findOneStuAllForum(@Param("forum_number")String forum_number);
	
	//查询某个学生账号的全部留言
	public List<Forumt>findOneStuAllForumt(@Param("forumt_number")String forumt_number);
	
	//删除某一条帖子
	public void adminDeleteOneForum(int id);
		
	//删除某条帖子下的所有留言
	public void adminDeleteAllForumt(int id);
	
	//删除某一条留言
	public void adminDeleteOneForumt(Forumt forumt);
}
