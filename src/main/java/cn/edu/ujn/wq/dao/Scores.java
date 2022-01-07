package cn.edu.ujn.wq.dao;

import java.io.Serializable;

public class Scores implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int id;
	
	private String course_college;
	
	private String course_major;
	
	private String course_class;
	
	private String course_number;
	
	private String course_name;
	
	private String stu_number;
	
	private String stu_name;
	
	private String score;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCourse_college() {
		return course_college;
	}

	public void setCourse_college(String course_college) {
		this.course_college = course_college;
	}

	public String getCourse_major() {
		return course_major;
	}

	public void setCourse_major(String course_major) {
		this.course_major = course_major;
	}

	public String getCourse_class() {
		return course_class;
	}

	public void setCourse_class(String course_class) {
		this.course_class = course_class;
	}

	public String getCourse_number() {
		return course_number;
	}

	public void setCourse_number(String course_number) {
		this.course_number = course_number;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public String getStu_number() {
		return stu_number;
	}

	public void setStu_number(String stu_number) {
		this.stu_number = stu_number;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Scores [id=" + id + ", course_college=" + course_college + ", course_major=" + course_major
				+ ", course_class=" + course_class + ", course_number=" + course_number + ", course_name=" + course_name
				+ ", stu_number=" + stu_number + ", stu_name=" + stu_name + ", score=" + score + "]";
	}

	public Scores(int id, String course_college, String course_major, String course_class, String course_number,
			String course_name, String stu_number, String stu_name, String score) {
		super();
		this.id = id;
		this.course_college = course_college;
		this.course_major = course_major;
		this.course_class = course_class;
		this.course_number = course_number;
		this.course_name = course_name;
		this.stu_number = stu_number;
		this.stu_name = stu_name;
		this.score = score;
	}
	
	
}
