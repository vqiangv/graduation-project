package cn.edu.ujn.wq.dao;

import java.io.Serializable;

public class Tea_course implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String course_number;
	
	private String tea_number;
	
	private int id;
   
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Tea_course [course_number=" + course_number + ", tea_number=" + tea_number + "]";
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

	public Tea_course(String course_number, String tea_number) {
		super();
		this.course_number = course_number;
		this.tea_number = tea_number;
	}
	
	

}
