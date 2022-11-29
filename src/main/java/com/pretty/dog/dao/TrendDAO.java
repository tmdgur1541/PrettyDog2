package com.pretty.dog.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface TrendDAO {

	ArrayList<HashMap<String, Object>> beautyTrendList();

	ArrayList<HashMap<String, Object>> changeKoMap(String changeKoMap);

	HashMap<String, Object> beautyTrendDetail(String idx);

	HashMap<String, Object> beautyTrendUpdate(String idx);

	ArrayList<HashMap<String, Object>> idChk(String memberId);

	ArrayList<HashMap<String, Object>> memberRank1(String memberId);

	int beautyTrendWrite(HashMap<String, Object> beautyTrendWrite);

	void fileWrite(int community_boardnum, String oriFileName, String newFileName);

	int trendUpdate(HashMap<String, String> params);

	void deleteCbpNewname(String newFileName);

	void beautyTrendDelete(String idx);


}
