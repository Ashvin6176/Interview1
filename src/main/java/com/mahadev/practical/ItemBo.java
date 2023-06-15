package com.mahadev.practical;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="mst_item",schema = "mahadev")
public class ItemBo extends CommonFieldBo{

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="ITEM_ID")
	private String item_id;
	
	@Column(name="ITEM_NAME")
	private String item_name;
	
	@Column(name="item_image")
	private MultipartFile item_image;

	public MultipartFile getItem_image() {
		return item_image;
	}

	public void setItem_image(MultipartFile item_image) {
		this.item_image = item_image;
	}

	public String getItem_id() {
		return item_id;
	}

	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
}
