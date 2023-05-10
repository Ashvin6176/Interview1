package com.mahadev.repo;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mahadev.entityModel.DtlEmiEntryBo;
@Repository
@Transactional
public interface DtlEmiEntryRepo extends JpaRepository<DtlEmiEntryBo, Long>{
  @Query("from DtlEmiEntryBo where status='1' and user_id=?1 and book_id=?2")
  List<DtlEmiEntryBo> getBookEmi(int userId,Long bookId);
  
  @Query("from DtlEmiEntryBo where status='1' and user_id=?1 and book_id=?2 and installment_date=?3")
  DtlEmiEntryBo getBookEmiBydate(int userId,Long bookId,Date instDate);
  
  @Modifying
  @Query(value = "update DtlEmiEntryBo set status='0',lstUpdDate=now(),lstUpdUser=?2,lstUpdIp=?3 where emi_entry_id=?1")
  int updateDtlEMIEntry(Long emi_entry_id,String userId,String userIp);
  
  @Query(value = "select count(1) from dtl_emi_entry where status='1' and user_id=?1 and book_id=?2",nativeQuery = true)
  int getCountOfInstallment(int user_id,Long book_id);
}
