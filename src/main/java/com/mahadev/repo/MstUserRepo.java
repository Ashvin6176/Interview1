package com.mahadev.repo;

import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mahadev.entityModel.MstUserBo;

@Repository
@Transactional
public interface MstUserRepo extends JpaRepository<MstUserBo, Integer> {

	@Modifying
	@Query("update MstUserBo set lstUpdDate=?1,lstUpdIp=?2,lstUpdUser=?3,status=?4 where user_id=?5")
	int ActivateDeActivateMstUser(Date lstUpdDate, String lstUpdIp, String lstUpdUser, String status, int user_id);
    @Modifying
	@Query("update MstUserBo set full_name=?1,mobile_no=?2,address=?3,city=?4,pincode=?5,adharcard=?6,check_img=?7,"
			+ "lstUpdDate=?8,lstUpdIp=?9,lstUpdUser=?10 where user_id=?11")
	int updateMstUser(String full_name, String mobile_no, String address, String city, String pincode,
			 byte[] adharcard, byte[] check, Date lstUpdDate, String lstUpdIp,
			String lstUpdUser, int user_id);

}
