package com.example.demo.board;

import java.sql.Date;

public class Board {
	private int num;
	private int pro_num;
	private String pname;
	private String img;
	private String title;
	private String id;
	private Date date;
	private String content;
	private String type;

	public Board() {
		super();
	}

	public Board(int num, int pro_num, String pname, String img, String title, String id, Date date, String content,
			String type) {
		super();
		this.num = num;
		this.pro_num = pro_num;
		this.pname = pname;
		this.img = img;
		this.title = title;
		this.id = id;
		this.date = date;
		this.content = content;
		this.type = type;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getPro_num() {
		return pro_num;
	}

	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Board [num=" + num + ", pro_num=" + pro_num + ", pname=" + pname + ", img=" + img + ", title=" + title
				+ ", id=" + id + ", date=" + date + ", content=" + content + ", type=" + type + "]";
	}

}
