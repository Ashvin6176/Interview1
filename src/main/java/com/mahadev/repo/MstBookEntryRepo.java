package com.mahadev.repo;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.mahadev.entityModel.MstBookEntryBo;

@Repository
@Transactional
public interface MstBookEntryRepo extends JpaRepository<MstBookEntryBo, Long>{

}
