package cn.edu.ujn.wq.dao;

import java.util.List;

public interface HotelMapper {

	public void hostelAdd(Hostel addHostel);
	
	public List<Hostel> findHotel();
}
