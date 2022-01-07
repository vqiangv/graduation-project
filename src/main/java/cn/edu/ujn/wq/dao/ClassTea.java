package cn.edu.ujn.wq.dao;

import java.io.Serializable;
//连接学生和班主任的，对应的表是stutea
public class ClassTea implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String stu_class;
	
	private String tea_number;                                                                                             
	
	private String major_number;

	

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

	public String getMajor_number() {
		return major_number;
	}

	public void setMajor_number(String major_number) {
		this.major_number = major_number;
	}

	@Override
	public String toString() {
		return "ClassTea [stu_class=" + stu_class + ", tea_number=" + tea_number + ", major_number=" + major_number
				+ "]";
	}

	
	
	
	

}
