package cn.edu.ujn.wq.dao;

import java.io.Serializable;

public class ClassIntroduction implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int id;
	
	private String college;
	
	private String major;
	
	private String classs;
	
	private String introduction;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getClasss() {
		return classs;
	}

	public void setClasss(String classs) {
		this.classs = classs;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@Override
	public String toString() {
		return "ClassIntroduction [id=" + id + ", college=" + college + ", major=" + major + ", classs=" + classs
				+ ", introduction=" + introduction + "]";
	}

	public ClassIntroduction(int id, String college, String major, String classs, String introduction) {
		super();
		this.id = id;
		this.college = college;
		this.major = major;
		this.classs = classs;
		this.introduction = introduction;
	}
	
	
}
