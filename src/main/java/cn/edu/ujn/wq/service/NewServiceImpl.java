package cn.edu.ujn.wq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.ujn.wq.dao.News;
import cn.edu.ujn.wq.dao.NewsMapper;

@Service
@Transactional
public class NewServiceImpl implements INewService {

	@Autowired
	private NewsMapper newsDao;
	
	@Override
	public int newsAdd(News news) {
		// TODO Auto-generated method stub
		int newRow=newsDao.newsAdd(news);
		return newRow;
	}

	@Override
	public List<News> newsFind(News news) {
		// TODO Auto-generated method stub
		List<News>newsFindList=newsDao.newsFind(news);
		return newsFindList;
	}

	@Override
	public void deleteNews(int newsID) {
		// TODO Auto-generated method stub
		newsDao.deleteNews(newsID);
	}

	@Override
	public News newsFindID(int newsID) {
		// TODO Auto-generated method stub
		News newsIDListNews=newsDao.newsFindID(newsID);
		return newsIDListNews;
	}

	@Override
	public List<News> classNewsFind(News findClassNews) {
		// TODO Auto-generated method stub
		List<News>classNewsFindList=newsDao.classNewsFind(findClassNews);
		return classNewsFindList;
	}

	//班主任发布班级公告
	@Override
	public int bossNoticesAdd(News notices) {
		// TODO Auto-generated method stub
		int noticesRow=newsDao.bossNoticesAdd(notices);
		return noticesRow;
	}

	//班级公告的查询
	@Override
	public List<News> classNoticesFind(News findClassNotices) {
		// TODO Auto-generated method stub
		List<News>classNoticesFind=newsDao.classNoticesFind(findClassNotices);
		return classNoticesFind;
	}

	//班级公告的删除
	@Override
	public void deleteClassNotice(int id) {
		// TODO Auto-generated method stub
		newsDao.deleteClassNotice(id);
	}

	//班级公告的修改
	@Override
	public void updateClassNotice(News notice) {
		// TODO Auto-generated method stub
		newsDao.updateClassNotice(notice);
	}

	@Override
	public List<News> findClassGongGao(News news) {
		// TODO Auto-generated method stub
		List<News>newslisList=newsDao.findClassGongGao(news);
		return newslisList;
	}

}
