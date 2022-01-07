package cn.edu.ujn.wq.dao;

import java.io.Serializable;

public class Forum implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int id;
	
	private String forum_name;
	
	private String forum_number;
	
	private String forum_text;
	
	private String forum_date;
	
    private String forum_college;
    
    private String forum_major;
    
    private String forum_class;
    

	public String getForum_college() {
		return forum_college;
	}

	public void setForum_college(String forum_college) {
		this.forum_college = forum_college;
	}

	public String getForum_major() {
		return forum_major;
	}

	public void setForum_major(String forum_major) {
		this.forum_major = forum_major;
	}

	public String getForum_class() {
		return forum_class;
	}

	public void setForum_class(String forum_class) {
		this.forum_class = forum_class;
	}

	

	@Override
	public String toString() {
		return "Forum [id=" + id + ", forum_name=" + forum_name + ", forum_number=" + forum_number + ", forum_text="
				+ forum_text + ", forum_date=" + forum_date + ", forum_college=" + forum_college + ", forum_major="
				+ forum_major + ", forum_class=" + forum_class + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getForum_name() {
		return forum_name;
	}

	public void setForum_name(String forum_name) {
		this.forum_name = forum_name;
	}

	public String getForum_number() {
		return forum_number;
	}

	public void setForum_number(String forum_number) {
		this.forum_number = forum_number;
	}

	public String getForum_text() {
		return forum_text;
	}

	public void setForum_text(String forum_text) {
		this.forum_text = forum_text;
	}

	public String getForum_date() {
		return forum_date;
	}

	public void setForum_date(String forum_date) {
		this.forum_date = forum_date;
	}

	public Forum(int id, String forum_name, String forum_number, String forum_text, String forum_date,
			String forum_college, String forum_major, String forum_class) {
		super();
		this.id = id;
		this.forum_name = forum_name;
		this.forum_number = forum_number;
		this.forum_text = forum_text;
		this.forum_date = forum_date;
		this.forum_college = forum_college;
		this.forum_major = forum_major;
		this.forum_class = forum_class;
	}


	
	
	

}
