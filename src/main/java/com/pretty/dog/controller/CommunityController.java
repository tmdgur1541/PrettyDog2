package com.pretty.dog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pretty.dog.dto.DogDTO;
import com.pretty.dog.service.CommunityService;

@Controller
public class CommunityController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CommunityService communityService;	
	
	
	//게시판 기능===========================================================================================================
	
	//리스트 페이지 이동, 카테고리 리스트 출력
	@RequestMapping(value =  {"/freeList"}, method = RequestMethod.GET)
	   public String freeList(Model model) {
	      logger.info("리스트 페이지로 이동, 카테고리 출력");
	      ArrayList<DogDTO> arr = communityService.categoryList();//카테고리 출력
	      model.addAttribute("category",arr);
	      return "freeList";
	   }
		
		// 게시판 리스트 출력,페이징 
	   @RequestMapping(value="/listCall")
	   @ResponseBody
	   public HashMap<String, Object> listCall(@RequestParam HashMap<String, Object> params) {
		  logger.info("리스트요청"); 
	      logger.info("리스트 요청 : {} 페이지, {} 개씩",params.get("page"),params.get("cnt"));
	      
	      System.out.println(params.get("page")+" / "+params.get("cnt")+" / "+params.get("catNum"));
	      params.get("searchOpt");
	      int currPage = Integer.parseInt((String) params.get("page"));
	      int pagePerCnt = Integer.parseInt((String) params.get("cnt"));
	     
	      //카테고리번호, 블라인드 코드, 관리자 카테고리 코드가 붙어 있어 카테고리번호만 추출해야 한다.
	      
	      String searchOpt = (String) params.get("searchOpt");
	      String keyword = ""; 
	      keyword = (String) params.get("keyword");    
	      
	      logger.info(searchOpt);
	      logger.info(keyword);
	      
	      String catNumCut = (String) params.get("catNum");//스트링으로 catNum 받기	      
	      String catNumSave = catNumCut.substring(0,1);//0번쨰 1개 컷	      
	      System.out.println("카테고리 넘버 : "+catNumSave);
	      
	      int catNum = Integer.parseInt(catNumSave);//추출한 값 인트 변환
	      
	      logger.info("params:{}",params);
	      logger.info("현재 페이지 "+currPage+" / 페이지 갯수"+pagePerCnt);
	      
	      
	      HashMap<String, Object> map = new HashMap<String, Object>();

	      map = communityService.listCall(currPage,pagePerCnt,catNum,searchOpt,keyword);
	
	      return map;
	   }
	
	   
	//게시판  게시물 작성 페이지 이동, 카테고리 호출
	@RequestMapping(value = "/freeWriteForm", method = RequestMethod.GET)
	   public String writeForm(Model model) {
	      logger.info("자유게시판 글쓰기 페이지 요청, 카테고리 출력");
	      ArrayList<DogDTO> arr = communityService.categoryList();
	      model.addAttribute("category",arr);
	      return "freeWriteForm";
	   }
	
	 	
		//게시물 작성
		@RequestMapping(value = "/freeWrite", method = RequestMethod.POST)
		   public String freeWrite(Model model, MultipartFile imgs, @RequestParam HashMap<String, Object> params, HttpServletRequest request) {
		      logger.info("글쓰기 요청 : {}", params);
		      //logger.info("업로드 할 파일 명 : {}", imgs.getOriginalFilename());
		      return communityService.freeWrite(params,imgs);
		   }
		
		
		//게시물 삭제
		@RequestMapping(value = "/freeDelete", method = RequestMethod.GET)
		public String freeDelete(Model model, @RequestParam String community_boardnum) {
			logger.info("delete : {}", community_boardnum);
			
			communityService.freeDelete(community_boardnum);
			
			return "redirect:/freeList";
		}
		
		//업데이트폼 이동
		@RequestMapping(value = "/freeUpdateForm", method = RequestMethod.GET)
		public String freeUpdateForm(Model model, @RequestParam String community_boardnum) {
			logger.info("updateForm : {}",community_boardnum);	      
			ArrayList<DogDTO> arr = communityService.categoryList();
			model.addAttribute("category",arr);
			return communityService.freeUpdateForm(model,community_boardnum);
		}   
		
		//업데이트
		@RequestMapping(value = "/freeUpdate", method = RequestMethod.POST)
		public String freeUpdate(Model model, MultipartFile imgs, @RequestParam HashMap<String, String> params) {
			logger.info("수정 요청 : {}",params);
			
			String page = communityService.freeUpdate(imgs,params);
			return page;
		}
		
		//상세, 댓글 출력
		@RequestMapping(value = {"/freeDetail"}, method = RequestMethod.GET)
		public String freeDetail(Model model,@RequestParam String community_boardnum) {
			logger.info("상세보기 : {}",community_boardnum);
			
			//게시글 가져오기
			DogDTO dto = communityService.freeDetail(community_boardnum);
			logger.info("community_date:{}",dto.getCommunity_date());
			model.addAttribute("dto", dto);
			
			//댓글 가져오기
			ArrayList<DogDTO> commentList =  communityService.commentList(community_boardnum);
			model.addAttribute("commentList", commentList);
			
			//댓글 갯수 가져오기	 
			int commentListCnt = commentList.size();
			System.out.println("가져온 댓글의 총 갯수 : "+commentListCnt);
			model.addAttribute("commentListCnt",commentListCnt);
			
			//사진 목록 가져오기
			ArrayList<DogDTO> imgs = communityService.photoList(community_boardnum);
			
			if(imgs.size() >0) {
				model.addAttribute("imgs", imgs.get(0));
			}
			
			// System.out.println(imgs.get(0).bphoto_newname); 
			return "freeDetail";
		}
		
		
		//댓글기능========================================================================================================================
		
		// 댓글 입력
		@RequestMapping(value = "/free_commentWrite", method = RequestMethod.POST)
		  
		   public String free_commentWrite
		   	(@RequestParam("community_boardnum") int community_boardnum, @RequestParam("mem_id") String mem_id, @RequestParam("bcomment_cont") String bcomment_cont) {
			
			System.out.println("컨단으로 넘어온 커뮤글 번호 : "+community_boardnum);
			
			DogDTO dto = new DogDTO();
			
			dto.setCommunity_boardnum(community_boardnum);
			
			dto.setMem_id(mem_id);
			
			dto.setBcomment_cont(bcomment_cont);
			
			logger.info(mem_id);
			
			logger.info(bcomment_cont);
			
			communityService.free_commentWrite(dto);
			
			String page = "redirect:/freeDetail?community_boardnum="+community_boardnum;
			
			
				return page;
		   }		
		
		
		//댓글 삭제
		 @RequestMapping(value = "/free_commentDelete", method = RequestMethod.GET)
		   public String free_commentDelete(Model model, @RequestParam String bcomment_num) {
			 
		      logger.info("delete : {}", bcomment_num);
		      
		      int bcn = Integer.parseInt(bcomment_num);
		      
		      communityService.free_commentDelete(bcn);
		      
		      int bn = communityService.boardNumOfdelCom(bcn);
		      
		      logger.info("bn : {}", bn);
		      return "redirect:/freeDetail?community_boardnum=" + bn;
		      //return "redirect:/freeList";
		   }	
	
		

	 
	//신고기능	===================================================================================================================
		 
		 
	 //게시물 신고 폼 출력
	 @RequestMapping(value = "/DeclaForm_Post", method = RequestMethod.GET)
	   public ModelAndView DeclaForm_Post(Model model, @RequestParam String community_boardnum,HttpSession session) {
		 logger.info("신고하기 :{} ",community_boardnum);
		 

		 DogDTO dto = communityService.DeclaForm_Post(community_boardnum);
		 model.addAttribute("dto", dto);
	     	 
	     return communityService.declalist();
	   }   
	 
	 //댓글 신고폼 출력
	 @RequestMapping(value="/DeclaForm_Comment")
		public ModelAndView DeclaForm_Comment(Model model, @RequestParam String bcomment_num) {
			logger.info("신고하기 :{} ",bcomment_num);
			DogDTO dto = communityService.DeclaForm_Comment(bcomment_num);
			model.addAttribute("dto", dto);					
			return communityService.declalistC();
		}
	 
	 //게시글 신고 입력
	 @PostMapping(value = "/DeclaSend_post")
	   public ModelAndView DeclaSend_post(@RequestParam HashMap<String, Object> params) {
	      logger.info("게시글 신고하기 : {}", params);
	      return communityService.DeclaSend_post(params);
	   }
	 //댓글 신고 입력
	 @PostMapping(value = "/DeclaSend_comment")
	   public ModelAndView DeclaSend_comment(@RequestParam HashMap<String, Object> params) {
	      logger.info("댓글 신고하기 : {}", params);
	      return communityService.DeclaSend_comment(params);
	   }

	 
	
	
}
