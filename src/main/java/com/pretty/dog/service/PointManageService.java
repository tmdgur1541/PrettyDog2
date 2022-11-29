package com.pretty.dog.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pretty.dog.dao.PointManagementDAO;
import com.pretty.dog.dto.DogDTO;

@Service
public class PointManageService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired PointManagementDAO dao;
	
	public ModelAndView pointInsert(int insertPoint, String loginId, RedirectAttributes rArrt) {
		
		ModelAndView mav = new ModelAndView();
		
		int row = dao.pointInsert(insertPoint,loginId);
		if (row > 0) {
			dao.memPointAdd(insertPoint,loginId);
		}
		logger.info("포인트들어갔니?:{}",row);
		rArrt.addFlashAttribute("success", row);
		
		mav.setViewName("redirect:/pointListPage");
		
		return mav;
	}

	public ModelAndView pointListPage(String loginId) {
		
		ModelAndView mav = new ModelAndView();
		
		ArrayList<DogDTO> memPoint = dao.memPointSelect(loginId);
		
		mav.addObject("loginId", loginId);
		mav.addObject("memInfo", memPoint);
		mav.setViewName("cywPointListPage");
		
		
		return mav;
	}

	public HashMap<String, Object> memPointList(int currPage, int pagePerCnt, String loginId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
		logger.info("offset:{}",offset);	 
		int totalCount = dao.allCountMemPointList(loginId); 
		logger.info("totalCount:{}",totalCount);	 
		int range = totalCount%pagePerCnt > 0 ? (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
		
		 map.put("pages", range); 
		 map.put("list",dao.memPointList(pagePerCnt,offset,loginId));
		 map.put("totalCount", totalCount);
	 
		return map;
	}

	public ModelAndView onerPointChange(String loginId) {
		ModelAndView mav = new ModelAndView();
		
		int memPoint = dao.onerPointChange(loginId);
		int OnerPointCheck = dao.OnerPointCheck(loginId);
		
		if (OnerPointCheck != 0) {
			int AllCountPoint = dao.onerAllCount(loginId);
			mav.addObject("pointSum", AllCountPoint);
		}
		
		mav.addObject("memPoint", memPoint);
		mav.addObject("loginId", loginId);
		mav.setViewName("cywOnerPointChange");
		
		return mav;
	}

	public HashMap<String, Object> onerPointListCall(int currPage, int pagePerCnt, String loginId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//어디서부터 보여줘야 하는가?
		int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
		logger.info("offset:{}",offset);
		
		int totalCount = dao.allPointChCount(loginId);
		// 만들 수 있는 총 페이지의 수(전체 갯수 / 보여줄 갯수)
		int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
		
		logger.info("총 갯수 : {}",totalCount);
		logger.info("만들수 있는 총 페이지 :{}",range);
		
		map.put("pages", range);
		map.put("list", dao.onerPointListCall(loginId,pagePerCnt,offset));

		
		return map;
	}

	public ModelAndView pointChange(String loginId, String changePoint, String bankName, String bankNum,RedirectAttributes rAttr) {
		
		ModelAndView mav = new ModelAndView();
		
		// 1. 회원포인트 삭제
		int q = dao.onerPointChange(loginId);
		int w = Integer.parseInt(changePoint);
		int e = 10000;
		
		if (q < w) {
			
			rAttr.addFlashAttribute("msg3", "환전가능금액보다 신청금액이 높습니다.");
			mav.setViewName("redirect:/onerPointChange");

		}else if (w < e) {

			rAttr.addFlashAttribute("msg3", "환전 가능 최소금액은 10,000원이상입니다.");
			mav.setViewName("redirect:/onerPointChange");
		}else {
			
			int r = q-w;
			dao.onerPointDel(loginId,r);
			// 포인트내역 저장
			dao.insertOnerPoint(loginId,w);
			// 2. 환전 테이블 등록
			int row = dao.pointChInsert(loginId,changePoint,bankName,bankNum);
			logger.info("환전완료:{}",row);
			
			logger.info("기존회원포인트:{}",q);
			logger.info("환전입력한거:{}",w);
			logger.info("시발 환전 회원에서 빼야되는데 :{}",r);
			
			if (row > 0) {
				rAttr.addFlashAttribute("msg", "환전신청이 완료되었습니다.");
				mav.setViewName("redirect:/onerPointChange");
			}else {
				rAttr.addFlashAttribute("msg", "환전신청이 실패하였습니다. 고객센터에 문의 부탁드립니다.");
				mav.setViewName("redirect:/onerPointChange");
			}
		}
		
		return mav;
	}

	public ModelAndView PointInsertPage(String loginId) {
		ModelAndView mav = new ModelAndView();
		
		ArrayList<DogDTO> memPoint = dao.memPointSelect(loginId);
		
		mav.addObject("loginId", loginId);
		mav.addObject("memInfo", memPoint);
		
		mav.setViewName("cywPointInsert");
		
		return mav;
	}
	
	
	
}
