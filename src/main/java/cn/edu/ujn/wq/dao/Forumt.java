package cn.edu.ujn.wq.dao;

import java.io.Serializable;

public class Forumt implements Serializable {
	private static final long serialVersionUID = 1L;
	
     private int id;
	
	
	private String forumt_number;
	
	private String forumt_text;
	
	private String forumt_date;
	
	private int uni_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getForumt_number() {
		return forumt_number;
	}

	public void setForumt_number(String forumt_number) {
		this.forumt_number = forumt_number;
	}

	public String getForumt_text() {
		return forumt_text;
	}

	public void setForumt_text(String forumt_text) {
		this.forumt_text = forumt_text;
	}

	public String getForumt_date() {
		return forumt_date;
	}

	public void setForumt_date(String forumt_date) {
		this.forumt_date = forumt_date;
	}
    
	public int getUni_id() {
		return uni_id;
	}

	public void setUni_id(int uni_id) {
		this.uni_id = uni_id;
	}



	@Override
	public String toString() {
		return "Forumt [id=" + id + ", forumt_number=" + forumt_number + ", forumt_text=" + forumt_text
				+ ", forumt_date=" + forumt_date + ", uni_id=" + uni_id + "]";
	}

	public Forumt(int id, String forumt_number, String forumt_text, String forumt_date, int uni_id) {
		super();
		this.id = id;
		this.forumt_number = forumt_number;
		this.forumt_text = forumt_text;
		this.forumt_date = forumt_date;
		this.uni_id = uni_id;
	}

	

	
    
    
}
