package cn.edu.ujn.wq.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.ujn.wq.dao.Hostel;
import cn.edu.ujn.wq.service.IHotelService;

@Controller
public class HotelController {

	@Autowired
	private IHotelService hotelService;

	// 管理员对宿舍信息的创建
	@RequestMapping("hostelAdd.action")
	public String hotelAdd(String hostel_number, String hostel_num, String hostelHome_num, String hostelPerson_num) {
		Hostel AddHostel = new Hostel(hostel_number, hostel_num, hostelHome_num, hostelPerson_num);
		hotelService.hostelAdd(AddHostel);
		return "adminHostelAdd";
	}

	// 管理员对楼栋宿舍的查询
	@RequestMapping("findHotel.action")
	public String findHotel(HttpSession session) {
		List<Hostel> findHoteList = hotelService.findHotel();
		/*
		for (int k = 0; k < findHoteList.size(); k++) {
			for (int i = 0; i < Integer.parseInt(findHoteList.get(k).getHostel_num()); i++) {
				for (int j = 0; j < Integer.parseInt(findHoteList.get(k).getHostelHome_num()); j++) {
					if (j > 8)
						System.out.println(Integer.toString(i + 1) + Integer.toString(j + 1));
					else
						System.out.println(Integer.toString(i + 1) + Integer.toString(0) + Integer.toString(j + 1));
				}
			}
		}
		*/
		//将查询到的宿舍信息传输到前端
		session.setAttribute("findHotel", findHoteList);
		return"adminHotelManage";
	}
}
