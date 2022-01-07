package cn.edu.ujn.wq.controller;

import java.io.File;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.ibatis.mapping.VendorDatabaseIdProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.jdbc.util.Base64Decoder;

import cn.edu.ujn.wq.dao.College;
import cn.edu.ujn.wq.dao.Hostel;
import cn.edu.ujn.wq.service.IHotelService;
import cn.edu.ujn.wq.service.IOthersService;

@Controller
public class OthersController {

	@Autowired
	private IOthersService othersService;

	/**************************************/
	@Autowired
	private IHotelService hotelService;

	/*************************************/

	// 查询所有的学院，专业，班级,并返回到注册界面
	@RequestMapping("College-major-class.action")
	public String findCollegeMajorClass(HttpSession session) {
		List<College> findCollegeMajorClass = othersService.findCollegeMajorClass();
		session.setAttribute("allCollege", findCollegeMajorClass);
		// 调用查询楼栋的宿舍信息
		findHotel(session);
		return "regis";
	}

	/************************ 其他控制层的函数 ********************************************/
	// 查询楼栋的宿舍信息
	public void findHotel(HttpSession session) {
		List<Hostel> findHoteList = hotelService.findHotel();
		session.setAttribute("findHotel", findHoteList);
	}
	/************************************************************************************/


}
