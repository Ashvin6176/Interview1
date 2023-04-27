package com.mahadev.common.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mahadev.common.entityModel.MstLabelBo;

@Repository
public interface MstLabelRepo extends JpaRepository<MstLabelBo, Integer>{
	 @Query("from MstLabelBo where status='1'")
	 List<MstLabelBo> getLabelList();
}
