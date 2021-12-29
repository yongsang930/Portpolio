package com.example.demo.order;

import com.example.demo.seller.Product;

public class Order {
	private int num;
	private String consumer_id;
	private String seller_id;
	private String recipient;
	private int pro_num;
	private String post_a;
	private String road_a;
	private String detail_a;
	private int quantity;
	private String tel;
	private String memo;
	private int result;
	private Product p = new Product();

	public Order() {
		super();
	}

	public Order(int num, String consumer_id, String seller_id, String recipient, int pro_num, String post_a,
			String road_a, String detail_a, int quantity, String tel, String memo, int result, Product p) {
		super();
		this.num = num;
		this.consumer_id = consumer_id;
		this.seller_id = seller_id;
		this.recipient = recipient;
		this.pro_num = pro_num;
		this.post_a = post_a;
		this.road_a = road_a;
		this.detail_a = detail_a;
		this.quantity = quantity;
		this.tel = tel;
		this.memo = memo;
		this.result = result;
		this.p = p;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getConsumer_id() {
		return consumer_id;
	}

	public void setConsumer_id(String consumer_id) {
		this.consumer_id = consumer_id;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public int getPro_num() {
		return pro_num;
	}

	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public Product getP() {
		return p;
	}

	public void setP(Product p) {
		this.p = p;
	}

	@Override
	public String toString() {
		return "Order [num=" + num + ", consumer_id=" + consumer_id + ", seller_id=" + seller_id + ", recipient="
				+ recipient + ", pro_num=" + pro_num + ", post_a=" + post_a + ", road_a=" + road_a + ", detail_a="
				+ detail_a + ", quantity=" + quantity + ", tel=" + tel + ", memo=" + memo + ", result=" + result
				+ ", p=" + p + "]";
	}

}
