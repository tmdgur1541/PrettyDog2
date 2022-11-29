package com.pretty.dog.service;


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pretty.dog.dao.MembersDAO;
import com.pretty.dog.dto.DogDTO;

@Service
public class MembersService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MembersDAO dao;
	
	public int joinShs(String id, String hashText, String name, String phone, String email) {
		
		return dao.joinShs(id,hashText,name,phone,email);
	}
	
	
	public int ShopjoinShs(String id, String hashText, String name, String phone, String email) {
		
		return dao.ShopjoinShs(id,hashText,name,phone,email);
	}
	
	
	public HashMap<String, Object> ShopjoinShs(HashMap<String, String> params) {
		logger.info("점주 회원가입 요청 서비스 도착!!");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = dao.ShopjoinShs(params);
		map.put("success", row);
		
		return map;
	}
	
	
	public HashMap<String, Object> overlayShsid(String id) {
		logger.info("중복체크 서비스 도착!!");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String overlayShsid = dao.overlayShsid(id);
		logger.info("중복 아이디 여부 : {}",overlayShsid);		
		boolean overlayid = overlayShsid == null ? false : true;		
		map.put("overlay", overlayid);		
		return map;
	}


	public void ShopInfo(MultipartFile shopPhoto, HashMap<String, String> params, String shopSaup) {
		logger.info("ShopInfo 서비스 도착!!");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = dao.ShopInfo(params);
		logger.info("성공{}",row);
		
		try {
			String oriFileName = shopPhoto.getOriginalFilename();
			int index = oriFileName.lastIndexOf(".");
			logger.info("index : {}",index);
			
			if(index>0) {
				String ext = oriFileName.substring(index);
				String newFileName = System.currentTimeMillis()+ext;
				logger.info(oriFileName+" => "+newFileName);
				
				byte[] bytes =shopPhoto.getBytes();
				Path path = Paths.get("C:/upload/"+newFileName);
				
				Files.write(path, bytes);
				logger.info(oriFileName+"save OK!!");
				dao.shopPhoto(shopSaup,oriFileName,newFileName);
			}
			Thread.sleep(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	public boolean PassCk(String id, String pw) {
		boolean success = false;
		
		String hashpw = dao.PassCk(id);
		
		if (hashpw != null) {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			success = encoder.matches(pw, hashpw);			
		}
		
		return success;
	}



	public DogDTO MyjungboSujungshs(String id) {
		logger.info("회원정보 서비스 도착");
		
		return dao.MyjungboSujungshs(id);
	}


	public DogDTO MyShopInfoshs(String id) {
		
		return  dao.MyShopInfoshs(id);
	}


	public int DogUp(String id, String dogname, String dogage, String dogweight, String dogchar) {
		
		return dao.DogUp(id,dogname,dogage,dogweight,dogchar);

	}


	public ModelAndView Mydogshs(String id) {
		
		ModelAndView mav = new ModelAndView();
		
		ArrayList<DogDTO> list = dao.Mydogshs(id);
		logger.info("size",list.size());
		mav.addObject("size",list.size());
		mav.addObject("list",list);
		mav.setViewName("Mydogshs");
		
		return mav;
	}


	public int DogDel(String id, String dogName) {
		
			logger.info("DogDel 서비스 도착");
		
			int delcnt = dao.DogDel(id,dogName);
			logger.info("삭제 성공 수 : {}",delcnt);
		return delcnt;
	}


	public DogDTO MyDogsujungshs(String id, String dogName) {
		logger.info(" 강아지 수정 폼 서비스 : {}",id+"/"+dogName);
		return dao.MyDogsujungshs(id,dogName);
	}


	public int DogSujung(String id, String dogname, String dogage, String dogweight, String dogchar) {
		int row = dao.DogSujung(id,dogname,dogage,dogweight,dogchar);
		
		return row;
	}


	public void memberOut(String id) {
		logger.info("회원탈퇴 서비스 도착 : {}",id );
		int memOutCnt = dao.memberOut(id);
	}



	public void shopup(HashMap<String, String> params) {
		String id = params.get("id");
		String busin_name = params.get("busin_name");
		logger.info("확인 : {}",id+"/"+busin_name);
		int idck = dao.shopIdck(id);
		logger.info("idck확인 : {}",idck);
		
		if(idck>0) {
			dao.shopup(params);
		}else {
			dao.shopIn(params);
		}
		
}

	public HashMap<String, Object> shopSaupCk(String shopSaup) {
		
		logger.info("사업자중복체크 서비스 도착!!");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String shopSaupCk = dao.shopSaupCk(shopSaup);
		logger.info("중복 아이디 여부 : {}",shopSaupCk);		
		boolean overlaySaup = shopSaupCk == null ? false : true;		
		map.put("shopSaup", overlaySaup);		
		return map;
	}


	public void userUp(HashMap<String, String> params) {
		String hashText = "";
		String pw = params.get("pw"); 
		logger.info("비밀번호값 : {}",pw);
		if(params.get("pw") != "") {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			hashText = encoder.encode(pw);
			params.put("pw", hashText);
		}
		
		logger.info("현재 비밀번호  : {}",params.get("pw"));
		int row = dao.userUp(params);
		logger.info("입력된 건수  : {}",row);
		
	}


	public ArrayList<DogDTO> memberPassCk(String id) {
		
		ArrayList<DogDTO> list = dao.memberPassCk(id);
		
		return list;
	}


	public DogDTO MyDogInfoshs(String id) {
		
		return dao.MyDogInfoshs(id);
		
	}




	  public ModelAndView MyPageAlarm(String loginId) {
	      ModelAndView mav = new ModelAndView();

	      ArrayList<DogDTO> memInfo = dao.AlarmMem(loginId);
	      
	      mav.addObject("loginId", loginId);
	      mav.addObject("memInfo", memInfo);
	      mav.setViewName("cywMyPageAlram");
	      
	      return mav;
	   }

	   public HashMap<String, Object> AlrimPageList(int currPage, int pagePerCnt, String loginId) {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      
	      //어디서부터 보여줘야 하는가?
	      int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
	      logger.info("offset:{}",offset);
	      
	      int totalCount = dao.AlrimPageListCount(loginId); 
	      
	      int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
	      
	      logger.info("총 갯수 : {}",totalCount);
	      logger.info("만들수 있는 총 페이지 :{}",range);
	      
	      map.put("pages", range);
	      map.put("list", dao.AlrimPageList(pagePerCnt,offset,loginId));
	      
	      return map;
	   }

	   public ModelAndView alarmDel(String alarm_num, RedirectAttributes rAttr) {
	      ModelAndView mav =new ModelAndView();
	      
	      int row = dao.alarmDel(alarm_num);
	      
	      if (row > 0) {
	         rAttr.addFlashAttribute("msg", "삭제가 완료되었습니다.");
	         mav.setViewName("redirect:/MyPageAlarm");
	      }else {
	         rAttr.addFlashAttribute("msg", "삭제가 불가능합니다.");
	         mav.setViewName("redirect:/MyPageAlarm");
	      }
	      
	      return mav;
	   }

	   public ModelAndView MyPageBoard(String loginId) {
	      ModelAndView mav = new ModelAndView();
	      
	      if (loginId != null) {
	    	  ArrayList<DogDTO> memInfo = dao.MyBoard(loginId);
	    	  
	    	  mav.addObject("loginId", loginId);
	    	  mav.addObject("memInfo", memInfo);
	    	  mav.setViewName("cywMyPageBoard");
		}else {
//			mav.setViewName("redirect:/loginPage");
			mav.setViewName("cywMyPageBoard");
		}
	      
	      return mav;
	   }

	   public HashMap<String, Object> MyBoardPageList(int currPage, int pagePerCnt, String loginId) {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      
	      //어디서부터 보여줘야 하는가?
	      int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
	      logger.info("offset:{}",offset);
	      
	      int totalCount = dao.MyBoardPageListCount(loginId); 
	      
	      int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
	      
	      logger.info("총 갯수 : {}",totalCount);
	      logger.info("만들수 있는 총 페이지 :{}",range);
	      
	      map.put("pages", range);
	      map.put("list", dao.MyBoardPageList(pagePerCnt,offset,loginId));
	      
	      return map;
	   }

	   public ModelAndView boardDel(String community_boardnum, String loginId, RedirectAttributes rAttr) {
	      ModelAndView mav =new ModelAndView();
	      
	      int row = dao.boardDel(community_boardnum,loginId);
	      
	      if (row > 0) {
	         rAttr.addFlashAttribute("msg", "삭제가 완료되었습니다.");
	         mav.setViewName("redirect:/MyPageBoard");
	      }else {
	         rAttr.addFlashAttribute("msg", "삭제가 불가능합니다.");
	         mav.setViewName("redirect:/MyPageBoard");
	      }
	      
	      return mav;
	   }

	   public ModelAndView MyPageComment(String loginId) {
	      ModelAndView mav = new ModelAndView();
	      
	      ArrayList<DogDTO> memInfo = dao.MyComment(loginId);
	      
	      mav.addObject("loginId", loginId);
	      mav.addObject("memInfo", memInfo);
	      mav.setViewName("cywMyPageComment");
	      
	      return mav;
	   }

	   public HashMap<String, Object> CommentPageList(int currPage, int pagePerCnt, String loginId) {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      
	      //어디서부터 보여줘야 하는가?
	      int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
	      logger.info("offset:{}",offset);
	      
	      int totalCount = dao.CommentPageListCount(loginId); 
	      
	      int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
	      
	      logger.info("총 갯수 : {}",totalCount);
	      logger.info("만들수 있는 총 페이지 :{}",range);
	      
	      map.put("pages", range);
	      map.put("list", dao.CommentPageList(pagePerCnt,offset,loginId));
	      
	      return map;
	   }

	   public ModelAndView commentDel(String bcomment_num, String loginId, RedirectAttributes rAttr) {
	      ModelAndView mav =new ModelAndView();
	      
	      int row = dao.commentDel(bcomment_num,loginId);
	      
	      if (row > 0) {
	         rAttr.addFlashAttribute("msg", "삭제가 완료되었습니다.");
	         mav.setViewName("redirect:/MyPageBoard");
	      }else {
	         rAttr.addFlashAttribute("msg", "삭제가 불가능합니다.");
	         mav.setViewName("redirect:/MyPageBoard");
	      }
	      
	      return mav;
	   }

	   public ModelAndView MyPageLikeShop(String loginId) {
	      
	      ModelAndView mav = new ModelAndView();
	      
	      ArrayList<DogDTO> memInfo = dao.MyLikeShop(loginId);
	      
	      mav.addObject("loginId", loginId);
	      mav.addObject("memInfo", memInfo);
	      mav.setViewName("cywMyPageLikeShop");
	      
	      return mav;
	   }

	   public HashMap<String, Object> MyLikeShopList(int currPage, int pagePerCnt, String loginId) {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      
	      //어디서부터 보여줘야 하는가?
	      int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
	      logger.info("offset:{}",offset);
	      
	      int totalCount = dao.MyLikeShopListCount(loginId); 
	      
	      int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
	      
	      logger.info("총 갯수 : {}",totalCount);
	      logger.info("만들수 있는 총 페이지 :{}",range);
	      
	      map.put("pages", range);
	      map.put("list", dao.MyLikeShopList(pagePerCnt,offset,loginId));
	      
	      
	      return map;
	   }

	   public ModelAndView LikeShopDel(String interestshop_num, String loginId, RedirectAttributes rAttr) {
	      ModelAndView mav =new ModelAndView();
	      
	      int success = dao.shopLikeCount(interestshop_num,loginId);
	      int row = dao.LikeShopDel(interestshop_num,loginId);
	      
	      if (row > 0) {
	         rAttr.addFlashAttribute("msg", "삭제가 완료되었습니다.");
	         mav.setViewName("redirect:/MyPageBoard");
	      }else {
	         rAttr.addFlashAttribute("msg", "삭제가 불가능합니다.");
	         mav.setViewName("redirect:/MyPageBoard");
	      }
	      
	      return mav;
	   }

	   public ModelAndView MyPageReserPage(String loginId) {
	      ModelAndView mav = new ModelAndView();
	      
	      ArrayList<DogDTO> memInfo = dao.MyPageReserPage(loginId);
	      
	      mav.addObject("loginId", loginId);
	      mav.addObject("memInfo", memInfo);
	      mav.setViewName("cywMyPageReser");
	      
	      return mav;
	   }

	   public HashMap<String, Object> MyReserPageList(int currPage, int pagePerCnt, String loginId) {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      
	      //어디서부터 보여줘야 하는가?
	      int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
	      logger.info("offset:{}",offset);
	      
	      int totalCount = dao.MyReserPageListCount(loginId); 
	      
	      int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
	      
	      logger.info("총 갯수 : {}",totalCount);
	      logger.info("만들수 있는 총 페이지 :{}",range);
	      
	      map.put("pages", range);
	      map.put("list", dao.MyReserPageList(pagePerCnt,offset,loginId));
	      
	      
	      return map;
	   }

	   public ModelAndView reserDel(String reser_num, String loginId, RedirectAttributes rAttr, String busin_num, int businChange, int normalChange, String reserDay, String canReserTime) {
	      ModelAndView mav =new ModelAndView();
	   
	      int row = dao.reserDel(reser_num,loginId);
	      logger.info("마이페이지예약취소사업자번호:{}",busin_num);
	      if (row > 0) {
	         // 예약취소 후의 데이터 불러오기
	         HashMap<String, Object> list = dao.reserData(reser_num,loginId);
	         logger.info("예약취소 후의 데이터 불러오기?:{}",list);
	         // 예약취소 후 예약히스토리 등록
	         int success = dao.reserLogInsert(list);
	         logger.info("예약취소 후 예약히스토리 등록?:{}",success);
	         // 알람등록(일반회원)
	         int Alarm = dao.reserCancleInsert(list);
	         logger.info("알람등록(일반회원)?:{}",Alarm);
	         // 알람등록(업주회원)
	         int OwnerAlarm = dao.OwnerCancleInsert(list);
	         logger.info("알람등록(업주회원)?:{}",OwnerAlarm);
	         // 회원포인트 추가
	         int reserDelMemPointAdd = dao.reserDelMemPointAdd(loginId,normalChange);
	         logger.info("회원포인트 추가?:{}",reserDelMemPointAdd);
	         // 회원포인트 추가 포인트테이블등록
	         int reserDelMemPointTable = dao.reserDelMemPointTable(loginId,normalChange);
	         logger.info("회원포인트 추가 포인트테이블등록?:{}",reserDelMemPointTable);
	         // 업주회원 노포인트 차감
	         int reserDelOwnerPointDel = dao.reserDelOwnerPointDel(normalChange,busin_num);
	         logger.info("업주회원 노포인트 차감?:{}",reserDelOwnerPointDel);
	         // 업주회원포인트 차감 포인트테이블 등록
	         int reserDelOwnerPointTable = dao.reserDelOwnerPointTable(normalChange,busin_num);
	         logger.info("업주회원포인트 차감 포인트테이블 등록?:{}",reserDelOwnerPointTable);
	         // 업주 회원 노포인트에서 포인트로 이동
	         int reserDelOwnerPointChange = dao.reserDelOwnerPointChange(businChange,busin_num);
	         logger.info("업주 회원 노포인트에서 포인트로 이동?:{}",reserDelOwnerPointChange);
	         // 업주 회원 포인트 더하기
	         int reserDelOwnerPointAdd = dao.reserDelOwnerPointAdd(businChange,busin_num);
	         logger.info("업주 회원 포인트 더하기?:{}",reserDelOwnerPointAdd);
	         // 예약가능 상태로 변경
	         int reserStateChange = dao.reserStateChange(busin_num,reserDay,canReserTime);
	         logger.info("예약가능 상태로 변경?:{}",reserStateChange);
	         
	         rAttr.addFlashAttribute("msg", "예약취소가 완료되었습니다.");
	         mav.setViewName("redirect:/MyPageReserPage");
	      }else {
	         rAttr.addFlashAttribute("msg", "예약취소가 불가능합니다.");
	         mav.setViewName("redirect:/MyPageReserPage");
	      }
	      return mav;
	   }

	   public ModelAndView OwnerReserPage(String loginId) {
	      ModelAndView mav = new ModelAndView();
	      
	      ArrayList<DogDTO> memInfo = dao.OwnerReserPage(loginId);
	      
	      mav.addObject("loginId", loginId);
	      mav.addObject("memInfo", memInfo);
	      mav.setViewName("cywMyPageOwnerReser");
	      
	      return mav;
	   }

	   public HashMap<String, Object> OwnerReserPageList(int currPage, int pagePerCnt, String loginId) {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      
	      //어디서부터 보여줘야 하는가?
	      int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
	      logger.info("offset:{}",offset);
	      
	      int totalCount = dao.OwnerReserPageListCount(loginId); 
	      
	      int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
	      
	      logger.info("총 갯수 : {}",totalCount);
	      logger.info("만들수 있는 총 페이지 :{}",range);
	      
	      map.put("pages", range);
	      map.put("list", dao.OwnerReserPageList(pagePerCnt,offset,loginId));
	      
	      
	      return map;
	   }

	   public ModelAndView NoShowChange(String reser_num, String loginId, RedirectAttributes rAttr, String busin_num,String reser_money) {
	      ModelAndView mav =new ModelAndView();
	      
	      int row = dao.NoShowChange(reser_num,loginId);
	      
	      if (row > 0) {
	         HashMap<String, Object> list = dao.reserData(reser_num,loginId);
	         logger.info("노쇼처리하고 정보해쉬맵?:{}",list);
	         // 노쇼처리 후 예약히스토리 등록
	         int success = dao.reserLogNoshow(list);
	         logger.info("노쇼처리하고 예약히스토리 등록?:{}",success);
	         // 노쇼처리 후 업주 노포인트에서 차감 
	         int NoShopNoPoint = dao.NoShopNoPoint(busin_num,reser_num,reser_money);
	         logger.info("노쇼처리 후 업주 노포인트에서 차감 ?:{}",NoShopNoPoint);
	         // 노쇼처리 후 업주 포인트에서 가감
	         int NoShowPointAdd = dao.NoShowPointAdd(busin_num,reser_money);
	         logger.info("노쇼처리 후 업주 포인트에서 가감?:{}",NoShowPointAdd);
	         
	         rAttr.addFlashAttribute("msg", "노쇼처리가 완료되었습니다.");
	         mav.setViewName("redirect:/OwnerReserPage");
	      }else {
	         rAttr.addFlashAttribute("msg", "노쇼처리가 불가능합니다.");
	         mav.setViewName("redirect:/OwnerReserPage");
	      }
	      return mav;
	   }

	   public ModelAndView SuccessChange(String reser_num, String loginId, RedirectAttributes rAttr, String busin_num, String reser_money) {
	      ModelAndView mav =new ModelAndView();
	      
	      int row = dao.SuccessChange(reser_num,loginId);
	      
	      if (row > 0) {
	         HashMap<String, Object> list = dao.reserData(reser_num,loginId);
	         logger.info("이용완료처리하고 정보해쉬맵?:{}",list);
	         // 예약취소 후 예약히스토리 등록
	         int success = dao.reserLogSuccess(list);
	         // 일반회원 알림서비스
	         int AlarmInsert = dao.AlarmInsert(list);
	         
	         // 이용완료 후 업주 노포인트에서 차감 
	         int UseSuccessNoPoint = dao.UseSuccessNoPoint(busin_num,reser_num,reser_money);
	         logger.info("이용완료 후 업주 노포인트에서 차감 ?:{}",UseSuccessNoPoint);
	         // 이용완료 후 업주 포인트에서 가감
	         int UseSuccessPointAdd = dao.UseSuccessPointAdd(busin_num,reser_money);
	         logger.info("이용완료 후 업주 포인트에서 가감?:{}",UseSuccessPointAdd);
	         
	         rAttr.addFlashAttribute("msg", "이용완료처리가 완료되었습니다.");
	         mav.setViewName("redirect:/OwnerReserPage");
	      }else {
	         rAttr.addFlashAttribute("msg", "이용완료처리가 불가능합니다.");
	         mav.setViewName("redirect:/OwnerReserPage");
	      }
	      return mav;
	   }

	   public ModelAndView OwnerReserLogPage(String loginId) {
	      ModelAndView mav = new ModelAndView();
	      
	      ArrayList<DogDTO> memInfo = dao.OwnerReserLogPage(loginId);
	      
	      mav.addObject("loginId", loginId);
	      mav.addObject("memInfo", memInfo);
	      mav.setViewName("cywMyPageReserLog");
	      
	      return mav;
	   }

	   public HashMap<String, Object> ReserLogList(int currPage, int pagePerCnt, String loginId) {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      
	      //어디서부터 보여줘야 하는가?
	      int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
	      logger.info("offset:{}",offset);
	      
	      int totalCount = dao.ReserLogListCount(loginId); 
	      
	      int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
	      
	      logger.info("총 갯수 : {}",totalCount);
	      logger.info("만들수 있는 총 페이지 :{}",range);
	      
	      map.put("pages", range);
	      map.put("list", dao.ReserLogList(pagePerCnt,offset,loginId));
	      
	      
	      return map;
	   }

	   public ModelAndView ShopServicePage(String loginId) {
	      ModelAndView mav = new ModelAndView();
	      
	      // 해당 아이디의 매장 정보
	      ArrayList<DogDTO> ShopServiceList = dao.ShopServiceList(loginId);
	      
	      // 해당 매장 서비스 목록 과 추가항목 리스트
	      ArrayList<DogDTO> ServiceInfoList = dao.ShopService(loginId);
	      // 소형견 서비스
	      ArrayList<DogDTO> AddSmallServiceName = dao.AddSmallServiceName();
	      // 중형견 서비스
	      ArrayList<DogDTO> AddMiddleServiceName = dao.AddMiddleServiceName();
	      // 대형견 서비스
	      ArrayList<DogDTO> AddBigServiceName = dao.AddBigServiceName();
	      logger.info("서비스 가져오냐?{}",AddSmallServiceName);
	      
	      mav.addObject("loginId", loginId);
	      mav.addObject("AddSmallServiceName", AddSmallServiceName);
	      mav.addObject("AddMiddleServiceName", AddMiddleServiceName);
	      mav.addObject("AddBigServiceName", AddBigServiceName);
	      mav.addObject("ShopServiceList", ShopServiceList);
	      mav.addObject("ServiceInfoList", ServiceInfoList);
	      mav.setViewName("cywShopService");
	      
	      return mav;
	   }

	   public ModelAndView SreviceDel(String price_num, RedirectAttributes rAttr) {
	      ModelAndView mav = new ModelAndView();
	      
	      int row = dao.SreviceDel(price_num);
	      
	      if (row > 0) {
	         rAttr.addFlashAttribute("msg", "서비스가 삭제 되었습니다.");
	         mav.setViewName("redirect:/ShopServicePage");
	      }else {
	         rAttr.addFlashAttribute("msg", "서비스삭제에 실패했습니다.");
	         mav.setViewName("redirect:/ShopServicePage");
	      }
	      
	      return mav;
	   }

	   public ModelAndView addShopSmallService(String inputText1, String serviceName1, String busin_num, RedirectAttributes rAttr) {
	      ModelAndView mav = new ModelAndView();
	      
	      int row = dao.addShopSmallService(inputText1,serviceName1,busin_num);
	      
	      if (row > 0) {
	         rAttr.addFlashAttribute("msg", "서비스가 추가 되었습니다.");
	         mav.setViewName("redirect:/ShopServicePage");
	      }else {
	         rAttr.addFlashAttribute("msg", "서비스추가에 실패했습니다.");
	         mav.setViewName("redirect:/ShopServicePage");
	      }
	      
	      return mav;
	   }

	   public ModelAndView addShopMiddleService(String inputText2, String serviceName2, String busin_num,
	         RedirectAttributes rAttr) {
	      ModelAndView mav = new ModelAndView();
	      
	      int row = dao.addShopMiddleService(inputText2,serviceName2,busin_num);
	      
	      if (row > 0) {
	         rAttr.addFlashAttribute("msg", "서비스가 추가 되었습니다.");
	         mav.setViewName("redirect:/ShopServicePage");
	      }else {
	         rAttr.addFlashAttribute("msg", "서비스추가에 실패했습니다.");
	         mav.setViewName("redirect:/ShopServicePage");
	      }
	      
	      return mav;
	   }

	   public ModelAndView addShopBigService(String inputText3, String serviceName3, String busin_num,
	         RedirectAttributes rAttr) {
	      ModelAndView mav = new ModelAndView();
	      
	      int row = dao.addShopBigService(inputText3,serviceName3,busin_num);
	      
	      if (row > 0) {
	         rAttr.addFlashAttribute("msg", "서비스가 추가 되었습니다.");
	         mav.setViewName("redirect:/ShopServicePage");
	      }else {
	         rAttr.addFlashAttribute("msg", "서비스추가에 실패했습니다.");
	         mav.setViewName("redirect:/ShopServicePage");
	      }
	      
	      return mav;
	   }



	


	






	


	
	

	
}
