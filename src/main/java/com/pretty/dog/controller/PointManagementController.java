package com.pretty.dog.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pretty.dog.service.PointManageService;

@Controller
public class PointManagementController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired PointManageService service;
	
	@RequestMapping(value = "/PointInsertPage")
	public ModelAndView PointInsertPage(Model model,HttpSession session) {
		logger.info("포인트충전페이지");
		
		String loginId = (String) session.getAttribute("loginId");
		//String loginId = "dud";
		
		return service.PointInsertPage(loginId);
	}
	
	@RequestMapping(value = "/pointInsert")
	public ModelAndView PointInsert(@RequestParam String point,HttpSession session,RedirectAttributes rArrt) {
		logger.info("포인트충전");
		String loginId = (String) session.getAttribute("loginId");
		//String loginId = "dud";
		int insertPoint = 0;
		int a = Integer.parseInt(point);
		if (a == 1) {
			insertPoint = 5000;
		}else if (a == 2) {
			insertPoint = 10000;
		}else if (a == 3) {
			insertPoint = 15000;
		}else if (a == 4) {
			insertPoint = 20000;
		}else if (a == 5) {
			insertPoint = 25000;
		}else if (a == 6) {
			insertPoint = 30000;
		}else if (a == 7) {
			insertPoint = 35000;
		}else if (a == 8) {
			insertPoint = 40000;
		}else if (a == 9) {
			insertPoint = 45000;
		}else if (a == 10) {
			insertPoint = 50000;
		}else {
			insertPoint = 0;
		}
		return service.pointInsert(insertPoint,loginId,rArrt);
	}
	
	
	@RequestMapping(value = "/pointListPage")
	public ModelAndView pointList(HttpSession session) {
		logger.info("포인트리스트페이지");
		
		String loginId = (String) session.getAttribute("loginId");
	      //String loginId = "dud";
		
		return service.pointListPage(loginId);
	}
	
	
	 @RequestMapping(value = "/memPointList", method = RequestMethod.POST)
	 @ResponseBody public HashMap<String, Object> memPointList(Model model,@RequestParam String page,@RequestParam String cnt,HttpSession session){
	 
		 String loginId = (String) session.getAttribute("loginId");
	      //String loginId = "dud";
		 
		 int currPage = Integer.parseInt(page); 
		 int pagePerCnt =Integer.parseInt(cnt);
		 
	 return service.memPointList(currPage,pagePerCnt,loginId); 
	 }
	
	
		@RequestMapping(value = "/onerPointChange")
		public ModelAndView onerPointChange(HttpSession session) {
			logger.info("포인트리스트페이지");
			
			String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
			
			return service.onerPointChange(loginId);
		}
		
		 @RequestMapping(value = "/onerPointListCall", method = RequestMethod.POST)
		 @ResponseBody public HashMap<String, Object> onerPointListCall(Model model,HttpSession session,@RequestParam String page,@RequestParam String cnt){
		 
			 String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
			 
			 int currPage = Integer.parseInt(page); 
			 int pagePerCnt =Integer.parseInt(cnt);
			 logger.info("페이징 컨트롤러:{}",currPage);
			 logger.info("페이징 컨트롤러:{}",pagePerCnt);
			 
		 return service.onerPointListCall(currPage,pagePerCnt,loginId); 
		 }
	
		@RequestMapping(value = "/pointChange")
		public ModelAndView pointChange(HttpSession session,@RequestParam String changePoint,@RequestParam String bankName,@RequestParam String bankNum,RedirectAttributes rAttr) {
			logger.info("포인트환전 요청:{}",changePoint);
			
			String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
			
			return service.pointChange(loginId,changePoint,bankName,bankNum,rAttr);
		}
		 
		 
		 
		 
		 
		 
		 
}
