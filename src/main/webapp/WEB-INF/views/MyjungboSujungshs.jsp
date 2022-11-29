<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
 
   #con_memberDe{width: 1200px;}
   #sujung_txt{
      position: relative;
      top :100px;
      left:0px;
      float:right;
      width:900px;
      padding: 20px 30px;
   }
   
   #sujung_txt p{
   display: inline;
   }
   
   
   .formSt{
      padding:5px;
      margin:5px;
      margin-bottom: 5px;
   }
   .pw{
      padding:5px;
      margin:5px;
      margin-bottom: 5px;
   }
	#headTxt{
	  font-size: 28px;
 	 font-style: bold;
	}
	
	#btn-join{
		font-size: 15px; 
		font-weight: bold; 
		border-radius: 7px; 
		cursor: pointer;	
		text-align: center;
		border: 1px solid #D985B7;
		background-color: white;
		padding: 5px 10px;
		color: #D985B7;
	}
	
	#btn-join:hover{
		border: 1px solid #D985B7;
		background-color: #D985B7;
		padding: 5px 10px;
		color: white;
	}
		
	input{
		border:1px solid #dedede;

	}
	
	#formCs{
		margin-top:20px;

		border:1px solid #dedede;
		width: 450px;
	}

	</style>
</head>
<body>

<%@ include file="Header.jsp"%>
		<c:if test="${info.mem_rank == 0 or info.mem_rank == 2}">
			<%@ include file="cywMyPageMenuBarNomal.jsp"%>		
		</c:if>
		<c:if test="${info.mem_rank == 1}">
			<%@ include file="cywMyPageMenuBarOwner.jsp"%>		
		</c:if>


<div id="con_memberDe">

<div id="sujung_txt">
<p id="headTxt">개인정보 수정</p>
<input type="button" value="회원 탈퇴하기" style="float: right;" id="userOut_btn">
<hr>

   <div id="formCs">
   
     	 <form action="userUp" method="POST">
     	 
     	 	<table style="margin:20px 60px; ">
     	 		<tr>
	            	<th  style="width: 100px;">ID</th>
	            		<td ><input style="border:1px solid white;" type="text" name="id"  value="${loginId}" class="formSt" readonly="readonly" /></td>
	            </tr>
	            <tr>
	            	<th  style="width: 100px;">비밀번호</th>
	           		<td "><input type="password" name="pw" placeholder="새로운 비밀번호" class="pw"   style="border:1px solid #ccc;"/></td>
	           	</tr>
	           	<tr>
	            	<th>확인</th>
	            	<td  "><input type="password" name="repw" placeholder="비밀번호 확인"  class="pw" style="border:1px solid #ccc;"/></td>
	            </tr>
	            <tr>
	        		<div class="alert alert-success" id="successPw" style = "color:#19a901; font-size: 13px;">비밀번호가 일치합니다.</div>
      				<div class="alert alert-danger" id="dangerPw" style = "color:#e70026; font-size: 13px;">비밀번호가 일치하지 않습니다.</div>
	      		</tr>
	            <tr>
	            	<th>이름</th>
	            	<td "><input type="text"  style="border:1px solid white;" value="${info.mem_name}" name="name" class="formSt" readonly="readonly"></td>
	            </tr>
	           <tr>
	           		<th>E-MAIL</th>
	           		<td><input type="text" value="${info.mem_email}" name="email"  class="formSt"   style="border:1px solid #ccc;"></td>
	           		</tr>
	           <tr>
	           		<th>전화번호</th>
	           		<td ><input type="text" value="${info.mem_tel}" name="phone" class="formSt"  style="border:1px solid #ccc;"></td>
	           	</tr>
	            <tr><td colspan="2" style="text-align: right; height: 50px;"><button id="btn-join"  >저장</button></td></tr>
			</table>
	      </form>
	   </div>
	</div>

</div>
</body>
<script>



$("#successPw").hide();
$("#dangerPw").hide();

var checkPw = false;
var finalPw = null;
var pw = $("input[name='pw']").val();
var repw = $("input[name='repw']").val();



//비밀번호 일치 체크
$('#dangerPw').keyup(function () {
    if (pw != "" || repw != "") {
		if (pw == repw) {
			$("#successPw").show();
			$("#dangerPw").hide();
			finalPw = repw;
			checkPw = true;
		} else {
			$("#successPw").hide();
			$("#dangerPw").show();
			checkPw = false;
		}
	}
});



var pw =$("input[name='pw']").val();
var repw = $("input[name='repw']").val();
$("#btn-join").click(function() {
	var email = $("input[name='email']").val();
	var phone = $("input[name='phone']").val();
	
	 if (pw != repw) { 
	      alert("비밀번호를 다시 확인해주세요");
	      return false;
	   } 
	 
	 if(email == null || email ==''){
		 
		 alert("이메일을 입력해주세요");
	      return false;
	 }
	 
 	if(phone ==null || phone ==''){
		 
		 alert("전화번호를 입력해주세요");
	      return false;
	 }
	 
	alert('저장이 완료되었습니다.');
	$("form").submit();
});	


$("#userOut_btn").click(function() {
    console.log('userOut_btn 확인');     
	
    var inputOut1 = prompt(" '탈퇴' 를 입력해주세요' ");
    
    if(inputOut1 != null){
    	var trimOut1 = inputOut1.trim();
    	
    	if(trimOut1 != "" && trimOut1 != '탈퇴'){
    		console.log('탈퇴불가'); 
    		alert('탈퇴가 불가합니다. 다시 시도해 주세요.');
    	}else if(trimOut1 == '탈퇴'){
    		console.log('탈퇴가능');
    		alert('탈퇴 되었습니다. 이용해 주셔서 감사합니다.');
    		location.href="./memberOut";
    	}
    	
    	
    }
    
 });


$('.pw').keyup(function () {
    pw =$("input[name='pw']").val();
    repw = $("input[name='repw']").val();

    if (pw != "" || repw != "") {
		if (pw == repw) {
			$("#successPw").show();
			$("#dangerPw").hide();
			finalPw = repw;
			checkPw = true;
		} else {
			$("#successPw").hide();
			$("#dangerPw").show();
			checkPw = false;
		}
	}
});



</script>
</html>