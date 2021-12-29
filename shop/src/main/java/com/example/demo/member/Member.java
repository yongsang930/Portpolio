package com.example.demo.member;

public class Member {
	private String id;
	private String pwd;
	private String name;
	private String tel;
	private String email;
	private String post_a;
	private String road_a;
	private String detail_a;
	private int type;// 판매자, 관리자 종류

	public Member() {
		super();
	}

	public Member(String id, String pwd, String name, String tel, String email, String post_a, String road_a,
			String detail_a, int type) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.post_a = post_a;
		this.road_a = road_a;
		this.detail_a = detail_a;
		this.type = type;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPost_a() {
		return post_a;
	}

	public void setPost_a(String post_a) {
		this.post_a = post_a;
	}

	public String getRoad_a() {
		return road_a;
	}

	public void setRoad_a(String road_a) {
		this.road_a = road_a;
	}

	public String getDetail_a() {
		return detail_a;
	}

	public void setDetail_a(String detail_a) {
		this.detail_a = detail_a;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", tel=" + tel + ", email=" + email
				+ ", post_a=" + post_a + ", road_a=" + road_a + ", detail_a=" + detail_a + ", type=" + type + "]";
	}

}
