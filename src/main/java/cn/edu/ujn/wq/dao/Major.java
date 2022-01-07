package cn.edu.ujn.wq.dao;

import java.io.Serializable;

public class Major implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String college_number;
	
	private String major_number;
	
	private String major_name;

	

	public String getCollege_number() {
		return college_number;
	}

	public void setCollege_number(String college_number) {
		this.college_number = college_number;
	}

	public String getMajor_number() {
		return major_number;
	}

	public void setMajor_number(String major_number) {
		this.major_number = major_number;
	}

	public String getMajor_name() {
		return major_name;
	}

	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}

	@Override
	public String toString() {
		return "Major [college_number=" + college_number + ", major_number=" + major_number + ", major_name="
				+ major_name + "]";
	}


	
	
}
