package com.pretty.dog.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.pretty.dog.dto.DogDTO;

public interface CalendarDao {

	HashMap<Object, Object> dateInfo(HashMap<String, Object> data);

	int oneDaySetting(HashMap<String, Object> data);

	int holiDay(String holiDayDate);

	List<HashMap<String, Object>> totalReserEx(HashMap<String, Object> data);

	int noReserAllDate(List<HashMap<String, Object>> list);

	void delDate(List<HashMap<String,Object>> list);

	ArrayList<HashMap<String, Object>> findMyDog(HashMap<String, Object> data);

	ArrayList<HashMap<String, Object>> shopServiceInfo(HashMap<String, Object> data);

	void reserState(HashMap<String, Object> reserState);

	void reserInfo(HashMap<String, Object> reserHistory);

	int reserHistory(HashMap<String, Object> reserHistory);

	void minusPoint(HashMap<String, Object> point);

	void plusPoint(HashMap<String, Object> point);

	void normalPointList(HashMap<String, Object> point);

	void businPointList(HashMap<String, Object> point);

	HashMap<String, Object> busin_num_chk(HashMap<String, Object> businId);

	HashMap<String, Object> reserSuccess(HashMap<String, Object> reserHistory);

	void reserSuccessAlarm(HashMap<String, Object> list);

	void reserOwnerSuccess(HashMap<String, Object> list);


}
