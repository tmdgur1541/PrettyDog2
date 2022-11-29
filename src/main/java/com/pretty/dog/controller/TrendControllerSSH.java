package com.pretty.dog.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pretty.dog.service.TrendServiceSSH;


@Controller
public class TrendControllerSSH {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired TrendServiceSSH trendServiceSSH;
	
	// 트랜드 게시물 작성 요청
	@RequestMapping(value = "/beautyTrendWrite", method = RequestMethod.POST)
	public String beautyTrendWrite(Model model, MultipartFile photos, @RequestParam HashMap<String, Object> params) {
		logger.info("글쓰기 요청 : {}", params);
		logger.info("업로드 할 파일 명 : {}", photos.getOriginalFilename());
		return trendServiceSSH.beautyTrendWrite(params, photos);
	}
	
	// 트랜드 게시물 작성 페이지 이동
	@RequestMapping(value = "/beautyTrendWriteForm", method = RequestMethod.GET)
	public String beautyTrendWriteForm(Model model, @RequestParam String mem_id) {
		logger.info("트렌드 게시판 등록 페이지 이동 :  "+ mem_id);
		model.addAttribute("mem_id", mem_id);
		return "beautyTrendWriteForm";
	}
	
	// 트렌드 리스트 페이지 등록 수정 버튼 제어 요청1(멤버?)
	@RequestMapping(value = "/idChk", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> idChk(Model model, @RequestParam String memberId) {
		logger.info("아이디 랭크 체크할 값 : " + memberId);
		System.out.println(memberId);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> memberInfo = trendServiceSSH.idChk(memberId);
		map.put("memberInfo", memberInfo);
		return map;
	}
	
	// 트렌드 리스트 페이지 등록 수정 버튼 제어 요청2(멤버?)
	@RequestMapping(value = "/memberRank1", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> memberRank1(Model model, @RequestParam String memberId) {
		logger.info("아이디 랭크 체크할 값 : " + memberId);
		System.out.println(memberId);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> memberRank = trendServiceSSH.memberRank1(memberId);
		System.out.println("memberRank.size()"+memberRank.size());
		if(memberRank.size() == 0) {
			map.put("community_boardnum", 0);
			return map;
		}
		map.put("memberRank", memberRank);
		return map;
	}
	
	// 트렌드 게시판 리스트 페이지 이동
	@RequestMapping(value = "/beautyTrendList", method = RequestMethod.GET)
	public String beautyTrendList(Model model) {
		logger.info("트렌드 페이지 이동");
		ArrayList<HashMap<String, Object>> beautyTrendList = trendServiceSSH.beautyTrendList();
		System.out.println(beautyTrendList.size());
		model.addAttribute("beautyTrendList", beautyTrendList);
		System.out.println(beautyTrendList);
		return "beautyTrend";
	}
	
	// 트렌드 게시판 한국맵 선택시 리스트 변경 요청
	@RequestMapping(value = "/changeKoMap", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> changeKoMap(Model model, @RequestParam String changeKoMap) {
		logger.info("지역검색");
		logger.info("changeKoMap : "+changeKoMap);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> beautyTrendList = trendServiceSSH.changeKoMap(changeKoMap);
		System.out.println(beautyTrendList.size());
		System.out.println(beautyTrendList);
		map.put("beautyTrendList", beautyTrendList);
		return map;
	}
	
	// 트렌드 게시판 상세보기 페이지 이동
	@RequestMapping(value = "/beautyTrendDetail", method = RequestMethod.GET)
	public ModelAndView beautyTrendDetail(Model model, @RequestParam String idx) {
		logger.info("트렌드 상세보기 : "+ idx);
		return trendServiceSSH.beautyTrendDetail(idx);
	}
	
	// 트렌드 게시판 수정 페이지 이동
	@RequestMapping(value = "/beautyTrendUpdate", method = RequestMethod.GET)
	public ModelAndView beautyTrendUpdate(Model model, @RequestParam String idx) {
		logger.info("트렌드 게시글 수정 : "+ idx);
		return trendServiceSSH.beautyTrendUpdate(idx);
	}
	
	// 트렌드 게시판 수정 요청
	 @RequestMapping(value = "/trendUpdate")
	 public String trendUpdate(Model model, MultipartFile photos, @RequestParam HashMap<String, String> params) {
		 logger.info("수정 요청 : {}", params);
		 logger.info("업로드 할 파일 수 : {}", photos.getOriginalFilename());
		 return trendServiceSSH.trendUpdate(photos, params); 
	 }
	 
	 // 트렌드 게시판 삭제 요청
	 @RequestMapping(value = "/beautyTrendDelete")
	 public String beautyTrendDelete(@RequestParam String idx, @RequestParam String newFilename) {
		 System.out.println("삭제 요청 번호 : " + idx);
		 System.out.println("삭제 요청 이미지 이름 : " + newFilename);
		 trendServiceSSH.beautyTrendDelete(idx, newFilename);
		 return "redirect:/beautyTrendList";
	 }
	 
	
}






























































































