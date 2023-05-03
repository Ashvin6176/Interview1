package com.mahadev.repo;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mahadev.entityModel.DtlEmiEntryBo;
@Repository
@Transactional
public interface DtlEmiEntryRepo extends JpaRepository<DtlEmiEntryBo, Long>{

}
