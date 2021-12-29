package com.example.demo.seller;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	private int num;
	private String name;
	private int quantity;
	private String info;
	private int price;
	private String seller_id;
	private int category1_id;
	private int category2_id;
	private int category3_id;
	private MultipartFile file1;
	private MultipartFile file2;
	private MultipartFile file3;

	public Product() {
		super();
	}

	public Product(int num, String name, int quantity, String info, int price, String seller_id, int category1_id,
			int category2_id, int category3_id, MultipartFile file1, MultipartFile file2, MultipartFile file3) {
		super();
		this.num = num;
		this.name = name;
		this.quantity = quantity;
		this.info = info;
		this.price = price;
		this.seller_id = seller_id;
		this.category1_id = category1_id;
		this.category2_id = category2_id;
		this.category3_id = category3_id;
		this.file1 = file1;
		this.file2 = file2;
		this.file3 = file3;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public int getCategory1_id() {
		return category1_id;
	}

	public void setCategory1_id(int category1_id) {
		this.category1_id = category1_id;
	}

	public int getCategory2_id() {
		return category2_id;
	}

	public void setCategory2_id(int category2_id) {
		this.category2_id = category2_id;
	}

	public int getCategory3_id() {
		return category3_id;
	}

	public void setCategory3_id(int category3_id) {
		this.category3_id = category3_id;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	public MultipartFile getFile2() {
		return file2;
	}

	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	public MultipartFile getFile3() {
		return file3;
	}

	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}

	@Override
	public String toString() {
		return "Product [num=" + num + ", name=" + name + ", quantity=" + quantity + ", info=" + info + ", price="
				+ price + ", seller_id=" + seller_id + ", category1_id=" + category1_id + ", category2_id="
				+ category2_id + ", category3_id=" + category3_id + ", file1=" + file1 + ", file2=" + file2 + ", file3="
				+ file3 + "]";
	}

}