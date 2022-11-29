package com.pretty.dog.dao;

import java.util.ArrayList;

import com.pretty.dog.dto.DogDTO;

public interface AdminPageDAO {
	
	//관리자 회원리스트
	int apuserlist3Count(String a, int b1, int c1);

	ArrayList<DogDTO> apuserlist3(int pagePerCnt, int offset, String a, int b1, int c1);
	
	

	DogDTO detail(String id);

	int userupdate(String id, String state, String rank);

	int pointupdate(String id, String CHpoint, String pointstate);

	void adminPointAdd(String id, String cHpoint, String pointstate);
	
	//관리자 매장
	int apshoplist3Count(String a, int b1);

	ArrayList<DogDTO> apshoplist3(int pagePerCnt, int offset, String a, int b1);
	

	DogDTO shopdetail(String shop);

	int shopdetail2(String shop);

	int shopdetail3(String shop);

	int shopmoney(String shop);

	int shopmoney2(String shop);

	int shopmoney3(String shop);

	int shopmoney4(String shop);

	int shopdate(String shop, String calss);
	
	//관리자 포인트
	int appointlist3Count();
	
	ArrayList<DogDTO> appointlist3(int pagePerCnt, int offset);
	
	//관리자 예약
	int apreservelist3Count();

	ArrayList<DogDTO> apreservelist3(int pagePerCnt, int offset);

	int AdminPageCheck(String loginId);

	/*
	 * int apuserlist30Count(String a, int b1, int c1);
	 * 
	 * ArrayList<DogDTO> apuserlist30(int pagePerCnt, int offset, String a, int b1,
	 * int c1);
	 */
	
	
	//회원 검색
	

	
	   int categoryListCount();

	   ArrayList<DogDTO> categoryListCall(int pagePerCnt, int offset);

	   int cateGoryAdd(String categoryName, String categoryClass);

	   int categoryDel(String category_num);

	   int SingoHangmokListCount();

	   ArrayList<DogDTO> SingoHangmokList(int pagePerCnt, int offset);

	   int SingoHangmokAdd(String singoSub);

	   int HangmokReUse(String decO_num);

	   int HangmokDel(String decO_num);

	   int SingoNoCheckListCount();

	   ArrayList<DogDTO> SingoNoCheckList(int pagePerCnt, int offset);

	   int SingoProcess(String decl_num);

	   int decAdminInsert(String decl_num, String loginId);

	   int SingoProcessListCount();

	   ArrayList<DogDTO> SingoProcessList(int pagePerCnt, int offset);

	   int ServiceHangmokListCount();

	   ArrayList<DogDTO> ServiceHangmokList(int pagePerCnt, int offset);

	   int UseServiceChange(String add_num);

	   int NoUseServiceChange(String add_num);

	   int ServiceHangmokAdd(String serviceDog, String serviceSub);

	   int ChangeListCount();

	   ArrayList<DogDTO> ChangeList(int pagePerCnt, int offset);

	   int ChangeMoneyCheck(String poch_num);

	   void pointChOkAdd(String poch_num, String loginId);

	   int ChangeOkListCount();

	   ArrayList<DogDTO> ChangeOkList(int pagePerCnt, int offset);

	   ArrayList<DogDTO> ShopServiceList(String loginId);
	   
	   ArrayList<DogDTO> ShopService(String loginId);

	   int SreviceDel(String price_num);

	   ArrayList<DogDTO> AddSmallServiceName();

	   ArrayList<DogDTO> AddMiddleServiceName();

	   ArrayList<DogDTO> AddBigServiceName();

	   int addShopSmallService(String inputText1, String serviceName1, String busin_num);

	   int addShopMiddleService(String inputText2, String serviceName2, String busin_num);

	   int addShopBigService(String inputText3, String serviceName3, String busin_num);

	   int reserDelOwnerPointChange(int businChange, String busin_num);

	   int reserDelOwnerPointAdd(int businChange, String busin_num);

	   int reserStateChange(String busin_num, String reserDay, String canReserTime);

	   int SingoHangmokPage(String loginId);

	   
	

	



	

	

	

}
