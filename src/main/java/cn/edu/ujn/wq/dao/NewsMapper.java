package cn.edu.ujn.wq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface NewsMapper {

	public int newsAdd(News news);
	
	public List<News>newsFind(News news);
	
	public void deleteNews(int newsID);
	
	public News newsFindID(int newsID);
	
	public List<News>classNewsFind(News findClassNews);
	
	//班主任发布班级公告
	public int bossNoticesAdd(News notices);
	
	//班级公告的查询
	public List<News>classNoticesFind(News findClassNotices);
	
	//班级公告的删除
	public void deleteClassNotice(int id);
	
	//班级公告的修改
	public void updateClassNotice(News notice);
	
	public List<News>findClassGongGao(News news);
}
