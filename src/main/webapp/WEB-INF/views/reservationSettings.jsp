<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>:: JavaScript 예약 설정 캘린더 ::</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<style type="text/css">

	a { color:#000000;text-decoration:none; }
    .scriptCalendar { text-align:center; }
    .scriptCalendar > thead > tr > td { width:50px;height:50px; }
    .scriptCalendar > thead > tr:first-child > td { font-weight:bold; }
    .scriptCalendar > thead > tr:last-child > td { background-color:#90EE90; }
    .scriptCalendar > tbody > tr > td { width:50px;height:50px; }
    
    .timeBtn{
    	cursor : pointer;
    	background-color : skyblue;
    	color : white;
    	padding: 10px;
    }
    
    .noBtn{
    	background-color: gray;
    	color : white;
    	padding: 10px;
    }

</style>
</head>
<body>
 <%@ include file="Header.jsp"%>
<%@ include file="cywMyPageMenuBarOwner.jsp"%>
<div style="position: absolute; left: 300px; top: 100px;">
	<h3>${busin_name} 매장의 영업시간 수정 페이지입니다.</h3>
</div>
<div style="position: absolute; left: 350px; top: 180px;">
<table class="scriptCalendar" style="float:left;">
    <thead>
        <tr>
            <td onClick="prevCalendar();" style="cursor:pointer;">&#60;&#60;</td>
            <td colspan="5">
                <span id="calYear">YYYY</span>년
                <span id="calMonth">MM</span>월
            </td>
            <td onClick="nextCalendar();" style="cursor:pointer;">&#62;&#62;</td>
        </tr>
        <tr>
            <td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
        </tr>
    </thead>
    <tbody></tbody>
</table>
</div>
<div style="position: absolute; left: 746px; top: 180px;">
<table id="reservationTime" style="float:left; border-spacing: 10px 10px;">
	<tr>
		<td colspan="3">이용 가능 시간</td>
	</tr>
	<tr id="viewtimearea">
	</tr>
</table>
</div>
<div style="position: absolute; left: 970px; top: 180px;">
<table>
	<tr>
		<td style="font-weight: bold;">영업 시간 선택</td>
	</tr>
	<tr>
		<td >
			<select id="startTime">
				<option value="0">00:00</option>
				<option value="1">01:00</option>
				<option value="2">02:00</option>
				<option value="3">03:00</option>
				<option value="4">04:00</option>
				<option value="5">05:00</option>
				<option value="6">06:00</option>
				<option value="7">07:00</option>
				<option value="8">08:00</option>
				<option value="9">09:00</option>
				<option value="10">10:00</option>
				<option value="11">11:00</option>
				<option value="12">12:00</option>
				<option value="13">13:00</option>
				<option value="14">14:00</option>
				<option value="15">15:00</option>
				<option value="16">16:00</option>
				<option value="17">17:00</option>
				<option value="18">18:00</option>
				<option value="19">19:00</option>
				<option value="20">20:00</option>
				<option value="21">21:00</option>
				<option value="22">22:00</option>
				<option value="23">23:00</option>
			</select>
		</td>
		<td > ~ </td>
		<td >
			<select id="endTime">
				<option value="0">00:00</option>
				<option value="1">01:00</option>
				<option value="2">02:00</option>
				<option value="3">03:00</option>
				<option value="4">04:00</option>
				<option value="5">05:00</option>
				<option value="6">06:00</option>
				<option value="7">07:00</option>
				<option value="8">08:00</option>
				<option value="9">09:00</option>
				<option value="10">10:00</option>
				<option value="11">11:00</option>
				<option value="12">12:00</option>
				<option value="13">13:00</option>
				<option value="14">14:00</option>
				<option value="15">15:00</option>
				<option value="16">16:00</option>
				<option value="17">17:00</option>
				<option value="18">18:00</option>
				<option value="19">19:00</option>
				<option value="20">20:00</option>
				<option value="21">21:00</option>
				<option value="22">22:00</option>
				<option value="23">23:00</option>
			</select>
		</td>
	</tr>
	<tr>
		<td style="font-weight: bold;">브레이크 타임 선택</td>
	</tr>
	<tr id="breakTimeAreaOne">
	</tr>
	<tr id="breakTimeAreaTwo">
	</tr>
	<tr>
		<td>
			<button id="plusBtn" onclick="callBreakTimeOne()" style="color:white; background-color: skyblue;">추가</button>
		</td>
		<td>
			<button id="minusBtn" onclick="noneCancel()" style="color:white; background-color: skyblue;">삭제</button>
		</td>
	</tr>
	<tr>
		<td style="font-weight: bold;">고정 휴무일 지정</td>
	</tr>
	<tr>
		<td>
			<select id="choiceHoliDay">
				<option value="9">없음</option>
				<option value="1">월요일</option>
				<option value="2">화요일</option>
				<option value="3">수요일</option>
				<option value="4">목요일</option>
				<option value="5">금요일</option>
				<option value="6">토요일</option>
				<option value="0">일요일</option>
			</select>
		</td>
	</tr>
	<tr>
		<td style="font-weight: bold;">지정 일자 휴무 처리</td>
	</tr>
	<tr>
		<td>
			<button onclick="holiDay()">휴무 처리</button>
		</td>
	</tr>
	<tr>
		<td>
			<br/>
		</td>
	</tr>
	<tr>
		<td style="border-top: 1px solid black;">
			<button  onclick="oneDay()">하루 저장</button>
		</td>
		<td style="border-top: 1px solid black;">
			<button  onclick="allDay()">일괄 저장</button>
		</td>
	</tr>
</table>
</div>
</body>
</html>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
	    buildCalendar();
	});
	
	var businHours = {0:"00:00", 1:"01:00", 2:"02:00", 3:"03:00", 4:"04:00", 5:"05:00", 6:"06:00", 7:"07:00", 8:"08:00", 9:"09:00"
		, 10:"10:00", 11:"11:00", 12:"12:00", 13:"13:00", 14:"14:00", 15:"15:00", 16:"16:00", 17:"17:00", 18:"18:00", 19:"19:00"
		, 20:"20:00", 21:"21:00", 22:"22:00", 23:"23:00"};
		
	var loginId = '<%=(String)session.getAttribute("loginId")%>';
		
		var busin_num = "";
		
		busin_num_chk(loginId);
		
		function busin_num_chk(loginId){
			
			if(loginId != null && loginId != 'null'){
				
				$.ajax({
					url:'/dog/businNumChk',
					type:"GET",
					dataType:"JSON",
					async:false,
					data:{"loginId" : loginId},
					success : function(data){
						//console.log(data);
						busin_num = data.busin_num;
						//console.log(busin_num);
					},error : function(e){
						//console.log(e);
					}
					
					
				});
				
			}
			
	}
	
	//전역 변수들 
	//예약이 찬 시간에 대한 정보를 담기 위한 배열 생성
	var  reserArr = [];
	
	//설정을 변경 요청한 시간과 해당 날짜에 에약이 있는지 검사하고 비교하기 위한 비교 문자열 변수
	var compareTime ="";
	
	//리얼 워크 타임을 담을 변수
	var workingHours = [];
	
	//일괄 저장할 때 쓰일 시간 정보를 담은 객체
	var sendWorkingTime = {};
	
	var today = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
	var date = new Date();  // @param 전역 변수, today의 Date를 세어주는 역할
	
	/**
	 * @brief   이전달 버튼 클릭
	 */
	function prevCalendar() {
	    this.today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
	    buildCalendar();    // @param 전월 캘린더 출력 요청
	}
	
	/**
	 * @brief   다음달 버튼 클릭
	 */
	function nextCalendar() {
	    this.today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	    buildCalendar();    // @param 명월 캘린더 출력 요청
	}
	
	/**
	 * @brief   캘린더 오픈
	 * @details 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다.
	 */
	function buildCalendar() {
	
	    let doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
	    let lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
	
	    let tbCalendar = document.querySelector(".scriptCalendar > tbody");
	     document.getElementById("calYear").innerText = today.getFullYear();		// @param YYYY월
	    document.getElementById("calMonth").innerText = autoLeftPad((today.getMonth() + 1), 2);   // @param MM월
	
	
	    // @details 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다.
	    while(tbCalendar.rows.length > 0) {
	        tbCalendar.deleteRow(tbCalendar.rows.length - 1);
	    }
	
	
	
	    // @param 첫번째 개행
	    let row = tbCalendar.insertRow();
	
	
	
	    // @param 날짜가 표기될 열의 증가값
	    let dom = 1;
	
	    // @details 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
	    //               7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.
	    let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();
	
	    // @param 달력 출력
	     // @details 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
	    for(let day = 1 - doMonth.getDay(); daysLength >= day; day++) {
	
	        let column = row.insertCell();
	
	        // @param 평일( 전월일과 익월일의 데이터 제외 )
	        if(Math.sign(day) == 1 && lastDate.getDate() >= day) {
	
	
	
	            // @param 평일 날짜 데이터 삽입
	
	            column.innerText = autoLeftPad(day, 2);
	
	
	
	            // @param 일요일인 경우
	            if(dom % 7 == 1) {
	                column.style.color = "#FF4D4D";
	            }
	
	            // @param 토요일인 경우
	            if(dom % 7 == 0) {
	                column.style.color = "#4D4DFF";
	                row = tbCalendar.insertRow();   // @param 토요일이 지나면 다시 가로 행을 한줄 추가한다.
	            }
	
	        }
	
	        // @param 평일 전월일과 익월일의 데이터 날짜변경
	        else {
	            let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
	            column.innerText = autoLeftPad(exceptDay.getDate(), 2);
	            column.style.color = "#A9A9A9";
	        }
	
	        // @brief   전월, 명월 음영처리
	        // @details 현재년과 선택 년도가 같은경우
	        if(today.getFullYear() == date.getFullYear()) {
	
	            // @details 현재월과 선택월이 같은경우
	            if(today.getMonth() == date.getMonth()) {
	
	                // @details 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
	                if(date.getDate() > day && Math.sign(day) == 1) {
	                    column.style.backgroundColor = "#E5E5E5";
	                }
	
	                // @details 현재일보다 이후이면서 현재월에 포함되는 일인경우
	                else if(date.getDate() < day && lastDate.getDate() >= day) {
	                    column.style.backgroundColor = "#FFFFFF";
	                    column.style.cursor = "pointer";
	                    column.onclick = function(){ calendarChoiceDay(this); }
	                }
	
	                // @details 현재일인 경우
	                else if(date.getDate() == day) {
	                    column.style.backgroundColor = "#FFFFE6";
	                    column.style.cursor = "pointer";
	                    column.onclick = function(){ calendarChoiceDay(this); }
	                }
	
	            // @details 현재월보다 이전인경우
	            } else if(today.getMonth() < date.getMonth()) {
	                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
	                    column.style.backgroundColor = "#E5E5E5";
	                }
	            }
	
	            // @details 현재월보다 이후인경우
	            else {
	                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
	                    column.style.backgroundColor = "#FFFFFF";
	                    column.style.cursor = "pointer";
	                    column.onclick = function(){ calendarChoiceDay(this); }
	                }
	            }
	        }
	
	        // @details 선택한년도가 현재년도보다 작은경우
	        else if(today.getFullYear() < date.getFullYear()) {
	            if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
	                column.style.backgroundColor = "#E5E5E5";
	            }
	        }
	
	        // @details 선택한년도가 현재년도보다 큰경우
	        else {
	            if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
	                column.style.backgroundColor = "#FFFFFF";
	                column.style.cursor = "pointer";
	                column.onclick = function(){ calendarChoiceDay(this); }
	            }
	        }
	
	
	
	        dom++;
	
	    }
	}
	
	//선택한 날짜의 데이터를 전역 변수로 선언
	var ChoiceDate = "";
	
	/**
	 * @brief   날짜 선택
	 * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
	 */
	function calendarChoiceDay(column) {
		
		$("#viewtimearea").empty();
		
	
	    // @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
	    if(document.getElementsByClassName("choiceDay")[0]) {
	        document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
	        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
	    }
	
	    // @param 선택일 체크 표시
	    column.style.backgroundColor = "#FF9999";
	
	
	
	    // @param 선택일 클래스명 변경
	
	    column.classList.add("choiceDay");
	   
	    
	    //선택한 날짜의 일자를 빼오기 순서대로 연 월 일
	    /*
	    console.log(document.getElementById("calYear").innerText);
	    console.log(document.getElementById("calMonth").innerText);
	    console.log(document.getElementsByClassName("choiceDay")[0].innerText);
	    */
	    ChoiceDate = document.getElementById("calYear").innerText + "-" + document.getElementById("calMonth").innerText + "-" + document.getElementsByClassName("choiceDay")[0].innerText ; 
	    //console.log(ChoiceDate);
	    
	    $.ajax({
        	url:"/dog/dateInfo",
        	type:"POST",
        	dataType:"JSON",
        	data:{
        		"busin_num": busin_num,
        		"ChooseDate" : ChoiceDate
        		},
        	success :function(data){
        		
        		//시간 자료(set_time) 에서 key:value 를 가져온것
        		//console.log(data.set_time);
        		
        		//JSON 컬럼으로 되어 있는 녀석의 데이터를 js 에서 사용하기 위해서 파싱을 해준 작업
        		let obj = JSON.parse(data.set_time);
        		
        		//파싱한 데이터를 다시 키값으로 나누기 위한 작업(선택한 날짜의 시간 정보를 가져온다)
				//console.log(Object.keys(obj));
        		//console.log(Object.values(obj));
        		
				reserArr = [];
				
				compareTime ="";
				
				var content = "";
        		var rowContent = "";
        		var rowCnt = Object.keys(obj).length / 3;
        		var rowPlus = Object.keys(obj).length % 3; 

        		if(rowPlus == 0){
					for(i=0; i<rowCnt; i++){
						rowContent += "<tr id='viewtimearea"+i+"'>";
						rowContent += "</tr>";	
					}
				}
        		
        		$("#viewtimearea").append(rowContent);
        		
        		//위애서 파싱한 데이터를 가지고 키와 밸류 추출 (예약이 된 녀석들의 정보만 뺴오기 위함)
        		for(var realTime in obj){
        			if(obj[realTime] == 1){
        				//배열에 예약이 된 시간을 넣는 작업
        				reserArr.push(realTime);
	        			//console.log("키 값 : "+realTime+" / 밸류 값 :"+obj[realTime]);        				
        			}
        		}

        		
        		//키값만 분리한 녀석들은 배열에 집어넣는 작업 (시간을 영역에 노출 해 주기 위해서)
				for(i=0; i<Object.keys(obj).length; i++){
					
					//console.log(Object.keys(obj)[i]);
					if(i%3 == 0){
						if(Object.values(obj)[i]==0){
							content += "<tr>";
							content += "<td class='timeBtn' onclick='selectTime(this)'>";
							content += "<span>"+Object.keys(obj)[i]+"</span>";
							content += "</td>";
						}else{
							content += "<tr>";
							content += "<td class='noBtn'>";
							content += "<span>"+Object.keys(obj)[i]+"</span>";
							content += "</td>";
						}	
					}else if(i%3 == 1){
						if(Object.values(obj)[i]==0){
							content += "<td class='timeBtn' onclick='selectTime(this)'>";
							content += "<span>"+Object.keys(obj)[i]+"</span>";
							content += "</td>";
						}else{
							content += "<td class='noBtn'>";
							content += "<span>"+Object.keys(obj)[i]+"</span>";
							content += "</td>";
						}
					}else if(i%3 == 2){
						if(Object.values(obj)[i]==0){
							content += "<td class='timeBtn' onclick='selectTime(this)'>";
							content += "<span>"+Object.keys(obj)[i]+"</span>";
							content += "</td>";
							content += "</tr>";	
						}else{
							content += "<td class='noBtn'>";
							content += "<span>"+Object.keys(obj)[i]+"</span>";
							content += "</td>";
							content += "</tr>";
						}	
					}
					
					
				}
		    	$("#viewtimearea").empty();
				$("#viewtimearea").append(content);			
        	},
        	error : function(e){
        		
        	}
        });
	    
	}
	

	
	/**
	 * @brief   숫자 두자릿수( 00 ) 변경
	 * @details 자릿수가 한지라인 ( 1, 2, 3등 )의 값을 10, 11, 12등과 같은 두자리수 형식으로 맞추기위해 0을 붙인다.
	 * @param   num     앞에 0을 붙일 숫자 값
	 * @param   digit   글자의 자릿수를 지정 ( 2자릿수인 경우 00, 3자릿수인 경우 000 … )
	 */
	function autoLeftPad(num, digit) {
	    if(String(num).length < digit) {
	        num = new Array(digit - String(num).length + 1).join("0") + num;
	    }
	    return num;
	}
	
	
	function oneDay(){
		//console.log(ChoiceDate); //연 월 일 데이터 추출 성공

		workingHours = [];
		
		//영업 시간의 시작 시간과 마감 시간을 뽑아옴
		var st = $("#startTime").val();
		var ed = $("#endTime").val();
		
		//value 가 String 으로 인식 되어 정확한 비교를 하기 위해서 parseInt 로 변환
		st = parseInt(st);
		ed = parseInt(ed);
		
		//오브젝트 형태로 뽑아온 데이터를 다시 밸류값으로 추출하기 위한 과정
		var ex = JSON.stringify(businHours);
		const obj = JSON.parse(ex);
		
		//첫 번째 브레이크 타임
		var btstOne = $("#btstOne").val();
		var btetOne = $("#btetOne").val();			
			
		btstOne = parseInt(btstOne);
		btetOne = parseInt(btetOne);		
		
		//두 번째 브레이크 타임
		var btstTwo = $("#btstTwo").val();
		var btetTwo = $("#btetTwo").val();	
			
		btstTwo = parseInt(btstTwo);
		btetTwo = parseInt(btetTwo);		
		
		
		
		if(st >= ed){
			alert("영업 시간 설정을 확인해주세요.");
		}else if(document.getElementById("breakTimeOne") && document.getElementById("breakTimeTwo") == null){
				
			if(btstOne >= btetOne){
				alert("첫 번째 브레이크 타임 설정을 확인해주세요.");
			}else if(btstOne < st || btetOne > ed){
				alert("브레이크 타임은 영업시간 내로 설정해주세요.");
			}else if(btstOne == st && btetOne == ed) {
				alert("영업 시간 전체가 브레이크 타임으로 설정될 수 없습니다. 설정 시간을 다시 확인해주세요.");
			}else{
				//console.log("브레이크 타임이 하나인 경우");
				var beforeBreakTime = Object.values(obj).slice(st,btstOne);
				var afterBreakTime = Object.values(obj).slice(btetOne,ed); 
				workingHours = [...beforeBreakTime, ...afterBreakTime];
				//console.log(workingHours);
			}
							
		}else if(document.getElementById("breakTimeTwo")){
			
			if(btstOne == btetOne || btstOne > btetOne){
				alert("첫 번째 브레이크 타임 설정을 확인해주세요.");
			}else if(btstOne < st || btetOne > ed){
				alert("브레이크 타임은 영업시간 내로 설정해주세요.");
			}else if(btstOne == st && btetOne == ed) {
				alert("영업 시간 전체가 브레이크 타임으로 설정될 수 없습니다. 설정 시간을 다시 확인해주세요.");
			}else if(btstTwo >= btetTwo){
				alert("두 번째 브레이크 타임 설정을 확인해주세요.");
			}else if(btstTwo < st || btetTwo > ed){
				alert("브레이크 타임은 영업시간 내로 설정해주세요.");
			}else if(btstTwo < btetOne && btstTwo > btstOne){
				alert("브레이크 타임이 겹쳤습니다. 다시 확인해주세요.");
			}else if(btstTwo < btstOne){
				alert("두 번째 브레이크 타임이 첫 번째 브레이크 타임보다 이릅니다. 브레이크 타임 설정을 다시 확인해주세요.");
			}else if((ed-st)==((btetOne-btstOne)+(btetTwo-btstTwo))){
				alert("영업 시간 전체가 브레이크 타임으로 설정될 수 없습니다. 설정 시간을 다시 확인해주세요.");
			}else{
				//console.log("브레이크 타임이 두개인 경우");
				var beforeBreakTime = Object.values(obj).slice(st,btstOne);
				var betweenBreakTime = Object.values(obj).slice(btetOne,btstTwo)
				var afterBreakTime = Object.values(obj).slice(btetTwo,ed);
				workingHours = [...beforeBreakTime, ...betweenBreakTime, ...afterBreakTime];
				//console.log(workingHours);		
			}
		}else{
			//console.log("브레이크 타임이 없을 경우");
			workingHours = Object.values(obj).slice(st,ed);
			//console.log(workingHours); //영업 시간 원하는 만큼 추출	
		}
		
		//예약이 되어있는 시간을 비교하여 예약이 있는 시간을 포함하여 설정을 요청하는지 확인하기 위한 변수
		var k = 0;
		
		//예약된 시간을 포함하고 있는 설정 시간을 보냈을 경우 예약 시간이 몇번째 인덱스 인지 저장하기 위한 배열
		var iArr = [];
		
		var objt = {};
		
		
		
		for(var i=0; i<workingHours.length; i++){
			
			objt[workingHours[i]] = 0;
			
			
			for(var j=0; j<reserArr.length; j++){
				
				compareTime = reserArr[j];
				
				//console.log(compareTime+" / "+workingHours[i]);
				
				if(workingHours[i] === compareTime){
					k++
					iArr.push(i);
					objt[workingHours[i]] = 1;
					
				} 
			}
		}
		
		//console.log(objt);	
		
		
		var sendData = {"busin_num" : busin_num, "set_date" : ChoiceDate, "set_time" : JSON.stringify(objt)};
		
		console.log(workingHours);
		
		if(ChoiceDate == "" || ChoiceDate == null){
			alert("설정하실 날짜를 선택해주세요.");
		}else if(reserArr.length == k){
			let yn = confirm("영업 시간 설정이 가능합니다. 설정하신 내용으로 저장하시겠습니까?");
			if(yn){
				
				$.ajax({
		        	url:"/dog/reservationSave",
		        	type:"POST",
		        	dataType:"JSON",
		        	data:sendData,
		        	success :function(data){
		        		//수정이 제대로 완료 되면은 달력 리스트 재 호출
		        		if(data>=1){
		        			location.reload();
		        		}
		        	},
		        	error : function(e){
		        		console.log(e)
		        	}
		        });
				
			}
		}else{
			alert("영업 시간 설정이 불가능합니다.");	
		}
		
	}
	
 
	
	
	
	
	function allDay(){
		
		workingHours = [];
		
		var st = $("#startTime").val();
		var ed = $("#endTime").val();
		
		//value 가 String 으로 인식 되어 정확한 비교를 하기 위해서 parseInt 로 변환
		st = parseInt(st);
		ed = parseInt(ed);
		
		//오브젝트 형태로 뽑아온 데이터를 다시 밸류값으로 추출하기 위한 과정
		var ex = JSON.stringify(businHours);
		const obj = JSON.parse(ex);
		
		//첫 번째 브레이크 타임
		var btstOne = $("#btstOne").val();
		var btetOne = $("#btetOne").val();			
			
		btstOne = parseInt(btstOne);
		btetOne = parseInt(btetOne);		
		
		//두 번째 브레이크 타임
		var btstTwo = $("#btstTwo").val();
		var btetTwo = $("#btetTwo").val();	
			
		btstTwo = parseInt(btstTwo);
		btetTwo = parseInt(btetTwo);		
		
		
		
		if(st >= ed){
			alert("영업 시간 설정을 확인해주세요.");
		}else if(document.getElementById("breakTimeOne") && document.getElementById("breakTimeTwo") == null){
				
			if(btstOne >= btetOne){
				alert("첫 번째 브레이크 타임 설정을 확인해주세요.");
			}else if(btstOne < st || btetOne > ed){
				alert("브레이크 타임은 영업시간 내로 설정해주세요.");
			}else if(btstOne == st && btetOne == ed) {
				alert("영업 시간 전체가 브레이크 타임으로 설정될 수 없습니다. 설정 시간을 다시 확인해주세요.");
			}else{
				//console.log("브레이크 타임이 하나인 경우");
				var beforeBreakTime = Object.values(obj).slice(st,btstOne);
				var afterBreakTime = Object.values(obj).slice(btetOne,ed); 
				workingHours = [...beforeBreakTime, ...afterBreakTime];
				//console.log(workingHours);
			}
							
		}else if(document.getElementById("breakTimeTwo")){
			
			if(btstOne == btetOne || btstOne > btetOne){
				alert("첫 번째 브레이크 타임 설정을 확인해주세요.");
			}else if(btstOne < st || btetOne > ed){
				alert("브레이크 타임은 영업시간 내로 설정해주세요.");
			}else if(btstOne == st && btetOne == ed) {
				alert("영업 시간 전체가 브레이크 타임으로 설정될 수 없습니다. 설정 시간을 다시 확인해주세요.");
			}else if(btstTwo >= btetTwo){
				alert("두 번째 브레이크 타임 설정을 확인해주세요.");
			}else if(btstTwo < st || btetTwo > ed){
				alert("브레이크 타임은 영업시간 내로 설정해주세요.");
			}else if(btstTwo < btetOne && btstTwo > btstOne){
				alert("브레이크 타임이 겹쳤습니다. 다시 확인해주세요.");
			}else if(btstTwo < btstOne){
				alert("두 번째 브레이크 타임이 첫 번째 브레이크 타임보다 이릅니다. 브레이크 타임 설정을 다시 확인해주세요.");
			}else if((ed-st)==((btetOne-btstOne)+(btetTwo-btstTwo))){
				alert("영업 시간 전체가 브레이크 타임으로 설정될 수 없습니다. 설정 시간을 다시 확인해주세요.");
			}else{
				//console.log("브레이크 타임이 두개인 경우");
				var beforeBreakTime = Object.values(obj).slice(st,btstOne);
				var betweenBreakTime = Object.values(obj).slice(btetOne,btstTwo)
				var afterBreakTime = Object.values(obj).slice(btetTwo,ed);
				workingHours = [...beforeBreakTime, ...betweenBreakTime, ...afterBreakTime];
				//console.log(workingHours);		
			}
		}else{
			//console.log("브레이크 타임이 없을 경우");
			workingHours = Object.values(obj).slice(st,ed);
			//console.log(workingHours); //영업 시간 원하는 만큼 추출	
		}
		
		//예약이 되어있는 시간을 비교하여 예약이 있는 시간을 포함하여 설정을 요청하는지 확인하기 위한 변수
		var k = 0;
		
		//예약된 시간을 포함하고 있는 설정 시간을 보냈을 경우 예약 시간이 몇번째 인덱스 인지 저장하기 위한 배열
		var iArr = [];
		
		var objt = {};
		
		for(var i=0; i<workingHours.length; i++){
			
			objt[workingHours[i]] = 0;
			sendWorkingTime[workingHours[i]] = 0;
			
			for(var j=0; j<reserArr.length; j++){
				
				compareTime = reserArr[j];
				
				//console.log(compareTime+" / "+workingHours[i]);
				
				if(workingHours[i] === compareTime){
					k++
					iArr.push(i);
					objt[workingHours[i]] = 1;
					sendWorkingTime[workingHours[i]] = 0;
				} 
			}
		}
		//시간 추출 완료
		//=============================================================//
		
		let today = new Date();   

		let year = today.getFullYear(); // 년도
		let month = ('0' + (today.getMonth() + 1)).slice(-2);  // 이번 월
		let nextMonth = ('0' + (today.getMonth() + 2)).slice(-2); //다음 월
		let date = ('0' + today.getDate()).slice(-2);  // 날짜
		
		// 오늘 날짜에 대한 당 월에 대한 마지막 날을 연/월/일 데이터를 스트링으로 저장
		var startDate = (year + '/' + month + '/' + date);
		
		//다음달 마지막 날짜(일)만을 추출
		var nextDate = new Date(year,nextMonth, 0).getDate();
		
		//위에서 추출한 날짜로 다음달 마지막 날의 연/월/일 데이터를 추출하여 스트링으로 저장
		var lastDate = (year + '/' + nextMonth + '/' + nextDate);

		var thisMonthCnt = new Date(year, month, 0).getDate();
		var nextMonthCnt = new Date(year, nextMonth, 0).getDate();
		
		//console.log(thisMonthCnt+" / "+nextMonthCnt+" / "+date);
		
		var thisMonthDay = [];
		var nextMonthDay = []; 
		var j = 0; //이번달 날짜 계산할 때 배열을 지정해 줄 변수
		var k = 0; //다음달 날짜 계산할 때 배열을 지정해 줄 변수
		
		//고정 휴무 선택하고 일괄 저장시 딜리트 시켜줄 휴무를 저장하는 배열 이번달
		let delThisHoliDay = [];
		let delThieDayCnt = 0; //위의 배열의 넘버를 찍어줄 변수
		
		let delNextHoilDay = []; //다음달 휴무
		let delNextDayCnt = 0;
		
		let noCancleDate = []; //일괄 저장시 저장이 안되게 할 날짜
		
		//오늘 날짜부터 내달 말일까지 모든 날짜를 연/월/일 형식으로 추출
		let choiceHoliDay = $("#choiceHoliDay").val();
		//console.log(choiceHoliDay);
		
		if(choiceHoliDay==9){
			
			for(var i = date; i<=thisMonthCnt; i++){
				if(i<10){
					var startDate = (year + '-' + month + '-' +"0"+i);
					thisMonthDay[j] = startDate; 
					j++;
				}else{
					var startDate = (year + '-' + month + '-' + i);
					thisMonthDay[j] = startDate; 
					j++;					
				}
			}
		
			//다음달 첫 날짜부터 말일까지 모든 날짜를 연/월/일 형식으로 추출
			for(var i = 1; i<=nextMonthCnt; i++){
				if(i<10){
					var startDate = (year + '-' + nextMonth + '-' +"0"+i);
					nextMonthDay[k] = startDate; 
					k++;
				}else{
					var startDate = (year + '-' + nextMonth + '-' + i);
					nextMonthDay[k] = startDate; 
					k++;
				}
				
			}

			
		}else if(choiceHoliDay < 9 || choiceHoliDay >=0){
			
			for(var i = date; i<=thisMonthCnt; i++){
				if(i<10){
					var startDate = (year + '-' + month + '-' +"0"+i);
					//휴무 지정 요일과 비교하기 위해서 일괄 저장할 날짜들의 요일 정보를 불러온다. 
					let comDate = new Date(startDate).getDay();
					if(comDate != choiceHoliDay){
						thisMonthDay[j] = startDate; 
						j++;			
					}else{
						delThisHoliDay[delThieDayCnt] = startDate;	
						delThieDayCnt++;
					}
				}else{
					var startDate = (year + '-' + month + '-' +i);
					//휴무 지정 요일과 비교하기 위해서 일괄 저장할 날짜들의 요일 정보를 불러온다. 
					let comDate = new Date(startDate).getDay();
					if(comDate != choiceHoliDay){
						thisMonthDay[j] = startDate; 
						j++;			
					}else{
						delThisHoliDay[delThieDayCnt] = startDate;	
						delThieDayCnt++;
					}
				}
			}
		
			//다음달 첫 날짜부터 말일까지 모든 날짜를 연/월/일 형식으로 추출
			for(var i = 1; i<=nextMonthCnt; i++){
				if(i<10){
					var startDate = (year + '-' + nextMonth + '-' +"0"+i);
					let comDate = new Date(startDate).getDay();
					if(comDate != choiceHoliDay){
						nextMonthDay[k] = startDate; 
						k++;			
					}else{
						delNextHoilDay[delNextDayCnt] = startDate;	
						delNextDayCnt++;
					}
				}else{
					var startDate = (year + '-' + nextMonth + '-' + i);
					let comDate = new Date(startDate).getDay();
					if(comDate != choiceHoliDay){
						nextMonthDay[k] = startDate; 
						k++;			
					}else{
						delNextHoilDay[delNextDayCnt] = startDate;	
						delNextDayCnt++;
					}
				}
				
			}

		}
		
		//예약 스케쥴 변경 요청을 보내는 전체 날짜
		var totalDay = [...thisMonthDay , ...nextMonthDay];
		
		var totalDelDay = [...delThisHoliDay, ...delNextHoilDay];
		
		var allTime =  JSON.stringify(objt);
		
		//console.log(totalDelDay);
		
		if(workingHours.length>0){
			let yn = confirm("예약 설정이 가능합니다. \n일괄 저장은 예약이 있는 날짜를 제외하고 적용 됩니다.\n일괄 저장을 하시겠습니까?");
			
			if(yn){
				
				$.ajax({
		        	url:"/dog/totalReserEx",
		        	type:"POST",
		        	dataType:"JSON",
		        	data:{"busin_num" : busin_num},
		        	success :function(data){
		        		
		        		console.log(data);
		        		
		        		for(var i=0; i<data.length; i++){
		        			//가져온 데이터에서 날짜를 yyyy-mm-dd 형식으로 변환
		            		let comDay = data[i].set_date;
		            		let comDate = new Date(comDay)
		            		let reserDate = (comDate.getFullYear()+ "-" +("0"+(comDate.getMonth()+1)).slice(-2)+"-"+("0" + comDate.getDate()).slice(-2));
		            		//console.log(reserDate);
		            		
		            		let obj = JSON.parse(data[i].set_time);
		            		let reserTime = Object.values(obj);
		            		//console.log(reserTime);
		        			
		        			if(reserTime.filter(v => v == 1).length >=1){
		        				noCancleDate.push(reserDate);
		            		}
		        		}
		        		
		        		if(noCancleDate.length == 0){
		        			//에약이 없을 경우 일괄 수정시 
		        			
		        			console.log(totalDay);

		        			$.ajax({
		    		        	url:"/dog/noReserAllDate",
		    		        	type:"POST",
		    		        	dataType:"JSON",
		    		        	data:{"busin_num" : busin_num, "totalDay" :JSON.stringify(totalDay), "set_time" : JSON.stringify(sendWorkingTime), "totalDelDay" : JSON.stringify(totalDelDay)},
		    		        	success :function(data){
		    		        		//console.log(data);
		    		        		if(data >= 1){
		    		        			location.reload();
		    		        		}
		    		        	},
		    		        	error : function(e){
		    		        		console.log(e);
		    		        	}
		    		        });	
		        			
		        			
		        		}else{
		        			
		        			
		        			
		        			//요청한 영업일에서 휴무와 예약이 있는 날짜를 저장할 배열
		        			var upsertDate = [];
		        			var delDate = [];
		            		
		        			
		            		
		        			i = 0;
		            		
		        			//설정 변경을 요청한 총 영업일에서 예약이 있는 날짜 제거
		        			for(var j=0; j<totalDay.length; j++){

		        				if(totalDay[j] == noCancleDate[i]){
		        					i++;
		        				}else{
		        					upsertDate.push(totalDay[j]);
		        				}
		            			
		            		}
		        			
		        			//설정 변경을 요청한 총 휴무일에서 예약이 있는 날짜 제거
		        			for(var j=0; j<totalDelDay.length; j++){
		        				
		        				if(totalDelDay[j] == noCancleDate[i]){
		        					i++;
		        				}else{
		        					delDate.push(totalDelDay[j]);
		        				}
		        					
		        			}
		        			
		        			console.log(sendWorkingTime);
		        			console.log(objt);
		        			
		        			//아작스 들어갈 부분
		        			
		        			
		        			$.ajax({
		    		        	url:"/dog/noReserAllDate",
		    		        	type:"POST",
		    		        	dataType:"JSON",
		    		        	data:{"busin_num" : busin_num, "totalDay" :JSON.stringify(upsertDate), "set_time" : JSON.stringify(sendWorkingTime), "totalDelDay" : JSON.stringify(delDate)},
		    		        	success :function(data){
		    		        		//console.log(data);
		    		        		if(data >= 1){
		    		        			location.reload();
		    		        		}
		    		        	},
		    		        	error : function(e){
		    		        		console.log(e);
		    		        	}
		    		        });	
		        			
		        			
		        			
		        			/*
		        			console.log(noCancleDate);
		        			console.log("==============================================");
		        			console.log(totalDay);
		        			console.log(totalDelDay);
		        			console.log("==============================================");
		            		console.log(upsertDate);
		            		console.log(delDate);
		            		*/
		        		}
		        		
		        		
		        		
		        		
		        	},
		        	error : function(e){
		        		console.log(e);
		        	}
		        });
			}
		}
		
		
		
		
		
		/*
		
		
		console.log(thisMonthDay);
		console.log(nextMonthDay);
		console.log(delThisHoliDay);
		console.log(delNextHoilDay);
		console.log(totalDelDay);
		*/
		
		//let exReser = ["2022-03-16","2022-03-18","2022-03-20"];
		//let test = ["2022-03-16","2022-03-17","2022-03-18","2022-03-19","2022-03-20","2022-03-21"]
		//let reserDate = [];
		
		//console.log(thisMonthDay);
		//console.log("구분점");
		//console.log(nextMonthDay);
		
		//console.log(exReser);
		//console.log(thisMonthDay);
		//for(var i = 0; i<exReser.length; i++){
			//reserDate = thisMonthDay.filter(v => v == exReser[i]);
			//console.log(exReser[i]);
			//console.log(thisMonthDay);
		//} 
		//console.log(reserDate);
		
	}
	
	
	
	function callBreakTimeOne(){
		
		contents = '';
		
		contents += '<tr id="breakTimeOne">';
		contents += '<td>'; 
		contents += '<select id="btstOne">';			
		contents += '<option value="0">00:00</option>';				
		contents += '<option value="1">01:00</option>';				
		contents += '<option value="2">02:00</option>';				
		contents += '<option value="3">03:00</option>';				
		contents += '<option value="4">04:00</option>';				
		contents += '<option value="5">05:00</option>';				
		contents += '<option value="6">06:00</option>';				
		contents += '<option value="7">07:00</option>';				
		contents += '<option value="8">08:00</option>';				
		contents += '<option value="9">09:00</option>';				
		contents += '<option value="10">10:00</option>';				
		contents += '<option value="11">11:00</option>';				
		contents += '<option value="12">12:00</option>';				
		contents += '<option value="13">13:00</option>';				
		contents += '<option value="14">14:00</option>';				
		contents += '<option value="15">15:00</option>';				
		contents += '<option value="16">16:00</option>';				
		contents += '<option value="17">17:00</option>';				
		contents += '<option value="18">18:00</option>';				
		contents += '<option value="19">19:00</option>';				
		contents += '<option value="20">20:00</option>';				
		contents += '<option value="21">21:00</option>';				
		contents += '<option value="22">22:00</option>';				
		contents += '<option value="23">23:00</option>';				
		contents += '</select>';			
		contents += '</td>';		
		contents += '<td> ~ </td>';		
		contents += '<td>';		
		contents += '<select id="btetOne">';			
		contents += '<option value="0">00:00</option>';				
		contents += '<option value="1">01:00</option>';				
		contents += '<option value="2">02:00</option>';				
		contents += '<option value="3">03:00</option>';				
		contents += '<option value="4">04:00</option>';				
		contents += '<option value="5">05:00</option>';				
		contents += '<option value="6">06:00</option> ';	
		contents += '<option value="7">07:00</option> ';	
		contents += '<option value="8">08:00</option> ';	
		contents += '<option value="9">09:00</option> ';	
		contents += '<option value="10">10:00</option>';	
		contents += '<option value="11">11:00</option>';	
		contents += '<option value="12">12:00</option>';	
		contents += '<option value="13">13:00</option>';	
		contents += '<option value="14">14:00</option>';	
		contents += '<option value="15">15:00</option>';	
		contents += '<option value="16">16:00</option>';	
		contents += '<option value="17">17:00</option>';	
		contents += '<option value="18">18:00</option>';	
		contents += '<option value="19">19:00</option>';	
		contents += '<option value="20">20:00</option>';	
		contents += '<option value="21">21:00</option>';	
		contents += '<option value="22">22:00</option>';	
		contents += '<option value="23">23:00</option>';	
		contents += '</select>';			
		contents += '</td>';		
		contents += '</tr>';	
				 
		
		$("#breakTimeAreaOne").append(contents);
		
		$("#plusBtn").attr("onclick","callBreakTimeTwo()");
		$("#minusBtn").attr("onclick","emptyBreakTimeOne()");
		
	}
	
	
	function callBreakTimeTwo(){
		
		contents = '';
		
		contents += '<tr id="breakTimeTwo">';
		contents += '<td>'; 
		contents += '<select id="btstTwo">';			
		contents += '<option value="0">00:00</option>';				
		contents += '<option value="1">01:00</option>';				
		contents += '<option value="2">02:00</option>';				
		contents += '<option value="3">03:00</option>';				
		contents += '<option value="4">04:00</option>';				
		contents += '<option value="5">05:00</option>';				
		contents += '<option value="6">06:00</option>';				
		contents += '<option value="7">07:00</option>';				
		contents += '<option value="8">08:00</option>';				
		contents += '<option value="9">09:00</option>';				
		contents += '<option value="10">10:00</option>';				
		contents += '<option value="11">11:00</option>';				
		contents += '<option value="12">12:00</option>';				
		contents += '<option value="13">13:00</option>';				
		contents += '<option value="14">14:00</option>';				
		contents += '<option value="15">15:00</option>';				
		contents += '<option value="16">16:00</option>';				
		contents += '<option value="17">17:00</option>';				
		contents += '<option value="18">18:00</option>';				
		contents += '<option value="19">19:00</option>';				
		contents += '<option value="20">20:00</option>';				
		contents += '<option value="21">21:00</option>';				
		contents += '<option value="22">22:00</option>';				
		contents += '<option value="23">23:00</option>';				
		contents += '</select>';			
		contents += '</td>';		
		contents += '<td> ~ </td>';		
		contents += '<td>';		
		contents += '<select id="btetTwo">';			
		contents += '<option value="0">00:00</option>';				
		contents += '<option value="1">01:00</option>';				
		contents += '<option value="2">02:00</option>';				
		contents += '<option value="3">03:00</option>';				
		contents += '<option value="4">04:00</option>';				
		contents += '<option value="5">05:00</option>';				
		contents += '<option value="6">06:00</option> ';	
		contents += '<option value="7">07:00</option> ';	
		contents += '<option value="8">08:00</option> ';	
		contents += '<option value="9">09:00</option> ';	
		contents += '<option value="10">10:00</option>';	
		contents += '<option value="11">11:00</option>';	
		contents += '<option value="12">12:00</option>';	
		contents += '<option value="13">13:00</option>';	
		contents += '<option value="14">14:00</option>';	
		contents += '<option value="15">15:00</option>';	
		contents += '<option value="16">16:00</option>';	
		contents += '<option value="17">17:00</option>';	
		contents += '<option value="18">18:00</option>';	
		contents += '<option value="19">19:00</option>';	
		contents += '<option value="20">20:00</option>';	
		contents += '<option value="21">21:00</option>';	
		contents += '<option value="22">22:00</option>';	
		contents += '<option value="23">23:00</option>';	
		contents += '</select>';			
		contents += '</td>';		
		contents += '</tr>';	
				 
		
		$("#breakTimeAreaTwo").append(contents);
		
		$("#plusBtn").attr("onclick","noneCall()");
		$("#minusBtn").attr("onclick","emptyBreakTimeTwo()");
	}
	
	
	function noneCancel(){
		alert("더이상 삭제 할 수 없습니다.");
	}
	
	function noneCall(){
		alert("더이상 추가 할 수 없습니다.");
	}
	
	function emptyBreakTimeOne(){
		
		$("#breakTimeAreaOne").empty();
		$("#minusBtn").attr("onclick","noneCancel()");
		$("#plusBtn").attr("onclick","callBreakTimeOne()");
	}

	function emptyBreakTimeTwo(){
		
		$("#breakTimeAreaTwo").empty();
		$("#minusBtn").attr("onclick","emptyBreakTimeOne()");
		$("#plusBtn").attr("onclick","callBreakTimeTwo()");
	}
	
	
	
	function holiDay(){
		var timeAreaEx = document.getElementById('viewtimearea').firstChild;
		var findNoBnt = document.getElementsByClassName('noBtn');
		
		
		if(ChoiceDate == "" || ChoiceDate == null){
			alert("휴무 처리일을 선택해주세요.");
		}else if(timeAreaEx == null || timeAreaEx == ""){
			alert("해당 날짜의 스케쥴이 비어있습니다.");
		}else if(findNoBnt.length > 0){
			alert("에약이 있는 날은 휴무처리를 하실 수 없습니다.");
		}else{
			
			let yn = confirm(ChoiceDate + "을 휴무일로 처리 하시곘습니까?");
			
			if(yn){

				$.ajax({
		        	url:"/dog/holiDay",
		        	type:"POST",
		        	dataType:"JSON",
		        	data:{"ChoiceDate" : ChoiceDate},
		        	success :function(data){
		        		//수정이 제대로 완료 되면은 달력 리스트 재 호출
		        		if(data>=1){
		        			location.reload();
		        		}
		        	},
		        	error : function(e){
		        		console.log(e)
		        	}
		        });	
			}
			
		}
	}

</script>
