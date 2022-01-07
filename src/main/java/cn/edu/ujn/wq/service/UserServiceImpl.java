package cn.edu.ujn.wq.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.ujn.wq.dao.User;
import cn.edu.ujn.wq.dao.UserMapper;
import cn.edu.ujn.wq.dao.teaUser;
import cn.edu.ujn.wq.dao.teaUserMapper;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

	@Autowired
	private UserMapper userDao;
	
	@Autowired
	private teaUserMapper teaUserDao;

	@Override
	public User findUser(String login_number, String login_password) {
		// TODO Auto-generated method stub
		User user = userDao.findUser(login_number, login_password);
		return user;
	}

	@Override
	public int userCreate(User stuUser) {
		// TODO Auto-generated method stub
		int row = userDao.createUser(stuUser);
		return row;
	}

	@Override
	public int bossUserCreate(teaUser bossTeaUser) {
		// TODO Auto-generated method stub
		int bossRow=teaUserDao.createBossUser(bossTeaUser);
		return bossRow;
	}

	@Override
	public int teacherUserCreate(teaUser teaUser) {
		// TODO Auto-generated method stub
		int teaRow=teaUserDao.createTeacherUser(teaUser);
		return teaRow;
	}

	@Override
	public teaUser findTeaUser(String login_number, String login_password) {
		// TODO Auto-generated method stub
		teaUser user = teaUserDao.findTeaUser(login_number, login_password);
		return user;
	}

	@Override
	public teaUser findTeacherById(int tea_id) {
		// TODO Auto-generated method stub
		teaUser teaUser=teaUserDao.findTeacherById(tea_id);
		return teaUser;
	}

	 //通过教师编号去查教师的姓名
	@Override
	public String findTeaNameByNumber(String tea_number) {
		// TODO Auto-generated method stub
		String nameString=teaUserDao.findTeaNameByNumber(tea_number);
		return nameString;
	}


}
