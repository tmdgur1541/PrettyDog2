package com.pretty.dog.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MimeType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pretty.dog.dto.DogDTO;
import com.pretty.dog.service.MembersService;


@Controller
public class MembersController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MembersService service;
	@Autowired private JavaMailSender mailSender;
	@Autowired HttpSession session;

	
	
	@RequestMapping(value = "/JoinFormshs", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("회원가입 페이지");
		
		return "JoinFormshs";
	}
	
	
	
	
	String hashText="";
	@RequestMapping(value = "/joinShs", method = RequestMethod.POST)
	public String joinShs(Model model,@RequestParam String id,@RequestParam String pw,
			@RequestParam String name,@RequestParam String phone,@RequestParam String email) {
		logger.info("일반 회원가입 요청");	
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		hashText = encoder.encode(pw);
		logger.info("암호화값 {}",hashText);
		int row = service.joinShs(id,hashText,name,phone,email);
		
		String success ="redirect:/JoinFormshs";
		String msg = "회원가입에 실패하였습니다.";
		model.addAttribute("msg",msg);
		
		if(row>0) {
			success ="redirect:/";
			msg = "회원가입이 완료 되었습니다.";
			model.addAttribute("msg",msg);
		}
		return success;
	}
	
	@RequestMapping(value = "/ShopJoinFormshs", method = RequestMethod.GET)
	public String ShopjoinShs(Model model) {
		logger.info(" 점주 회원가입 페이지");
		
		return "ShopJoinFormshs";
	}
	
	
	@RequestMapping(value = "/ShopjoinShs", method = RequestMethod.POST)
	public String ShopjoinShs(Model model,@RequestParam String id,@RequestParam String pw,
			@RequestParam String name,@RequestParam String phone,@RequestParam String email) {
		logger.info("점주 회원가입 요청");	
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		hashText = encoder.encode(pw);
		logger.info("암호화값 {}",hashText);
		int row = service.ShopjoinShs(id,hashText,name,phone,email);
		String success ="redirect:/ShopJoinFormshs";
		
		String msg = "회원가입에 실패하였습니다.";
		
		if(row>0) {
			model.addAttribute("id",id);
			msg = "매장 회원가입 완료";
			success ="redirect:/ShopInfoFormshs";
		}
		
		model.addAttribute("msg",msg);
		
		return success;
	}
	
	
	
	@RequestMapping(value = "/ShopInfoFormshs", method = RequestMethod.GET)
	public String ShopInfoFormshs(Model model,HttpServletRequest request) {
		logger.info(" 점주 회원가입 정보 페이지");
		String id =request.getParameter("id");

		model.addAttribute("id",id);
		
		return "ShopInfoFormshs";
	}
	
	@RequestMapping(value = "/ShopInfo", method = RequestMethod.POST)
	public String ShopInfo(Model model,MultipartFile shopPhoto,@RequestParam HashMap<String, String> params, @RequestParam String shopSaup) {
		logger.info("점주 매장정보 요청 컨트롤러");	
		logger.info("params : {}",params);
		logger.info("shopPhoto : {}",shopPhoto);
		
		service.ShopInfo(shopPhoto,params,shopSaup);
		
		return "Main";
	}
	
	
	
	
	
	@GetMapping(value="/mailCheck",consumes = {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public String mailCheck(String email) throws Exception{
//		logger.info("이메일 데이터 전송확인");
//		logger.info("인증 메일 : "+email);
		
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111; // 111111 - 999999
//		logger.info("인증번호 : "+checkNum);
		
		//이메일 보내기
		String setFrom = "PrettyDog";
		String toEmail = email;
		String title = "PrettyDog 회원가입 인증 이메일 입니다.";
		String content = "PrettyDog 가입해주셔서 감사합니다."+ "<br/><br/>"+"인증 번호는 "+checkNum+" 입니다.<br/>"+
							"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toEmail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        return num;
	}
	


		//ajax 통신 - 중복 아이디 확인
		@RequestMapping(value = "/overlayid", method = RequestMethod.GET)
		@ResponseBody
		public HashMap<String, Object> overlayid(@RequestParam String id) {		
			logger.info("중복 아이디 체크 : {}",id);		
			return service.overlayShsid(id);
		}	
		
		
		//ajax 통신 - 중복 사업자 확인
		@RequestMapping(value = "/shopSaupCk", method = RequestMethod.GET)
		@ResponseBody
		public HashMap<String, Object> shopSaupCk(@RequestParam String shopSaup) {		
			logger.info("중복 아이디 체크 : {}",shopSaup);		
			return service.shopSaupCk(shopSaup);
		}	



		
		
// 여기까지가 회원가입 기능 		
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	

		@RequestMapping(value = "/ShopPriFormshs", method = RequestMethod.GET)
		public String ShopPrifo(Model model) {
			logger.info("요금표 폼");	

			return "ShopPriFormshs";
		}
	
	
		
		
		@RequestMapping(value = "/memberPassCk", method = RequestMethod.GET)
		public String memberPassCk(Model model,HttpSession session) {
//			logger.info("비밀번호체크 페이지 컨트롤러");	
			String id = (String) session.getAttribute("loginId");

			String Page ="redirect:/loginPage";
			if(id != null) {
				String loginId = (String) session.getAttribute("loginId");
				model.addAttribute("loginId", loginId);
				model.addAttribute("memInfo",service.memberPassCk(id)); 
				Page ="MemberCkshs";
			}	

			return Page;
			}
		
		
		@RequestMapping(value = "/PassCk", method = RequestMethod.POST)
		public ModelAndView PassCk(Model model,HttpSession session, @RequestParam String pw,@RequestParam String id) {
			//logger.info("비밀번호체크 컨트롤러{}",pw+id);	
			ModelAndView mav = new ModelAndView();
		
				if (service.PassCk(id,pw)) {
					mav.setViewName("redirect:/MyjungboSujungshs");
				}else {

					mav.setViewName("redirect:/memberPassCk");	
				}
			
			return mav;
		}
		
		
		//개인정보 수정페이지
		@RequestMapping(value = "/MyjungboSujungshs", method = RequestMethod.GET)
			public String memberDe(Model model,HttpSession session) {
			
				String id = (String) session.getAttribute("loginId");
				logger.info("세션아이디 값 : {}",id);
				
				DogDTO dto = service.MyjungboSujungshs(id);
				model.addAttribute("info", dto);
				
			return "MyjungboSujungshs";
		}
		
		
		//개인정보 수정요청
		@RequestMapping(value = "/userUp")
			public String userUp(Model model,HttpSession session,@RequestParam HashMap<String, String> params) {
					
				String id = (String) session.getAttribute("loginId");
				logger.info("세션아이디 값 : {}",id);
				logger.info("정보 값 : {}",params);
						
				service.userUp(params);
						
			return "redirect:/MyjungboSujungshs";
		}
		
		
		
		//매장정보 수정페이지
		@RequestMapping(value = "/MyShopInfoshs", method = RequestMethod.GET)
			public String MyjungboSujungshs(Model model,HttpSession session) {
					
				String id = (String) session.getAttribute("loginId");
				logger.info("세션아이디 값 : {}",id);
						
				DogDTO dto = service.MyShopInfoshs(id);
				model.addAttribute("shopinfo", dto);
						
			return "MyShopInfoshs";
		}
		
		//매장정보 수정
		@RequestMapping(value = "/shopUp", method = RequestMethod.POST)
			public String shopup(Model model,HttpSession session, @RequestParam HashMap<String, String> params) {
							
				String id = (String) session.getAttribute("loginId");
				logger.info("세션아이디 값 : {}",params);
								
				service.shopup(params);
								
			return "redirect:/MyShopInfoshs";
				}
				
		
		
		
	//개인 강아지 등록페이지
		@RequestMapping(value = "/MyDogInfoshs", method = RequestMethod.GET)
		public String MyDogInfoshs(Model model,HttpSession session) {
				
			String id = (String) session.getAttribute("loginId");
			logger.info("세션아이디 값 : {}",id);
			DogDTO memInfo = service.MyDogInfoshs(id);
			model.addAttribute("memInfo", memInfo);
			
		return "MyDogInfoshs";
	}		
		
		//개인 강아지 등록페이지
		@RequestMapping(value = "/DogUp", method = RequestMethod.POST)
		public String DogUp(Model model,HttpSession session,@RequestParam String dogname,@RequestParam String dogage
				,@RequestParam String dogweight,@RequestParam String dogchar) {

			String id = (String) session.getAttribute("loginId");
			
			int row= service.DogUp(id,dogname,dogage,dogweight,dogchar); 
			
		return "redirect:/Mydogshs";
	}	
		
		//개인 애견정보 리스트 페이지
		@RequestMapping(value = "/Mydogshs", method = RequestMethod.GET)
		public ModelAndView DogUp(Model model,HttpSession session) {

			String id = (String) session.getAttribute("loginId");
			logger.info("세션아이디 값 : {}",id);
			
		return service.Mydogshs(id);
	}	
		
		
		
		//개인 애견정보 삭제
		@ResponseBody
		@RequestMapping(value = "/DogDel", method = RequestMethod.GET)
		public HashMap<String, Object> DogDel(Model model,HttpSession session,@RequestParam String dogName) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			String id = (String) session.getAttribute("loginId");
			logger.info("세션아이디 값 : {}",id+"/"+dogName);
			int delCnt = service.DogDel(id,dogName);
			
			map.put("msg","삭제에 실패하였습니다.");
			if(delCnt>0) {
				map.put("msg", delCnt+" 마리의 등록 정보를 삭제 하였습니다.");
				
			}
		return map;
	}	
		
		//개인 강아지 수정페이지
		@RequestMapping(value = "/MyDogsujungshs")
		public String MyDogsujungshs(Model model,HttpSession session,HttpServletRequest request) {

			String id = (String) session.getAttribute("loginId");
			String dogName = request.getParameter("dogName");
			logger.info("세션아이디 강아지 값 : {}",id+dogName);
			
			DogDTO dto =  service.MyDogsujungshs(id,dogName);
			model.addAttribute("doginfo",dto);
			
		return "MyDogsujungshs";
	}	

		//개인 강아지 수정페이지
		@RequestMapping(value = "/DogSujung")
		public String DogSujung(Model model,HttpSession session,@RequestParam String dogname,@RequestParam String dogage
				,@RequestParam String dogweight,@RequestParam String dogchar) {
			
			String id = (String) session.getAttribute("loginId");
			logger.info("세션아이디 강아지 값 : {}",dogname+dogage+dogweight+dogchar);
			int row = service.DogSujung(id,dogname,dogage,dogweight,dogchar);
			logger.info("수정 성공 여부 {}",row);
			String msg = "수정에 실패 하였습니다.";
			if(row>0) {
				msg = "수정에 성공 하였습니다.";
			}
			model.addAttribute("msg",msg);
					
		return "redirect:/Mydogshs";
			}	
		
		
		//회원탈퇴
		@RequestMapping(value = "/memberOut")
		public String memberOut(HttpSession session) {
//			logger.info("회원탈퇴 컨트롤러");
			
			String id = (String) session.getAttribute("loginId");
			
			if(id != null) {
				session.getAttribute("loginId");
//				logger.info("회원탈퇴 컨트롤러 : {}",object);
				
				service.memberOut(id);
				session.invalidate();
			}
			
			return "redirect:/";
		}

		  @RequestMapping(value = "/MyPageAlarm")
		   public ModelAndView MyPageAlarm(HttpSession session) {
		      logger.info("마이페이지알림페이지");
		      
		      String loginId = (String) session.getAttribute("loginId");
				/* String loginId = "dud"; */
		      return service.MyPageAlarm(loginId);
		   }
		   
		   @RequestMapping(value = "/AlrimPageList", method = RequestMethod.GET) 
		   public @ResponseBody HashMap<String, Object> AlrimPageList(@RequestParam String page,@RequestParam String cnt,HttpSession session) {
		      logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      int currPage = Integer.parseInt(page);
		      int pagePerCnt = Integer.parseInt(cnt);

		      return service.AlrimPageList(currPage,pagePerCnt,loginId);
		   }
		   
		   @RequestMapping(value = "/alarmDel")
		   public ModelAndView alarmDel(HttpSession session,@RequestParam String alarm_num,RedirectAttributes rAttr) {
		      logger.info("마이페이지알림삭제:{}",alarm_num);

		      
		      return service.alarmDel(alarm_num,rAttr);
		   }
		   
		   @RequestMapping(value = "/MyPageBoard")
		   public ModelAndView MyPageBoard(HttpSession session) {
		      logger.info("마이페이지게시물페이지");
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      return service.MyPageBoard(loginId);
		   }
		   
		   @RequestMapping(value = "/MyBoardPageList", method = RequestMethod.GET) 
		   public @ResponseBody HashMap<String, Object> MyBoardPageList(@RequestParam String page,@RequestParam String cnt,HttpSession session) {
		      logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      int currPage = Integer.parseInt(page);
		      int pagePerCnt = Integer.parseInt(cnt);

		      return service.MyBoardPageList(currPage,pagePerCnt,loginId);
		   }
		   
		   @RequestMapping(value = "/boardDel")
		   public ModelAndView boardDel(HttpSession session,@RequestParam String community_boardnum,RedirectAttributes rAttr) {
		      logger.info("마이페이지게시글삭제:{}",community_boardnum);
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      return service.boardDel(community_boardnum,loginId,rAttr);
		   }
		   
		   @RequestMapping(value = "/MyPageComment")
		   public ModelAndView MyPageComment(HttpSession session) {
		      logger.info("마이페이지댓글페이지");
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      return service.MyPageComment(loginId);
		   }
		   @RequestMapping(value = "/CommentPageList", method = RequestMethod.GET) 
		   public @ResponseBody HashMap<String, Object> CommentPageList(@RequestParam String page,@RequestParam String cnt,HttpSession session) {
		      logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      int currPage = Integer.parseInt(page);
		      int pagePerCnt = Integer.parseInt(cnt);

		      return service.CommentPageList(currPage,pagePerCnt,loginId);
		   }
		   
		   @RequestMapping(value = "/commentDel")
		   public ModelAndView commentDel(HttpSession session,@RequestParam String bcomment_num,RedirectAttributes rAttr) {
		      logger.info("마이페이지댓글삭제:{}",bcomment_num);
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      return service.commentDel(bcomment_num,loginId,rAttr);
		   }
		   
		   @RequestMapping(value = "/MyPageLikeShop")
		   public ModelAndView MyPageLikeShop(HttpSession session) {
		      logger.info("마이페이지관심매장페이지");
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      return service.MyPageLikeShop(loginId);
		   }
		   
		   @RequestMapping(value = "/MyLikeShopList", method = RequestMethod.GET) 
		   public @ResponseBody HashMap<String, Object> MyLikeShopList(@RequestParam String page,@RequestParam String cnt,HttpSession session) {
		      logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      int currPage = Integer.parseInt(page);
		      int pagePerCnt = Integer.parseInt(cnt);

		      return service.MyLikeShopList(currPage,pagePerCnt,loginId);
		   }
		   
		   @RequestMapping(value = "/LikeShopDel")
		   public ModelAndView LikeShopDel(HttpSession session,@RequestParam String interestshop_num,RedirectAttributes rAttr) {
		      logger.info("마이페이지관심매장삭제:{}",interestshop_num);
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      return service.LikeShopDel(interestshop_num,loginId,rAttr);
		   }
		   
		   @RequestMapping(value = "/MyPageReserPage")
		   public ModelAndView MyPageReserPage(HttpSession session) {
		      logger.info("마이페이지일반회원예약목록페이지");
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      return service.MyPageReserPage(loginId);
		   }
		   
		   @RequestMapping(value = "/MyReserPageList", method = RequestMethod.GET) 
		   public @ResponseBody HashMap<String, Object> MyReserPageList(@RequestParam String page,@RequestParam String cnt,HttpSession session) {
		      logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      int currPage = Integer.parseInt(page);
		      int pagePerCnt = Integer.parseInt(cnt);

		      return service.MyReserPageList(currPage,pagePerCnt,loginId);
		   }
		   
		   @RequestMapping(value = "/reserDel")
		   public ModelAndView reserDel(HttpSession session,@RequestParam String reser_num,
		         RedirectAttributes rAttr,@RequestParam String reser_money,@RequestParam String busin_num,@RequestParam String reserDay,@RequestParam String reserTime) {
		      //logger.info("마이페이지일반회원예약취소:{}",reser_num);
		      //logger.info("마이페이지일반회원예약취소금액:{}",reser_money);
		      logger.info("마이페이지예약취소사업자번호:{}",busin_num);
		      //logger.info("마이페이지예약취소예약방문날짜:{}",reserDay);
		      //logger.info(reserTime);
		      
		      String canReserTime = "$."+reserTime;
		      
		      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		      
		      //로컬데이터를 이용한 날짜 추출
		      LocalDate reser = LocalDate.parse(reserDay, formatter);
		      
		      LocalDate now = LocalDate.now();    
		      LocalDate oneDay = now.plusDays(1);
		      LocalDate threeDay = now.plusDays(3);
		      LocalDate fiveDay = now.plusDays(5);
		      LocalDate sevenDay = now.plusDays(7);
		      LocalDate freeDay = now.plusDays(15);
		      
		      //최종적으로 처리할 환불금에 대한 정보를 담을 변수
		      int normalChange = 0;
		      int businChange = 0;
		      
		      /*
		       * int normalEx; int BusinEx;
		       */
		      
		      int servicePrice = Integer.parseInt(reser_money);

		      if(reser.isEqual(now)){
		         
		         businChange = servicePrice;
		         normalChange = servicePrice*0;
		         
		         System.out.println("환불금 0%");
		         System.out.println("업주 한테 :"+businChange);
		      }else if(reser.isBefore(threeDay) && reser.isAfter(oneDay) || reser.isEqual(oneDay)){
		         
		         businChange = servicePrice*90/100;
		         normalChange = servicePrice*10/100;
		               
		         System.out.println("환불금 10%");
		         System.out.println("업주 한테 :"+businChange);
		         System.out.println("일반 한테 :"+normalChange);
		      }else if(reser.isBefore(fiveDay) && reser.isAfter(threeDay) || reser.isEqual(threeDay)){
		         
		         businChange = servicePrice*70/100;
		         normalChange = servicePrice*30/100;

		         System.out.println("환불금 30%");
		         System.out.println("업주 한테 :"+businChange);
		         System.out.println("일반 한테 :"+normalChange);
		      }else if(reser.isBefore(sevenDay) && reser.isAfter(fiveDay) || reser.isEqual(fiveDay)){

		         businChange = servicePrice*50/100;
		         normalChange = servicePrice*50/100;
		         
		         System.out.println("환불금 50%");
		         System.out.println("업주 한테 :"+businChange);
		         System.out.println("일반 한테 :"+normalChange);
		      }else if(reser.isBefore(freeDay) && reser.isAfter(sevenDay) || reser.isEqual(sevenDay)){
		         
		         businChange = servicePrice*30/100;
		         normalChange = servicePrice*30/100;
		         
		         System.out.println("환불금 70%");
		         System.out.println("업주 한테 :"+businChange);
		         System.out.println("일반 한테 :"+normalChange);
		      }else if(reser.isAfter(freeDay) || reser.isEqual(freeDay)){
		         
		         businChange = servicePrice*0;
		         normalChange = servicePrice;
		         
		         System.out.println("환불금 100%");
		         System.out.println("일반 한테 :"+servicePrice);
		      }

		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      // 업주 회원 noPoint 에서 차감 할 포인트 변수명  businChange
		      // 일반 호원 point 에서 적립 될 포인트 변수명 normalChange
		      // 예약 상태를 변경하기 위해서 보내야 할 변수명 2개  1.날짜 reserDay, 2.시간 canReserTime
		      
		      return service.reserDel(reser_num,loginId,rAttr,busin_num,businChange,normalChange,reserDay,canReserTime);
		   }
		   
		   @RequestMapping(value = "/OwnerReserPage")
		   public ModelAndView OwnerReserPageList(HttpSession session) {
		      logger.info("마이페이지업주회원예약목록페이지");
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      return service.OwnerReserPage(loginId);
		   }
		   @RequestMapping(value = "/OwnerReserPageList", method = RequestMethod.GET) 
		   public @ResponseBody HashMap<String, Object> OwnerReserPageList(@RequestParam String page,@RequestParam String cnt,HttpSession session) {
		      logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      int currPage = Integer.parseInt(page);
		      int pagePerCnt = Integer.parseInt(cnt);

		      return service.OwnerReserPageList(currPage,pagePerCnt,loginId);
		   }
		   
		   @RequestMapping(value = "/NoShowChange")
		   public ModelAndView NoShowChange(HttpSession session,@RequestParam String reser_num,
		         RedirectAttributes rAttr,@RequestParam String busin_num,@RequestParam String reser_money) {
		      logger.info("마이페이지예약노쇼처리:{}",reser_num);
		      logger.info("마이페이지예약노쇼사업자번호:{}",busin_num);
		      logger.info("마이페이지예약노쇼 금액:{}",reser_money);
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      return service.NoShowChange(reser_num,loginId, rAttr,busin_num,reser_money);
		   }
		   
		   @RequestMapping(value = "/SuccessChange")
		   public ModelAndView SuccessChange(HttpSession session,@RequestParam String reser_num,
		         RedirectAttributes rAttr,@RequestParam String busin_num,@RequestParam String reser_money) {
		      logger.info("마이페이지예약이용완료처리:{}",reser_num);
		      logger.info("마이페이지예약이용완료사업자번호:{}",busin_num);
		      logger.info("마이페이지예약이용완료 금액:{}",reser_money);
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      return service.SuccessChange(reser_num,loginId, rAttr,busin_num,reser_money);
		   }
		   
		   @RequestMapping(value = "/OwnerReserLogPage")
		   public ModelAndView OwnerReserLogPage(HttpSession session) {
		      logger.info("마이페이지업주회원예약목록페이지");
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      return service.OwnerReserLogPage(loginId);
		   }
		   
		   @RequestMapping(value = "/ReserLogList", method = RequestMethod.GET) 
		   public @ResponseBody HashMap<String, Object> ReserLogList(@RequestParam String page,@RequestParam String cnt,HttpSession session) {
		      logger.info("리스트 요청:{} 페이지, {} 개 씩",page,cnt);
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      int currPage = Integer.parseInt(page);
		      int pagePerCnt = Integer.parseInt(cnt);

		      return service.ReserLogList(currPage,pagePerCnt,loginId);
		   }
		   
		   @RequestMapping(value = "/ShopServicePage")
		   public ModelAndView ShopServicePage(HttpSession session) {
		      logger.info("매장 추가 서비스 설정 페이지");
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      return service.ShopServicePage(loginId);
		   }
		   
		   @RequestMapping(value = "/addShopSmallService")
		   public ModelAndView addShopSmallService(HttpSession session,@RequestParam String inputText1,
		         @RequestParam String serviceName1,@RequestParam String busin_num,RedirectAttributes rAttr) {
		      logger.info("매장 소형견 서비스추가:{}",busin_num);
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      return service.addShopSmallService(inputText1,serviceName1,busin_num,rAttr);
		   }
		   
		   @RequestMapping(value = "/addShopMiddleService")
		   public ModelAndView addShopMiddleService(HttpSession session,@RequestParam String inputText2,
		         @RequestParam String serviceName2,@RequestParam String busin_num,RedirectAttributes rAttr) {
		      logger.info("매장 중형견 서비스추가");
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      return service.addShopMiddleService(inputText2,serviceName2,busin_num,rAttr);
		   }
		   
		   @RequestMapping(value = "/addShopBigService")
		   public ModelAndView addShopBigService(HttpSession session,@RequestParam String inputText3,
		         @RequestParam String serviceName3,@RequestParam String busin_num,RedirectAttributes rAttr) {
		      logger.info("매장 대형견 서비스추가");
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "dud";
		      
		      return service.addShopBigService(inputText3,serviceName3,busin_num,rAttr);
		   }
		   
		   @RequestMapping(value = "/SreviceDel")
		   public ModelAndView SreviceDel(HttpSession session,@RequestParam String price_num,RedirectAttributes rAttr) {
		      logger.info("매장 추가 서비스 삭제");
		      
		      String loginId = (String) session.getAttribute("loginId");
		      //String loginId = "cyw4328";
		      
		      
		      
		      return service.SreviceDel(price_num,rAttr);
		   }
		
	
}


