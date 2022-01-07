package cn.edu.ujn.wq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.ujn.wq.dao.Hostel;
import cn.edu.ujn.wq.dao.HotelMapper;

@Service
@Transactional
public class HotelServiceImpl implements IHotelService {
	@Autowired
	private HotelMapper hotelMapper;

	@Override
	public void hostelAdd(Hostel addHostel) {
		// TODO Auto-generated method stub
		hotelMapper.hostelAdd(addHostel);
	}

	@Override
	public List<Hostel> findHotel() {
		// TODO Auto-generated method stub
		List<Hostel> findHostelList = hotelMapper.findHotel();
		return findHostelList;
	}

}
