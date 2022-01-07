package cn.edu.ujn.wq.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.ujn.wq.dao.Images;
import cn.edu.ujn.wq.service.ImageService;

@Controller
public class ImageController {

	@Autowired
	private ImageService imageService;
	
  //存取用户的头像，将头像的本地路径存取到数据库中、
 @RequestMapping("addUserImage.action")
 public void addUserImage(String image)
 {
	 System.out.println(image);
	 String number="202112221";
	 Images images=new Images(0, number, image);
	 imageService.addUserImage(images);
 }
 
 //根据编号、学号查询头像信息
 @RequestMapping("findImageByNumber.action")
 public String findImageByNumber(String number,HttpSession session)
 {
	 number="202112221";
	 Images images=imageService.findImageByNumber(number);
	 String name=images.getImage();
	 String url="/imgUrl/"+name;
	 //将头像信息传输到前端
	 session.setAttribute("findImageByNumber", url);
	 return "classPhotos.jsp";
 }
}
