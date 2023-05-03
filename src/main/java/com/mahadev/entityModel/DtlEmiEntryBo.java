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
@Table(name = "dtl_emi_entry",schema = "mahadev")
public class DtlEmiEntryBo extends CommonTableFieldBo{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="DTL_ID") private Long dtl_id;
	@Column(name="EMI_ENTRY_ID") private Long emi_entry_id;
	@Column(name="INSTALLMENT_AMOUNT") private BigDecimal installment_amount;
	@Column(name="INSTALLMENT_DATE") private Date installment_date;
	
	public Long getDtl_id() {
		return dtl_id;
	}
	public void setDtl_id(Long dtl_id) {
		this.dtl_id = dtl_id;
	}
	public Long getEmi_entry_id() {
		return emi_entry_id;
	}
	public void setEmi_entry_id(Long emi_entry_id) {
		this.emi_entry_id = emi_entry_id;
	}
	public BigDecimal getInstallment_amount() {
		return installment_amount;
	}
	public void setInstallment_amount(BigDecimal installment_amount) {
		this.installment_amount = installment_amount;
	}
	public Date getInstallment_date() {
		return installment_date;
	}
	public void setInstallment_date(Date installment_date) {
		this.installment_date = installment_date;
	}
}
