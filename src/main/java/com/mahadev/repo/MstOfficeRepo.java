package com.mahadev.repo;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mahadev.entityModel.MstOfficeBo;

@Repository
@Transactional
public interface MstOfficeRepo extends JpaRepository<MstOfficeBo, Long>{

}
