<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <style>
		#ReviewTitle {
			font-size: 30px;
		}
		#assessment {
			font-size: 20px;
		}
    </style>
</head>
<body>
	<div style="width: 100%; height: auto; background-color: #d3d3d359; border : 0px solid transparent; border-radius: 10px 10px 10px 10px;">
		<c:if test="${revLength_size > 0 }">
		<form action="reviewWrite" method="post" enctype="multipart/form-data">
			<input name="busin_num" type="hidden" value="${sshShopDetail[0].busin_num }" />
			<input name="mem_id" type="hidden" value="${memId }"/>
			<p>
				&nbsp;&nbsp;
				<span style="font-size: 25px;" id="ReviewTitle"> 리뷰 작성</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="font-size: 15px;">(이용완료하신 회원님께서만 작성 가능합니다.)</span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<span  style="font-size: 20px;" id="assessment"> 매장 평가 : </span>&nbsp;&nbsp;
				<select style="width: 50px; height: 30px; font-size: 15px;" name="apprai_cont">
					<option value="5">5</option>
					<option value="4">4</option>
					<option value="3">3</option>
					<option value="2">2</option>
					<option value="1">1</option>
				</select>
			</p>
			<input type="hidden" name="reser_num" value="${reser_num }"/>
			<div style="width: 100%; height: auto; display: flex;">
				<div style="width: 2%; height: 10px;"></div>
				<textarea style="width: 96%; height: auto; font-size: 15px;" cols="70" rows="5" placeholder="내용을 입력해 주세요" id="RevTextWrite" name="shop_boardcont"></textarea>
				<div style="width: 2%; height: 10px;"></div>
			</div>
			
			<div style="width: 100%; height: 10px;"></div>
			
			<div style="width: 100%; height: auto; display: flex;">
				<div style="width: 58%; height: auto;"></div>
				
				<div style="width: 20%; height: auto;">
					<input style="font-size: 15px;" type='file' id='btnAtt' name="photos" multiple='multiple' />
				</div>
				
				<div style="width: 15%; height: auto; font-size: 15px;">
					<p>(1장의 사진만 등록 가능)</p>
				</div>
				
				<div style="width: 2%; height: auto;"></div>
				
				<div style="width: 5%; height: auto;">
					<input style="font-size: 15px;" type="submit" value="등록"/>
				</div>
			</div>
			
		</form>	
		</c:if>
	</div>
	
	
	
	
	<c:if test="${revLength_size == 0 }">
		<p style="font-size: 15px;" >(이용완료하신 회원님께서만 작성 가능합니다.)</p>
	</c:if>
	
	
	<div style="width: 100%; height: auto; background-color: #d3d3d359; border : 0px solid transparent; border-radius: 10px 10px 10px 10px;">
		
		<div style="width: 100%; height: 30px;"></div>
		<div style="width: 100%; height: auto; display: flex;">	
		
			<div style="width: 5%; height: 100%;"></div>
			<div style="width: 90%; height: auto;">
				<c:forEach items="${sshShopRevList }" var="sshShopRevList">
					<input type="hidden" name="shop_boardnum" value="${sshShopRevList.shop_boardnum }"/>
					<%-- <input type="hidden" name="memId" value="${memId }"/> --%>
					<input type="hidden" name="busin_num" value="${sshShopRevList.busin_num }"/>
					
					<div style="display: flex;">
						<div>
							<img style="width: 200px; height: 200px;" src="/photo/${sshShopRevList.sphoto_newname }"/>
						</div>
						
						<div style="width:5%;"></div>
						
						<div>
							<p style="font-weight: bold; font-size: 20px;">${sshShopRevList.mem_id }</p>
							<p style="font-size: 16px;">${sshShopRevList.shop_boarddate }<span> 평점 : ${sshShopRevList.apprai_cont }</span></p>
							<p style="font-size: 21px;">${sshShopRevList.shop_boardcont }</p>
						</div>
					</div>
					
					
					
					<!--  
					<c:if test="${memId == sshShopRevList.mem_id }">
						<a href="ReviewDelete?idx=${sshShopRevList.shop_boardnum }&newFilename=${sshShopRevList.sphoto_newname }
						&memId=${memId}&busin_num=${sshShopRevList.busin_num}">삭제</a>
					</c:if>
					-->
					<div style="width: 100%; height: 25px;"></div>
					<div style="width: 100%; height: 2px; background-color: white;"></div>
					<div style="width: 100%; height: 25px;"></div>
				</c:forEach>
			</div>
			<div style="width: 5%; height: 100%;"></div>
		</div>
		<div style="width: 100%; height: 30px;"></div>
	</div>
	
	
</body>
<script>

</script>
</html>














































































































































