package cn.edu.ujn.wq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.edu.ujn.wq.dao.Forumt;
import cn.edu.ujn.wq.dao.Forum;
import cn.edu.ujn.wq.dao.ForumMapper;

@Service
@Transactional
public class ForumServiceImpl implements IForumService {

	@Autowired
	private ForumMapper forumDao;
	@Override
	public void formAdd(Forum forum) {
		// TODO Auto-generated method stub
		forumDao.formAdd(forum);
	}
	@Override
	public  List<Forum> findOneClassForums(Forum forum) {
		// TODO Auto-generated method stub
		List<Forum> forums=forumDao.findOneClassForums(forum);
		return forums;
	}
	@Override
	public Forum findOneForums(int id) {
		// TODO Auto-generated method stub
		Forum forum=forumDao.findOneForums(id);
		return forum;
	}
	@Override
	public List<Forumt> findOneAllHuiForums(int id) {
		// TODO Auto-generated method stub
		List<Forumt> forums=forumDao.findOneAllHuiForums(id);
		return forums;
	}
	@Override
	public void LiuYanAdd(Forumt forumt) {
		// TODO Auto-generated method stub
		forumDao.LiuYanAdd(forumt);
	}
	@Override
	public List<Forum> findOneStuAllForum(String forum_number) {
		// TODO Auto-generated method stub
		List<Forum>findOneStuAllForum=forumDao.findOneStuAllForum(forum_number);
		return findOneStuAllForum;
	}
	@Override
	public List<Forumt> findOneStuAllForumt(String forumt_number) {
		// TODO Auto-generated method stub
		List<Forumt>findOneStuAllForumt=forumDao.findOneStuAllForumt(forumt_number);
		return findOneStuAllForumt;
	}
	//删除某一条帖子
	@Override
	public void adminDeleteOneForum(int id) {
		// TODO Auto-generated method stub
		forumDao.adminDeleteOneForum(id);
	}
	//删除某一条帖子下的所有留言
	@Override
	public void adminDeleteAllForumt(int id) {
		// TODO Auto-generated method stub
		forumDao.adminDeleteAllForumt(id);
	}
	//删除某一条留言
	@Override
	public void adminDeleteOneForumt(Forumt forumt) {
		// TODO Auto-generated method stub
		forumDao.adminDeleteOneForumt(forumt);
	}

}
