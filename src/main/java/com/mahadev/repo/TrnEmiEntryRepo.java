package com.mahadev.repo;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mahadev.entityModel.TrnEmiEntryBo;

@Repository
@Transactional
public interface TrnEmiEntryRepo extends JpaRepository<TrnEmiEntryBo, Long>{
  @Modifying	
  @Query(value = "update TrnEmiEntryBo set status='0',lstUpdDate=now(),lstUpdUser=?2,lstUpdIp=?3 where emi_entry_id=?1")
  int updateTrnEMIEntry(Long emi_entry_id,String userId,String userIp);
}
