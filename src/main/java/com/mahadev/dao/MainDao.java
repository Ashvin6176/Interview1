package com.mahadev.dao;

import java.io.IOException;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public interface MainDao {
	Map<String, Object> updateMstUser(Map<String, Object> map);

	Map<String, Object> saveMstCreateUser(Map<String, Object> map)throws IOException;

	Map<String, Object> ActivateDeActivateMstUser(Map<String, Object> map);
	Map<String, Object> saveAddBookEntry(Map<String, Object> map)throws IOException;
	Map<String, Object> saveAddInstallment(Map<String, Object> map)throws IOException;
	
	Map<String, Object> deleteInstallment(Map<String, Object> map)throws IOException;
	Map<String, Object> saveOfficeTransaction(Map<String, Object> map)throws IOException;
}
