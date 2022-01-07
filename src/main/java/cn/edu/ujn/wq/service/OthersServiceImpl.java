package cn.edu.ujn.wq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.ujn.wq.dao.College;
import cn.edu.ujn.wq.dao.Hostel;
import cn.edu.ujn.wq.dao.HotelMapper;
import cn.edu.ujn.wq.dao.OthersMapper;

@Service
@Transactional
public class OthersServiceImpl implements IOthersService {

	@Autowired
	private OthersMapper othersDao;
	

	
	@Override
	public List<College> findCollegeMajorClass() {
		// TODO Auto-generated method stub
		List<College>findCollegeMajorClass=othersDao.findCollegeMajorClass();
		return findCollegeMajorClass;
	}



}
