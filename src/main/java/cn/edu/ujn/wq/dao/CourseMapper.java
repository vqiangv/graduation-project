package cn.edu.ujn.wq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.ujn.wq.dao.Course;
public interface CourseMapper {

	public int courseAdd(Course course);
	
	public void teaCourseAdd(TeaCourse teaCourse);
	
	public void tea_CourseAdd(Tea_course tea_Course);
	
	public List<Course> teaFindCourse(@Param("tea_number")String tea_number);
	
	public List<TeaCourse> teaFindCourseTimeAddress(@Param("tea_number")String tea_number );
	
	public TeaCourse FindCourseTimeAddress(TeaCourse teaCourse);
	//任课老师根据学年和学期进行条件查询，查询自己的课表
	public List<Course>teaFindCourseYearTerm(@Param("tea_number")String tea_number,@Param("course_year")String course_year,
			@Param("course_term")String course_term);
	//条件查询，查询课程的上课时间和上课地点
	public List<TeaCourse> teaFindCYTtimeaddress(@Param("tea_number")String tea_number,@Param("course_year")String course_year,
				@Param("course_term")String course_term);
	
 	//学生查询个人课表
  	public List<TeaCourse> findPersonCourse(@Param("course_college")String course_college,@Param("course_major")String course_major,@Param("course_class")String course_class);
  	
	//任课老师发布教学效果
	public void teaFindAddCourseXiaoguo(Scores scores);
}
