package com.niit.pojo;
 
import java.io.Serializable;
 
public class UserBean implements Serializable{
 
	private static final long serialVersionUID = 4657462015039726030L;
	private String userId;
	private String door;
	private String city;
	private String state;
	private String street;
	private String mail;
 
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getUserId() {
		return userId;
	}
	public String getDoor() {
		return door;
	}
	public void setDoor(String door) {
		this.door = door;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}