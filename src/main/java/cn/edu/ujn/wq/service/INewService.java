package cn.edu.ujn.wq.service;

import java.util.List;

import cn.edu.ujn.wq.dao.News;

public interface INewService {

	//发布新闻
	public int newsAdd(News news);
	
	//新闻查询
	public List<News>newsFind(News news);
	
	//新闻删除
	public void deleteNews(int newsID);
	
	//通过id查询新闻
	public News newsFindID(int newsID);
	
	//班级新闻的查询
	public List<News>classNewsFind(News findClassNews);
	
	public List<News>findClassGongGao(News news);
	
	//班主任发布班级公告
	public int bossNoticesAdd(News notices);
	
	//班级公告的查询
	public List<News>classNoticesFind(News findClassNotices);
	
	//班级公告的删除
	public void deleteClassNotice(int id);
	
	//班级公告的修改
	public void updateClassNotice(News notice);
}
