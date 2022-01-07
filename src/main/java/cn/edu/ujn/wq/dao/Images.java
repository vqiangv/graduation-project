package cn.edu.ujn.wq.dao;

import java.io.Serializable;

public class Images implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int id;
	
	private String number;
	
	private String image;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Images [id=" + id + ", number=" + number + ", image=" + image + "]";
	}

	public Images(int id, String number, String image) {
		super();
		this.id = id;
		this.number = number;
		this.image = image;
	}
	
	
}
