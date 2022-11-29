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
      right:0px;
      float:right;
      width:900px;
      
      
   }
   
   #sujung_txt p{
   display: inline;
   }
   
   
   .formSt{
      padding:5px;
      margin:5px;
      margin-bottom: 5px;
   }

	#headTxt{
	  font-size: 28px;
 	 font-style: bold;
	}
	
	
	
	#MyDog_btn{
		border: 1px solid white;
		padding: 5px 10px;
		background-color: #2C767B;
		color: white;
	}
	
	.btn_ds{
		border: 1px solid #D985B7;
		background-color: white;
		padding: 5px 10px;
		color: #D985B7;
	}
	
	.btn_ds:hover{
		border: 1px solid #D985B7;
		background-color: #D985B7;
		padding: 5px 10px;
		color: white;
	}
		

	</style>
</head>
<body>
<%@ include file="Header.jsp"%>
<%@ include file="cywMyPageMenuBarNomal.jsp"%>		


<div id="con_memberDe">

<div id="sujung_txt">
<p id="headTxt">애견정보 확인</p>
<hr>
	<span style="font-size: 20px; " >현재 <span id="loginId">${loginId}</span> 님의 등록된 댕댕이는 ${size} 마리 입니다.</span>
	<a href="./MyDogInfoshs?mem_id=${loginId}" ><input type="button" value="+강아지등록" style="float: right;" id="MyDog_btn"></a>
   <div id="formCs" >
     	 <table width="800px;">
     	 	<c:if test="${size == 0}">
     	 		<tr><td>등록된 강아지가 없습니다</td></tr>	
     	 	</c:if>
     	 	<c:if test="${size>0}">
     	 	
	     	 	<c:forEach items="${list}" var="doginfo">
	     	 		<tr>
	     	 			<th><img alt="썸네일" src="/photo/images.png" width="100px" height="100px"></th>
	     	 			<td>
	     	 				<span class="dogName">${doginfo.dog_name}</span><span class ="dogNum" hidden="hidden">${doginfo.dog_num}</span>(${doginfo.dog_age}살)<br>
	     	 				${doginfo.dog_weight}<br>
	     	 				등록일 : ${doginfo.dog_date}
	     	 			</td>
	     	 			<td><button onclick="MyDogsujungshs('${doginfo.dog_name}')" class="btn_ds">수정</button>
	     	 			<button onclick="dogDel('${doginfo.dog_num}')" class="btn_ds">삭제</button></td>
	     	 		</tr>	
	     	 		<tr>
	     	 			<td  colspan="3">
	     	 				<hr >
	     	 			</td>
	     	 		</tr>
	     	 	</c:forEach>	
     	 	</c:if>
	      </table>
	   </div>
	</div>

</div>
</body>
<script>
var id = $('#loginId').html();
var dogName = $('.dogName').html();
var dogNum = $('.dogNum').html();

function MyDogsujungshs(dogName) {
		//console.log('수정 로그');
		//console.log(id,dogName);
		//alert(dogName);
	location.href="./MyDogsujungshs?dogName="+dogName;	
	}




	function dogDel(dogNum) {
		//console.log('삭제 로그');
		confirm('등록된 강아지 정보를 삭제하시겠습니까?');
		//dogNumconsole.log(dogNum);
		
		 $.ajax({
			type:'get',
			url:'DogDel',
			data:{'id':id,'dogName':dogNum},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				location.reload();
			},
			error:function(e){
				console.log(e);
			}
		}); 
		
	
	
		
	}


</script>
</html>