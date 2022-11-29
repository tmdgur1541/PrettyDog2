<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>이쁘개 예약목록</title>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
    <script src="resources/js/jquery.twbsPagination.js"></script>
	<style>
			table {
			border-collapse: collapse;
			text-align: left;
			line-height: 1.5;
			border: 1px solid #ccc;
			margin: 20px 10px;
			width: 900px;
		}
		table thead {
			border-right: 1px solid #ccc;
			border-left: 1px solid #ccc;
			background: #e7708d;
		}
		table thead th {
			padding: 10px;
			font-weight: bold;
			vertical-align: top;
			color: #fff;
		}
		table tbody th {
			/* width: 150px; */
			padding: 10px;
			font-weight: bold;
			vertical-align: top;
			border-bottom: 1px solid #ccc;
			background: #fcf1f4;
		}
		table td {
			/* width: 350px; */
			padding: 10px;
			vertical-align: top;
			/* border-bottom: 1px solid #ccc; */
		}
		#subject{
			width:200px; 
		}
		</style>
</head>
<body>
<%@ include file="Header.jsp"%>
	<c:forEach items="${memInfo}" var="mem">
		<c:if test="${mem.mem_rank == 0}">
			<%@ include file="cywMyPageMenuBarNomal.jsp"%>		
		</c:if>
		<c:if test="${mem.mem_rank == 1}">
			<%@ include file="cywMyPageMenuBarOwner.jsp"%>		
		</c:if>
	</c:forEach>
	<div style="position: relative;left: 250px;top: 100px;">
		<div style="position: absolute; top: 50px; left: 20px;">
			<h4 style="font-size: 25px;">${loginId }님의 예약 히스토리</h4>	
		</div>
		<div style="position: absolute; top: 150px; left: 20px;">
			<table>
				<thead>
					<tr>
						<th>아이디</th>
						<th>예약접수일</th>
						<th>예약방문일</th>
						<th>애견종류</th>
						<th>예약 서비스</th>
						<th>예약 금액</th>
						<th>예약 상태</th>
						<th>상태변경일</th>
					</tr>
				</thead>
				<tbody id="list">
					
				</tbody>
					<tr>
						<td colspan="8" id="paging" style="text-align: center; position: absolute; left: 150px;">
							<div class="container">                           
			              			<nav aria-label="Page navigation" style="text-align:center; width:500px;">
			                 			<ul class="pagination" id="pagination"></ul>
			             			</nav>               
			           		</div>
						</td>
					</tr>
			</table>
		</div>
	</div>
</body>
<script>
var currPage = 1;
var totalPage = 2;

ReserLogList(currPage,10);


function ReserLogList(page,cnt) {
	
	// 페이지 도착하자마자 ajax 실행
	$.ajax({
		type:'GET',
		url:'ReserLogList',
		data:{'page':page,'cnt':cnt}, 
		dataType:'JSON',
		success:function(data) {

			totalPage = data.pages;
			listDraw(data.list);
			console.log(data.list);
			
			if (data.list.length > 0) {
				$('#pagination').twbsPagination({
					startPage:currPage, // 현재 페이지
					totalPages:totalPage, // 만들수 있는 총 페이지 수
					visiblePages:5, // [1][2][3]... 이걸 몇개까지 보여줄 것인가? 밑에 페이지클릭숫자
					onPageClick:function(event,page) { // 해당 페이지 번호를 클릭 했을때 일어날 일들
						console.log(event); // 현재 일어나는 클릭 이벤트 관련 정보들
						console.log(page); // 몇 페이지를 클릭 했는지에 대한 정보
						ReserLogList(page,10);
					}
				});
			}
			
		},
		error:function(e) {
			console.log(e);
		}
	});
}

function listDraw(list) {
    var content = '';
   	var msg ='';
    var reserState = '';
    var reserDog ="";
    
    list.forEach(function(item,history_num) {
    	var date = new Date(item.history_askdate);
    	var date1 = new Date(item.history_visitday);
    	var date2 = new Date(item.history_updateday);
    	
    	if (item.history_states == 0) {
			reserState = '<b style="color:blue">'+"예약완료"+'</b>';
		}else if (item.history_states == 1) {
			reserState = '<b style="color:red">'+"노쇼"+'</b>';
		}else if (item.history_states == 2) {
			reserState = '<b style="color:red">'+"예약취소"+'</b>';
		}else if (item.history_states == 3) {
			reserState = '<b style="color:blue">'+"이용완료"+'</b>';
		}else if (item.history_states == 4) {
			reserState = '<b style="color:blue">'+"리뷰작성완료"+'</b>';
		}
    	
    	if (item.history_dog == 1) {
    		reserDog = "소형견";
		}else if (item.history_dog == 2) {
			reserDog = "중형견";
		}else if (item.history_dog == 3) {
			reserDog = "대형견";
		}
    	
		content +='<tr>';
		content +='<td>'+item.mem_id+'</td>';
		
		content += '<td>'+date.getFullYear()+"-"
	      +("0"+(date.getMonth()+1)).slice(-2)+"-"
	      +("0" + date.getDate()).slice(-2);+'</td>';
	    content += '<td>'+date1.getFullYear()+"-"
	    +("0"+(date1.getMonth()+1)).slice(-2)+"-"
	    +("0" + date1.getDate()).slice(-2);+'</td>';
		content +='<td>'+reserDog+'</td>';
		content +='<td>'+item.history_service+'</td>';
		content +='<td>'+item.history_money+'</td>';
		content +='<td>'+reserState+'</td>';
		content += '<td>'+date2.getFullYear()+"-"
	      +("0"+(date2.getMonth()+1)).slice(-2)+"-"
	      +("0" + date2.getDate()).slice(-2);+'</td>';
		content +='</tr>';

    });
    $('#list').empty();
    $('#list').append(content);
}

var msg = "${msg}";

if(msg != ""){
	alert(msg);

}	

</script>
</html>