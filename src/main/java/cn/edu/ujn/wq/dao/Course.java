package cn.edu.ujn.wq.dao;

import java.io.Serializable;
import java.util.List;

public class Course implements Serializable {
	private static final long serialVersionUID = 1L;

	private int course_id;
   
	private String course_year;
	
	private String course_term;
	
	private String course_number;

	private String course_name;

	private String course_score;




	public String getCourse_year() {
		return course_year;
	}


	public void setCourse_year(String course_year) {
		this.course_year = course_year;
	}


	public String getCourse_term() {
		return course_term;
	}


	public void setCourse_term(String course_term) {
		this.course_term = course_term;
	}


	public int getCourse_id() {
		return course_id;
	}


	public void setCourse_id(int course_id) {
		this.course_id = course_id;
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

	public String getCourse_score() {
		return course_score;
	}

	public void setCourse_score(String course_score) {
		this.course_score = course_score;
	}


	@Override
	public String toString() {
		return "Course [course_id=" + course_id + ", course_year=" + course_year + ", course_term=" + course_term
				+ ", course_number=" + course_number + ", course_name=" + course_name + ", course_score=" + course_score
				+ "]";
	}


	public Course(int course_id, String course_year, String course_term, String course_number, String course_name,
			String course_score) {
		super();
		this.course_id = course_id;
		this.course_year = course_year;
		this.course_term = course_term;
		this.course_number = course_number;
		this.course_name = course_name;
		this.course_score = course_score;
	}



	



}