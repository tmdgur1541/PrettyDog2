package com.pretty.dog.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pretty.dog.dao.AdminPageDAO;
import com.pretty.dog.dto.DogDTO;

@Service
public class AdminPageService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired AdminPageDAO dao;
	
	//관리자 회원리스트
	public ModelAndView apuserlist2(String loginId) {
		ModelAndView mav = new ModelAndView();
		
		int AdminCheck = dao.AdminPageCheck(loginId);
	  	if (AdminCheck == 1) {
	  		mav.setViewName("APuserList2");
	  	}else {
	  		mav.addObject("loginSuccessAlert", "관리자만 사용할수 있는 페이지입니다.");
	  		mav.setViewName("Main");
	  	}  
		return mav;
	}

	public HashMap<String, Object> apuserlist3(int currPage, int pagePerCnt, String a, int b1, int c1) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//어디서부터 보여줘야 하는가?
		int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
		logger.info("offset:{}",offset);
		
		int totalCount = dao.apuserlist3Count(a,b1,c1); 
		
		int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
		
		logger.info("총 갯수 : {}",totalCount);
		logger.info("만들수 있는 총 페이지 :{}",range);
		
		map.put("pages", range);
		map.put("list", dao.apuserlist3(pagePerCnt,offset,a,b1,c1));
		
		return map;
	}	
	
/*	public HashMap<String, Object> apuserlist30(int currPage, int pagePerCnt, String a, int b1, int c1) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		logger.info("시발:{}",a);
		logger.info("시발:{}",b1);
		logger.info("시발:{}",c1);
		
		//어디서부터 보여줘야 하는가?
		int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
		logger.info("offset:{}",offset);
		
		int totalCount = dao.apuserlist30Count(a,b1,c1); 
		
		int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
		
		logger.info("총 갯수 : {}",totalCount);
		logger.info("만들수 있는 총 페이지 :{}",range);
		
		map.put("pages", range);
		map.put("list", dao.apuserlist30(pagePerCnt,offset,a,b1,c1));
		
		return map;
	}*/
	
	
	

	public DogDTO detail(String id) {
		
		return dao.detail(id);
	}

	public void userupdate(HashMap<String, String> params) {
		
		String id = params.get("id");
		String state = params.get("state");
		String rank = params.get("rank");
		
		logger.info(id+"/"+state+"/"+rank);
		
		int row = dao.userupdate(id,state,rank);
		logger.info("수정 성공 여부 : "+row);
	}

	public void pointupdate(HashMap<String, String> params, RedirectAttributes rArrt) {
		
		String id = params.get("id");
		String CHpoint = params.get("CHpoint");
		String pointstate = params.get("pointstate");
		
		logger.info(id+"/"+CHpoint+"/"+pointstate);
		int row = dao.pointupdate(id,CHpoint,pointstate);
		if (row > 0) {
			dao.adminPointAdd(id,CHpoint,pointstate);
		}
		rArrt.addFlashAttribute("success", row);
		
		logger.info("수정 성공 여부 : "+row);
	}

	//관리자 매장
	public ModelAndView apshoplist2(String loginId) {
		ModelAndView mav = new ModelAndView();
		
		int AdminCheck = dao.AdminPageCheck(loginId);
	  	if (AdminCheck == 1) {
	  		mav.setViewName("APshopList2");
	  	}else {
	  		mav.addObject("loginSuccessAlert", "관리자만 사용할수 있는 페이지입니다.");
	  		mav.setViewName("Main");
	  	}  
		return mav;
	}

	public HashMap<String, Object> apshoplist3(int currPage, int pagePerCnt, String a, int b1) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//어디서부터 보여줘야 하는가?
		int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
		logger.info("offset:{}",offset);
		
		int totalCount = dao.apshoplist3Count(a,b1); 
		
		int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
		
		logger.info("총 갯수 : {}",totalCount);
		logger.info("만들수 있는 총 페이지 :{}",range);
		
		map.put("pages", range);
		map.put("list", dao.apshoplist3(pagePerCnt,offset,a,b1));
		
		return map;
	}	

	
	
	
	

	public DogDTO adminshopdetail(String shop) {
		
		return dao.shopdetail(shop);
	}

	public int adminshopdetail2(String shop) {
		
		
		int totalCount = dao.shopdetail2(shop);
		logger.info("totalCount:{}",totalCount);
		
		
		return  totalCount;
	}

	public int adminshopdetail3(String shop) {
		
		int totalCount = dao.shopdetail3(shop);
		logger.info("totalCount:{}",totalCount);
		
		return totalCount;
	}

	public int adminshopmoney(String shop) {
		
		int totalCount = dao.shopmoney(shop);
		logger.info("totalCount:{}",totalCount);
		
		return totalCount;
	}

	
	 public int adminshopmoney2(String shop) {
	  
		int totalCount = dao.shopmoney2(shop);
		logger.info("totalCount:{}",totalCount);
		  
		return totalCount; 
	 }

	public int adminshopmoney3(String shop) {
		
		int totalCount = dao.shopmoney3(shop);
		logger.info("totalCount:{}",totalCount);
		  
		return totalCount; 
	}

	public int adminshopmoney4(String shop) {

		int totalCount = dao.shopmoney4(shop);
		logger.info("totalCount:{}",totalCount);
		  
		return totalCount; 
	}

	public void shopdate(HashMap<String, String> params) {

		
		String shop = params.get("shop");
		String calss = params.get("calss");
		
		logger.info(shop+"/"+calss);
		
		int row = dao.shopdate(shop,calss);
		
		logger.info("수정 성공 여부 : "+row);
		
	}
	
	
	//관리자 포인트
	public ModelAndView appointlist2(String loginId) {
		ModelAndView mav = new ModelAndView();
		
		int AdminCheck = dao.AdminPageCheck(loginId);
	  	if (AdminCheck == 1) {
	  		mav.setViewName("APpointList2");
	  	}else {
	  		mav.addObject("loginSuccessAlert", "관리자만 사용할수 있는 페이지입니다.");
	  		mav.setViewName("Main");
	  	}  
		
		return mav;
	}
	
	public HashMap<String, Object> appointlist3(int currPage, int pagePerCnt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
		logger.info("offset:{}",offset);
		
		int totalCount = dao.appointlist3Count(); 
		
		int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
		
		logger.info("총 갯수 : {}",totalCount);
		logger.info("만들수 있는 총 페이지 :{}",range);
		
		map.put("pages", range);
		map.put("list", dao.appointlist3(pagePerCnt,offset));
		
		return map;
	}
	
	//관리자 예약
	public ModelAndView apreservelist2(String loginId) {
		
		ModelAndView mav = new ModelAndView();
		
		int AdminCheck = dao.AdminPageCheck(loginId);
	  	if (AdminCheck == 1) {
	  		mav.setViewName("APreserveList2");
	  	}else {
	  		mav.addObject("loginSuccessAlert", "관리자만 사용할수 있는 페이지입니다.");
	  		mav.setViewName("Main");
	  	}  
		
		
		return mav;
	}

	public HashMap<String, Object> apreservelist3(int currPage, int pagePerCnt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//어디서부터 보여줘야 하는가?
		int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
		logger.info("offset:{}",offset);
		
		int totalCount = dao.apreservelist3Count(); 
		
		int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
		
		logger.info("총 갯수 : {}",totalCount);
		logger.info("만들수 있는 총 페이지 :{}",range);
		
		map.put("pages", range);
		map.put("list", dao.apreservelist3(pagePerCnt,offset));
		
		return map;
	}


	  public ModelAndView categoryPage(String loginId) {
	      ModelAndView mav = new ModelAndView();
	      
	      int categoryPage = dao.SingoHangmokPage(loginId);
	      
		  	if (categoryPage == 1) {
				mav.setViewName("cywCateGory");
			}else {
				mav.addObject("loginSuccessAlert", "관리자만 사용할수 있는 페이지입니다.");
				mav.setViewName("Main");
			}
	      
	      return mav;
	   }

	   public HashMap<String, Object> categoryListCall(int currPage, int pagePerCnt) {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      
	      //어디서부터 보여줘야 하는가?
	      int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
	      logger.info("offset:{}",offset);
	      
	      int totalCount = dao.categoryListCount(); 
	      
	      int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
	      
	      logger.info("총 갯수 : {}",totalCount);
	      logger.info("만들수 있는 총 페이지 :{}",range);
	      
	      map.put("pages", range);
	      map.put("list", dao.categoryListCall(pagePerCnt,offset));
	      
	      return map;
	   }

	   public ModelAndView cateGoryAdd(String categoryName, String categoryClass, RedirectAttributes rAttr) {
	      
	      ModelAndView mav = new ModelAndView();
	      
	      int row = dao.cateGoryAdd(categoryName,categoryClass);
	      
	      if (row >0) {
	         rAttr.addFlashAttribute("msg", "등록이 완료되었습니다.");
	         mav.setViewName("redirect:/categoryPage");
	      }else {
	         rAttr.addFlashAttribute("msg", "등록이 실패했습니다.");
	         mav.setViewName("redirect:/categoryPage");
	      }
	      
	      return mav;
	   }

	   public ModelAndView categoryDel(String category_num, RedirectAttributes rAttr) {
	      ModelAndView mav = new ModelAndView();
	      
	      int row = dao.categoryDel(category_num);
	      if (row>0) {
	         rAttr.addFlashAttribute("msg1", "삭제에 성공하였습니다.");
	         mav.setViewName("redirect:/categoryPage");
	      }else {
	         rAttr.addFlashAttribute("msg1", "삭제에 실패하였습니다.");
	         mav.setViewName("redirect:/categoryPage");
	      }
	      
	      return mav;
	   }
	

	   public HashMap<String, Object> SingoHangmokList(int currPage, int pagePerCnt) {
		      HashMap<String, Object> map = new HashMap<String, Object>();
		      
		      //어디서부터 보여줘야 하는가?
		      int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
		      logger.info("offset:{}",offset);
		      
		      int totalCount = dao.SingoHangmokListCount(); 
		      
		      int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
		      
		      logger.info("총 갯수 : {}",totalCount);
		      logger.info("만들수 있는 총 페이지 :{}",range);
		      
		      map.put("pages", range);
		      map.put("list", dao.SingoHangmokList(pagePerCnt,offset));
		      
		      
		      return map;
		   }

		   public ModelAndView SingoHangmokAdd(String singoSub, RedirectAttributes rAttr) {
		      ModelAndView mav = new ModelAndView();
		      
		      int row = dao.SingoHangmokAdd(singoSub);
		      
		      if (row > 0) {
		         rAttr.addFlashAttribute("msg", "신고항목이 등록되었습니다.");
		         mav.setViewName("redirect:/SingoHangmokPage");
		      }else {
		         rAttr.addFlashAttribute("msg", "등록에 실패했습니다.");
		         mav.setViewName("redirect:/SingoHangmokPage");
		      }
		      
		      return mav;
		   }

		   public ModelAndView HangmokReUse(String decO_num, RedirectAttributes rAttr) {
		      ModelAndView mav = new ModelAndView();
		      
		      int row = dao.HangmokReUse(decO_num);
		      
		      if (row > 0) {
		         rAttr.addFlashAttribute("msg", "신고항목이 상태변경되었습니다.");
		         mav.setViewName("redirect:/SingoHangmokPage");
		      }else {
		         rAttr.addFlashAttribute("msg", "상태변경에 실패했습니다.");
		         mav.setViewName("redirect:/SingoHangmokPage");
		      }
		      
		      return mav;
		   }

		   public ModelAndView HangmokDel(String decO_num, RedirectAttributes rAttr) {
		      ModelAndView mav = new ModelAndView();
		      
		      int row = dao.HangmokDel(decO_num);
		      
		      if (row > 0) {
		         rAttr.addFlashAttribute("msg", "신고항목이 상태변경되었습니다.");
		         mav.setViewName("redirect:/SingoHangmokPage");
		      }else {
		         rAttr.addFlashAttribute("msg", "상태변경에 실패했습니다.");
		         mav.setViewName("redirect:/SingoHangmokPage");
		      }
		      
		      return mav;
		   }

	
		   public ModelAndView SingoListPage(String loginId) {
			      
			      ModelAndView mav = new ModelAndView();
			  	
				  	int AdminCheck = dao.SingoHangmokPage(loginId);
				  	if (AdminCheck == 1) {
				  		mav.setViewName("cywAdminSingoList");
				  	}else {
				  		mav.addObject("loginSuccessAlert", "관리자만 사용할수 있는 페이지입니다.");
				  		mav.setViewName("Main");
				  	}
			      
			      return mav;
			   }

			   public HashMap<String, Object> SingoNoCheckList(int currPage, int pagePerCnt) {
			      HashMap<String, Object> map = new HashMap<String, Object>();
			      
			      //어디서부터 보여줘야 하는가?
			      int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
			      logger.info("offset:{}",offset);
			      
			      int totalCount = dao.SingoNoCheckListCount(); 
			      
			      int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
			      
			      logger.info("총 갯수 : {}",totalCount);
			      logger.info("만들수 있는 총 페이지 :{}",range);
			      
			      map.put("pages", range);
			      map.put("list", dao.SingoNoCheckList(pagePerCnt,offset));
			      
			      
			      return map;
			   }

			   public ModelAndView SingoProcess(String decl_num, RedirectAttributes rAttr, String loginId) {
			      ModelAndView mav = new ModelAndView();
			      
//			      예약상태 변경
			      int row = dao.SingoProcess(decl_num);
			      
			      if (row > 0) {
			         // 예약처리테이블 등록
			         int success = dao.decAdminInsert(decl_num,loginId);
			         
			         rAttr.addFlashAttribute("msg", "신고가 처리상태가 되었습니다.");
			         mav.setViewName("redirect:/SingoListPage");
			      }else {
			         rAttr.addFlashAttribute("msg", "상태변경에 실패했습니다.");
			         mav.setViewName("redirect:/SingoListPage");
			      }
			      
			      return mav;
			   }
	

			   public ModelAndView SingoProcessListPage(String loginId) {
				      ModelAndView mav = new ModelAndView();
				    	
					  	int AdminCheck = dao.SingoHangmokPage(loginId);
					  	if (AdminCheck == 1) {
					  		mav.setViewName("cywAdminSingoProcess");
					  	}else {
					  		mav.addObject("loginSuccessAlert", "관리자만 사용할수 있는 페이지입니다.");
					  		mav.setViewName("Main");
					  	}
				      
				      return mav;
				   }

				   public HashMap<String, Object> SingoProcessList(int currPage, int pagePerCnt) {
				      HashMap<String, Object> map = new HashMap<String, Object>();
				      
				      //어디서부터 보여줘야 하는가?
				      int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
				      logger.info("offset:{}",offset);
				      
				      int totalCount = dao.SingoProcessListCount(); 
				      
				      int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
				      
				      logger.info("총 갯수 : {}",totalCount);
				      logger.info("만들수 있는 총 페이지 :{}",range);
				      
				      map.put("pages", range);
				      map.put("list", dao.SingoProcessList(pagePerCnt,offset));
				      
				      
				      return map;
				   }

				   public ModelAndView AdminServicePage(String loginId) {
				      ModelAndView mav = new ModelAndView();
				      
				      int AdminCheck = dao.SingoHangmokPage(loginId);
					  	if (AdminCheck == 1) {
					  		mav.setViewName("cywAdminAddService");
					  	}else {
					  		mav.addObject("loginSuccessAlert", "관리자만 사용할수 있는 페이지입니다.");
					  		mav.setViewName("Main");
					  	}
				      
				      
				      return mav;
				   }

				   public HashMap<String, Object> ServiceHangmokList(int currPage, int pagePerCnt) {
				      HashMap<String, Object> map = new HashMap<String, Object>();
				      
				      //어디서부터 보여줘야 하는가?
				      int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
				      logger.info("offset:{}",offset);
				      
				      int totalCount = dao.ServiceHangmokListCount(); 
				      
				      int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
				      
				      logger.info("총 갯수 : {}",totalCount);
				      logger.info("만들수 있는 총 페이지 :{}",range);
				      
				      map.put("pages", range);
				      map.put("list", dao.ServiceHangmokList(pagePerCnt,offset));
				      
				      
				      return map;
				   }	
	
	 
				   public ModelAndView UseServiceChange(String add_num, RedirectAttributes rAttr) {
					      ModelAndView mav = new ModelAndView();
					      
					      int row = dao.UseServiceChange(add_num);
					      
					      if (row > 0) {
					         
					         rAttr.addFlashAttribute("msg", "사용상태로 변경 되었습니다.");
					         mav.setViewName("redirect:/AdminServicePage");
					      }else {
					         rAttr.addFlashAttribute("msg", "상태변경에 실패했습니다.");
					         mav.setViewName("redirect:/AdminServicePage");
					      }
					      
					      return mav;
					   }

					   public ModelAndView NoUseServiceChange(String add_num, RedirectAttributes rAttr) {
					      ModelAndView mav = new ModelAndView();
					      
					      int row = dao.NoUseServiceChange(add_num);
					      
					      if (row > 0) {
					         
					         rAttr.addFlashAttribute("msg", "미사용상태로 변경 되었습니다.");
					         mav.setViewName("redirect:/AdminServicePage");
					      }else {
					         rAttr.addFlashAttribute("msg", "상태변경에 실패했습니다.");
					         mav.setViewName("redirect:/AdminServicePage");
					      }
					      
					      return mav;
					   }

					   public ModelAndView ServiceHangmokAdd(String serviceDog, String serviceSub, RedirectAttributes rAttr) {
					      ModelAndView mav = new ModelAndView();
					      
					      int row = dao.ServiceHangmokAdd(serviceDog,serviceSub);
					      
					      if (row > 0) {
					         
					         rAttr.addFlashAttribute("msg", "서비스가 추가되었습니다.");
					         mav.setViewName("redirect:/AdminServicePage");
					      }else {
					         rAttr.addFlashAttribute("msg", "서비스추가에 실패했습니다.");
					         mav.setViewName("redirect:/AdminServicePage");
					      }
					      
					      return mav;
					   }

					   public ModelAndView ChangeListPage(String loginId) {
					      ModelAndView mav = new ModelAndView();

					      int AdminCheck = dao.SingoHangmokPage(loginId);
						  	if (AdminCheck == 1) {
						  		mav.setViewName("cywAdminChangeList");
						  	}else {
						  		mav.addObject("loginSuccessAlert", "관리자만 사용할수 있는 페이지입니다.");
						  		mav.setViewName("Main");
						  	} 
					      
					      return mav;
					   }

					   public HashMap<String, Object> ChangeList(int currPage, int pagePerCnt) {
					      HashMap<String, Object> map = new HashMap<String, Object>();
					      
					      //어디서부터 보여줘야 하는가?
					      int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
					      logger.info("offset:{}",offset);
					      
					      int totalCount = dao.ChangeListCount(); 
					      
					      int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
					      
					      logger.info("총 갯수 : {}",totalCount);
					      logger.info("만들수 있는 총 페이지 :{}",range);
					      
					      map.put("pages", range);
					      map.put("list", dao.ChangeList(pagePerCnt,offset));
					      
					      
					      return map;
					   }	 

	
					   public ModelAndView ChangeMoneyCheck(String poch_num, RedirectAttributes rAttr, String loginId) {
						      ModelAndView mav = new ModelAndView();
						      
						      int row = dao.ChangeMoneyCheck(poch_num);
						      
						      if (row > 0) {
						         dao.pointChOkAdd(poch_num,loginId);
						         
						         rAttr.addFlashAttribute("msg", "환전 신청이 완료처리 되었습니다.");
						         mav.setViewName("redirect:/ChangeListPage");
						      }else {
						         rAttr.addFlashAttribute("msg", "환전 신청이 완료처리에 실패했습니다.");
						         mav.setViewName("redirect:/ChangeListPage");
						      }
						      
						      return mav;
						   }

						   public ModelAndView ChangeOkListPage(String loginId) {
						      ModelAndView mav = new ModelAndView();
						      int AdminCheck = dao.SingoHangmokPage(loginId);
							  	if (AdminCheck == 1) {
							  		mav.setViewName("cywAdminChangeOk");
							  	}else {
							  		mav.addObject("loginSuccessAlert", "관리자만 사용할수 있는 페이지입니다.");
							  		mav.setViewName("Main");
							  	}  
						      return mav;
						   }

						   public HashMap<String, Object> ChangeOkList(int currPage, int pagePerCnt) {
						      HashMap<String, Object> map = new HashMap<String, Object>();
						      
						      //어디서부터 보여줘야 하는가?
						      int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
						      logger.info("offset:{}",offset);
						      
						      int totalCount = dao.ChangeOkListCount(); 
						      
						      int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
						      
						      logger.info("총 갯수 : {}",totalCount);
						      logger.info("만들수 있는 총 페이지 :{}",range);
						      
						      map.put("pages", range);
						      map.put("list", dao.ChangeOkList(pagePerCnt,offset));
						      
						      
						      return map;
						   }
	
	

public ModelAndView SingoHangmokPage(String loginId) {
	
	ModelAndView mav = new ModelAndView();
	
	int AdminCheck = dao.SingoHangmokPage(loginId);
	if (AdminCheck == 1) {
		mav.setViewName("cywAdminSingoHangmok");
	}else {
		mav.addObject("loginSuccessAlert", "관리자만 사용할수 있는 페이지입니다.");
		mav.setViewName("Main");
	}
	
	return mav;
}	
	
	
	
	

	
	
	
	
	
	
	
	
}
