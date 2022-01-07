package cn.edu.ujn.wq.dao;

import java.io.Serializable;
import java.util.List;

import javax.management.loading.PrivateClassLoader;

//学生账号
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	private int stu_id;
	// 数据库中的ID
	private String stu_name;
	// 用户的名字
	private String stu_number;
	// 用户的编号
	private String stu_gender;
	private String stu_college;
	private String stu_major;
	private String stu_class;
	private String stu_house;
	private String stu_housenum;
	private String stu_job;
	private String stu_card;
	private String stu_password;

	// 多对多实体映射
	private List<Course> courses;

	// 多对多实体映射
	//private List<teaUser> teaUsers;

	/*
	 * public List<teaUser> getTeaUsers() { return teaUsers; }
	 * 
	 * public void setTeaUsers(List<teaUser> teaUsers) { this.teaUsers = teaUsers; }
	 */

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public int getStu_id() {
		return stu_id;
	}

	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public String getStu_number() {
		return stu_number;
	}

	public void setStu_number(String stu_number) {
		this.stu_number = stu_number;
	}

	public String getStu_gender() {
		return stu_gender;
	}

	public void setStu_gender(String stu_gender) {
		this.stu_gender = stu_gender;
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

	public String getStu_house() {
		return stu_house;
	}

	public void setStu_house(String stu_house) {
		this.stu_house = stu_house;
	}

	public String getStu_housenum() {
		return stu_housenum;
	}

	public void setStu_housenum(String stu_housenum) {
		this.stu_housenum = stu_housenum;
	}

	public String getStu_job() {
		return stu_job;
	}

	public void setStu_job(String stu_job) {
		this.stu_job = stu_job;
	}

	public String getStu_card() {
		return stu_card;
	}

	public void setStu_card(String stu_card) {
		this.stu_card = stu_card;
	}

	public String getStu_password() {
		return stu_password;
	}

	public void setStu_password(String stu_password) {
		this.stu_password = stu_password;
	}

	/*
	 * @Override public String toString() { return "User [stu_id=" + stu_id +
	 * ", stu_name=" + stu_name + ", stu_number=" + stu_number + ", stu_gender=" +
	 * stu_gender + ", stu_college=" + stu_college + ", stu_major=" + stu_major +
	 * ", stu_class=" + stu_class + ", stu_house=" + stu_house + ", stu_housenum=" +
	 * stu_housenum + ", stu_job=" + stu_job + ", stu_card=" + stu_card +
	 * ", stu_password=" + stu_password + "]"; }
	 */
	public User(int stu_id, String stu_name, String stu_number, String stu_gender, String stu_college, String stu_major,
			String stu_class, String stu_house, String stu_housenum, String stu_job, String stu_card,
			String stu_password) {
		super();
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.stu_number = stu_number;
		this.stu_gender = stu_gender;
		this.stu_college = stu_college;
		this.stu_major = stu_major;
		this.stu_class = stu_class;
		this.stu_house = stu_house;
		this.stu_housenum = stu_housenum;
		this.stu_job = stu_job;
		this.stu_card = stu_card;
		this.stu_password = stu_password;
	}

	@Override
	public String toString() {
		return "stu_id=" + stu_id + ", stu_name=" + stu_name + ", stu_number=" + stu_number + ", stu_gender="
				+ stu_gender + ", stu_college=" + stu_college + ", stu_major=" + stu_major + ", stu_class=" + stu_class
				+ ", stu_house=" + stu_house + ", stu_housenum=" + stu_housenum + ", stu_job=" + stu_job + ", stu_card="
				+ stu_card + ", stu_password=" + stu_password + ", courses=" + courses;
	}

}
