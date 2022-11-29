<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>이쁘개 비밀번호찾기</title>
        <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
        <link rel="icon" href="./icon.png">
        <style type="text/css">
            
            /*드래그 금지*/
            .no-drag {-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;} 

            /*레이아웃*/
            * {margin: 0; padding: 0;}
            #wrap {text-align: center; font-size: 30px; color: black; font-size: 16px;}
            #header {height: 140px; line-height: 140px; background: white; color: black; font-size: 16px;}
            #banner {height: 150px; line-height: 250px; background: white; color: black; font-size: 16px;}
            #contents {height: 450px; line-height: 450px; background: white; color: black; font-size: 16px;}
            #footer {height: 220px; line-height: 220px; background: white; color: color: black; font-size: 16px;}
                .container {width: 1100px; height: inherit; margin: 0 auto; background: white; color: black; font-size: 16px;}

            /*테이블*/
            table{
                height: 40px; 
                line-height: 10px; 
                margin: 0 auto;
                position: relative;
            }

            th, td{ 
                border-collapse: collapse;
                padding :1px;
		    }
		    
		    #id, #name, #phone, #email{
		    	width:290px;
		    	height:40px; 
		    	font-size:13px; 
		    	padding-left: 10px; 
		    	border: 1px solid gray; 
		    	border-radius: 3px / 3px;
		    }
		    
		    #logo{
		  		position: absolute;
                top: 5%;
                left: 8%;
                width: 80px;
                height: 80px;
		    	/* border: 1px solid black;  */
		    	cursor:pointer;
		    }
		    
		    #alert-danger-pws{
		    	color:red;
		    	font-size:13px;
		    	height:20px;
		    	margin-top:5px;
		    	text-align: center;
		    }
        </style>
    </head>
    <body class="no-drag">
    <%@ include file="Header.jsp"%>
    <div>
		<a href="./"><img src="/photo/LOGO.PNG"/></a>
	</div>
        <div id="wrap">
            <div id="header">
                <div class="container"></div>
            </div>
            <div id="banner">
                <div class="container"><h2 style="color: pink;">비밀번호 찾기</h2></div>
            </div>
            <div id="contents">
                <div class="container">
                	<form action="PwS" method="POST" onsubmit="return submitCheck();" id="PwS">
                        <table>
                            <tr>
                                <td><input type="text" placeholder="아이디를 입력해주세요" id=id name="userId"/></td>
                            </tr>
                            <tr>
                                <td><input type="text" placeholder="이름을 입력해주세요" id="name" name="userName"/></td>
                            </tr>
                            <tr>
                                <td><input type="text" placeholder="전화번호를 입력해주세요(-포함)"  id="phone" name="userPhone"/></td>
                            </tr>
                            <tr>
                                <td><input type="email" placeholder="이메일를 입력해주세요"  id="email" name="userEmail"/>
                                <div class="alert alert-danger" id="alert-danger-pws">입력하지 않은 항목이 있습니다.</div>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="button"  
                                	style="background-color: #F8E0F1; margin:auto; display:block; cursor:pointer; 
                                	font-size: 16; width:290px;height:40px; color:black; border-radius: 5px / 5px; border: 0; "  value="확인" id="PwSearchBtn"/></td>
                            </tr>

                        </table>
                	</form>
                </div>
            </div>
            <div id="footer">
                <div class="container"></div>
            </div>
        </div>
    </body>

    <script>
    $("#alert-danger-pws").hide();
    var check = false;
    var inputName ="";
    var inputPhone ="";
    var inputEmail ="";
    
	$("input[name='userId']").keyup(function() {
    	inputId = $("input[name='userId']").val();
    	if (inputId != "" && inputName != "" && inputPhone != "" && inputEmail != "") {
		  		$("#alert-danger-pws").hide();
				check = true;
			} else {
				$("#alert-danger-pws").show();
				check = false;
    		}
    }); 
    
    $("input[name='userName']").keyup(function() {
    	inputName = $("input[name='userName']").val();
    	if (inputId != "" && inputName != "" && inputPhone != "" && inputEmail != "") {
	    		$("#alert-danger-pws").hide();
				check = true;
			} else {
				$("#alert-danger-pws").show();
				check = false;
    		}
    }); 
    
    $("input[name='userPhone']").keyup(function() {
    	inputPhone = $("input[name='userPhone']").val();
    	if (inputId != "" && inputName != "" && inputPhone != "" && inputEmail != "") {
	    		$("#alert-danger-pws").hide();
				check = true;
			} else {
				$("#alert-danger-pws").show();
				check = false;
    		}
    }); 
    
    $("input[name='userEmail']").keyup(function() {
    	inputEmail = $("input[name='userEmail']").val();
    	if (inputId != "" && inputName != "" && inputPhone != "" && inputEmail != "") {
    			$("#alert-danger-pws").hide();
    			check = true;
    		} else {
    			$("#alert-danger-pws").show();
    			check = false;
    		}
    }); 

    
	 function submitCheck() {
  	   if(check != true) {
  		  
  	   		return false;
	}	
  	  		return true
  	}
 		 
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}
		 
	$('#PwSearchBtn').click(function() {
		var $id = $('#id').val();
		var $name = $('#name').val();
		var $email = $('#email').val();
		var $phone = $('#phone').val();
		
		if ($id == '') {
			alert("아이디를 입력해주랑개~");
		}else if ($name == '') {
			alert("이름을 입력해주랑개~");
		}else if ($phone == '') {
			alert("전화번호를 입력해주랑개~");
		}else if ($email == '') {
			alert("이메일을 입력해주랑개~");
		}else {
			$('#PwS').submit();
		}
		
		
	})
  		
   		
    </script>

</html>