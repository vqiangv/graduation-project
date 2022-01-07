package cn.edu.ujn.wq.dao;

import java.io.Serializable;
//任课老师发布的课程信息
public class TeaCourse implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int id;
	
	private String course_number;
	
	private String tea_number;
	
	private String course_name;
	
	private String course_college;
	
	private String course_major;
	
	private String course_class;
	
	private String course_time;
	
	private String course_address;

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCourse_major() {
		return course_major;
	}

	public void setCourse_major(String course_major) {
		this.course_major = course_major;
	}

	public String getCourse_number() {
		return course_number;
	}

	public void setCourse_number(String course_number) {
		this.course_number = course_number;
	}

	public String getTea_number() {
		return tea_number;
	}

	public void setTea_number(String tea_number) {
		this.tea_number = tea_number;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public String getCourse_college() {
		return course_college;
	}

	public void setCourse_college(String course_college) {
		this.course_college = course_college;
	}

	public String getCourser_major() {
		return course_major;
	}

	public void setCourser_major(String courser_major) {
		this.course_major = courser_major;
	}

	public String getCourse_class() {
		return course_class;
	}

	public void setCourse_class(String course_class) {
		this.course_class = course_class;
	}

	public String getCourse_time() {
		return course_time;
	}

	public void setCourse_time(String course_time) {
		this.course_time = course_time;
	}

	public String getCourse_address() {
		return course_address;
	}

	public void setCourse_address(String course_address) {
		this.course_address = course_address;
	}

	@Override
	public String toString() {
		return "TeaCourse [course_number=" + course_number + ", tea_number=" + tea_number + ", course_name="
				+ course_name + ", course_college=" + course_college + ", courser_major=" + course_major
				+ ", course_class=" + course_class + ", course_time=" + course_time + ", course_address="
				+ course_address + "]";
	}

	public TeaCourse(String course_number, String tea_number, String course_name, String course_college,
			String course_major, String course_class, String course_time, String course_address) {
		super();
		this.course_number = course_number;
		this.tea_number = tea_number;
		this.course_name = course_name;
		this.course_college = course_college;
		this.course_major = course_major;
		this.course_class = course_class;
		this.course_time = course_time;
		this.course_address = course_address;
	}
	
	
	

}
