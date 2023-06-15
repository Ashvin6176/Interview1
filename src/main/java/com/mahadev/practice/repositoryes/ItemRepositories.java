package com.mahadev.practice.repositoryes;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mahadev.practical.ItemBo;

@Repository
public interface ItemRepositories extends JpaRepository<ItemBo, String>{

	@Transactional
	@Modifying
	@Query("update ItemBo set status='0' where item_id=?1")
	int deleteByItem(String item_id);

}
