package com.mahadev.practical;

import java.util.Date;

import javax.persistence.Column;

public class CommonFieldBo {

	@Column(name="STATUS")
	private String status;
	
	@Column(name="CRT_DATE")
	private Date crt_date;
	
	@Column(name="LST_UPD_DATE")
	private Date lst_upd_date;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCrt_date() {
		return crt_date;
	}

	public void setCrt_date(Date crt_date) {
		this.crt_date = crt_date;
	}

	public Date getLst_upd_date() {
		return lst_upd_date;
	}

	public void setLst_upd_date(Date lst_upd_date) {
		this.lst_upd_date = lst_upd_date;
	}
}
