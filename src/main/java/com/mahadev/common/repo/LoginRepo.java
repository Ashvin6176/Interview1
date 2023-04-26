package com.mahadev.common.repo;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mahadev.common.entityModel.LoginBo;

@Repository
@Transactional
public interface LoginRepo extends JpaRepository<LoginBo, Integer>{

	@Query("from LoginBo where user_name=?1 and password=?2 and status='1'")
	LoginBo getUserByIdPassword(String userName,String password);
}
