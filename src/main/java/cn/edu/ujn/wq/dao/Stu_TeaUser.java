package cn.edu.ujn.wq.dao;

import java.io.Serializable;

public class Stu_TeaUser implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	
	private String stu_college;
	
	private String stu_major;
	
	private String stu_class;
	
	private String tea_number;

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStu_college() {
		return stu_college;
	}

	public void setStu_college(String stu_college) {
		this.stu_college = stu_college;
	}

	public String getStu_major() {
		return stu_major;
	}

	public void setStu_major(String stu_major) {
		this.stu_major = stu_major;
	}

	public String getStu_class() {
		return stu_class;
	}

	public void setStu_class(String stu_class) {
		this.stu_class = stu_class;
	}

	public String getTea_number() {
		return tea_number;
	}

	public void setTea_number(String tea_number) {
		this.tea_number = tea_number;
	}

	@Override
	public String toString() {
		return "Stu_TeaUser [id=" + id + ", stu_college=" + stu_college + ", stu_major=" + stu_major + ", stu_class="
				+ stu_class + ", tea_number=" + tea_number + "]";
	}

	public Stu_TeaUser(int id, String stu_college, String stu_major, String stu_class, String tea_number) {
		super();
		this.id = id;
		this.stu_college = stu_college;
		this.stu_major = stu_major;
		this.stu_class = stu_class;
		this.tea_number = tea_number;
	}


	
	
}
