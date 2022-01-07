package cn.edu.ujn.wq.dao;

import java.io.Serializable;

public class Hostel implements Serializable {
	private static final long serialVersionUID = 1L;
	//楼栋号
	private String hostel_number;
	//层数
	private String hostel_num;
	//单层的房间数
	private String hostelHome_num;
	//宿舍容量
	private String hostelPerson_num;
	
	public String getHostel_number() {
		return hostel_number;
	}
	public void setHostel_number(String hostel_number) {
		this.hostel_number = hostel_number;
	}
	public String getHostel_num() {
		return hostel_num;
	}
	public void setHostel_num(String hostel_num) {
		this.hostel_num = hostel_num;
	}
	public String getHostelHome_num() {
		return hostelHome_num;
	}
	public void setHostelHome_num(String hostelHome_num) {
		this.hostelHome_num = hostelHome_num;
	}
	public String getHostelPerson_num() {
		return hostelPerson_num;
	}
	public void setHostelPerson_num(String hostelPerson_num) {
		this.hostelPerson_num = hostelPerson_num;
	}
	@Override
	public String toString() {
		return "Hostel [hostel_number=" + hostel_number + ", hostel_num=" + hostel_num + ", hostelHome_num="
				+ hostelHome_num + ", hostelPerson_num=" + hostelPerson_num + "]";
	}
	public Hostel(String hostel_number, String hostel_num, String hostelHome_num, String hostelPerson_num) {
		super();
		this.hostel_number = hostel_number;
		this.hostel_num = hostel_num;
		this.hostelHome_num = hostelHome_num;
		this.hostelPerson_num = hostelPerson_num;
	}
	
	
	
	

}
