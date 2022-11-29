package com.pretty.dog.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pretty.dog.dao.CalendarDao;
import com.pretty.dog.dto.DogDTO;

@Service
public class CalendarService {

		Logger logger = LoggerFactory.getLogger(this.getClass());
		@Autowired CalendarDao dao;
		
		public HashMap<Object, Object> dateInfo(HashMap<String, Object> data) {
			
			HashMap<Object, Object> dateInfo = dao.dateInfo(data);
			
			return dateInfo;
		}

		public int oneDaySetting(HashMap<String, Object> data) {
			
			return dao.oneDaySetting(data);
		}

		public int holiDay(String holiDayDate) {
			
			return dao.holiDay(holiDayDate);
		}

		public List<HashMap<String, Object>> totalReserEx(HashMap<String, Object> data) {
			
			System.out.println(data);
			
			return dao.totalReserEx(data);
		}

		public int noReserAllDate(List<HashMap<String, Object>> list) {
			
			return dao.noReserAllDate(list);
		}

		public void delDate(List<HashMap<String, Object>> delList) {
			
			dao.delDate(delList);
		}

		public ArrayList<HashMap<String, Object>> findMyDog(HashMap<String, Object> data) {
			
			return dao.findMyDog(data);
		}

		public ArrayList<HashMap<String, Object>> shopServiceInfo(HashMap<String, Object> data) {
			
			return dao.shopServiceInfo(data);
		}

		public void reserState(HashMap<String, Object> reserState) {
			
			dao.reserState(reserState);
		}

		public int reserHistory(HashMap<String, Object> reserHistory) {
			
			dao.reserInfo(reserHistory);
			return dao.reserHistory(reserHistory);
		}

		public void point(HashMap<String, Object> point) {
			//일반 회원 포인트에서 예약금 만큼 차감
			dao.minusPoint(point);
			//업주 회원 노포인트에 예약금 만큼 증가 
			dao.plusPoint(point);
			//일반 회원 포인트 내역에 저장
			dao.normalPointList(point);
			//업주 회원 포인트 내역에 저장
			dao.businPointList(point);
		}

		public HashMap<String, Object> busin_num_chk(HashMap<String, Object> businId) {
			
			return dao.busin_num_chk(businId);
		}

		public void reserSuccess(HashMap<String, Object> reserHistory) {
			HashMap<String, Object> list = dao.reserSuccess(reserHistory);
			dao.reserSuccessAlarm(list);
			dao.reserOwnerSuccess(list);
		}



	
		
}
