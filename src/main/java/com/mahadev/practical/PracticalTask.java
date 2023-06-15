package com.mahadev.practical;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mahadev.practice.repositoryes.ItemRepositories;

@Controller
@RequestMapping("/practical")
public class PracticalTask {

	@Autowired 
	ItemRepositories ItemRepositories;
	
	@RequestMapping("/saveItemData")
	public ResponseEntity<String> saveItemData(@ModelAttribute ItemBo bo) {
		
		String status = "";
		bo.setStatus("1");
		bo.setCrt_date(new Date());
		ItemBo saveData = ItemRepositories.save(bo);
		if(saveData !=null && saveData.getItem_id() !=null) {
			status="1000";
		}else {
			status="999";
		}
		return ResponseEntity.ok(status);
	}
	
	@RequestMapping("/updateItemData")
	public ResponseEntity<String> updateItemData(@ModelAttribute ItemBo bo) {
		
		String status = "";
		
		ItemBo returnData = null;
		ItemBo getData = ItemRepositories.getOne(bo.getItem_id());
		
		if(getData !=null) {
			getData.setStatus("1");
			getData.setLst_upd_date(new Date());
			getData.setItem_id(bo.getItem_id());
			getData.setItem_name(bo.getItem_name());
			returnData = ItemRepositories.save(getData);
		}
		
		if(returnData !=null && returnData.getItem_id() !=null) {
			status="1000";
		}else {
			status="999";
		}
		return ResponseEntity.ok(status);
	}
	
	@RequestMapping("/deleteItemData")
	public ResponseEntity<String> deleteItemData(@RequestBody ItemBo bo) {
		
		String status = "";
		
		int returnData = 0;
		ItemBo getData = ItemRepositories.getOne(bo.getItem_id());
		
		if(getData !=null) {
			returnData = ItemRepositories.deleteByItem(bo.getItem_id());
		}
		
		if(returnData > 0) {
			status="1000";
		}else {
			status="999";
		}
		return ResponseEntity.ok(status);
	}
	
	@RequestMapping("/getItemData")
	public ResponseEntity<List<ItemBo>> getItemData(@RequestBody ItemBo bo) {
		
		List<ItemBo> getData = ItemRepositories.findAll();
		return ResponseEntity.ok(getData);
	}
}
