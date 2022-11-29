<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>매장 추가서비스</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		table {
			border-collapse: collapse;
			/* text-align: left; */
			line-height: 1.5;
			border: 1px solid #ccc;
			margin: 20px 10px;
			/* width: 600px; */
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
			border-bottom: 1px solid #ccc;
		}
		#Allpage{
			position: relative;
			top: 150px;
			left: 300px;
		}
		#AddForm{
			position: absolute;
			top: 50px;
			left: 10px;
		}
		#ChangeOkList{
			position: absolute;
			top: 120px;
			/* left: 10px; */
		}
		.table1{
			width: 60%;
		    max-width: 100%;
		    margin-bottom: 20px;
			table-layout: fixed;
		}
		select{
			width: 150px;
			height: 50px;
		}
		input[type="text"]{
			width: 200px;
			height: 50px;
		}
		input[type="button"]{
			width: 100px;
			height: 50px;
			border: 0;
			background-color: black;
			color: white;
		}
	</style>
</head>
<body>
<%@ include file="Header.jsp"%>
	<%@ include file="cywMyPageMenuBarOwner.jsp"%>	
	<div id="Allpage">
		
		<div id="AddForm">
			<c:forEach var="list" items="${ShopServiceList}">
				<h3>${list.busin_name} 매장의 서비스 종류입니다.</h3>
			</c:forEach>
			<c:forEach var="list" items="${ShopServiceList}">
				<c:if test="${list.busin_smalldog == 1}">
					
				</c:if>
			</c:forEach>
		</div>
		<div id="ChangeOkList">
			<c:forEach var="list" items="${ShopServiceList}">
				<c:if test="${list.busin_smalldog == 1}">
					<table class="table1">
						<thead>
							<tr><th colspan="3" style="background-color: black; color: white;">소형견</th></tr>
							<tr>
								<th>서비스</th>
								<th>금액</th>
								<th>삭제</th>
							</tr>
						</thead>
						<c:forEach var="list1" items="${ServiceInfoList}">
							<c:if test="${list1.price_class == 1}">
								<tbody>
									<tr>
										<td>${list1.add_sub}</td>
										<td>${list1.price_cost}</td>
										<td><a href="SreviceDel?price_num=${list1.price_num}">삭제</a></td>
									</tr>
								</tbody>	
							</c:if>
						</c:forEach>	
						<tbody style="text-align: center;">	
							<tr>
								<form action="addShopSmallService" id="addShopSmallService">
									<td colspan="3">
										<c:forEach var="list" items="${ShopServiceList}">
											<input type="hidden" value="${list.busin_num}" name="busin_num"/>
										</c:forEach>
										<select name="serviceName1" id="serviceName1">
											<option selected="selected" value="">추가항목 설정</option>
											<c:forEach items="${AddSmallServiceName}" var="serviceName">
													<option value="${serviceName.add_num}">${serviceName.add_sub}</option>
											</c:forEach>
										</select>																							
										<input type="text" placeholder="서비스 금액을 적어주세요" name="inputText1"/>
										<input type="button" value="추가" id="addBtn1">
									</td>
								</form>
							</tr>
						</tbody>
					</table>	
				</c:if>
			</c:forEach>
						
			<c:forEach var="list" items="${ShopServiceList}">
				<c:if test="${list.busin_middledog == 1}">	
					<table class="table1">
						<thead>
							<tr><th colspan="3" style="background-color: black; color: white;">중형견</th></tr>
							<tr>
								<th>서비스</th>
								<th>금액</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
 						<c:forEach var="list1" items="${ServiceInfoList}">
							<c:if test="${list1.price_class == 2}">
								<tbody>
									<tr>
										<td>${list1.add_sub}</td>
										<td>${list1.price_cost}</td>
										<td><a href="SreviceDel?price_num=${list1.price_num}">삭제</a></td>
									</tr>
								</tbody>	
							</c:if>
						</c:forEach>	
						<tbody style="text-align: center;">	
							<tr>
								<form action="addShopMiddleService" id="addShopMiddleService">
									<td colspan="3">
										<c:forEach var="list" items="${ShopServiceList}">
											<input type="hidden" value="${list.busin_num}" name="busin_num"/>
										</c:forEach>
										<select name="serviceName2" id="serviceName2">
											<option selected="selected" value="">추가항목 설정</option>
											<c:forEach items="${AddMiddleServiceName}" var="serviceName">
													<option value="${serviceName.add_num}">${serviceName.add_sub}</option>
											</c:forEach>
										</select>																							
										<input type="text" placeholder="서비스 금액을 적어주세요" name="inputText2"/>
										<input type="button" value="추가" id="addBtn2">
									</td>
								</form>
							</tr>
						</tbody>
					</table>
				</c:if>
			</c:forEach>					

		<c:forEach var="list" items="${ShopServiceList}">
			<c:if test="${list.busin_bigdog == 1}">	
				<table class="table1">
						<thead>
							<tr><th colspan="3" style="background-color: black; color: white;">대형견</th></tr>
							<tr>
								<th>서비스</th>
								<th>금액</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
 						<c:forEach var="list1" items="${ServiceInfoList}">
							<c:if test="${list1.price_class == 3}">
								<tbody>
									<tr>
										<td>${list1.add_sub}</td>
										<td>${list1.price_cost}</td>
										<td><a href="SreviceDel?price_num=${list1.price_num}">삭제</a></td>
									</tr>
								</tbody>	
							</c:if>
						</c:forEach>	
						<tbody style="text-align: center;">	
							<tr>
								<form action="addShopBigService" id="addShopBigService">
									<td colspan="3">
										<c:forEach var="list" items="${ShopServiceList}">
											<input type="hidden" value="${list.busin_num}" name="busin_num"/>
										</c:forEach>
										<select name="serviceName3" id="serviceName3">
											<option selected="selected" value="">추가항목 설정</option>
											<c:forEach items="${AddBigServiceName}" var="serviceName">
													<option value="${serviceName.add_num}">${serviceName.add_sub}</option>
											</c:forEach>
										</select>																							
										<input type="text" placeholder="서비스 금액을 적어주세요" name="inputText3"/>
										<input type="button" value="추가" id="addBtn3">
									</td>
								</form>
							</tr>
						</tbody>
					</table>					
				</c:if>
			</c:forEach>		
					
					 
		</div>
	</div>
</body>
<script>
var msg = "${msg}";

if(msg != ""){
	alert(msg);

}	

$('#addBtn1').click(function() {
	var $smallService = $("input[name='inputText1']").val();
	var $smallCode =	$("select[name='serviceName1']").val();
	
	console.log($smallService);
	console.log($smallCode);
	if ($smallService == '') {
		alert("추가서비스 금액을 입력해주세요.");
	}else if ($smallCode == '') {
		alert("추가항목을 선택해주세요.");
	}else{
		$('#addShopSmallService').submit();
	}	
})

$('#addBtn2').click(function() {
	var $maiddleService = $("input[name='inputText2']").val();
	var $middleCode = $("select[name='serviceName2']").val();
	console.log($maiddleService);
	console.log($middleCode);
	if ($maiddleService == '') {
		alert("추가서비스 금액을 입력해주세요.");
	}else if ($middleCode == '') {
		alert("추가항목을 선택해주세요.");
	}else{
		$('#addShopMiddleService').submit();
	}	
})

$('#addBtn3').click(function() {
	var $bigService = $("input[name='inputText3']").val();
	var $bigCode = $("select[name='serviceName3']").val();
	console.log($bigService);
	console.log($bigCode);
	if ($bigService == '') {
		alert("추가서비스 금액을 입력해주세요.");
	}else if ($bigCode == '') {
		alert("추가항목을 선택해주세요.");
	}else{
		$('#addShopBigService').submit();
	}	
})

</script>
</html>