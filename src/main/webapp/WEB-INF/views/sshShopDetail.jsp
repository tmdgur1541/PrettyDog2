<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> -->
    <script src="resources/js/jquery.twbsPagination.js"></script>
   <style>
   
   </style>
</head>
<body>
	<!-- 헤더 -->
	<section style="width: 100%; height: 85px; display: flex; background-color: rgb(66, 52, 52);">
        <%@ include file="Header.jsp"%>
	</section>
	
	<div style="display: flex; height: 50px"></div>
	
	
	<!-- <h2>여긴 매장 상세페이지</h2> -->
	<input type="hidden" name="busin_num" id="busin_mem_chk" value="${sshShopDetail[0].busin_num }"/>
	<input type="hidden" name="mem_id" id="busin_mem_id_chk" value="${sshShopDetail[0].mem_id }"/>
	
	<div class="container" style="display: flex;">
		<div style="width: 50%; height: 300px;">
			<img src="/photo/${sshShopDetail[0].interior_newname }" style="width: 100%; height: 300px;"/>
		</div>
		<div style="width: 5%;"></div>
		<div style="width: 45%; ">
			<p style="font-weight: bold; font-size: x-large;">${sshShopDetail[0].busin_name }</p>
			<p style="font-weight: bold; font-size: large; margin-top: 20px;">${sshShopDetail[0].busin_juso }</p>
			<p style="font-weight: bold; font-size: large; margin-bottom: 60px;">${sshShopDetail[0].mem_tel }</p>
			<c:if test="${sshShopDetail[0].busin_smalldog == 1 }">
				<button style="width: 90px; height: 40px; font-size: large;">소형견</button>
			</c:if>
			<c:if test="${sshShopDetail[0].busin_middledog == 1 }">
				<button style="width: 90px; height: 40px; font-size: large;">중형견</button>
			</c:if>
			<c:if test="${sshShopDetail[0].busin_bigdog == 1 }">
				<button style="width: 90px; height: 40px; font-size: large;">대형견</button>
			</c:if>
			<div style="display: flex;" >
				<p id="like" style="font-size: xx-large; cursor : pointer;">${sshMyInterestShop_size }</p>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a style="font-size: large; width: 60px; height: 50px; padding-top: 10px; ">${sshShopDetail[0].busin_likes }</a>
			</div>
		</div>
	</div>
	
	<div style="display: flex; height: 40px; "></div>
	<h1 style="
    margin-left: 400px;
    font-size: 30px;
    margin-bottom: 20px;
">매장정보</h1>
	<div class="container" style="display: flex;">
		<textarea style="width: 100%; font-size: 15px; border:0; " cols="100" rows="10" readonly>${sshShopDetail[0].busin_info }</textarea>
	</div>
	
	<div style="display: flex; height: 60px;"></div>
	
	<div class="container" style="">
		<jsp:include page="/WEB-INF/views/reserCalendar.jsp"/>
	</div>
	
	<div style="display: flex; height: 60px; "></div>
	
	
	<div class="container" style="">
		<div>
			<ul class="nav nav-tabs" style="font-size: 15px;">
				<li class='active'><a data-toggle="tab" onclick="review()">리뷰</a></li>
				<li ><a data-toggle="tab" onclick="qna()">QnA</a></li>
			</ul>
		</div>
		
		<div style="width: 100%; height: 100px;"></div>
		
		<div class="tab-content" id="review" style="display: block;">
			<%-- <div class="tab-pane fade" id="tabmenu_01"><jsp:include page="/WEB-INF/views/sshShopReviewList.jsp"/></div> --%>
			<%-- <div class="tab-pane fade" id="tabmenu_02"><jsp:include page="/WEB-INF/views/sshShopQnaList.jsp"/></div> --%>
			<%@ include file="sshShopReviewList.jsp"%>
		</div>
		<div class="tab-content" id="QnA" style="display: none;">
			<%-- <div class="tab-pane fade" id="tabmenu_01"><jsp:include page="/WEB-INF/views/sshShopReviewList.jsp"/></div> --%>
			<%-- <div class="tab-pane fade" id="tabmenu_02"><jsp:include page="/WEB-INF/views/sshShopQnaList.jsp"/></div> --%>
			<%@ include file="sshShopQnaList.jsp"%>
		</div>
	</div>
	
	

</body>
<script>
	//console.log(loginId);
	
	var busin_mem_chk = $("#busin_mem_chk").val();
	
	likeChk();
	function likeChk() {
		if('${sshMyInterestShop_size}' > 0){
			$("#like").text("♥");
		}else{
			$("#like").text("♡");
		}
	}

	$("#like").click(function () {
		console.log("여기까지는 옴?");
		if('${sshMyInterestShop_size}' > 0){
			$("#like").text("♡");
			location.href='myShopLike?likeVal='+${sshMyInterestShop_size}+'&memId='+'${memId}'+'&idx='+'${sshShopDetail[0].busin_num }';
		}else{
			$("#like").text("♥");
			location.href='myShopLike?likeVal='+${sshMyInterestShop_size}+'&memId='+'${memId}'+'&idx='+'${sshShopDetail[0].busin_num }';
		}
	})
	
	function review() {
			$('#review').css({'display':'block'});
			$('#QnA').css({'display':'none'});
	}
	
	function qna() {
		$('#review').css({'display':'none'});
		$('#QnA').css({'display':'block'});
	}
</script>
</html>



