package com.mahadev.common.entityModel;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import lombok.Data;

@MappedSuperclass
@Data
public class CommonTableFieldBo {

	@Column(name = "CRT_DATE", updatable = false)
	private Date crtDate;
	
	@Column(name = "CRT_USER", updatable = false)
	private String crtUser;
	
	@Column(name = "CRT_IP", updatable = false)
	private String crtIp;
	
	@Column(name = "LST_UPD_DATE")
	private Date lstUpdDate;
	
	@Column(name = "LST_UPD_USER")
	private String lstUpdUser;
	
	@Column(name = "LST_UPD_IP")
	private String lstUpdIp;
	
	@Column(name = "STATUS", updatable = false)
	private String status;
	
	// Transient fields
	@Transient
	private String fileId;

	public Date getCrtDate() {
		return crtDate;
	}

	public void setCrtDate(Date crtDate) {
		this.crtDate = crtDate;
	}

	public String getCrtUser() {
		return crtUser;
	}

	public void setCrtUser(String crtUser) {
		this.crtUser = crtUser;
	}

	public String getCrtIp() {
		return crtIp;
	}

	public void setCrtIp(String crtIp) {
		this.crtIp = crtIp;
	}

	public Date getLstUpdDate() {
		return lstUpdDate;
	}

	public void setLstUpdDate(Date lstUpdDate) {
		this.lstUpdDate = lstUpdDate;
	}

	public String getLstUpdUser() {
		return lstUpdUser;
	}

	public void setLstUpdUser(String lstUpdUser) {
		this.lstUpdUser = lstUpdUser;
	}

	public String getLstUpdIp() {
		return lstUpdIp;
	}

	public void setLstUpdIp(String lstUpdIp) {
		this.lstUpdIp = lstUpdIp;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	} 

}
