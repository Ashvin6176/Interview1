package com.mahadev.entityModel;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.mahadev.common.entityModel.CommonTableFieldBo;
@Entity
@Table(name = "mst_office",schema = "mahadev")
public class MstOfficeBo extends CommonTableFieldBo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "OFFICE_ID")
	private Long office_id;
	@Column(name = "USER_ID")
	private int user_id;
	@Column(name = "OPERATION")
	private String operation;
	@Column(name = "AMOUNT")
	private BigDecimal amount;
	@Column(name = "PAYMENT_DATE")
	private Date payment_date;
	@Column(name = "DESCRIPTION")
	private String description;

	public Long getOffice_id() {
		return office_id;
	}

	public void setOffice_id(Long office_id) {
		this.office_id = office_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
