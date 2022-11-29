package com.pretty.dog.dao;

import java.util.ArrayList;

import com.pretty.dog.dto.DogDTO;

public interface PointManagementDAO {

	int pointInsert(int insertPoint, String loginId);

	void memPointAdd(int insertPoint, String loginId);

	ArrayList<DogDTO> memPointSelect(String loginId);

	int allCountMemPointList(String loginId);

	ArrayList<DogDTO> memPointList(int pagePerCnt, int offset, String loginId);

	int onerPointChange(String loginId);

	int allPointChCount(String loginId);

	ArrayList<DogDTO> onerPointListCall(String loginId, int pagePerCnt, int offset);

	int onerAllCount(String loginId);

	void onerPointDel(String loginId, int r);

	int pointChInsert(String loginId, String changePoint, String bankName, String bankNum);

	void insertOnerPoint(String loginId, int w);

	int OnerPointCheck(String loginId);


	
	

}
