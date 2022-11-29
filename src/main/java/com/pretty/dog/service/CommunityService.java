package com.pretty.dog.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pretty.dog.dao.CommunityDAO;
import com.pretty.dog.dto.DogDTO;


@Service
public class CommunityService {
	
	@Autowired CommunityDAO communityDao;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//카테고리 불러오기
	public ArrayList<DogDTO> categoryList() {
		logger.info("카테고리 가져오기 서비스");
		return communityDao.categoryList();
	}
	
	
	//페이징, 카테고리 필터링, 검색
		 public HashMap<String, Object> listCall(int currPage, int pagePerCnt, int catNum, String searchOpt, String keyword ) {
		      
			 logger.info("리스트콜 서비스 도착");
			 
			 HashMap<String, Object> sendMap = new HashMap<String, Object>();
		      HashMap<String, Object> map = new HashMap<String, Object>(); 
		      
		      int offset = ((currPage-1) * pagePerCnt-1) >=0 ? ((currPage-1) * pagePerCnt-1) : 0; //어디서부터 보여줘야 하는가?
		      
		      int totalCount = communityDao.allCount(catNum);
		      
		      int range = totalCount%pagePerCnt>0?	
		    		  (totalCount/pagePerCnt)+1:(totalCount/pagePerCnt);
		      logger.info("총갯수:{}",totalCount);
		      logger.info("만들 수 있는 총 페이지:{}",range);	      
		      logger.info("리스트 콜 서비스 : DAO 호출");
		      
		      sendMap.put("pagePerCnt", pagePerCnt);
		      sendMap.put("offset", offset);
		      sendMap.put("catNum", catNum);
		      sendMap.put("searchOpt", searchOpt);
		      sendMap.put("keyword", keyword);
		      
		      map.put("pages",range);
		      map.put("list",communityDao.listCall(sendMap));
		      
		      //logger.info("Map에 담긴 정보"+map);
		      
		      return map;
		   }
	
	//게시글 작성
	public String freeWrite( HashMap<String, Object> params, MultipartFile imgs){
		
	      String page = "freeWriteForm";
	      HashMap<String, Object> freeWrite = params;
	      //HashMap<String, Object> beautyTrendWrite = new HashMap<String, Object>();
	      logger.info("글쓰기 서비스");
	      freeWrite.put("community_sub", params.get("community_sub"));
	      
	      freeWrite.put("community_cont", params.get("community_cont"));
	      
	      freeWrite.put("mem_id", params.get("mem_id"));
	      
	      freeWrite.put("category_num",Integer.parseInt((String) params.get("category_num")));
	      //dto.setCategory_num(Integer.parseInt((String) params.get("category_num"))
	      freeWrite.put("community_boardnum", 0);
	      
	      
	      System.out.println(freeWrite.get("community_sub"));
	      System.out.println(freeWrite.get("community_cont"));
	      System.out.println(freeWrite.get("mem_id"));	     
	      System.out.println(freeWrite.get("category_num"));
	      communityDao.freeWrite(freeWrite);

	      int community_boardnum = (int) freeWrite.get("community_boardnum");
	    
	      System.out.println("community_boardnum: " + community_boardnum);
	     
	      if(community_boardnum > 0) {
	         page = "redirect:/freeDetail?community_boardnum="+community_boardnum;
	         saveFile(community_boardnum, imgs);
	      }	     
	      return page;
	   }
	 
		// 파일저장
	   private void saveFile(int community_boardnum, MultipartFile imgs){
		   
	      String oriFileName = imgs.getOriginalFilename();
	      logger.info("세이브 파일 서비스");
	      int index = oriFileName.lastIndexOf(".");
	      try {
	         if(index>0) {
	            String ext = oriFileName.substring(index);// 확장자(보여주기 시작할 인덱스)
	            logger.info("ext : {}", ext);
	            String newFileName = System.currentTimeMillis()+ext; // 새로운 파일명 생성(중복을 피하기 위해 / 확장자 없으면 사용 불가)
	            logger.info(oriFileName + " = >" + newFileName);
	            byte[] bytes = imgs.getBytes(); // photo에 여러개의 정보(파일명/크기/byte... 등등)가 있지만 byte만 뽑아와서 byte[]배열에 담아준다
	            
	            Path path = Paths.get("C:/upload/"+ newFileName); // 파일을 저장할 경로와 파일 이름을 설정해 준다.
	            // 파일을 저장할 경로와 파일 이름을 설정해 준다.
	            //"C:/STUDY/PrettyDog/PrettyDog/src/main/webapp/resources/trend/" + newFileName);
	            
	            // 스트림을 사용 안해서 Files가  nio 라는걸 알수 있다 Files의 라이트 메서드를 사용해서(저장할 위치와 photo로부터 뽑아온 byte[]의 값을 사용해서 저장한다.)
	            // 이때는 그냥 컴퓨터에 저장을 하는것(DB에 저장은 dao로 해야 한다.)
	            System.out.println(path);
	            Files.write(path, bytes);
	            // Files.write(path, bytes); 까지 성공 하면 컴퓨터에 저장이 된거기 때문에 oriFileName 을 출력할수 있기 때문에 logger 로 확인해 본다
	            logger.info(oriFileName + "SAVE OK!!"); 
	            communityDao.saveFile(community_boardnum, oriFileName, newFileName);// DB 에 저장할 파일명을 기록               
	         }
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	   }
	
	//상세보기   
	public DogDTO freeDetail(String community_boardnum) {

		DogDTO dto = null;
		int success=communityDao.community_view(community_boardnum);
		
		if(success>0) {
			
			dto = communityDao.freeDetail(community_boardnum);
		}
		return dto;
		
	}
	
	
	//사진 출력
	public ArrayList<DogDTO> photoList(String community_boardnum) {
		logger.info("사진 출력");
		return communityDao.photoList(community_boardnum);
	}

	//게시글 삭제
	public void freeDelete(String community_boardnum) {
		 //1. 게시물에 사진이 있는지 확인
	      ArrayList<DogDTO> list = communityDao.photoList(community_boardnum);
	      
	      //2. 게시물 삭제
	      int success = communityDao.freeDelete(community_boardnum);

	      //3. 삭제가 완료되면 D:/upload/ 에 해당 파일 삭제(이때 newFileName을 이용)
	      
	      if(success>0) {
	         for(DogDTO dto : list) {
	            //4. 있으면 업로드 된 사진 이름(newFileName) 알아오기
	            File file = new File("C:/STUDY/PrettyDog/src/main/webapp/resources/commu/" + dto.getBphoto_newname());
	            boolean yn = file.delete();      
	            logger.info(dto.getBphoto_oriname()+" delete : "+yn);
	         }         
	      }
		
	}

	//게시글 수정폼 이동
	public String freeUpdateForm(Model model, String community_boardnum) {

		DogDTO dto = communityDao.freeDetail(community_boardnum);
			ArrayList<DogDTO> list = communityDao.photoList(community_boardnum);
	      
			logger.info("subject : "+dto.getCommunity_sub());
			logger.info("category : "+dto.getCategory_num());
			logger.info("cont : "+dto.getCommunity_cont());
			logger.info("photo : {}",list);
	      
			model.addAttribute("dto",dto);
			model.addAttribute("imgs",list);
		
		
		return "freeUpdateForm";
	}

	//게시글 수정
	
	
	
	public String freeUpdate(MultipartFile imgs, HashMap<String, String> params) {


	      int community_boardnum= Integer.parseInt(params.get("community_boardnum"));

	      System.out.println("업데이트할 게시물 번호 : " + community_boardnum);
	      System.out.println("업로드 할 파일 명 : "+ imgs.getOriginalFilename());

	      String page = "redirect:/freeUpdateForm?community_boardnum="+community_boardnum;

	      ArrayList<DogDTO> dto = new ArrayList<DogDTO>();
	   
	      if(communityDao.freeUpdate(params)>0) {

	         page = "redirect:/freeDetail?community_boardnum="+community_boardnum;
	         
	         if(communityDao.photoList(Integer.toString(community_boardnum)).size() > 0 && imgs.getOriginalFilename() != "")//기존이미지가 있을경우 삭제 뒤 새로 삽입
	         {//상세보기에서 게시물 정보 추출 
	        	 dto = communityDao.photoList(Integer.toString(community_boardnum));
	        	 System.out.println("사진이 있을 경우");
	        	 System.out.println("bphoto_newname 확인" + dto.get(0).getBphoto_newname());
		         File file = new File("C:/STUDY/PrettyDog/src/main/webapp/resources/commu/" + dto.get(0).getBphoto_newname());
		         boolean yn = file.delete();
		         String NewFileName = (String)dto.get(0).getBphoto_newname();// 추출된 정보에서 새 파일 이름 get
		         System.out.println("기존게시물 이미지 = " + NewFileName);
		         logger.info(dto.get(0).getBphoto_newname() +"delete : " + yn);
		         communityDao.free_imgDelete(NewFileName);//해당 파일명 삭제 
	        	 saveFile(community_boardnum, imgs);
	        	 
	         }else{
	        	 //사진 딜리트 제외하고 일반 글쓰기처럼 일반 업데이트
	        	 System.out.println("사진이 없을 경우 ");
	        	 saveFile(community_boardnum, imgs);
	        	 
	         }	         
	      }
	      return page;
	   }
	
	

	//댓글리스트 출력
	public ArrayList<DogDTO> commentList(String community_boardnum) {
		return communityDao.commentList(community_boardnum);
	}

	//댓글  삭제
	public void free_commentDelete(int bcn) {
		
		communityDao.free_commentDelete(bcn);
		
	}

	//댓글 번호 찾기
	public int boardNumOfdelCom(int bcn) {
		
		return communityDao.boardNumOfdelCom(bcn);
	}

	// 댓글 작성
	public void free_commentWrite(DogDTO dto) {
		logger.info("댓글입력 서비스");
		communityDao.free_commentWrite(dto);
		
	}

	//게시글 신고 폼 
	public DogDTO DeclaForm_Post(String community_boardnum) {
		DogDTO dto = communityDao.freeDetail(community_boardnum);				
		return dto;
	}
	
	//댓글 신고 폼
	public DogDTO DeclaForm_Comment(String bcomment_num) {
		DogDTO dto = communityDao.commentDetail(bcomment_num);
		return dto;
	}
	
	//신고옵션 출력 ~ 게시글
	public ModelAndView declalist() {
		
		ModelAndView mav = new ModelAndView();
		
		ArrayList<DogDTO> list = communityDao.declalist();
		
		System.out.println(list);
		
		mav.addObject("list", list);
		mav.setViewName("DeclaForm_Post");
		
		return mav;
	}
	
	//신고옵션 출력 ~ 댓글
	public ModelAndView declalistC() {
		ModelAndView mav = new ModelAndView();
		
		ArrayList<DogDTO> list = communityDao.declalistC();
		
		System.out.println(list);
		
		mav.addObject("list", list);
		mav.setViewName("DeclaForm_Comment");
		
		return mav;
	}
	//게시글 신고 제출
	public ModelAndView DeclaSend_post(HashMap<String, Object> params) {
		 ModelAndView mav = new ModelAndView();
		 communityDao.DeclaSend_post(params);
		 
		 logger.debug("게시글 신고 서비스");
		 //int boardNum = (int) params.get("dec_targetNum");
		 
		 //System.out.println("신고 할 때 받아온 게시물 번호"+boardNum);
		 
		 //신고 완료시 해당 디테일 페이지 새로고침 
	     mav.setViewName("redirect:/freeList");
	     return mav;

	}

	//댓글 신고 제출
	public ModelAndView DeclaSend_comment(HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView();
		communityDao.DeclaSend_comment(params);
		
		logger.info("댓글신고 서비스");
		//int boardNum = (int) params.get("dec_targetNum");
		
		//System.out.println("신고 할 때 받아온 게시물 번호"+boardNum);
		
		//신고 완료시 해당 디테일 페이지 새로고침 
		mav.setViewName("redirect:/freeList");
		return mav;
	}



	
}
