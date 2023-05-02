package com.mahadev.repo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mahadev.entityModel.MstUserBo;
import com.mahadev.exception.ResourceNotFoundException;


@Repository
public class AllMainRepository {
	@Autowired
    private MstUserRepo mstUserRepo;
	@Autowired
    private MstBookEntryRepo mstBookEntryRepo;
	
	public MstUserBo saveMstCreateUser(MstUserBo bo) {
		return mstUserRepo.save(bo);
		
	}

	public int ActivateDeActivateMstUser(MstUserBo bo) {
		
		return mstUserRepo.deActivateMstGpGalleryImage(bo.getLstUpdDate(),bo.getLstUpdIp(),bo.getLstUpdUser(),bo.getStatus(),bo.getUser_id());
	}

	public int updateMstUser(MstUserBo bo) {
		 return mstUserRepo.updateMstGpImageGallery(bo.getFull_name(),bo.getMobile_no(),bo.getAddress(),bo.getCity(),bo.getPincode(),bo.getCapital(),bo.getPercentage(),bo.getAdharcard(),bo.getCheck_img(),bo.getLstUpdDate(),bo.getLstUpdIp(),bo.getLstUpdUser(),bo.getUser_id());
	}
	
	public MstBookEntryRepo getMstBookEntryRepo() {
		 return mstBookEntryRepo;
	}
}
