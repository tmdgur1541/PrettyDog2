<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>포인트 충전</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		#AllPage{
			position: relative;
			top: 150px;
			left: 270px;
		}
		#Sub{
			
			position: absolute;
			top: 20px;
			left: 50px;
			font-size: 25px;
		}
		#ContForm{
			position: absolute;
			top: 130px;
			left: 50px;
		}
		#ContText{
			position: absolute;
			top: 450px;
			left: 50px;
		}
		td{
			height: 40px;
			font-size: 25px;
		}
		input[name="backBtn"],input[name="addBtn"]{
			width: 100px;
			height: 50px;
			background-color: pink;
			border: 0;
			margin-top: 20px;
			margin-left: 10px;
			font-size: 15px;
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
	
	<div id="AllPage">
		<c:forEach items="${memInfo}" var="mem">
			<div id="Sub">
				<h5>${loginId} 님의 현재 보유 포인트<br/><b style="color: red; font-size: 40px;">${mem.mem_point}</b>point</h5>
			</div>		
		</c:forEach>
		<div id="ContForm">
			<form action="pointInsert" id="pointadd">
				<table>
					<tr>
						<td><input type="radio" value="1" name="point">&nbsp;5,000POINT</td>
						<td>&nbsp;<input type="radio" value="2" name="point">&nbsp;10,000POINT</td>
					</tr>
					<tr>
						<td><input type="radio" value="3" name="point">&nbsp;15,000POINT</td>
						<td>&nbsp;<input type="radio" value="4" name="point">&nbsp;20,000POINT</td>
					</tr>
					<tr>
						<td><input type="radio" value="5" name="point">&nbsp;25,000POINT</td>
						<td>&nbsp;<input type="radio" value="6" name="point">&nbsp;30,000POINT</td>
					</tr>
					<tr>
						<td><input type="radio" value="7" name="point">&nbsp;35,000POINT</td>
						<td>&nbsp;<input type="radio" value="8" name="point">&nbsp;40,000POINT</td>
					</tr>
					<tr>
						<td><input type="radio" value="9" name="point">&nbsp;45,000POINT</td>
						<td>&nbsp;<input type="radio" value="10" name="point">&nbsp;50,000POINT</td>
					</tr>
				</table>
				<%-- <input type="hidden" value="${loginId}" name="AddPointId"/> --%>
				
				<input type="button" value="돌아가기" id="backBtn" name="backBtn"/><input type="button" value="충전하기" id="addBtn" name="addBtn"/>
			</form>
		</div>
		<div id="ContText">
			<p>
				충전하기 누르신 후<br/>
				카카오뱅크 3333-06-3782406 최영우로 입금부탁드립니다.<br/>
				입금이 확인되면 충전이 완료됩니다.
			</p>
		</div>
	</div>
</body>
<script>
var success = "${success}" ;
if (success > 0) {
	alert("충전이 완료되었습니다.");
}

$('#backBtn').click(function() {
	window.location.href="./pointListPage";
})

$('#addBtn').click(function() {
	var $point = $('input[name="point"]:checked');
	console.log($point);
 
	if ($point.val() == null) {
		alert('충전할 금액을 정하랑개');
	}else{
		let result = confirm('충전을 진행하시겠습니까?');
		$('#pointadd').submit();
	}
	
});


</script>
</html>