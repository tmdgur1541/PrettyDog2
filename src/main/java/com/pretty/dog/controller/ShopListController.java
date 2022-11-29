package com.pretty.dog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pretty.dog.dto.DogDTO;
import com.pretty.dog.service.ShopListService;

@Controller
public class ShopListController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ShopListService service;
	
	
//	@RequestMapping(value = "/ShopList", method = RequestMethod.GET)
//	public ModelAndView home(Model model) {
//		logger.info("메인페이지");
//	return  service.shopList();
//	}
	
	
	/*
	 * @RequestMapping(value = "/addService", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public HashMap<String, Object> addService(Model model){
	 * 
	 * return service.addService(); }
	 */
	
	@RequestMapping(value = {"/shopSerch","/ShopList"})
	public ModelAndView shopSerch(@RequestParam HashMap<String, Object> params) {
		logger.info("검색:{}",params);
		return  service.shopSerch(params);
	}
	
	@RequestMapping(value = "/shopListAjax", method = RequestMethod.POST) 
	public @ResponseBody HashMap<String, Object> AlrimPageList(@RequestParam HashMap<String, Object> params) {
		
		return service.shopSearchAjax(params);
	}
	
/*	@ResponseBody
	@RequestMapping(value = "/updateLike", method = RequestMethod.GET)
	public HashMap<String, Object> updateLike (@RequestParam String busin_num, HttpSession session) {

			HashMap<String, Object> map = new HashMap<String, Object>();
			
			String loginId = (String) session.getAttribute("loginId");
			//String loginId = "dud";
			
			if (loginId != null) {
				int LikeCheck = service.LikeCheck(busin_num, loginId);
				
				if (LikeCheck == 1) {
					service.deleteLike(busin_num, loginId);
					service.CancelBLike(busin_num);
				}else {
					service.insertLike(busin_num, loginId);
					service.updateBLike(busin_num);
				}
				map.put("LikeCheck", LikeCheck);
			} else { 
				map.put("msg", "로그인이 필요한 기능입니다."); 
			}
			
		
		return map;
	}*/
	
	@ResponseBody
	@RequestMapping(value = "/serviceScopeSelect", method = RequestMethod.GET)
	public HashMap<String, Object> serviceScopeSelect (@RequestParam String serviceNum) {
			
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("serviceNum:{}",serviceNum);
		ArrayList<DogDTO> list = service.serviceScopeSelect(serviceNum);
		
		map.put("serviceList", list);
		return map;
	}
	
	   // 매장 상세보기 페이지 이동
	   @RequestMapping(value = "/sshShopDetail", method = RequestMethod.GET)
	   public String sshShopDetail(Model model, @RequestParam String idx, HttpSession session) {
	      logger.info("sshShopDetail리스트 페이지 이동");
	      System.out.println("매장번호" + idx);
	      String memId = (String) session.getAttribute("loginId");
	      System.out.println("로그인한 아이디"+memId);
	      String page = "sshShopDetail";
	      //String page = "sshShopDetail?idx="+idx;
	      ArrayList<HashMap<String,Object>> sshShopDetail = service.sshShopDetail(idx);
	      ArrayList<HashMap<String,Object>> sshMyInterestShopList = service.sshMyInterestShopList(memId, idx);
	      ArrayList<HashMap<String,Object>> sshShopQnaList = service.sshShopQnaList(idx);
	      ArrayList<HashMap<String,Object>> sshShopQnaIdChk = service.sshShopQnaIdChk(memId);
	      ArrayList<HashMap<String,Object>> sshShopQnaNnswerList = service.sshShopQnaNnswerList();
	      ArrayList<HashMap<String,Object>> sshShopRevList = service.sshShopRevList(idx);
	      ArrayList<HashMap<String,Object>> revLength = service.revLength(memId, idx);
	      //System.out.println("revLength 길이 : " + revLength.size());
	      //System.out.println("sshMyInterestShopList 샾 길이 : " + sshMyInterestShopList.size());
	      //System.out.println("revLength 프라이머리키값 : " + revLength.get(0).get("reser_num"));
	      //System.out.println("sshShopQnaIdChk size() : " +  revLength.size() );
	      System.out.println("sshShopDetail 값 : "+sshShopDetail);

	      if(revLength.size() == 0) {
	         model.addAttribute("reser_num", 0);
	         //int reser_num = (int)revLength.get(0).get("reser_num");
	         if(sshShopDetail.size() == 0) {
	            ArrayList<HashMap<String,Object>> sshShopDetailTwo = service.sshShopDetailTwo(idx);
	            model.addAttribute("sshShopDetail", sshShopDetailTwo);
	         }else {
	            model.addAttribute("sshShopDetail", sshShopDetail);
	         }
	         model.addAttribute("sshShopQnaList", sshShopQnaList);
	         model.addAttribute("memId", memId);
	         model.addAttribute("sshMyInterestShop_size", sshMyInterestShopList.size());
	         model.addAttribute("sshShopQnaIdChk", sshShopQnaIdChk);
	         model.addAttribute("sshShopQnaNnswerList", sshShopQnaNnswerList);
	         model.addAttribute("sshShopRevList", sshShopRevList);
	         model.addAttribute("revLength_size", revLength.size());
	         return page;
	      }else {
	         if(sshShopDetail.size() == 0) {
	            ArrayList<HashMap<String,Object>> sshShopDetailTwo = service.sshShopDetailTwo(idx);
	            model.addAttribute("sshShopDetail", sshShopDetailTwo);
	         }else {
	            model.addAttribute("sshShopDetail", sshShopDetail);
	         }
	         int reser_num = (int)revLength.get(0).get("reser_num");
	         model.addAttribute("sshShopQnaList", sshShopQnaList);
	         model.addAttribute("memId", memId);
	         model.addAttribute("sshMyInterestShop_size", sshMyInterestShopList.size());
	         model.addAttribute("sshShopQnaIdChk", sshShopQnaIdChk);
	         model.addAttribute("sshShopQnaNnswerList", sshShopQnaNnswerList);
	         model.addAttribute("sshShopRevList", sshShopRevList);
	         model.addAttribute("reser_num", reser_num);
	         model.addAttribute("revLength_size", revLength.size());
	         return page;
	      }
	   }
	   
	   // QnA 답변 체크된 리스트 요청
	   @RequestMapping(value = "/qnaComChk", method = RequestMethod.POST)
	   @ResponseBody
	   public List<HashMap<String, Object>> qnaComChk(Model model, @RequestParam(value="a[]") List<String> a) {
	      System.out.println("여기로 오냐고");
	      System.out.println(a);
	      List<HashMap<String,Object>> qnaComChk = service.qnaComChk(a);
	      System.out.println(qnaComChk);
	      /*
	       * HashMap<String, Object> map = new HashMap<String, Object>();
	       * map.put("qnaComChk", qnaComChk);
	       */
	      //if(qnaComChk)
	      
	      return qnaComChk;
	   }
	   
	   // QnA답변 달기 요청
	   @RequestMapping(value = "/QnaNnswerInsert", method = RequestMethod.GET)
	   public String QnaNnswerInsert(Model model, @RequestParam String QnaNnswerText, HttpSession session, @RequestParam String qnaDivNum, @RequestParam String busin_num) {
	      logger.info("QnaNnswerText :  "+ QnaNnswerText);
	      String memId = (String) session.getAttribute("loginId");
	      System.out.println("로그인한 아이디"+memId);
	      logger.info("qnaDivNum :  "+ qnaDivNum);
	      logger.info("busin_num :  "+ busin_num);
	      service.QnaNnswerInsert(QnaNnswerText, memId, qnaDivNum);
	      return "redirect:/sshShopDetail?idx="+busin_num;
	      //return "redirect:/beautyTrendList";
	   }
	   
	   // QnA 달기 요청
	   @RequestMapping(value = "/QnaWrite", method = RequestMethod.GET)
	   public String QnaWrite(Model model, @RequestParam String qnaText, HttpSession session,@RequestParam String busin_num) {
	      logger.info("QnaText QnaTextQnaText:  "+ qnaText);
	      String memId = (String) session.getAttribute("loginId");
	      System.out.println("로그인한 아이디"+memId);
	      logger.info("busin_num busin_numbusin_num:  "+ busin_num);
	      service.QnaWrite(qnaText,memId,busin_num);
	      return "redirect:/sshShopDetail?idx="+busin_num;
	      //return null;
	   }
	   
	   // 리뷰 달기 요청
	   @RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	   public String reviewWrite(Model model, MultipartFile photos, @RequestParam HashMap<String, Object> params) {
	      logger.info("글쓰기 요청 : {}", params);
	      logger.info("업로드 할 파일 명 : {}", photos.getOriginalFilename());
	      System.out.println("컨트롤러 reser_num : " + params.get("reser_num"));
	      String page  = service.reviewWrite(params, photos);
	      System.out.println("pagepagepagepage:" + page);
	      return page;
	      //return null;
	   }
	   
	   // 리뷰 삭제 요청
	   @RequestMapping(value = "/ReviewDelete")
	   public String ReviewDelete(@RequestParam String idx, @RequestParam String newFilename, HttpSession session,@RequestParam String busin_num) {
	      System.out.println("삭제 요청 번호 : " + idx);
	       System.out.println("삭제 요청 이미지 이름 : " + newFilename);
	       String memId = (String) session.getAttribute("loginId");
	       System.out.println("로그인한 아이디"+memId);
	       System.out.println("삭제 요청 사업자번호 : " + busin_num);
	       //sshShopListService.ReviewDelete(idx, newFilename);
	       //return "redirect:/sshShopDetail?idx="+busin_num+"&memId="+memId;
	       return null;
	    }

	   // 매장 좋아요 추가/삭제 제어 요청
	   @RequestMapping(value = "/myShopLike")
	   public String myShopLike(@RequestParam String likeVal, HttpSession session, @RequestParam String idx) {
	      System.out.println("매장 좋아요 상태 : " + likeVal);
	      String memId = (String) session.getAttribute("loginId");
	       System.out.println("로그인한 아이디"+memId);
	      System.out.println("매장 번호 : " + idx);
	      String page = "redirect:/sshShopDetail?idx="+idx;
	      if(likeVal.equals("0")) {
	    	  service.myShopLikeInsert(memId, idx);
	    	  service.shopLikeUpdate(idx);
	         return page;
	         //return null;
	      }else {
	    	  service.myShopLikeDelete(memId,idx);
	    	  service.shopLikeDown(idx);
	         return page;
	         //return null;
	      }
	      
	    }

	
	
	
	
}
