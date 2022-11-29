<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>:: 테스트 페이지 ::</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<div>
	<jsp:include page="/WEB-INF/views/reserCalendar.jsp"></jsp:include>
</div>
</head>
<body>

</body>
<script>

	var today = new Date();   
	
	let yearTest = today.getFullYear(); // 년도
	let monthTest = today.getMonth() + 1;  // 월
	let dateTest = today.getDate();  // 날짜
	let dayTest = today.getDay();  // 요일
	
	//예약 날짜와 비교할 날짜들 변수에 저장
	let thisDay = yearTest+"-"+monthTest+"-"+dateTest;		//오늘 날짜
	let oneDay = yearTest+"-"+monthTest+"-"+(dateTest+1);	//하루 날짜
	let threeDay = yearTest+"-"+monthTest+"-"+(dateTest+3);	//3일 전
	let fiveDay = yearTest+"-"+monthTest+"-"+(dateTest+5);	//5일 전
	let sevenDay = yearTest+"-"+monthTest+"-"+(dateTest+7);	//7일 전
	let freeDay = yearTest+"-"+monthTest+"-"+(dateTest+15); //15일 전

	let servicePrice = 10000;//임의의 예약금
	
	if(reserDay == thisDay){
		console.log("환불금 0%");
		console.log("업주 한테 :"+servicePrice);
	}else if(reserDay < threeDay && reserDay >= oneDay){
		console.log("환불금 10%");
		console.log("업주 한테 :"+servicePrice*0.9);
		console.log("일반 한테 :"+servicePrice*0.1);
	}else if(reserDay < fiveDay && reserDay >= threeDay){
		console.log("환불금 30%");
		console.log("업주 한테 :"+servicePrice*0.7);
		console.log("일반 한테 :"+servicePrice*0.3);
	}else if(reserDay < sevenDay && reserDay >= fiveDay){
		console.log("환불금 50%");
		console.log("업주 한테 :"+servicePrice*0.5);
		console.log("일반 한테 :"+servicePrice*0.5);
	}else if(reserDay < freeDay && reserDay >= sevenDay){
		console.log("환불금 70%");
		console.log("업주 한테 :"+servicePrice*0.3);
		console.log("일반 한테 :"+servicePrice*0.7);
	}else if(reserDay >= freeDay){
		console.log("환불금 100%");
		console.log("일반 한테 :"+servicePrice);
	}

	
	
</script>
</html>