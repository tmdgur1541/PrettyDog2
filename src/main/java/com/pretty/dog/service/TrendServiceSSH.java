package com.pretty.dog.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pretty.dog.dao.TrendDAO;

@Service
public class TrendServiceSSH {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired TrendDAO trendDAO;

	public ArrayList<HashMap<String, Object>> beautyTrendList() {
		logger.info("beautyTrendList 서비스 도착");
		return trendDAO.beautyTrendList();
	}

	public ArrayList<HashMap<String, Object>> changeKoMap(String changeKoMap) {
		logger.info("changeKoMap 서비스 도착 : "+ changeKoMap);
		return trendDAO.changeKoMap(changeKoMap);
	}

	public ModelAndView beautyTrendDetail(String idx) {
		ModelAndView mav = new ModelAndView();
			
		HashMap<String, Object> map = trendDAO.beautyTrendDetail(idx);
			
		mav.addObject("beautyTrendDetail", map);
		mav.setViewName("beautyTrendDetail");
			
		return mav;
	}

	public ModelAndView beautyTrendUpdate(String idx) {
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> map = trendDAO.beautyTrendUpdate(idx);
		System.out.println("beautyTrendUpdate map : "+ map);
		mav.addObject("beautyTrendDetail", map);
		mav.setViewName("beautyTrendUpdate");
		return mav;
	}

	public ArrayList<HashMap<String, Object>> idChk(String memberId) {
		logger.info("idChk 서비스 도착 : "+ memberId);
		return trendDAO.idChk(memberId);
	}

	public ArrayList<HashMap<String, Object>> memberRank1(String memberId) {
		logger.info("memberRank1 서비스 도착 : "+ memberId);
		return trendDAO.memberRank1(memberId);
	}

	public String beautyTrendWrite(HashMap<String, Object> params, MultipartFile photos){
		String page = "beautyTrendWriteForm";
		HashMap<String, Object> beautyTrendWrite = params;
		//HashMap<String, Object> beautyTrendWrite = new HashMap<String, Object>();
		beautyTrendWrite.put("community_sub", params.get("community_sub"));
		beautyTrendWrite.put("community_cont", params.get("community_cont"));
		beautyTrendWrite.put("mem_id", params.get("mem_id"));
		beautyTrendWrite.put("community_boardnum", 0);
		System.out.println(beautyTrendWrite.get("community_sub"));
		System.out.println(beautyTrendWrite.get("community_cont"));
		System.out.println(beautyTrendWrite.get("mem_id"));
		trendDAO.beautyTrendWrite(beautyTrendWrite);
		//System.out.println(beautyTrendWrite.get("community_boardnum"));
		int community_boardnum = (int)beautyTrendWrite.get("community_boardnum");
		if(community_boardnum > 0) {
			page = "redirect:/beautyTrendDetail?idx="+community_boardnum;
			saveFile(community_boardnum, photos);
		}
		return page;
	}

	private void saveFile(int community_boardnum, MultipartFile photos){
		String oriFileName = photos.getOriginalFilename();
		int index = oriFileName.lastIndexOf(".");
		try {
			if(index>0) {
				String ext = oriFileName.substring(index);// 확장자(보여주기 시작할 인덱스)
				logger.info("ext : {}", ext);
				String newFileName = System.currentTimeMillis()+ext; // 새로운 파일명 생성(중복을 피하기 위해 / 확장자 없으면 사용 불가)
				logger.info(oriFileName + " = >" + newFileName);
				byte[] bytes = photos.getBytes(); // photo에 여러개의 정보(파일명/크기/byte... 등등)가 있지만 byte만 뽑아와서 byte[]배열에 담아준다
				// C:\STUDY\PrettyDog\PrettyDog\src\main\webapp\resources\trend
				Path path = Paths.get("C:/upload/" + newFileName); // 파일을 저장할 경로와 파일 이름을 설정해 준다.
				// 스트림을 사용 안해서 Files가  nio 라는걸 알수 있다 Files의 라이트 메서드를 사용해서(저장할 위치와 photo로부터 뽑아온 byte[]의 값을 사용해서 저장한다.)
				// 이때는 그냥 컴퓨터에 저장을 하는것(DB에 저장은 dao로 해야 한다.)
				System.out.println(path);
				Files.write(path, bytes);
				// Files.write(path, bytes); 까지 성공 하면 컴퓨터에 저장이 된거기 때문에 oriFileName 을 출력할수 있기 때문에 logger 로 확인해 본다
				logger.info(oriFileName + "SAVE OK!!"); 
				trendDAO.fileWrite(community_boardnum, oriFileName, newFileName);// DB 에 저장할 파일명을 기록					
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String trendUpdate(MultipartFile photos, HashMap<String, String> params) {
		int idx = Integer.parseInt(params.get("community_boardnum"));
		System.out.println("업데이트할 게시물 번호 : " + idx);
		System.out.println("업로드 할 파일 명 : "+ photos.getOriginalFilename());
		String page = "redirect:/beautyTrendUpdate?idx="+idx;
		if(trendDAO.trendUpdate(params)>0) {
			page = "redirect:/beautyTrendDetail?idx="+idx;
			HashMap<String, Object> map = trendDAO.beautyTrendDetail(Integer.toString(idx));
			System.out.println("bphoto_newname 확인" + map.get("bphoto_newname"));
			File file = new File("C:/STUDY/PrettyDog/PrettyDog/src/main/webapp/resources/trend/" + map.get("bphoto_newname"));
			boolean yn = file.delete();
			String NewFileName = (String)map.get("bphoto_newname");
			System.out.println("NewFileName = " + NewFileName);
			trendDAO.deleteCbpNewname(NewFileName);
			logger.info(map.get("bphoto_newname")+"delete : " + yn);
			saveFile(idx, photos); // 파일 저장 처리
		}
		return page;
	}

	public void beautyTrendDelete(String idx, String newFilename) {
		File file = new File("C:/STUDY/PrettyDog/PrettyDog/src/main/webapp/resources/trend/" + newFilename);
		boolean yn = file.delete();
		logger.info("newFilename "+"delete : " + yn);
		trendDAO.deleteCbpNewname(newFilename);
		trendDAO.beautyTrendDelete(idx);
	}



}


































































