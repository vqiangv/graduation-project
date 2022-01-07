package cn.edu.ujn.wq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.ujn.wq.dao.Course;
import cn.edu.ujn.wq.dao.CourseMapper;
import cn.edu.ujn.wq.dao.Scores;
import cn.edu.ujn.wq.dao.TeaCourse;
import cn.edu.ujn.wq.dao.Tea_course;
import cn.edu.ujn.wq.dao.User;
import cn.edu.ujn.wq.dao.UserMapper;

@Service
@Transactional
public class CourseServiceImpl implements ICourseService {

	@Autowired
	private CourseMapper courseDao;
	
	@Autowired
	private UserMapper userDao;

	@Override
	public int courseAdd(Course course) {
		// TODO Auto-generated method stub
		int courseAddRow = courseDao.courseAdd(course);
		return courseAddRow;
	}

	@Override
	public List<TeaCourse> findPersonCourse(String course_college,String course_major,String course_class) {
		// TODO Auto-generated method stub
		List<TeaCourse> findPersonCourse=courseDao.findPersonCourse(course_college,course_major,course_class);
		return findPersonCourse;
	}

	@Override
	public void teaCourseAdd(TeaCourse teaCourse) {
		// TODO Auto-generated method stub
		courseDao.teaCourseAdd(teaCourse);
	}

	@Override
	public void tea_CourseAdd(Tea_course tea_Course) {
		// TODO Auto-generated method stub
		System.out.println(tea_Course);
		courseDao.tea_CourseAdd(tea_Course);
	}

	@Override
	public List<Course> teaFindCourse(String tea_number) {
		// TODO Auto-generated method stub
		List<Course>teaFindCourseList=courseDao.teaFindCourse(tea_number);
		return teaFindCourseList;
	}

	@Override
	public List<TeaCourse> teaFindCourseTimeAddress(String tea_number) {
		// TODO Auto-generated method stub
		List<TeaCourse> teaFindTimeAddress=courseDao.teaFindCourseTimeAddress(tea_number);
		return teaFindTimeAddress;
	}

	@Override
	public TeaCourse FindCourseTimeAddress(TeaCourse teaCourse) {
		// TODO Auto-generated method stub
		TeaCourse FindTimeAddress=courseDao.FindCourseTimeAddress(teaCourse);
		return FindTimeAddress;
	}
	
	//任课老师根据学年和学期进行条件查询，查询自己的课表
	@Override
	public List<Course> teaFindCourseYearTerm(String tea_number, String course_year, String course_term) {
		// TODO Auto-generated method stub
		List<Course>teaFindCourseList=courseDao.teaFindCourseYearTerm(tea_number, course_year, course_term);
		return teaFindCourseList;
	}
	
	//条件查询，查询课程的上课时间和上课地点
	@Override
	public List<TeaCourse> teaFindCYTtimeaddress(String tea_number, String course_year, String course_term) {
		// TODO Auto-generated method stub
		List<TeaCourse> teaFindTimeAddress=courseDao.teaFindCYTtimeaddress(tea_number, course_year, course_term);
		return teaFindTimeAddress;
	}

	//任课老师发布教学效果
	@Override
	public void teaFindAddCourseXiaoguo(Scores scores) {
		// TODO Auto-generated method stub
		courseDao.teaFindAddCourseXiaoguo(scores);
	}
	
	
	

}
