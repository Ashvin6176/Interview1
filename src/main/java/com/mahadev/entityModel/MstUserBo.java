package com.mahadev.entityModel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.mahadev.common.entityModel.CommonTableFieldBo;

@Entity
@Table(name="mst_user", schema="sys")
public class MstUserBo extends CommonTableFieldBo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="user_id")
	private int user_id;
	
	@Column(name="full_name")
	private String full_name;
	
	@Column(name="mobile_no")
	private String mobile_no;
	
	@Column(name="address")
	private String address;
	
	@Column(name="city")
	private String city;
	
	@Column(name="pincode")
	private String pincode;
	
	@Column(name="capital")
	private String capital;
	
	@Column(name="percentage")
	private String percentage;
	
	@Column(name="check_img")
	private byte[] check_img;
	
	@Column(name="adharcard")
	private byte[] adharcard;
	
	@Column(name="check_exe")
	private String check_exe;
	
	@Column(name="adhar_exe")
	private String adhar_exe;
	
	@Transient
	private MultipartFile check_temp;
	
	@Transient MultipartFile adhar;
	
	public MultipartFile getCheck_temp() {
		return check_temp;
	}
	public void setCheck_temp(MultipartFile check_temp) {
		this.check_temp = check_temp;
	}
	public MultipartFile getAdhar() {
		return adhar;
	}
	public void setAdhar(MultipartFile adhar) {
		this.adhar = adhar;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getFull_name() {
		return full_name;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}
	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getCapital() {
		return capital;
	}
	public void setCapital(String capital) {
		this.capital = capital;
	}
	public String getPercentage() {
		return percentage;
	}
	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}
	
	public byte[] getCheck_img() {
		return check_img;
	}
	public void setCheck_img(byte[] check_img) {
		this.check_img = check_img;
	}
	public byte[] getAdharcard() {
		return adharcard;
	}
	public void setAdharcard(byte[] adharcard) {
		this.adharcard = adharcard;
	}
	public String getCheck_exe() {
		return check_exe;
	}
	public void setCheck_exe(String check_exe) {
		this.check_exe = check_exe;
	}
	public String getAdhar_exe() {
		return adhar_exe;
	}
	public void setAdhar_exe(String adhar_exe) {
		this.adhar_exe = adhar_exe;
	}
}
