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
	.followCnt{
	font-size: 16px;
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
		width:100%;
	}
	
	#formCs{
		margin-top:20px;

		border:1px solid #dedede;
		width: 420px;
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

<div id="con_memberDe">
<div id="sujung_txt">
<p id="headTxt">비밀번호 확인</p>
<hr>
<p class="followCnt">개인정보 수정을 위해 비밀번호 확인 부탁드립니다.</p>
		
   <div id="formCs">
     	 <form action="./PassCk" method="POST">
     	 	<table style="margin:20px 45px; ">
	            <tr>
	            	<th style="width: 100px;">ID</th>
	            	<td><input type="text" name="id"  value="${loginId}" class="formSt" readonly="readonly" placeholder="아이디" /></td>
	            </tr>
	          	 <tr>
	          	 	<th>비밀번호</th>
	          	 	<td><input type="password" name="pw" placeholder="비밀번호" class="pw" /></td>
	          	 </tr>
	          	  <tr>
	          	 	<th colspan="2" style="text-align: right; height: 50px;"><button id="btn-join" >확인</button></th>
	          	 </tr>
	          	 
	            </table>
	            
	      </form>
	   </div>
	   
	</div>

</div>
</body>
<script>
var pw = $("input[name='pw']").val();
var msg = "${msg}";


$("#btn-join").on("click", function(e) {
	
	if (msg != "") {
		alert(msg);
	}

		$("form").submit();
	});


	

</script>
</html>