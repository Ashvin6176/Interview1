package com.mahadev.repo;

import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.mahadev.entityModel.MstBookEntryBo;

@Repository
@Transactional
public interface MstBookEntryRepo extends JpaRepository<MstBookEntryBo, Long>{
	@Modifying
	@Query("update MstBookEntryBo set lstUpdDate=?1,lstUpdIp=?2,lstUpdUser=?3,status=?4 where book_id=?5")
	int ActivatedeActivateMstAddBook(Date lstUpdDate, String lstUpdIp, String lstUpdUser, String status, Long book_id);

}
