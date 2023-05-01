package com.mahadev.common.entityModel;

import java.math.BigDecimal;

import javax.annotation.Generated;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.persistence.GenerationType;

@Entity
@Table(name = "mst_login",schema = "sys")
public class LoginBo extends CommonTableFieldBo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "USER_ID")
	private int user_id;
	
	@Column(name = "MOBILE_NO")
	private Long mobile_no;
	
	@Column(name = "PASSWORD")
	@NotEmpty(message = "Please enter password")
	private String password;
	
	@Column(name = "USER_NAME")
	@NotEmpty(message = "Please enter username")
	private String user_name;

	public Long getMobile_no() {
		return mobile_no;
	}

	public void setMobile_no(Long mobile_no) {
		this.mobile_no = mobile_no;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

}
