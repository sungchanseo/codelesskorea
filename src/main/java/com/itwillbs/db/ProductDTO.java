package com.itwillbs.db;

import java.sql.Date;

public class ProductDTO {
	private int product_id;
	private String title;
	private String model;
	private String content;
	private int price;
	private String product_image;
	private int grade;
	private Date reg_date;
	private int read_count;
	private int like_count;
	private int chat_count;
	private String city;
	private int method;
	private int fee;
	private int charge;
	private String parts;
	private String user_id;
	

	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getChat_count() {
		return chat_count;
	}
	public void setChat_count(int chat_count) {
		this.chat_count = chat_count;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getMethod() {
		return method;
	}
	public void setMethod(int method) {
		this.method = method;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}
	public String getParts() {
		return parts;
	}
	public void setParts(String parts) {
		this.parts = parts;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", title=" + title + ", model=" + model + ", content=" + content
				+ ", price=" + price + ", product_image=" + product_image + ", grade=" + grade + ", reg_date="
				+ reg_date + ", read_count=" + read_count + ", like_count=" + like_count + ", chat_count=" + chat_count
				+ ", city=" + city + ", method=" + method + ", fee=" + fee + ", charge=" + charge + ", parts=" + parts
				+ ", user_id=" + user_id + "]";
	}
	
}