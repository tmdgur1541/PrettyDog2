package com.pretty.dog.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pretty.dog.service.HomeService;


@Controller
public class HomeController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired HomeService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("메인페이지");
		

		return "Main";
	}
	
	
	@RequestMapping(value = "/idRankChk")
	@ResponseBody
	public HashMap<String, Object> idRankChk(Model model, @RequestParam HashMap<String, Object> loginId) {
		
		//logger.info("아이디 랭크 체크 컨단 도착 : ");
		//System.out.println(loginId);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		

		System.out.println(service.idRankChk(loginId));
		
		int rankLoinChk = service.idRankChk(loginId).size();
		
		if(rankLoinChk == 0) {
			map.put("loginId", "null");
		}else {
			map.put("mem_rank", service.idRankChk(loginId).get(0).get("mem_rank"));
			map.put("loginId", service.idRankChk(loginId).get(0).get("mem_id"));
			map.put("mem_point", service.idRankChk(loginId).get(0).get("mem_point"));
		}
		

		return map;
	}
	
	@PostMapping(value = "/login")
	public ModelAndView login(@RequestParam String idInput,@RequestParam String pwInput,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (pwInput == null || pwInput.equals("")) {
			int sns = service.SnsLogin(idInput);
			if (sns > 0) {
				mav.addObject("loginSuccessAlert", idInput+"님 반갑습니다. 즐거운 하루 되세요!♡");
				mav.setViewName("Main");
				session.setAttribute("loginId", idInput);				
			}else {
				mav.addObject("loginSuccessAlert", "로그인이 실패하였습니다.");
				mav.setViewName("Main");				
			}
			return mav;
		}
		if (service.login(idInput,pwInput)) {
			mav.addObject("loginSuccessAlert", idInput+"님 반갑습니다. 즐거운 하루 되세요!♡");
			mav.setViewName("Main");
			session.setAttribute("loginId", idInput);
		}else {
			mav.addObject("msg", "로그인 정보를 확인해 주세요.");
			mav.setViewName("cywLogin");
			 
		}
		
		return mav;
	}
	
	@GetMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/idSearchPage")
	public String idSearchPage(Model model,HttpSession session) {
		logger.info("아이디찾기페이지");

		return "cywIDSearch";
	}

	@ResponseBody
	@RequestMapping(value = "/idSearch", method = RequestMethod.POST)
	public HashMap<String, Object> idSearch (@RequestParam String name,@RequestParam String email, HttpSession session) {
					
		return service.idSearch(name,email);
	}
	@RequestMapping(value = "/pwSearchPage")
	public String pwSearchPage(Model model,HttpSession session) {
		logger.info("비밀번호찾기페이지");

		return "cywPwSearch";
	}
	
	@RequestMapping(value = "/PwS")  
	public ModelAndView PwS(@RequestParam String userId,@RequestParam String userName,@RequestParam String userPhone,@RequestParam String userEmail) {
		logger.info("비밀번호찾기");

		return service.pwSearch(userId,userName,userPhone,userEmail);
	}
	
	@RequestMapping(value = "/PwChange")  
	public ModelAndView PwChange(@RequestParam String Id,@RequestParam String pwInput,@RequestParam String pwcheck) {
		logger.info("비밀번호바꾸기");

		return service.pwChange(Id,pwInput,pwcheck);
	}
	@RequestMapping(value = "/loginPage")
	public String loginPage() {

		return  "cywLogin";
	}
	
}
