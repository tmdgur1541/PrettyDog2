<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>:: JavaScript 예약 캘린더 ::</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  -->
    <script src="resources/js/jquery.twbsPagination.js"></script>
    
    <script src="resources/js/jquery.twbsPagination.js"></script>
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
	<h3>${busin_name} 매장의 영업시간 정보입니다.</h3>
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
	<table id="reservationTime" style=" border-spacing: 10px 10px;"	>
		<tr>
			<td colspan="3">이용 가능 시간</td>
		</tr>
		<tr id="viewtimearea">
		</tr>
	</table>	
</div>
<div style="position: absolute; left: 470px; top: 568px;">
		<button style="font-weight: bold;" onclick="sendReserSet()">
		예약 스케줄 수정
		</button>
	</div>
</body>
</html>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        buildCalendar();
    });
    
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
         document.getElementById("calYear").innerText = today.getFullYear();                                  // @param YYYY월
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
        		
        		//JSON 컬럼으로 되어 있는 녀석의 데이터를 js 에서 사용하기 위해서 파싱을 해준 작업
        		const obj = JSON.parse(data.set_time);
        		
        		//파싱한 데이터를 다시 키값으로 나누기 위한 작업
				//console.log(Object.keys(obj));
        		//console.log(Object.values(obj));
        		
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
        		console.log(e)
        	}
        });
    }
    
    function selectTime(data){
    	
    	console.log(ChoiceDate); // 요청 보낼 연 월 일 데이터
    	console.log(data.firstElementChild.innerText); //요청 보낼 시간 데이터
    	
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
    
    
    function sendReserSet(){
    	location.assign("/dog/reservationSettings");
    }

</script>