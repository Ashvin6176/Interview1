package com.mahadev.common.repo;

import java.util.List;

import org.aspectj.apache.bcel.generic.RET;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mahadev.common.entityModel.MstLabelBo;

@Component
public class AllRepo {
   @Autowired LoginRepo loginRepo;
   @Autowired MstLabelRepo mstLabelRepo;
   public LoginRepo getLoginRepo() {
	 return loginRepo;
   }
   public List<MstLabelBo> getLableListData(){
	   return mstLabelRepo.getLabelList();
   }
}
