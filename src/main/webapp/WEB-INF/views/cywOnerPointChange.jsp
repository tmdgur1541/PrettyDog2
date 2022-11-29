<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>이쁘개 환급페이지</title>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
    <script src="resources/js/jquery.twbsPagination.js"></script>
	<style>
		#main {
			border-collapse: collapse;
			text-align: left;
			line-height: 1.5;
			border: 1px solid #ccc;
			margin: 20px 10px;
			width: 700px;
		}
		#main thead {
			border-right: 1px solid #ccc;
			border-left: 1px solid #ccc;
			background: #e7708d;
		}
		#main thead th {
			padding: 10px;
			font-weight: bold;
			vertical-align: top;
			color: #fff;
		}
		#main tbody th {
			width: 150px;
			padding: 10px;
			font-weight: bold;
			vertical-align: top;
			border-bottom: 1px solid #ccc;
			background: #fcf1f4;
		} 
		#main td {
			width: 350px;
			padding: 10px;
			vertical-align: top;
			border-bottom: 1px solid #ccc;
		}
		h2{
			font-size: 20px;
		}
		#AllPage{
			position: relative;
		    top: 30px;
		    left: 300px;
		}
		#MainSub{
			position: absolute;
			top: 10px;
			left: 10px;
		}
		#MainCont{
			position: absolute;
		    top: 100px;
    		left: 10px;
		}
		#SubSub{
			position: absolute;
		    top: 500px;
    		left: 10px;
		}
		#SubCont{
			position: absolute;
		    top: 600px;
    		left: 350px;
		}
		input[name="changePoint"],input[name="bankName"],input[name="bankNum"]{
			width: 300px;
			height: 50px;
			margin-bottom: 10px;
			
		}
		input[name="changeBtn"]{
			width: 300px;
			height: 50px;
			background-color: pink;
			margin-top: 10px;
			
		}
	
	</style>
</head>
<body>
<%@ include file="Header.jsp"%>
	<%@ include file="cywMyPageMenuBarOwner.jsp" %>
	<div id="AllPage">
		<div id="MainSub">
			<h4>환전내역</h4>
			<h2>${loginId} 님의 누적 환급포인트 : <b style="font-size: 30px;color: red;">${pointSum}</b> POINT</h2>
		</div>
		<div id="MainCont">
			<table id="main">
				<thead>
					<tr>
						<th>환급 신청 날짜</th>
						<th>환급 완료 날짜</th>
						<th>환급 신청 포인트</th>
					</tr>
				</thead>
				<tbody id="pointList">
			
				</tbody>
				<tr>
					<td colspan="3" id="paging">
						<div class="container">                           
	               			<nav aria-label="Page navigation" style="text-align:center">
	                  			<ul class="pagination" id="pagination"></ul>
	              			</nav>               
	            		</div>
					</td>
				</tr>
			</table>
		</div>

		<div id="SubSub">

			<h4>환전신청하기</h4>
			<h2>${loginId} 님의 환급 가능 포인트 : <b style="font-size: 30px;color: red;">${memPoint}</b> POINT</h2>
		</div>
		<div id="SubCont">
			<form action="pointChange" id="pointForm">
				<table id="sub">
					<tr>
						<td>
							<input type="hidden" value="${memPoint}" id="pointResult"/> 
							<input type="text" placeholder="환전요청하실 금액을 입력해주세요." name="changePoint" id="changePoint"/><br/>
							<input type="text" placeholder="이용 은행명(정확한이름)" name="bankName" id="bankName"/><br/>
							<input type="text" placeholder="계좌번호를 적어주세요.(-포함)" name="bankNum" id="bankNum"/>			
						</td>				
						
					</tr>
					
					<tr>
						<td>
							<input type="button" value="환전 신청 하기" name="changeBtn" id="changeBtn"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script>

var currPage = 1;
var totalPage = 2;

listCall(currPage,5);

function listCall(page,cnt) {
	

	$.ajax({
		type:'POST',
		url:'onerPointListCall',
		data:{'page':page,'cnt':cnt},
		dataType:'JSON', 
		success:function(data) {
			console.log(data);
			totalPage = data.pages;
			listDraw(data.list);
			
			if (data.list.length > 0) {
				$('#pagination').twbsPagination({
					startPage:currPage, // 현재 페이지
					totalPages:totalPage, // 만들수 있는 총 페이지 수
					visiblePages:5, // [1][2][3]... 이걸 몇개까지 보여줄 것인가? 밑에 페이지클릭숫자
					onPageClick:function(event,page) { // 해당 페이지 번호를 클릭 했을때 일어날 일들
						console.log(event); // 현재 일어나는 클릭 이벤트 관련 정보들
						console.log(page); // 몇 페이지를 클릭 했는지에 대한 정보
						listCall(page,5);
					}
				});	
			}
			
		},
		error:function(e) {
			console.log(e);
		}
	});
}

// 강사님 다른 방법
function listDraw(list) {
    var content = '';
    list.forEach(function(item,poch_num) {
    	var date = new Date(item.poch_date);
    	var date1 = new Date(item.poch_cdate);
    	
    	var check = item.poch_check;
    	
    	var check1 =  "";

    	if (check == 0) {
    		check1 = '<td>'+'<b>'+"환급 완료 전"+'</b>'+'</td>'
		}
    	if (check == 1) {
    		check1 = '<td>'+date1.getFullYear()+"-"
  	      +("0"+(date1.getMonth()+1)).slice(-2)+"-"
  	      +("0" + date1.getDate()).slice(-2)+'</td>';
		}
   	
        content += '<tr>';
		content += '<td>'+date.getFullYear()+"-"
	      +("0"+(date.getMonth()+1)).slice(-2)+"-"
	      +("0" + date.getDate()).slice(-2)+'</td>';	      
	    content += check1;
		content += '<td>'+item.poch_money+'</td>';
        content += '</tr>'
    });
    $('#pointList').empty();
    $('#pointList').append(content);
}


$('#changeBtn').click(function() {
	var $changePoint = $('#changePoint');
	//var $pointResult = $('#pointResult');
	
	var $bankName = $('#bankName');
	var $bankNum = $('#bankNum');
	
	console.log($changePoint.val());
	//console.log($pointResult.val());
	
		if ($changePoint.val() == '') {
			alert('환전금액을 입력해 주세요.');
			$changePoint.focus();
		}else if ($bankName.val() == '') {
			alert('이용하실 은행을 입력해 주세요.');
			$bankName.focus();
		}else if ($bankNum.val() == '') {
			alert('환급받을 계좌번호를 입력해 주세요.');
			$bankNum.focus();
		}else {
			/* if ($changePoint.val() < "10000") {
				alert("최소 환전 포인트는 10,000 POINT 입니다.");
			}else if ($changePoint.val() > $pointResult.val()) {
				alert("환급 가능포인트보다 높습니다. 다시 한번 확인부탁합니다.");
			}else {
				$('#pointForm').submit();
			} */
			$('#pointForm').submit();
		}
})
		
var msg = "${msg}";

if (msg != "") {
	alert(msg);
}
	
var msg3 = "${msg3}";

if (msg3 != "") {
	alert(msg3);
}	
	

</script>
</html>