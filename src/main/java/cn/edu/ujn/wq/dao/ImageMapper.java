package cn.edu.ujn.wq.dao;

public interface ImageMapper {

	  //存取用户的头像，将头像的本地路径存取到数据库中、
		public void addUserImage(Images images);
		
		 //根据编号、学号查询头像信息
		public Images findImageByNumber(String number);
}
