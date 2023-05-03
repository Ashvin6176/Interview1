package com.mahadev.repo;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mahadev.entityModel.TrnEmiEntryBo;

@Repository
@Transactional
public interface TrnEmiEntryRepo extends JpaRepository<TrnEmiEntryBo, Long>{

}
