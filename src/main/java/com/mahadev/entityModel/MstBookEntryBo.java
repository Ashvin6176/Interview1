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
@Table(name = "mst_book_entry", schema = "mahadev")
public class MstBookEntryBo extends CommonTableFieldBo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BOOK_ID")
	private Long book_id;
	@Column(name = "BOOK_NAME")
	private String book_name;
	@Column(name = "USER_ID")
	private int user_id;
	@Column(name = "EMI_START_DATE")
	private Date emi_start_date;
	@Column(name = "CAPITAL_AMOUNT")
	private BigDecimal capital_amount;
	@Column(name = "INTEREST_PER")
	private BigDecimal interest_per;
	@Column(name = "INTEREST_AMOUNT")
	private BigDecimal interest_amount;
	@Column(name = "INSTALLMENT_AMOUNT")
	private BigDecimal installment_amount;
	@Column(name = "NO_OF_INSTALLMENT")
	private BigDecimal no_of_installment;

	public Long getBook_id() {
		return book_id;
	}

	public void setBook_id(Long book_id) {
		this.book_id = book_id;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Date getEmi_start_date() {
		return emi_start_date;
	}

	public void setEmi_start_date(Date emi_start_date) {
		this.emi_start_date = emi_start_date;
	}

	public BigDecimal getCapital_amount() {
		return capital_amount;
	}

	public void setCapital_amount(BigDecimal capital_amount) {
		this.capital_amount = capital_amount;
	}

	public BigDecimal getInterest_per() {
		return interest_per;
	}

	public void setInterest_per(BigDecimal interest_per) {
		this.interest_per = interest_per;
	}

	public BigDecimal getInterest_amount() {
		return interest_amount;
	}

	public void setInterest_amount(BigDecimal interest_amount) {
		this.interest_amount = interest_amount;
	}

	public BigDecimal getInstallment_amount() {
		return installment_amount;
	}

	public void setInstallment_amount(BigDecimal installment_amount) {
		this.installment_amount = installment_amount;
	}

	public BigDecimal getNo_of_installment() {
		return no_of_installment;
	}

	public void setNo_of_installment(BigDecimal no_of_installment) {
		this.no_of_installment = no_of_installment;
	}

}
