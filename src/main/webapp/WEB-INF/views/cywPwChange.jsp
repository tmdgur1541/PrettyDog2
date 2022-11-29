<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>이쁘개 비밀번호 바꾸기</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		input[type="submit"]{
			border-radius: 7px / 7px;
			background-color: #F8E0F1;
			color: black;
			width: 250px;
			height: 40px;
			border: 0;
			font-size: 15px;
		}
		input[type="password"]{
			width: 250px;
			height: 40px;
		}
		input[type="text"]{
			width: 250px;
			height: 40px;
		}
		input[type="button"]{
			border: 1px solid white;
			background-color: white;
			color: lightgray;
			cursor: pointer;
		}
		#AllPage{
			position: relative;
			top: 200px;
			left: 650px;
		}
		#PwChangeSub{
			position: absolute;
		}
		#PwChangeCont{
			position: absolute;
			top: 70px;
			left: 30px;
			
		}
	</style>
</head>
<body>
<%@ include file="Header.jsp"%>
	<div>
		<a href="./"><img src="/photo/LOGO.PNG"/></a>
	</div>
	<div id="AllPage">
		<form action="PwChange" method="post" onsubmit="return submitCheck();">
			<div id="PwChangeSub">
				<h2 style="color: pink;">${loginId} 님 비밀번호 재설정</h2>
			</div>
			<div id="PwChangeCont">
				<table>
					<tr>
						<td><input type="hidden" name="Id" value="${loginId}"></td>
					</tr>
					<tr>
						<td>
							<input type="password" placeholder="새로운 비밀번호를 입력하세요" name="pwInput" id="pwInput">
							<input type="button" value="문자로 보기" id="textChangeBtn1" style="display: block;"/>
							<input type="button" value="다시 가리기" id="textChangeBtn3" style="display: none;"/>
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" placeholder="새로운 비밀번호 확인하세요." name="pwcheck" id="pwcheck">
							<input type="button" value="문자로 보기" id="textChangeBtn2" style="display: block;"/>
							<input type="button" value="다시 가리기" id="textChangeBtn4" style="display: none;"/>
							<div class="alert" id="alert-pws" style="color: red; font-size: 15px;"><b>비밀번호가 다릅니다. 확인해주세요</b></div>
						</td>
					</tr>
					<tr>
						<td><input type="submit" value="확인"/></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
<script>
	$('#alert-pws').hide();
	var check = false;
	var $inputPw = "";
	var $inputCheck = "";
	
	
	$("input[name='pwInput']").keyup(function() {
		$inputPw = $('#pwInput').val();
		if ($inputPw != "" && $inputCheck != "") {
			$("#alert-pws").hide();
			check = true;
		}else {
			$("#alert-pws").show();
			check = false;
		}
	})
	
	$("input[name='pwcheck']").keyup(function() {
		$inputPw = $('#pwInput').val();
		$inputCheck = $('#pwcheck').val();
		if ($inputPw != "" && $inputCheck != "" && $inputCheck == $inputPw) {
			$("#alert-pws").hide();
			check = true;
		}else {
			$("#alert-pws").show();
			check = false;
		}
	})
	
	  function submitCheck() {
    	   if(check != true) {
    		  
    	   		return false;
			}	
    	  		return true
    	}
	
	$('#textChangeBtn1').click(function() {
		console.log("클릭");
		var a = document.getElementById('pwInput');
		console.log(a);
		a.type ="text";
		$('#textChangeBtn1').css({'display':'none'});
		$('#textChangeBtn3').css({'display':'block'});
	})
	$('#textChangeBtn2').click(function() {
		console.log("클릭");
		var a = document.getElementById('pwcheck');
		console.log(a);
		a.type ="text";
		$('#textChangeBtn2').css({'display':'none'});
		$('#textChangeBtn4').css({'display':'block'});
	})
	$('#textChangeBtn3').click(function() {
		console.log("클릭");
		var a = document.getElementById('pwInput');
		console.log(a);
		a.type ="password";
		$('#textChangeBtn1').css({'display':'block'});
		$('#textChangeBtn3').css({'display':'none'});
	})
	$('#textChangeBtn4').click(function() {
		console.log("클릭");
		var a = document.getElementById('pwcheck');
		console.log(a);
		a.type ="password";
		$('#textChangeBtn2').css({'display':'block'});
		$('#textChangeBtn4').css({'display':'none'});
	})
	
</script>
</html>