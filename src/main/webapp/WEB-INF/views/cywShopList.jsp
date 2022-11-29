<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>이쁘개</title>
     <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
    <script src="resources/js/jquery.twbsPagination.js"></script>
	<style>
		body{
			/* background-color: #F8ECF2; */
		}
		#allpage{
			position: relative;
			width: 100%;
			height: 1500px;
		}
		select{
			width: 200px;
			padding: .8em .5em;
			font-family: inherit;
			background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
			border: 1px solid #999; border-radius: 0px;
			-webkit-appearance: none;
			-moz-appearance: none; appearance: none;
			height: 50px;
		}
		#inputShop{
			width: 250px;
			height: 40px;
			background: no-repeat 95% 50%;
		}
		#serchBtn{
			  width:100px;
			    background-color: #0C0509;
			    border: none;
			    color:#fff;
			    padding: 10px 0;
			    text-align: center;
			    text-decoration: none;
			    display: inline-block;
			    font-size: 15px;
			    margin: 4px;
			    cursor: pointer;
		}
		td{
			padding: 50px;
			width: 420px;
			font-size: 20px;
			border: 1px solid lightgray;
		}
		#searchForm{
			position: absolute;
			left: 200px;
			top: 140px;
			background-color: white;
			height: 50px;
		}
		.shoplist{
			position: absolute;
			top: 260px;
			left: 180px;
		}
		img:hover{
			cursor: pointer;
		}
		.likebtn{
			border: 0;
			outline: 0;
		}

	</style>
</head>
<body>
<%@ include file="Header.jsp"%>
	<div id="allpage">
		<div id="searchForm">
			<form id="searchFormTag" action="shopSerch" method="post">
				<input type="hidden" name="hiddenFilter" id="hiddenFilter" value="${params.hiddenFilter}">
				<select name="areaScope">
		
					<option <c:if test="${empty params.areaScope}">selected="selected"</c:if> value="">지역선택</option>
					<c:forEach items="${fn:split(selectAreaScope,',')}" var="item">
						<option value="${item}" <c:if test="${item eq params.areaScope}">selected="selected"</c:if>>${item }</option>
					</c:forEach>
					
				</select>
				
				<select name="dogScope" onchange="serviceSelect(this.value);">
					<option <c:if test="${empty params.dogScope}">selected="selected"</c:if> value="0">견종선택</option>
					
					<c:forEach items="${fn:split(selectDogScope,',')}" var="item2" varStatus="status">
						<option value="${status.count}" <c:if test="${status.count eq params.dogScope }">selected="selected"</c:if>>${item2 }</option>
					</c:forEach>

				</select>
				
				<select name="serviceScope" id="addService" style="width: 350px;">
					<option <c:if test="${empty params.serviceScope}">selected="selected"</c:if> value="0">서비스선택(견종을 먼저 선택해주세요)</option>
					<%-- <c:forEach items="${fn:split(selectServiceScope,',')}" var="item3" varStatus="status">
						<option value="${status.count}" <c:if test="${status.count eq params.serviceScope }">selected="selected"</c:if>>${item3 }</option>
					</c:forEach> --%>
				</select> 
				
				<input type="text" placeholder="매장명입력" name="nameScope" id="inputShop" value="${params.nameScope}"/>
				
				<input type="submit" value="검색" id="serchBtn"/> 
			</form>

			<p style="text-align:right;">
				<a href="javascript:test1();">추천순</a>&nbsp;|&nbsp;
				<a href="javascript:test2();">낮은가격순</a>&nbsp;|&nbsp;
				<a href="javascript:test3();">높은가격순</a>
			</p>
			
		</div>
	
		<div class="shoplist">
			<c:set var="i" value="0" /> 
			<c:set var="j" value="3" /> 
			
			<table style="border: none; text-align: center;" id="shopTable"> 
				<tbody id="shopListTbody">
					<c:forEach items="${shopList }" var="list"> 
						<c:if test="${i%j == 0 }"> 
							<tr> 
						</c:if> 
						<td class="shopPaging">
							<input type="hidden" value="${list.busin_num}" id="shopDetail"/> 
							<img src="/photo/${list.interior_newname}" style="width: 200px;height: 250px" class="shopimg"/>
	
						<br/>
						${list.busin_name} 
						${list.busin_likes}
						<br/>
							<c:if test="${list.price_class == 1}">
								<b>소형견</b>
							</c:if>
							<c:if test="${list.price_class == 2}">
								<b>중형견</b>
							</c:if>
							<c:if test="${list.price_class == 3}">
								<b>대형견</b>
							</c:if>
							<b>${list.add_sub}</b>
							<b>${list.price_cost}Point</b>
						</td> 		
						<c:if test="${i%j == j-1 }"> 
							</tr> 
						</c:if> 
						<c:set var="i" value="${i+1 }" /> 
					</c:forEach> 
				</tbody>
				<tr>
					<td colspan="4" id="paging" style="text-align: center; position: absolute; left: 300px; border: 0;">
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

function test1(){
	$('#hiddenFilter').val('recomendFilter');
	$('#searchFormTag').submit();
}
function test2(){
	$('#hiddenFilter').val('lowPriceFilter');
	$('#searchFormTag').submit();
}
function test3(){
	$('#hiddenFilter').val('highPriceFilter');
	$('#searchFormTag').submit();
}


/* $('.likebtn').click(function() {
	
	var $busin_num = $(this).prev().val()
	console.log($busin_num);
	
	$.ajax({
		url: "updateLike",
		type: "GET",
		data: {'busin_num':$busin_num},
		dataType: "JSON",
		success: function (data) {
				console.log(data.msg);
				if (data.msg != null) {
					alert(data.msg)
				}else if(data.LikeCheck == 1) {
					alert("매장 추천 취소했당개!");
				}else{
					alert("추천 완료했당개");
				}			
		},					
		error : function () {
			alert("추천에 실패했당개");
		}
	}); 
}); */

/* $('.shopimg').click(function() {
	var $busin_num = $(this).prev().val();
	 console.log("매장상세보기",$busin_num);
	 alert("매장상세보기는 준비중입니다.");
}); */
/* 매장상세보기 이어지기 */
function shopDetail(a) {
	var $busin_num = $(this).prev().val();
	 console.log("매장상세보기",a);
	 //alert("매장상세보기는 준비중입니다.");
	<%--  var memId = <%=session.getAttribute("loginId")%>;
	 console.log("매장상세보기",memId); --%>
	 window.location.href="./sshShopDetail?idx="+a;
}

function serviceSelect(a) {
	
	console.log(a);
	$.ajax({
		type:'GET',
		url:'serviceScopeSelect',
		data:{'serviceNum':a},
		dataType:'JSON',
		success:function(data) {
			console.log(data.serviceList);
			listDraw(data.serviceList);
			
		},
		error:function(e) {
			console.log(e);
		}
	});
}
function listDraw(list) {
    var content = '<option <c:if test="${empty params.serviceScope}">'+'selected="selected"'+'</c:if>'+'value="0">'+"서비스선택(견종을 먼저 선택해주세요)"+'</option>';
    
    list.forEach(function(item,add_num) {
		content += '<option value="'+item.add_num+'"<c:if test="${'+item.add_num+'eq params.serviceScope}">selected="selected"</c:if>>'+item.add_sub+'</option>'
    });
   $('#addService').empty();
    $('#addService').append(content);
}
<c:if test="${status.count eq params.dogScope }">selected="selected"</c:if>
var currPage = 1;
var totalPage = 2;

$('#serchBtn').click(function(e){
		e.preventDefault();
	   $('#pagination').twbsPagination('destroy');
	   shopListPageList(currPage,6);
	   currPage = 1;
	});

shopListPageList(currPage,6);

function shopListPageList(page,cnt) {
	
	// 페이지 도착하자마자 ajax 실행
	var dataList = $('#searchFormTag').serialize();
	
	dataList += '&page='+page;
	dataList += '&cnt='+cnt
	
	$.ajax({
		type:'POST',
		url:'shopListAjax',
		data: dataList, 
		dataType:'JSON',
		success:function(data) {
			console.log(data);
			totalPage = data.pages;
			shopListDraw(data.shopList);
			console.log(data.shopList);
			
			if (data.shopList.length > 0) {
				$('#pagination').twbsPagination({
					startPage:currPage, // 현재 페이지
					totalPages:totalPage, // 만들수 있는 총 페이지 수
					visiblePages:5, // [1][2][3]... 이걸 몇개까지 보여줄 것인가? 밑에 페이지클릭숫자
					onPageClick:function(event,page) { // 해당 페이지 번호를 클릭 했을때 일어날 일들
						console.log(event); // 현재 일어나는 클릭 이벤트 관련 정보들
						console.log(page); // 몇 페이지를 클릭 했는지에 대한 정보
						shopListPageList(page,6);
					}
				});
			} 
			
		},
		error:function(e) {
			console.log(e);
		}
	});
}

function shopListDraw(list) {
    var content = '';
   	var msg ='';
    var $dogClass = ''
   	
   	var index = 0;
   	var arrage = 3;
    list.forEach(function(item) {
 		
    	if(index % arrage ==0){
			content +='<tr>';
    	}
    	if (item.price_class == 1) {
    		$dogClass = "소형견 ";
		}else if (item.price_class == 2) {
			$dogClass = "중형견 ";
		}else if (item.price_class == 3) {
			$dogClass = "대형견 ";
		}
    	
    	content +='<td class="shopPaging">';
   		content +='<input type="hidden" value="'+item.busin_num+'" id="shopDetail"/>';
   		content +='<a onclick="shopDetail(\''+item.busin_num+'\')">'+'<img src="/photo/'+item.interior_newname+'" style="width: 200px;height: 250px" class="shopimg"/>'+'</a>';
   		content +='<br/>';
   		content += '<b style="font-size: 20px;">'+item.busin_name+'</b>';
   		content += '<b style="font-size: 15px; color:gray;">'+"  "+"추천수 : "+item.busin_likes+'</b>';
   		/* 관심매장 뺌 */
   		content +='<br/>';
   		content +='<b style="font-size: 15px;color:gray;">'+$dogClass+'</b>';
   		content +='<b style="font-size: 15px;color:gray;">'+item.add_sub+'</b>';
    	content +='<b style="font-size: 15px; color:red;">'+item.price_cost+' Point</b>';
   		content +='</td>';
   		
	    if(index % arrage == arrage-1 ){
			content +='</tr>';
	    }
	    index++;
    });
    $('#shopListTbody').empty();
    $('#shopListTbody').append(content);
}

</script>
</html>