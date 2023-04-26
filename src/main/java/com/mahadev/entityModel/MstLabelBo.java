package com.mahadev.entityModel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;

import com.mahadev.common.entityModel.CommonTableFieldBo;


@Entity
@Table(name="MST_LABEL")
public class MstLabelBo extends CommonTableFieldBo {
	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE , generator="SEQ_MST_LABEL")
	@SequenceGenerator(
	name="SEQ_MST_LABEL",
	sequenceName="SEQ_MST_LABEL",
	allocationSize=1
	)
	@Column(name="label_id")
	private String label_id;
	
	@Column(name="label_key")
	@NotEmpty(message = "data not empty")
	private String label_key;
	
	@Column(name="label_eng_name")
	private String label_eng_name;

	@Column(name="label_knd_name")
	private String label_knd_name;
	
	@Column(name="status")
	private String status;
	
	@Transient
	private String actionFlag;

	public String getLabel_id() {
		return label_id;
	}

	public void setLabel_id(String label_id) {
		this.label_id = label_id;
	}

	public String getLabel_eng_name() {
		return label_eng_name;
	}

	public void setLabel_eng_name(String label_eng_name) {
		this.label_eng_name = label_eng_name;
	}

	public String getLabel_knd_name() {
		return label_knd_name;
	}

	public void setLabel_knd_name(String label_knd_name) {
		this.label_knd_name = label_knd_name;
	}
	public String getLabel_key() {
		return label_key;
	}

	public void setLabel_key(String label_key) {
		this.label_key = label_key;
	}

	public String getActionFlag() {
		return actionFlag;
	}

	public void setActionFlag(String actionFlag) {
		this.actionFlag = actionFlag;
	}
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
