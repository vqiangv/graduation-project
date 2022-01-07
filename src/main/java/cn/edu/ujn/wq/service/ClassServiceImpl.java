package cn.edu.ujn.wq.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.ujn.wq.dao.ClassIntroduction;
import cn.edu.ujn.wq.dao.ClassMapper;
import cn.edu.ujn.wq.dao.Stu_TeaUser;
import cn.edu.ujn.wq.dao.User;
import cn.edu.ujn.wq.dao.teaUser;
import cn.edu.ujn.wq.dao.teaUserMapper;

@Service
@Transactional
public class ClassServiceImpl implements IClassService {

	@Autowired
	private ClassMapper classDao;
	
	@Autowired
	private teaUserMapper teaDao;
	

	//查询所在班级所有人员
	@Override
	public List<User> findAllClassPerson(User findUser) {
		// TODO Auto-generated method stub
		List<User> findAllClassList=classDao.findAllClassPerson(findUser);
		return findAllClassList;
	}

	@Override
	public List<teaUser> findAllBoss(String tea_flag) {
		// TODO Auto-generated method stub
		List<teaUser>findAllBossList=teaDao.findAllBoss(tea_flag);
		return findAllBossList;
	}

	@Override
	public List<teaUser> findAllTea(String tea_flag) {
		// TODO Auto-generated method stub
		List<teaUser>findAllTeaList=teaDao.findAllTea(tea_flag);
		return findAllTeaList;
	}

	@Override
	public List<teaUser> findAllClassName() {
		// TODO Auto-generated method stub
		List<teaUser> findAllClassName=teaDao.findAllClassName();
		return findAllClassName;
	}

	@Override
	public List<User> findAllClassNameStu(User user) {
		// TODO Auto-generated method stub
		List<User>findAllClassNameStu=classDao.findAllClassNameStu(user);
		return findAllClassNameStu;
	}

	@Override
	public void deleteBoss(int inthiddInteger) {
		// TODO Auto-generated method stub
		teaDao.deleteBoss(inthiddInteger);
	}

	@Override
	public List<Stu_TeaUser> bossManageClass(String tea_number) {
		// TODO Auto-generated method stub
		List<Stu_TeaUser> bossManageList=teaDao.bossManageClass(tea_number);
		return bossManageList;
	}

	@Override
	public void updateBoss(teaUser teaUser) {
		// TODO Auto-generated method stub
		teaDao.updateBoss(teaUser);
	}

	@Override
	public void updateTeacher(teaUser teaUser) {
		// TODO Auto-generated method stub
		teaDao.updateTeacher(teaUser);
	}

	@Override
	public void updateStu(User user) {
		// TODO Auto-generated method stub
		classDao.updateStu(user);
	}

	@Override
	public void deleteStu(int stu_id) {
		// TODO Auto-generated method stub
		classDao.deleteStu(stu_id);
	}

	@Override
	public void adminClassAdd(Stu_TeaUser stu_TeaUser) {
		// TODO Auto-generated method stub
		teaDao.adminClassAdd(stu_TeaUser);
	}

	@Override
	public List<Stu_TeaUser> findadminCMClassTea() {
		// TODO Auto-generated method stub
		List<Stu_TeaUser>stu_TeaUsers=teaDao.findadminCMClassTea();
		return stu_TeaUsers;
	}

	@Override
	public void updateadminCMClassTea(Stu_TeaUser stu_TeaUser) {
		// TODO Auto-generated method stub
		teaDao.updateadminCMClassTea(stu_TeaUser);
	}

	@Override
	public List<User> findOneClassNameStu(int id) {
		// TODO Auto-generated method stub
		List<User>findoneclassstUsers=classDao.findOneClassNameStu(id);
		return findoneclassstUsers;
	}

	@Override
	public ClassIntroduction findClassIntroduction(ClassIntroduction classIntroduction) {
		// TODO Auto-generated method stub
		ClassIntroduction classIntroduction2=classDao.findClassIntroduction(classIntroduction);
		return classIntroduction2;
	}
	//根据宿舍号查询宿舍成员的信息
	@Override
	public List<User> findAllPresonByHousenum(User user) {
		// TODO Auto-generated method stub
		List<User>findAllHotelList=classDao.findAllPresonByHousenum(user);
		return findAllHotelList;
	}

}
