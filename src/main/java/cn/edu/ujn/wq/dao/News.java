package cn.edu.ujn.wq.dao;

import java.io.Serializable;

public class News implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int new_id;
	
	private String new_home;
	
	private String new_author;
	
	private String new_context;
	
	private String new_college;
	
	private String new_major;
	
	private String new_class;
	
	private String new_date;
	
	private String new_flag;

	
	public String getNew_college() {
		return new_college;
	}

	public void setNew_college(String new_college) {
		this.new_college = new_college;
	}

	public String getNew_major() {
		return new_major;
	}

	public void setNew_major(String new_major) {
		this.new_major = new_major;
	}

	public String getNew_class() {
		return new_class;
	}

	public void setNew_class(String new_class) {
		this.new_class = new_class;
	}

	public String getNew_flag() {
		return new_flag;
	}

	public void setNew_flag(String new_flag) {
		this.new_flag = new_flag;
	}

	public int getNew_id() {
		return new_id;
	}

	public void setNew_id(int new_id) {
		this.new_id = new_id;
	}

	public String getNew_home() {
		return new_home;
	}

	public void setNew_home(String new_home) {
		this.new_home = new_home;
	}

	public String getNew_author() {
		return new_author;
	}

	public void setNew_author(String new_author) {
		this.new_author = new_author;
	}

	public String getNew_context() {
		return new_context;
	}

	public void setNew_context(String new_context) {
		this.new_context = new_context;
	}

	public String getNew_date() {
		return new_date;
	}

	public void setNew_date(String new_date) {
		this.new_date = new_date;
	}

	@Override
	public String toString() {
		return "News [new_id=" + new_id + ", new_home=" + new_home + ", new_author=" + new_author + ", new_context="
				+ new_context + ", new_college=" + new_college + ", new_major=" + new_major + ", new_class=" + new_class
				+ ", new_date=" + new_date + ", new_flag=" + new_flag + "]";
	}

	public News(int new_id, String new_home, String new_author, String new_context, String new_college,
			String new_major, String new_class, String new_date, String new_flag) {
		super();
		this.new_id = new_id;
		this.new_home = new_home;
		this.new_author = new_author;
		this.new_context = new_context;
		this.new_college = new_college;
		this.new_major = new_major;
		this.new_class = new_class;
		this.new_date = new_date;
		this.new_flag = new_flag;
	}

	




	
	
}
