package com.pretty.dog.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.pretty.dog.dto.DogDTO;

public interface HomeDAO {

	List<HashMap<String, Object>> idRankChk(HashMap<String, Object> loginId);
	
	
	String login(String idInput);

	ArrayList<DogDTO> idSearch(String name, String email);

	int pwSearch(String userId, String userName, String userPhone, String userEmail);

	int pwChange(String id, String pw);


	int snsUser(String idInput);


	int snsInsert(String idInput);
	



	

	



	

	

	

}
