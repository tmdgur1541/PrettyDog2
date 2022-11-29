package com.pretty.dog.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.pretty.dog.dto.DogDTO;

public interface MembersDAO {

	int joinShs(HashMap<String, String> params);

	String overlayShsid(String id);

	int ShopjoinShs(HashMap<String, String> params);

	int ShopInfo(HashMap<String, String> params);

	int shopPhoto(String shopSaup, String oriFileName, String newFileName);

	String PassCk(String id);
	
	int joinShs(String id, String hashText, String name, String phone, String email);

	int ShopjoinShs(String id, String hashText, String name, String phone, String email);

	DogDTO MyjungboSujungshs(String id);

	DogDTO MyShopInfoshs(String id);

	int DogUp(String id, String dogname, String dogage, String dogweight, String dogchar);

	ArrayList<DogDTO> Mydogshs(String id);

	int DogDel(String id, String dogName);

	DogDTO MyDogsujungshs(String id, String dogName);

	int DogSujung(HashMap<String, String> params, String id);

	int DogSujung(String id, String dogname, String dogage, String dogweight, String dogchar);

	int memberOut(String id);

	int shopup(HashMap<String, String> params);

	int userUp(HashMap<String, String> params);

	String shopSaupCk(String shopSaup);

	ArrayList<DogDTO> memberPassCk(String id);

	int shopIdck(String id);

	int shopIn(HashMap<String, String> params);

	DogDTO MyDogInfoshs(String id);


	  int AlrimPageListCount(String loginId);

	   ArrayList<DogDTO> AlrimPageList(int pagePerCnt, int offset, String of);

	   ArrayList<DogDTO> AlarmMem(String loginId);

	   int alarmDel(String alarm_num);

	   ArrayList<DogDTO> MyBoard(String loginId);

	   int MyBoardPageListCount(String loginId);

	   ArrayList<DogDTO> MyBoardPageList(int pagePerCnt, int offset, String loginId);

	   int boardDel(String community_boardnum, String loginId);

	   ArrayList<DogDTO> MyComment(String loginId);

	   int CommentPageListCount(String loginId);

	   ArrayList<DogDTO> CommentPageList(int pagePerCnt, int offset, String loginId);

	   int commentDel(String bcomment_num, String loginId);

	   ArrayList<DogDTO> MyLikeShop(String loginId);

	   int MyLikeShopListCount(String loginId);

	   ArrayList<DogDTO> MyLikeShopList(int pagePerCnt, int offset, String loginId);

	   int LikeShopDel(String interestshop_num, String loginId);

	   ArrayList<DogDTO> MyPageReserPage(String loginId);

	   int MyReserPageListCount(String loginId);

	   ArrayList<DogDTO> MyReserPageList(int pagePerCnt, int offset, String loginId);

	   int reserDel(String reser_num, String loginId);

	   ArrayList<DogDTO> OwnerReserPage(String loginId);

	   ArrayList<DogDTO> OwnerReserPageList(int pagePerCnt, int offset, String loginId);

	   int OwnerReserPageListCount(String loginId);

	   int NoShowChange(String reser_num, String loginId);

	   int SuccessChange(String reser_num, String loginId);

	   ArrayList<DogDTO> OwnerReserLogPage(String loginId);

	   int ReserLogListCount(String loginId);

	   ArrayList<DogDTO> ReserLogList(int pagePerCnt, int offset, String loginId);

	   HashMap<String, Object> reserData(String reser_num, String loginId);

	   int reserLogInsert(HashMap<String, Object> list);

	   int reserCancleInsert(HashMap<String, Object> list);

	   int OwnerCancleInsert(HashMap<String, Object> list);

	   int reserLogNoshow(HashMap<String, Object> list);

	   int reserLogSuccess(HashMap<String, Object> list);

	   int AlarmInsert(HashMap<String, Object> list);

	   // -----------------------------------------------------------------
	   
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

	   int reserDelMemPointAdd(String loginId, int normalChange);

	   int reserDelMemPointTable(String loginId, int normalChange);

	   int reserDelOwnerPointDel(int normalChange, String busin_num);

	   int reserDelOwnerPointTable(int normalChange, String busin_num);

	   int NoShopNoPoint(String busin_num, String reser_num, String reser_money);

	   int NoShowPointAdd(String busin_num, String reser_money);

	   int UseSuccessNoPoint(String busin_num, String reser_num, String reser_money);

	   int UseSuccessPointAdd(String busin_num, String reser_money);

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
	   int shopLikeCount(String interestshop_num, String loginId);
}
