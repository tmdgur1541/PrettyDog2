<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/HS.css">
	<style>
		*{margin:0 auto;}
		
		.container{
			margin-top:7%;
		}
		
		table{background-color: white;}
	</style>
</head>
<body bgcolor="#EAEAEA">
	<a href="./"><img alt="logo" src="/photo/LOGO02.png"></a>
	<div class="container">
		<div class="formDiv">
        	<form action="joinShs" method="post">
                <table>
                	<tr><th colspan="2" style="font-size: 26px;">일반회원가입</th></tr>
                    <tr>
                        <th>아이디</th>
                        <td><input type="text" name="id" class = "joinCL" placeholder="아이디를 입력해주세요"/>
                        <input type="button" id="overlay" value="중복체크"/></td>
                        
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><input type="password" name="pw"  class = "joinCL" placeholder="비밀번호를 입력해주세요"/></td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td>
                        	<input type="password" name="repw" class = "joinCL" id="qwCk" />
                        	<div class="alert alert-success" id="successPw" style = "color:#19a901; font-size: 13px;">비밀번호가 일치합니다.</div>
      						<div class="alert alert-danger" id="dangerPw" style = "color:#e70026; font-size: 13px;">비밀번호가 일치하지 않습니다.</div>
                        </td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><input type="text" name="name" class = "joinCL" /></td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td><input type="text" name="phone" class = "joinCL"  placeholder=" '-' 를 입력해 주세요 "  /></td>
                    </tr>
                    <tr>
                        <th>E-mail</th>
                        <td><input type="text" name="email" class = "joinCL" placeholder="@gmail.com" />
                        <input type="button" id="mailCheck" value="메일발송"/></td>
                        
                    <tr id="enumber">
                        <th>인증번호</th>
                        <td><input type="text" name="ecode" class = "joinCL"  />
                        <!-- 인증번호 확인 -->
      					<div class="alert alert-success" id="alert-success-email" style = "color:#19a901; font-size: 13px;">인증번호가 일치합니다.</div>
      					<div class="alert alert-danger" id="alert-danger-email" style = "color:#e70026; font-size: 13px;">인증번호가 일치하지 않습니다.</div>
                        </td>
                    </tr>
<!--                     <tr>
                        <th>닉네임</th>
                        <td><input type="text" name="nickname" class = "joinCL" /></td>
                    </tr> -->
                    
                    <tr>
                        <td colspan="2" style="border:0px; text-align: center; font-size: 13px;" ><input type="checkbox" id ="infoCh">개인정보동의(필수)</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="border:0px; text-align: right;"><input type="submit" value="회원가입" id="btn-join"></td>
                    </tr>
            </table>
        </form>
        </div>
        
    </div>



</body>
<script>
$("#alert-success-email").hide();
$("#alert-danger-email").hide();
$("#enumber").hide();


var check = false;
var checkId = false;


$("#successPw").hide();
$("#dangerPw").hide();
var checkPw = false;
var finalPw = null;

//비밀번호 일치 체크
$('#qwCk').keyup(function () {
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


//회원가입 버튼 클릭
$("#btn-join").on("click", function(e) {
   e.preventDefault();
   var id = $("input[name='id']").val();
   var pw = $("input[name='pw']").val();
   var repw = $("input[name='repw']").val();
   var name = $("input[name='name']").val();
   var phone = $("input[name='phone']").val();
   var email = $("input[name='email']").val();infoCh
   var infoCh = $('#infoCh').is(':checked');

   
   
 //회원가입 버튼 중복체크 재확인
   $.ajax({
  		type:'get',
  		async:false,
  		url:'overlayid',
  		data:{'id':id},
  		dataType:'json',
  		success:function(data){
  			console.log(data);
  			
  			if(data.overlay){
  				checkId = false;
  			}

  		},
  		error:function(e){
  			console.log(e);
  		}
  	});
   
   
   
   
   

   			

   
   
   
   
   
   
   	
   
   
   
    
   //아이디,비밀번호 유효성 검사
   if (id == null || id == "") { 
      alert("아이디를 입력해주세요");
      return false;
   } 
   if (pw == null || pw == "") { 
      alert("비밀번호를 입력해주세요");
      return false;
   } 
   if (repw == null || repw == "") { 
      alert("비밀번호 확인을 입력해주세요");
      return false;
   } 
   if (name == null || name == "") { 
      alert("이름을 입력해주세요");
      return false;
   } 
   if (phone == null || phone == "") { 
      alert("전화번호를 입력해주세요");
      return false;
   } 
   
   if (email == null || email == "") { 
	      alert("이메일을 입력해주세요");
	      return false;
	   } 
   
   if (check == false) { 
      alert("인증번호를 확인 해주세요");
      return false;
   } 
   

   if (checkId == false) { 
	      alert("중복체크 확인 해주세요");
	      return false;
	   }
   
   

   if (!phone.match("-")) { 
	      alert("전화번호 '-' 를 확인해 주세요.");
	      return false;
	   } 
   
   
   if(infoCh==false){
	    alert("개인정보동의를 확인해주세요.");
	    return false;
	}
   
		

   
   
   
   
   
   
  
   

   var param = {'id':id};
   param.pw = pw;
   param.name = name;
   param.phone = phone;
   param.email = email;
   param.pw = pw;
   
   console.log(param);
   console.log('서버전송 시작');
   alert("회원가입이 완료 되었습니다.");
   $("form").submit();

   
});



//인증번호를 저장할 변수
var code = "";
//인증번호 이메일 전송
$("#mailCheck").on("click",function(e){
   console.log('버튼확인');
   
   email = $("input[name='email']").val();
   var ecode = $("input[name='ecode']");
   
   
   		if(email==null||email == ''||!email.match("@gmail.com")){
      	 	alert('이메일을 확인해 주세요. (이메일은 gmail 만 가능합니다.)');
	   }else{
		   $("#enumber").show();
		   alert('인증번호 발송이 완료 되었습니다.');
		   $.ajax({
		      type:"GET",
		      url : "mailCheck",
		      data : {email : email},
		      contentType :"text/plain;charset=UTF-8",
		      success : function(data){ //인증번호를 가져옴
	    	  
	    	   e.preventDefault();
	         //checkBox.val(''); // 기존에 값이 있었으면 지워줌
	         $("#alert-success-email").hide();
	         $("#alert-danger-email").hide();
	         check = false;
	         code = data; // 인증번호를 변수에 저장
	         
	      }
		      
	   });
		   
		   
   }
   
});
      
	 
      

      
      
//인증코드 입력 시 동일성 확인
$("input[name='ecode']").keyup(function() {
	
	var inputCode = $("input[name='ecode']").val();
	if (inputCode != "" || code != "") {
		if (inputCode == code) {
			$("#alert-success-email").show();
			$("#alert-danger-email").hide();
			//$("input[name='ecode']").attr("disabled",true); //인증번호 입력 멈춤
			check = true;
		} else {
			$("#alert-success-email").hide();
			$("#alert-danger-email").show();
			check = false;
		}
	}
});      
      
      

      
//아이디 중복 체크
$('#overlay').click(function(){
	console.log('중복 체크 시작!');
	
	var id = $('input[name="id"]').val();
	console.log('check id : ',id);
			
	$.ajax({
		type:'get',
		url:'overlayid',
		data:{'id':id},
		dataType:'json',
		success:function(data){
			console.log(data);
			
			if(data.overlay){
				alert('이미 사용중인 아이디 입니다.');
				$('input[name="id"]').val('');
			}else{
				alert('사용 가능한 아이디 입니다.');
				checkId = true;
			}	
			
		},
		error:function(e){
			console.log(e);
		}
	});			

	
	
	
	
	
	
	
	
	
			
}); 

</script>
</html>