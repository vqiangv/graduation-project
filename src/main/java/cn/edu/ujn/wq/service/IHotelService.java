package cn.edu.ujn.wq.service;

import java.util.List;

import cn.edu.ujn.wq.dao.Hostel;

public interface IHotelService {
	//管理员添加宿舍信息
	public void hostelAdd(Hostel addHostel);
	
	//管理员查询楼栋的宿舍信息
	public List<Hostel> findHotel();
}
