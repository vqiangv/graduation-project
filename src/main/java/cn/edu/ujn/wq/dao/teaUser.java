package cn.edu.ujn.wq.dao;

import java.io.Serializable;
import java.util.List;

public class teaUser implements Serializable {
	private static final long serialVersionUID = 1L;
	private int tea_id;
	// 数据库中的ID
	private String tea_name;
	// 用户的名字
	private String tea_number;
	// 用户的编号
	private String tea_gender;
	private String tea_college;
	private String tea_major;
	private String tea_class;
	private String tea_card;
	private String tea_password;
	private String tea_flag;
    
	public String getTea_major() {
		return tea_major;
	}

	public void setTea_major(String tea_major) {
		this.tea_major = tea_major;
	}

	public int getTea_id() {
		return tea_id;
	}

	public void setTea_id(int tea_id) {
		this.tea_id = tea_id;
	}

	public String getTea_name() {
		return tea_name;
	}

	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}

	public String getTea_number() {
		return tea_number;
	}

	public void setTea_number(String tea_number) {
		this.tea_number = tea_number;
	}

	public String getTea_gender() {
		return tea_gender;
	}

	public void setTea_gender(String tea_gender) {
		this.tea_gender = tea_gender;
	}

	public String getTea_college() {
		return tea_college;
	}

	public void setTea_college(String tea_college) {
		this.tea_college = tea_college;
	}

	public String getTea_card() {
		return tea_card;
	}

	public void setTea_card(String tea_card) {
		this.tea_card = tea_card;
	}

	public String getTea_password() {
		return tea_password;
	}

	public void setTea_password(String tea_password) {
		this.tea_password = tea_password;
	}

	

	public String getTea_flag() {
		return tea_flag;
	}

	public void setTea_flag(String tea_flag) {
		this.tea_flag = tea_flag;
	}

	public String getTea_class() {
		return tea_class;
	}

	public void setTea_class(String tea_class) {
		this.tea_class = tea_class;
	}

	@Override
	public String toString() {
		return "teaUser [tea_id=" + tea_id + ", tea_name=" + tea_name + ", tea_number=" + tea_number + ", tea_gender="
				+ tea_gender + ", tea_college=" + tea_college + ", tea_major=" + tea_major + ", tea_class=" + tea_class
				+ ", tea_card=" + tea_card + ", tea_password=" + tea_password + ", tea_flag=" + tea_flag + "]";
	}

	public teaUser(int tea_id, String tea_name, String tea_number, String tea_gender, String tea_college,
			String tea_major, String tea_class, String tea_card, String tea_password, String tea_flag) {
		super();
		this.tea_id = tea_id;
		this.tea_name = tea_name;
		this.tea_number = tea_number;
		this.tea_gender = tea_gender;
		this.tea_college = tea_college;
		this.tea_major = tea_major;
		this.tea_class = tea_class;
		this.tea_card = tea_card;
		this.tea_password = tea_password;
		this.tea_flag = tea_flag;
	}

	
	

	



}
