<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>알림목록</title>
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
	</style>
</head>
<body>
<%@ include file="Header.jsp"%>
	<c:forEach items="${memInfo}" var="mem">
		<c:if test="${mem.mem_rank == 0 or mem.mem_rank == 2}">
			<%@ include file="cywMyPageMenuBarNomal.jsp"%>		
		</c:if>
		<c:if test="${mem.mem_rank == 1}">
			<%@ include file="cywMyPageMenuBarOwner.jsp"%>		
		</c:if>
	</c:forEach>
	<div style="position: relative;left: 250px;top: 100px;">
		<div style="position: absolute; top: 50px; left: 20px;">
			<h4 style="font-size: 25px;">${loginId }님의 알림 목록</h4>	
		</div>
		<div style="position: absolute; top: 150px; left: 20px;">
			<table>
				<thead>
					<tr>
						<th style="width: 200px;">내용</th>
						<th style="width: 200px;">날짜</th>
						<th style="width: 70px;">삭제</th>
					</tr>
				</thead>
				<tbody id="list">
					
				</tbody>
					<tr>
						<td colspan="4" id="paging" style="text-align: center; position: absolute; left: 150px;">
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

AlrimPageList(currPage,5);


function AlrimPageList(page,cnt) {
	
	// 페이지 도착하자마자 ajax 실행
	$.ajax({
		type:'GET',
		url:'AlrimPageList',
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
						AlrimPageList(page,5);
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
    
    
    list.forEach(function(item,alarm_num) {
    	var date = new Date(item.alarm_date);
 
    	if (item.alarm_class == 0) {
			msg = "예약이 완료되었습니다."
		}else if (item.alarm_class == 1) {
			msg = "해당매장에 예약이 1건 등록 되었습니다."
		}else if (item.alarm_class == 2) {
			msg = "예약이 취소되었습니다.";
		}else if (item.alarm_class == 3) {
			msg = "매장에 예약이 1건 취소되었습니다.";
		}else if (item.alarm_class == 4) {
			msg = "이용완료가 되었습니다. 리뷰를 작성해주세요."
		}
    	
		content +='<tr>';
		content += '<td>'+msg+'</td>';
		content += '<td>'+date.getFullYear()+"-"
	      +("0"+(date.getMonth()+1)).slice(-2)+"-"
	      +("0" + date.getDate()).slice(-2);+'</td>'
	    content += '<td>'+'<a href="alarmDel?alarm_num='+item.alarm_num+'">삭제</a>'+'</td>';
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