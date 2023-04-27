package com.mahadev.common.entityModel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "MST_LABEL")
public class MstLabelBo{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="LABEL_ID") private int label_id;
	@Column(name="LABEL_KEY") private String label_key;
	@Column(name="LABEL_NAME_ENG") private String label_name_eng;
	@Column(name="LABEL_NAME_GUJ") private String label_name_guj;
	@Column(name = "STATUS") private String status;
	
	public int getLabel_id() {
		return label_id;
	}
	public void setLabel_id(int label_id) {
		this.label_id = label_id;
	}
	public String getLabel_key() {
		return label_key;
	}
	public void setLabel_key(String label_key) {
		this.label_key = label_key;
	}
	public String getLabel_name_eng() {
		return label_name_eng;
	}
	public void setLabel_name_eng(String label_name_eng) {
		this.label_name_eng = label_name_eng;
	}
	public String getLabel_name_guj() {
		return label_name_guj;
	}
	public void setLabel_name_guj(String label_name_guj) {
		this.label_name_guj = label_name_guj;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
