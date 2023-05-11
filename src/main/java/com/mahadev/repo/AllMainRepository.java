package com.mahadev.repo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mahadev.entityModel.MstBookEntryBo;
import com.mahadev.entityModel.MstUserBo;
import com.mahadev.exception.ResourceNotFoundException;


@Repository
public class AllMainRepository {
	@Autowired
    private MstUserRepo mstUserRepo;
	@Autowired
    private MstBookEntryRepo mstBookEntryRepo;
	@Autowired
	private TrnEmiEntryRepo trnEmiEntryRepo;
	@Autowired DtlEmiEntryRepo dtlEmiEntryRepo;
	@Autowired MstOfficeRepo mstOfficeRepo;
	
	public MstUserBo saveMstCreateUser(MstUserBo bo) {
		return mstUserRepo.save(bo);
		
	}

   public MstUserBo getOldData(int user_id) {
		
		return mstUserRepo.getOne(user_id);
		
	}

	public int ActivateDeActivateMstUser(MstUserBo bo) {
		
		return mstUserRepo.ActivateDeActivateMstUser(bo.getLstUpdDate(),bo.getLstUpdIp(),bo.getLstUpdUser(),bo.getStatus(),bo.getUser_id());
	}

	public int updateMstUser(MstUserBo bo) {
		 return mstUserRepo.updateMstUser(bo.getFull_name(),bo.getMobile_no(),bo.getAddress(),bo.getCity(),bo.getPincode(),bo.getAdharcard(),bo.getCheck_img(),bo.getLstUpdDate(),bo.getLstUpdIp(),bo.getLstUpdUser(),bo.getUser_id());
	}
	
	public MstBookEntryRepo getMstBookEntryRepo() {
		 return mstBookEntryRepo;
	}
	public TrnEmiEntryRepo getTrnEmiEntryRepo() {
		 return trnEmiEntryRepo;
	}
	public DtlEmiEntryRepo getDtlEmiEntryRepo() {
		 return dtlEmiEntryRepo;
	}
	public MstOfficeRepo getMstOfficeRepo() {
		 return mstOfficeRepo;
	}
	public int ActivatedeActivateMstAddBook(MstBookEntryBo bo) {
		return mstBookEntryRepo.ActivatedeActivateMstAddBook(bo.getLstUpdDate(),bo.getLstUpdIp(),bo.getLstUpdUser(),bo.getStatus(),bo.getBook_id());
	}
}
