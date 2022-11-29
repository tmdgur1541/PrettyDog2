package com.pretty.dog.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pretty.dog.dto.DogDTO;
import com.pretty.dog.service.AdminPageService;



@Controller
public class AdminPageController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired AdminPageService service;
	
	
	//회원 조회 및 관리
	@RequestMapping(value = "/apuserlist2")
	public ModelAndView apuserlist2(HttpSession session) {
		logger.info("관리자 리스트 페이지");
		
		String loginId = (String) session.getAttribute("loginId");
		
		return service.apuserlist2(loginId);
	}
	
	@RequestMapping(value = "/apuserlist3", method = RequestMethod.POST) 
	public @ResponseBody HashMap<String, Object> apuserlist3(@RequestParam String page,@RequestParam String cnt,HttpSession session,
			@RequestParam String a,@RequestParam String b,@RequestParam String c) {
				/* @RequestParam String a,@RequestParam String b,@RequestParam String c */
		logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
		logger.info("시발1:{}",b);
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		int b1 = Integer.parseInt(b);
		int c1 = Integer.parseInt(c);
		
		return service.apuserlist3(currPage,pagePerCnt,a,b1,c1);
	}		
	
/*	@RequestMapping(value = "/apuserlist30", method = RequestMethod.POST) 
	public @ResponseBody HashMap<String, Object> apuserlist30(@RequestParam String page,@RequestParam String cnt,HttpSession session, 
			@RequestParam String a,@RequestParam String b,@RequestParam String c
			) {
		logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
		logger.info("시발1:{}",a);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		int b1 = Integer.parseInt(b);
		int c1 = Integer.parseInt(c);
		
		return service.apuserlist30(currPage,pagePerCnt,a,b1,c1);
	}		*/
	
	
	
	
	//회원 상세보기
	@RequestMapping(value="/apuserdetail", method = RequestMethod.GET)
	public String apdetail(Model model,@RequestParam String id) {
		logger.info("클릭한 아이디 : {}",id);
		
		DogDTO dto = service.detail(id);
		model.addAttribute("info", dto);
		
		return "APuserView";
	}
	
	//회원 상태 및 등급 수정
	@RequestMapping(value="/apuserupdate", method = RequestMethod.POST)
	public String apupdate(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("수정 : {}",params);
		
		service.userupdate(params);
		
		return "redirect:/apuserdetail?id="+params.get("id");
	}
	
	//회원 포인트 임의 수정
	@RequestMapping(value="/appointupdate", method = RequestMethod.POST)
	public String appointupdate(Model model,@RequestParam HashMap<String, String> params,RedirectAttributes rArrt) {
		logger.info("포인트 적립 : {}",params);
		
		service.pointupdate(params, rArrt);
		
		return "redirect:/apuserdetail?id="+params.get("id");
	}
	
	//관리자 매장
	@RequestMapping(value = "/apshoplist2")
	public ModelAndView apshoplist2(HttpSession session) {
		logger.info("매장 리스트 페이지");

		String loginId = (String) session.getAttribute("loginId");
		
		return service.apshoplist2(loginId);
	}
	
	@RequestMapping(value = "/apshoplist3", method = RequestMethod.POST) 
	public @ResponseBody HashMap<String, Object> apshoplist3(@RequestParam String page,@RequestParam String cnt,HttpSession session,
			@RequestParam String a,@RequestParam String b) {
		/* @RequestParam String a,@RequestParam String b,@RequestParam String c */
		logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
		logger.info("시발1:{}",b);
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		int b1 = Integer.parseInt(b);

		return service.apshoplist3(currPage,pagePerCnt,a,b1);
	}		
	
	
	
	
	//매장 상세보기
	@RequestMapping(value="/apshopinfo", method = RequestMethod.GET)
	public String apshopdetail(Model model,@RequestParam String shop) {
		logger.info("매장의 사업자번호 : {}",shop);
			
		DogDTO dto = service.adminshopdetail(shop);
		model.addAttribute("shopinfo", dto);
		
		//이용 완료
		int dto2 = service.adminshopdetail2(shop);
		model.addAttribute("shopinfo2", dto2);
		//logger.info("안들어오지:{}",dto2);	
		
		//취소
		int dto3 = service.adminshopdetail3(shop);
		model.addAttribute("shopinfo3", dto3);
		//logger.info("안들어오지:{}",dto3);	
		
		//매출금액
		int dto4 = service.adminshopmoney(shop);
		model.addAttribute("shopmoney", dto4);
		//logger.info("안들어오지:{}",dto4);
		
		//환급금액
		 int dto5 = service.adminshopmoney2(shop);
		 model.addAttribute("shopmoney2",dto5); 
		 //logger.info("안들어오지:{}",dto5);
		 
		//결제금액
		 int dto6 = service.adminshopmoney3(shop);
		 model.addAttribute("shopmoney3",dto6); 
		 //logger.info("안들어오지:{}",dto6);
		 
		//취소금액
		 int dto7 = service.adminshopmoney4(shop);
		 model.addAttribute("shopmoney4",dto7); 
		 //logger.info("안들어오지:{}",dto7);

		return "APshopView";
	}
	
	//매장 상태 수정
	@RequestMapping(value="/apshopupdate", method = RequestMethod.POST)
	public String apshopdate(Model model,@RequestParam HashMap<String, String> params) {
		logger.info("수정 : {}",params);
			
		service.shopdate(params);
			
		return "redirect:/apshopinfo?shop="+params.get("shop");
	}	
	
	//관리자페이지 포인트 조회
	@RequestMapping(value = "/appointlist2")
	public ModelAndView appointlist2(HttpSession session) {
		logger.info("포인트 리스트 페이지");
		String loginId = (String) session.getAttribute("loginId");
		
		return service.appointlist2(loginId);
	}
	
	@RequestMapping(value = "/appointlist3", method = RequestMethod.POST) 
	public @ResponseBody HashMap<String, Object> appointlist3(@RequestParam String page,@RequestParam String cnt,HttpSession session) {
		logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);

		return service.appointlist3(currPage,pagePerCnt);
	}
	
	//관리자페이지 예약 조회	
	@RequestMapping(value = "/apreservelist2")
	public ModelAndView apreservelist2(HttpSession session) {
		logger.info("예약 리스트 페이지");
		
		String loginId = (String) session.getAttribute("loginId");
		
		return service.apreservelist2(loginId);
	}
	
	@RequestMapping(value = "/apreservelist3", method = RequestMethod.POST) 
	public @ResponseBody HashMap<String, Object> apreservelist3(@RequestParam String page,@RequestParam String cnt,HttpSession session) {
		logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);

		return service.apreservelist3(currPage,pagePerCnt);
	}		
	
	   @RequestMapping(value = "/categoryPage")
	   public ModelAndView idSearchPage(Model model,HttpSession session) {
	      logger.info("카테고리페이지");
	      
	      String loginId = (String) session.getAttribute("loginId");

	      return service.categoryPage(loginId);
	   }
	   
	   
	   @RequestMapping(value = "/categoryListCall", method = RequestMethod.GET) 
	   public @ResponseBody HashMap<String, Object> categoryListCall(@RequestParam String page,@RequestParam String cnt) {
	      logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
	      
	      int currPage = Integer.parseInt(page);
	      int pagePerCnt = Integer.parseInt(cnt);

	      return service.categoryListCall(currPage,pagePerCnt);
	   }
	   
	   
	   @RequestMapping(value = "/cateGoryAdd")
	   public ModelAndView cateGoryAdd(@RequestParam String categoryName,@RequestParam String categoryClass,RedirectAttributes rAttr) {
	      logger.info("카테고리 추가");

	      return service.cateGoryAdd(categoryName,categoryClass,rAttr);
	   }
	   
	   @RequestMapping(value = "/categoryDel")
	   public ModelAndView categoryDel(@RequestParam String category_num,RedirectAttributes rAttr) {
	      logger.info("카테고리 삭제:{}",category_num);

	      return service.categoryDel(category_num,rAttr);
	   }
	   
	   @RequestMapping(value = "/SingoHangmokPage")
	   public ModelAndView SingoHangmokPage(HttpSession session) {
	      logger.info("신고항목 페이지");
	      
	      String loginId = (String) session.getAttribute("loginId");

	      return service.SingoHangmokPage(loginId);
	   }
	   
	   @RequestMapping(value = "/SingoHangmokList", method = RequestMethod.POST) 
	   public @ResponseBody HashMap<String, Object> SingoHangmokList(@RequestParam String page,@RequestParam String cnt) {
	      logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
	      
	      int currPage = Integer.parseInt(page);
	      int pagePerCnt = Integer.parseInt(cnt);

	      return service.SingoHangmokList(currPage,pagePerCnt);
	   }
	   
	   @RequestMapping(value = "/SingoHangmokAdd")
	   public ModelAndView SingoHangmokAdd(@RequestParam String SingoSub,RedirectAttributes rAttr) {

	      return service.SingoHangmokAdd(SingoSub,rAttr);
	   }
	   
	   @RequestMapping(value = "/HangmokReUse")
	   public ModelAndView HangmokReUse(@RequestParam String decO_num,RedirectAttributes rAttr) {

	      return service.HangmokReUse(decO_num,rAttr);
	   }
	   
	   @RequestMapping(value = "/HangmokDel")
	   public ModelAndView HangmokDel(@RequestParam String decO_num,RedirectAttributes rAttr) {

	      return service.HangmokDel(decO_num,rAttr);
	   }
	   
	   @RequestMapping(value = "/SingoListPage")
	   public ModelAndView SingoListPage(HttpSession session) {
	      logger.info("신고리스트 페이지");
	      
	      String loginId = (String) session.getAttribute("loginId");

	      return service.SingoListPage(loginId);
	   }
	   
	   @RequestMapping(value = "/SingoNoCheckList", method = RequestMethod.POST) 
	   public @ResponseBody HashMap<String, Object> SingoNoCheckList(@RequestParam String page,@RequestParam String cnt) {
	      logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
	      
	      int currPage = Integer.parseInt(page);
	      int pagePerCnt = Integer.parseInt(cnt);

	      return service.SingoNoCheckList(currPage,pagePerCnt);
	   }
	   
	   @RequestMapping(value = "/SingoProcess")
	   public ModelAndView SingoProcess(HttpSession session,@RequestParam String decl_num,RedirectAttributes rAttr) {
	      logger.info("신고처리",decl_num);
	      
	      String loginId = (String) session.getAttribute("loginId");
	      //String loginId = "dud";
	      
	      return service.SingoProcess(decl_num,rAttr,loginId);
	   }
	   
	   @RequestMapping(value = "/SingoProcessListPage")
	   public ModelAndView SingoProcessListPage(HttpSession session) {
	      logger.info("신고리스트 페이지");
	      
	      String loginId = (String) session.getAttribute("loginId");

	      return service.SingoProcessListPage(loginId);
	   }
	   
	   @RequestMapping(value = "/SingoProcessList", method = RequestMethod.POST) 
	   public @ResponseBody HashMap<String, Object> SingoProcessList(@RequestParam String page,@RequestParam String cnt) {
	      logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
	      
	      int currPage = Integer.parseInt(page);
	      int pagePerCnt = Integer.parseInt(cnt);

	      return service.SingoProcessList(currPage,pagePerCnt);
	   }
	   
	   @RequestMapping(value = "/AdminServicePage")
	   public ModelAndView AdminServicePage(HttpSession session) {
	      logger.info("추가서비스항목 페이지");
	      
	      String loginId = (String) session.getAttribute("loginId");

	      return service.AdminServicePage(loginId);
	   }
	   
	   @RequestMapping(value = "/ServiceHangmokList", method = RequestMethod.POST) 
	   public @ResponseBody HashMap<String, Object> ServiceHangmokList(@RequestParam String page,@RequestParam String cnt) {
	      logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
	      
	      int currPage = Integer.parseInt(page);
	      int pagePerCnt = Integer.parseInt(cnt);

	      return service.ServiceHangmokList(currPage,pagePerCnt);
	   }
	   
	   @RequestMapping(value = "/UseServiceChange")
	   public ModelAndView UseServiceChange(HttpSession session,@RequestParam String add_num,RedirectAttributes rAttr) {
	      logger.info("서비스 사용으로 바꾸기");

	      return service.UseServiceChange(add_num,rAttr);
	   }
	   
	   @RequestMapping(value = "/NoUseServiceChange")
	   public ModelAndView NoUseServiceChange(HttpSession session,@RequestParam String add_num,RedirectAttributes rAttr) {
	      logger.info("서비스 사용으로 바꾸기");

	      return service.NoUseServiceChange(add_num,rAttr);
	   }
	   
	   @RequestMapping(value = "/ServiceHangmokAdd")
	   public ModelAndView ServiceHangmokAdd(HttpSession session,@RequestParam String ServiceDog,@RequestParam String ServiceSub,RedirectAttributes rAttr) {
	      logger.info("서비스 추가");

	      return service.ServiceHangmokAdd(ServiceDog,ServiceSub,rAttr);
	   }
	   
	   
	   @RequestMapping(value = "/ChangeListPage")
	   public ModelAndView ChangeListPage(HttpSession session) {
	      logger.info("환전신청목록 페이지");
	      
	      String loginId = (String) session.getAttribute("loginId");

	      return service.ChangeListPage(loginId);
	   }
	   
	   @RequestMapping(value = "/ChangeList", method = RequestMethod.POST) 
	   public @ResponseBody HashMap<String, Object> ChangeList(@RequestParam String page,@RequestParam String cnt) {
	      logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
	      
	      int currPage = Integer.parseInt(page);
	      int pagePerCnt = Integer.parseInt(cnt);

	      return service.ChangeList(currPage,pagePerCnt);
	   }
	   
	   @RequestMapping(value = "/ChangeMoneyCheck")
	   public ModelAndView ChangeMoneyCheck(HttpSession session,@RequestParam String poch_num,RedirectAttributes rAttr) {
	      logger.info("환전신청완료하기");

	      String loginId = (String) session.getAttribute("loginId");
	      //String loginId = "dud";
	      return service.ChangeMoneyCheck(poch_num,rAttr,loginId);
	   }
	   
	   @RequestMapping(value = "/ChangeOkListPage")
	   public ModelAndView ChangeOkListPage(HttpSession session) {
	      logger.info("환전완료목록 페이지");
	      
	      String loginId = (String) session.getAttribute("loginId");

	      return service.ChangeOkListPage(loginId);
	   }

	   @RequestMapping(value = "/ChangeOkList", method = RequestMethod.POST) 
	   public @ResponseBody HashMap<String, Object> ChangeOkList1(@RequestParam String page,@RequestParam String cnt) {
	      logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
	      
	      int currPage = Integer.parseInt(page);
	      int pagePerCnt = Integer.parseInt(cnt);

	      return service.ChangeOkList(currPage,pagePerCnt);
	   }
	
	
}
