package com.pretty.dog.controller;

import java.io.Console;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pretty.dog.service.CalendarService;

@Controller
public class CalendarController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CalendarService service;
	
	//업주 회원에게 뿌려줄 캘린더 호출
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String calendar(Model model) {
		
		return "calendar";
	}
	
	//업주 회원에게 뿌려줄 캘린더 호출
	@RequestMapping(value = "/reserCalendar", method = RequestMethod.GET)
	public String reserCalendar(Model model) {
		
		return "reserCalendar";
	}
	
	//달력에 날짜를 클릭하면 해당 날짜의 예약 가능 시간 정보를 보여주는 컨트롤러
	@RequestMapping(value = "/dateInfo", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<Object, Object> dateInfo(Model model, @RequestParam HashMap<String, Object> data) {
		
		HashMap<Object, Object> map = service.dateInfo(data);
		System.out.println(data);

		return map;
		
	}
	
	//업주 회원이 예약 설정을 할 수 있는 페이지 로드
	@RequestMapping(value = "/reservationSettings", method = RequestMethod.GET)
	public String reservationSettings(Model model) {
		
		return "reservationSettings";
	}
	
	
	//업주 회원이 설정한 예약 스케쥴 정보를 등록하는 컨트롤러 (하루)
	@RequestMapping(value = "/reservationSave", method = RequestMethod.POST)
	@ResponseBody
	public int reservationSave(Model model, @RequestParam HashMap<String, Object> data) {
		
		//System.out.println(data.get("busin_num"));
		//System.out.println(data.get("set_date"));
		//System.out.println(data.get("set_time"));
		
		return service.oneDaySetting(data);
	}
	
	
	
	@RequestMapping(value = "/holiDay", method = RequestMethod.POST)
	@ResponseBody
	public int holiDay(Model model, @RequestParam HashMap<String, Object> data) {
		
		//System.out.println(data.get("ChoiceDate"));
		
		String holiDayDate = (String) data.get("ChoiceDate");
	
		return service.holiDay(holiDayDate);
	}
	
	
	
	@RequestMapping(value = "/totalReserEx", method = RequestMethod.POST)
	@ResponseBody
	public List<HashMap<String, Object>> totalReserEx(Model model, @RequestParam HashMap<String, Object> data) {
		
		//System.out.println(data.get("busin_num"));
		
		List<HashMap<String, Object>> totalReserEx = service.totalReserEx(data);
		
		//System.out.println(totalReserEx);
		
		return totalReserEx;
	}
	
	
	
	@RequestMapping(value = "/noReserAllDate", method = RequestMethod.POST)
	@ResponseBody
	public int noReserAllDate(Model model, @RequestParam HashMap<String, Object> data) throws Exception {
		
		Object str = data.get("totalDay");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		
		String totalDate = str.toString();
		int lastInNo = totalDate.length();
		String[] sendTotalDate = totalDate.substring(1, (lastInNo-1)).split(",");
		String busin_num = (String) data.get("busin_num");
		Object set_time = data.get("set_time");
		
		ArrayList<String> set_date = new ArrayList<String>();
		
		for(int j=0; j<sendTotalDate.length; j++) {
			set_date.add(sendTotalDate[j].replaceAll("\"", "")); 
		}
		
		
		for(int i=0; i<sendTotalDate.length; i++) {
			
			map.put("busin_num", busin_num);
			map.put("set_date", set_date.get(i));
			map.put("set_time", set_time);
			list.add(i, map);
			map = new HashMap<String, Object>();
		}
		
		System.out.println(list);
		
		HashMap<String, Object> delMap = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> delList = new ArrayList<HashMap<String,Object>>();
		
		Object noCancle = data.get("totalDelDay");
		String coCan = noCancle.toString();
		int lastNoCan = coCan.length();
		String[] sendcoCan = coCan.substring(1, (lastNoCan-1)).split(",");
		
		ArrayList<String> del_date = new ArrayList<String>();
		
		for(int j=0; j<sendcoCan.length; j++) {
			del_date.add(sendcoCan[j].replaceAll("\"", "")); 
		}
		
		for(int i=0; i<sendcoCan.length; i++) {
			
			delMap.put("del_date", del_date.get(i));
			delList.add(i, delMap);
			delMap = new HashMap<String, Object>();
		}
		
		System.out.println(delList);
		
		service.delDate(delList);
		
		
		
		return service.noReserAllDate(list);
	}
	

	//예약 할 때 필요한 일반 회원이 등록한 애견 정보를 받아오기
	@RequestMapping(value = "/findMyDog", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<HashMap<String, Object>> findMyDog(Model model, @RequestParam HashMap<String, Object> data) {
		
		return service.findMyDog(data);
	}
	
	
	//예약 할 때 필요한 일반 회원이 애견을 선택하면 해당 견급에 따라서 노출시켜 줄 리스트를 호출
	@RequestMapping(value = "/shopServiceInfo", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<HashMap<String, Object>> shopServiceInfo(Model model, @RequestParam HashMap<String, Object> data) {
		
		//System.out.println(data);
		
		return service.shopServiceInfo(data);
	}
	
	//예약 진행, 예약 설정 상태를 예약 불가능으로, 예약 정보에 insert, 예약 로그에 insert 
	@RequestMapping(value = "/reservation", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> reservation(Model model, @RequestParam HashMap<String, Object> data) {
				
		HashMap<String, Object> reserState = new HashMap<String, Object>();
		HashMap<String, Object> reserHistory = new HashMap<String, Object>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> point = new HashMap<String, Object>();
		
		String str = (String) data.get("ChoiceTime");
		String ct = str.replaceAll("\'", ""); 
		String ChoiceTime = "$."+ct;

		System.out.println(ChoiceTime);
		
		//예약 상태 변경할 떄 보낼 데이터
		reserState.put("busin_num", data.get("busin_num"));
		reserState.put("ChoiceDate", data.get("ChoiceDate"));
		reserState.put("ChoiceTime", ChoiceTime);
		
		reserHistory.put("mem_id",  data.get("mem_id"));
		reserHistory.put("busin_num",  data.get("busin_num"));
		reserHistory.put("add_num",  data.get("add_num"));
		reserHistory.put("service",  data.get("service"));
		reserHistory.put("servicePrice",  data.get("servicePrice"));
		reserHistory.put("reserTime",  data.get("reserTime"));
		
		point.put("mem_id", data.get("mem_id"));
		point.put("busin_mem_id", data.get("busin_mem_id"));
		point.put("servicePrice", data.get("servicePrice"));
		
		service.point(point);
		
		service.reserState(reserState);
		
		int cnt = service.reserHistory(reserHistory);
		if (cnt > 0) {
			service.reserSuccess(reserHistory);
		}
		map.put("inHistory", cnt);
		
		return map;
	}
	
	
	
	//include 테스트용
	@RequestMapping(value = "/reserCalTest", method = RequestMethod.GET)
	public String reserCalTest(Model model) {
		
		return "reserCalTest";
	}
	
	
	//마이 페이지에서 예약 설정 및 확인 할 때 필요한 busin_num 을 조회
	@RequestMapping(value = "/businNumChk")
	@ResponseBody
	public HashMap<String, Object> busin_num_chk(Model model, @RequestParam HashMap<String, Object> businId) {
		
		//System.out.println("마이페이지에서 사용할 사업자 번호를 조회하기 위해 받아오 아이디 정보 : "+businId);
		
		return service.busin_num_chk(businId);
	}
	
	
	
	
	
	
	
}
