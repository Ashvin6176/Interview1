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
@Table(name = "trn_emi_entry",schema = "mahadev")
public class TrnEmiEntryBo extends CommonTableFieldBo{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="EMI_ENTRY_ID") private Long emi_entry_id;
	@Column(name="USER_ID") private int user_id;
	@Column(name="BOOK_ID") private Long book_id;
	@Column(name="PAYMENT_AMOUNT") private BigDecimal payment_amount;
	@Column(name="PAYMENT_DATE") private Date payment_date;
	public Long getEmi_entry_id() {
		return emi_entry_id;
	}
	public void setEmi_entry_id(Long emi_entry_id) {
		this.emi_entry_id = emi_entry_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Long getBook_id() {
		return book_id;
	}
	public void setBook_id(Long book_id) {
		this.book_id = book_id;
	}
	public BigDecimal getPayment_amount() {
		return payment_amount;
	}
	public void setPayment_amount(BigDecimal payment_amount) {
		this.payment_amount = payment_amount;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
}
