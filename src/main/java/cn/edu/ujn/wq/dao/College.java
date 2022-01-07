package cn.edu.ujn.wq.dao;

import java.io.Serializable;
import java.util.List;
import cn.edu.ujn.wq.dao.ClassTea;
import cn.edu.ujn.wq.dao.Major;

public class College implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String college_number;
	
	private String college_name;
	
	private List<Major> majors;
	
	private List<ClassTea> classTeas;
	
	


	public String getCollege_number() {
		return college_number;
	}

	public void setCollege_number(String college_number) {
		this.college_number = college_number;
	}

	public String getCollege_name() {
		return college_name;
	}

	public void setCollege_name(String college_name) {
		this.college_name = college_name;
	}

	public List<Major> getMajors() {
		return majors;
	}

	public void setMajors(List<Major> majors) {
		this.majors = majors;
	}

	public List<ClassTea> getClassTeas() {
		return classTeas;
	}

	public void setClassTeas(List<ClassTea> classTeas) {
		this.classTeas = classTeas;
	}

	


	@Override
	public String toString() {
		return "College [college_number=" + college_number + ", college_name=" + college_name + ", majors=" + majors
				+ ", classTeas=" + classTeas + "]";
	}



	
	




	
	

}
