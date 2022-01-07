package cn.edu.ujn.wq.service;

import java.util.List;

import cn.edu.ujn.wq.dao.Course;
import cn.edu.ujn.wq.dao.Scores;
import cn.edu.ujn.wq.dao.TeaCourse;
import cn.edu.ujn.wq.dao.Tea_course;
import cn.edu.ujn.wq.dao.User;

public interface ICourseService {

	//课程的添加
	public int courseAdd(Course course);
	
	public List<TeaCourse> findPersonCourse(String course_college,String course_major,String course_class);
	//任课老师发布课程信息
	public void teaCourseAdd(TeaCourse teaCourse);
	//向课程-任课老师课程的关系表中添加数据
	public void tea_CourseAdd(Tea_course tea_Course);
	//任课老师查看自己的课表
	public List<Course> teaFindCourse(String tea_number);
	
	public List<TeaCourse> teaFindCourseTimeAddress(String tea_number );
	
	//根据课程号，学院，专业，班级，查询上课时间和上课地点
	public TeaCourse FindCourseTimeAddress(TeaCourse teaCourse);
	//任课老师根据学年和学期进行条件查询，查询自己的课表
	public List<Course>teaFindCourseYearTerm(String tea_number,String course_year,String course_term);
	//条件查询，查询课程的上课时间和上课地点
	public List<TeaCourse> teaFindCYTtimeaddress(String tea_number,String course_year,String course_term);
	
	//任课老师发布教学效果
	public void teaFindAddCourseXiaoguo(Scores scores);
}
