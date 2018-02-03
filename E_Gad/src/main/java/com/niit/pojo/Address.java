package com.niit.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
@Entity
public class Address
{   @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
@NotBlank(message="Door no shouldnot be empty")
	private String doorno;
@NotBlank(message="Street name shouldnot be empty")
	private String streetname;
@NotBlank(message="City shouldnot be empty")
	private String city;
@NotBlank(message="State shouldnot be empty")
	private String state;
@Size(min=6,message="Pincode should be of length 6 to 10")
	private String pincode;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
	public String getDoorno() {
		return doorno;
	}
	public void setDoorno(String doorno) {
		this.doorno = doorno;
	}
	public String getStreetname() {
		return streetname;
	}
	public void setStreetname(String streetname) {
		this.streetname = streetname;
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
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	
}


