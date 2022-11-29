<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>포인트 내역</title>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
    <script src="resources/js/jquery.twbsPagination.js"></script>
	<style>
		#allpage{
			position: relative;
			left: 300px;
			top: 150px;
		}
		#pointInfo{
			position: absolute;
			left: 20px;
			top: 0px;
		}
		#pointList{
			position: absolute;
			top: 150px;
		}
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
			width: 150px;
			padding: 10px;
			font-weight: bold;
			vertical-align: top;
			border-bottom: 1px solid #ccc;
			background: #fcf1f4;
		}
		table td {
			width: 350px;
			padding: 10px;
			vertical-align: top;
			/* border-bottom: 1px solid #ccc; */
		}
		#addPointPage{
			background: black;
			color:#fff;
			border:none;
			position:relative;
			height:60px;
			font-size:1.6em;
			padding:0 2em;
			cursor:pointer;
			transition:800ms ease all;
			outline:none;
		}
		#addPointPage:hover{
			background:#fff;
	  		color:#1AAB8A;
		}
		#addPointPage:before,#addPointPage:after{
			  content:'';
			  position:absolute;
			  top:0;
			  right:0;
			  height:2px;
			  width:0;
			  background: #1AAB8A;
			  transition:400ms ease all;
		}
		#addPointPage:after{
			  right:inherit;
			  top:inherit;
			  left:0;
			  bottom:0;
		}
		#addPointPage:hover:before,#addPointPage:hover:after{
			width:100%;
			transition:800ms ease all;
		}
		#paging{
			position: absolute;
			left: 150px;
		}
		
		#onerChangeBtn{
			background: black;
			color:#fff;
			border:none;
			position:relative;
			height:60px;
			font-size:1.6em;
			padding:0 2em;
			cursor:pointer;
			transition:800ms ease all;
			outline:none;
			margin-left: 10px;
		}
		#onerChangeBtn:hover{
			background:#fff;
	  		color:#1AAB8A;
		}
		#onerChangeBtn:before,#onerChangeBtn:after{
			  content:'';
			  position:absolute;
			  top:0;
			  right:0;
			  height:2px;
			  width:0;
			  background: #1AAB8A;
			  transition:400ms ease all;
		}
		#onerChangeBtn:after{
			  right:inherit;
			  top:inherit;
			  left:0;
			  bottom:0;
		}
		#onerChangeBtn:hover:before,#onerChangeBtn:hover:after{
			width:100%;
			transition:800ms ease all;
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
	<div id="allpage">
		<div id="pointInfo">
			<c:forEach items="${memInfo}" var="mem">
			<div>
				<h5 style="font-size: 25px;">(${mem.mem_id} 님의 현재 확정 포인트 잔액) <br/>
				<b style="color: red; font-size: 30px;">${mem.mem_point}</b>POINT</h5>
				
				<c:if test="${mem.mem_rank == 1}">
					<h5 style="font-size: 25px; position: absolute; left: 500px; width: 360px; top: 0px;" id="onerFix">${mem.mem_id} 님의 현재 확정 전 포인트<br/>
					<b style="color: red; font-size: 30px;">${mem.mem_nopoint}</b> POINT</h5>				
				</c:if>
			</div>
			<input type="button" value="충전하기" id="addPointPage"/>
			<c:if test="${mem.mem_rank == 1}">
				<input type="button" value="환전하기" id="onerChangeBtn"/>
			</c:if>

			</c:forEach>
		</div>
		<div id="pointList">
			<table>
				<thead>
					<tr>
						<th>날짜</th><th>내용</th><th>금액</th><th>상태</th>
					</tr>
				</thead>
				<tbody id="list">
					
				</tbody>
				<tr>
					<td colspan="4" id="paging" style="text-align: center;">
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

	$('#addPointPage').click(function() {
		window.location.href="./PointInsertPage";
	})

var currPage = 1;
var totalPage = 2;

memPointList(currPage,10);


function memPointList(page,cnt) {
	
	// 페이지 도착하자마자 ajax 실행
	$.ajax({
		type:'POST',
		url:'memPointList',
		data:{'page':page,'cnt':cnt}, 
		dataType:'JSON',
		success:function(data) {
			console.log(data);
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
						memPointList(page,10);
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

    list.forEach(function(item,point_num) {
    	var date = new Date(item.point_date);
    	var distin = "";
    	if (item.point_distin == 1) {
			distin = '<b  style="color: red;">'+"차감"+'</b>';
		}else {
			distin = '<b  style="color: blue;">'+"적립"+'</b>';;
		}
	
    	content += '<tr>';
    	content += '<td>'+date.getFullYear()+"-"
	      +("0"+(date.getMonth()+1)).slice(-2)+"-"
	      +("0" + date.getDate()).slice(-2);+'</td>';
	    content += '<td>'+item.point_cont+'</td>'; 
	    content += '<td>'+item.point_cdc+'</td>'
	    content += '<td>'+distin+'</td>'
    	content += '</tr>';

    });
    $('#list').empty();
    $('#list').append(content);
}

$('#onerChangeBtn').click(function() {
	window.location.href="./onerPointChange";
})

var success = "${success}" ;
if (success > 0) {
	alert("충전이 완료되었습니다.");
}

</script>
</html>