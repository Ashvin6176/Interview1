package com.mahadev.dao;

import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public interface MainDao {
	Map<String, Object> updateMstUser(Map<String, Object> map);

	Map<String, Object> saveMstCreateUser(Map<String, Object> map);

	Map<String, Object> ActivateDeActivateMstUser(Map<String, Object> map);
}
