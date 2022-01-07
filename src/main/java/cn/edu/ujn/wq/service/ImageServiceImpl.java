package cn.edu.ujn.wq.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.ujn.wq.dao.ImageMapper;
import cn.edu.ujn.wq.dao.Images;

@Service
@Transactional
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageMapper imageDao;
	
	@Override
	public void addUserImage(Images images) {
		// TODO Auto-generated method stub
		imageDao.addUserImage(images);
	}

	 //根据编号、学号查询头像信息
	@Override
	public Images findImageByNumber(String number) {
		// TODO Auto-generated method stub
		 Images images=imageDao.findImageByNumber(number);
		return images;
	}

}
