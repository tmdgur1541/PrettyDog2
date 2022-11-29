<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>이쁘개 로그인</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<style>
		#AllPage{
			position: relative;
			top: 200px;
			left: 650px;
		}
		#LoginSub{
			font-size: 30px;
			position: absolute;
			left: 65px;
			
		}
		#LoginForm{
			position: absolute;
			top: 110px;
		}
		#SearchBtn{
			position: absolute;
			top: 220px;
			left: 40px;
		}
		
		#JoinFormBtn{
			position: absolute;
			top: 250px;
		}
		input[type="text"],input[type="password"]{
			height: 30px;
			width: 260px
		}
		#loginBtn{
			width: 250px;
			height: 30px;
			background-color: pink;
			color: white;
			font-size: 15px;
			border: 0;
		}
		input[type="button"]{
			width: 110px;
			height: 30px;
			background-color: #F8E0F1;
			color: black;
			font-size: 13px;
			margin-left: 10px;
			border: 0;
		}
		#SnsJoin{
			position: absolute;
			top: 300px;
			left: 100px;
		}
		 a:link { color: black; text-decoration: none;}
		 a:visited { color: black; text-decoration: none;}
		 a:hover { color: red; text-decoration: none;}

		
	</style>
</head>
<body>
	<div>
		<a href="./"><img src="/photo/LOGO.PNG"/></a>
	</div>
	<div id="AllPage">
		<div id="LoginSub">
			<h2 style="color: pink">LOGIN</h2>
		</div>
		<div id="LoginForm">
			<form action="login" method="post" id="login">
				<table>
					<tr>
						<td><input type="text" placeholder="ID를 입력해주세요!" name="idInput" id= "idInput"/></td>
					</tr>
					<tr>
						<td><input type="password" placeholder="PW를 입력해주세요!" name="pwInput"/></td>
					</tr>
					<tr>
						<td id="loginBtn"><input type="button" value="Login" id="loginBtn"/></td>
					</tr>
				</table>
			</form>
		</div>
		<div id="SearchBtn">
			<a href="./idSearchPage">아이디찾기</a>&nbsp;/&nbsp;<a href="./pwSearchPage">비밀번호찾기</a>
		</div>
		<div id="JoinFormBtn">
			<input type="button" value="일반 회원가입" class="joinForm" id="nomalmem"/><input type="button" value="업주 회원가입" class="joinForm" id="Ownermem"/>
		</div>
		<div id="SnsJoin">
			<img src="/photo/kakaoImg.jpg" style="width: 50px;height: 50px;" onclick="kakaoLogin()"/>
		</div>
	</div>	
</body>
<script>

Kakao.init('9a016594e23ac3e216f7daff7c18b296'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  $('#idInput').val(response.kakao_account.email); 
        	  console.log('test');
        	  login.submit();
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }








$('#loginBtn').click(function() {
	var $idInput = $('input[name="idInput"]')
	var $pwInput = $('input[name="pwInput"]')
	console.log($idInput.val());	
	if ($idInput.val() == '') {
		alert("아이디를 입력해주랑개~");
	}else if ($pwInput.val() == '') {
		alert("비밀번호를 입력하랑개~");
	}else {
		login.submit();
	}
});


var msg = "${msg}";

if (msg != "") {
	alert(msg);
}

var msg1 = "${msg1}";

if (msg1 != "") {
	alert(msg1);
}

$('#nomalmem').click(function() {
	window.location.href="./JoinFormshs";
})

$('#Ownermem').click(function() {
	window.location.href="./ShopJoinFormshs";
})

</script>
</html>