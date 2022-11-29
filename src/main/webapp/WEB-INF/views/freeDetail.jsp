<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> -->
    <script src="resources/js/jquery.twbsPagination.js"></script>
   
   
   
   
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   
   <style>
   	.postArea > td,tr,th{
			border : 1px solid ;
			border-collapse: collapse;
			}
			
	.commentArea{
			
			}		
	.postArea{
		width: 1000px;
    height: 500px;
    text-align: center;
	}
   th{
   		background-color: #F8E0F7;
   }
   
   #commBtn{
   		width: 100%;
   		background-color: grey;
   		color:white;
   		border: none;
   		font-weight:bolder;
   }
   a:visited{
   		color: black;  		
   }
   a:link{
   		color: black;
   }
   textarea{
   		border: none;
    	resize: none;
   
   }
   th a{
   		padding: 10px;
    border: 1px solid;
    margin: 10px;
   }
   </style>
</head>
<body>
<section style="width: 100%; height: 84px; display: flex; background-color: rgb(66, 52, 52);">
        <%@ include file="Header.jsp"%>
    </section>



<div id="detail_frame"  style="margin-left: 400px;margin-top: 50px;">
	<h1 style="
    margin-bottom: 30px;
">자유게시판  상세</h1>
   <table class="postArea">
      <tr>
         <th>제목</th>
         <td colspan = "3">${dto.community_sub}</td>     
      </tr>
      <tr>
      	<th>카테고리</th> 
      	<td> ${dto.category_name}</td>
      	<th>조회수</th>
      	<td>${dto.community_view}</td>     	
      </tr>
      <tr>
         <th>작성자</th>
         <td id ="writer">${dto.mem_id}</td>
         <th>작성일</th>
         <td>${dto.community_date}</td>
      </tr>
     
      <tr>
         <td colspan="4">        
         	<img width="300px" height="300px" src="/photo/${imgs.bphoto_newname}" onerror="this.style.display='none';"/>
         	<br/>
        	 <br/>
         	${dto.community_cont}
         </td>
      </tr>
     	 <tr>
         <th colspan="4" style="text-align: center;height: 70px;">
           	 	<a href="freeList">리스트</a>
           	 	<a href= "freeUpdateForm?community_boardnum=${dto.community_boardnum}"  onclick= "memAuthchk_postUp(event);">수정</a>
           	 	<a href = "freeDelete?community_boardnum=${dto.community_boardnum}" onclick= "memAuthchk_postDel(event);">삭제</a>
           	 	<a href="DeclaForm_Post?community_boardnum=${dto.community_boardnum}" onclick="window.open(this.href,'','width=500, height=500, scrollbars=yes'); return false;">신고</a>
         	</th>
     	</tr> 
   </table>
   
   <br/>
   
   <!--댓글영역 ------------------------------------------------------------------------------------------------------ -->
   
   <div id="free_commentList">
   		<table style="
    width: 1000px;
">
   		<!-- commentCount -->
   			<thead>
	   			<tr>
	   				<th colspan="2" style="background-color: lightgrey">	   				   				
	   					댓글수: ${commentListCnt}	개   				
	   				</th>
	   			</tr>	   			   			
    		</thead>
    		<tbody>
    			<c:forEach items="${commentList}" var="comm">
    				<c:if test="${comm.bcomment_blind != 1}">		
    					<tr>
    						<th style="background-color:gray; color:white; width: 80%" id="comm_writer">&nbsp;&nbsp;${comm.mem_id}</th>
							<th style="background-color:gray; color:white;">${comm.bcomment_date}</th>	    				
    					</tr>
    					<tr>
    						<td style="height: 100px ">${comm.bcomment_cont}</td>
							<td style="text-align: center; border: none">
								<a href="#" onclick= "memAuthchk_comm('${comm.mem_id}','${comm.bcomment_num}');">삭제</a>
							 	<a href="DeclaForm_Comment?bcomment_num=${comm.bcomment_num}" onclick="window.open(this.href,'','width=500, height=300, scrollbars=yes'); return false;">신고</a>
							 </td>	    				
    					</tr>
    				</c:if>	
    			</c:forEach>
   			</tbody>
   			
    </tbody>
   		</table>
   		<form action="free_commentWrite" name="freeCommForm"  method="post" onsubmit="commSubmitchk();" >
   			<div id="commentWriter">
   			<table style="
    width: 1000px;
">
   			<tr>
   				<td>
	   				<input type="hidden" name="mem_id" id="comm_writer" class="comm_writer_class"> 			
	   				<input type="hidden" name='community_boardnum' value='${dto.community_boardnum}'>
   				</td>
   			</tr>
   			<tr>	
   				<td>
	   				<textarea name="bcomment_cont" id="comm_cont" placeholder="댓글 내용을 입력하세요"  style="width: 100%; height: 100px; resize: none " maxlength='300'></textarea>   				
   				</td>
   			</tr>
   			<tr>	
   				<td>
	   				<button id="commBtn">댓글 작성</button>		
   				</td>
   			</tr>
				
   			</table>

   			</div>
   		</form>
   		
   </div>
</div>
   
</body>
<script>

var memberId = '<%=(String)session.getAttribute("loginId")%>';
console.log(memberId);
//document.getElementById("comm_writer").value = memberId;

var currId_P = document.getElementById("writer").innerText;//게시물 작성자 아이디

var loginIda = loginId;
console.log("loginIda : "+loginIda);
loginIdb();
function loginIdb() {
	$(".comm_writer_class").val(loginIda);
}


function memAuthchk_comm(currId_this, currCnum){//댓글삭제 권한 검사
	
	console.log("권한검사 메서드 실행");			
	console.log(currId_this);
	console.log(currCnum);
	
	if(memberId != currId_this){
		alert("권한이 없습니다.");
		event.preventDefault();
	}else{
		alert("삭제 되었습니다.");
		location.href="free_commentDelete?bcomment_num="+currCnum;  
	}

}

function memAuthchk_postDel(event){//게시물 삭제 권한 검사
	
	console.log("권한검사 메서드 실행");			
	console.log(currId_P);
	
	var delChk = confirm("게시물을 삭제하시겠습니까?");	

	if(delChk == true){		
		if(memberId != currId_P){
			alert("권한이 없습니다.");
			event.preventDefault();
		}else{
			alert("삭제되었습니다.")
			
		}
		
		
	}else{
		event.preventDefault();
	}

}

function memAuthchk_postUp(){// 게시물 수정 권한 검사
	
	if(memberId != currId_P){
		alert("권한이 없습니다.");
		event.preventDefault();
	}
	
}

/* function commAuthchk(currBnum){// 댓글작성 권한 검사
		console.log("클릭");
	if(memberId.equals("")||memberId.equals("")){
		console.log("클릭2");
		alert("로그인 후 이용해주세요.");
		location.href= "freeDetail?community_boardnum="+currBnum;
	}
} */


var commenter = document.getElementById('comm_cont');
function commSubmitchk(){
	if(commenter.value == ""){
		alert("댓글 내용을 기입해 주세요")
		document.freeCommForm.bcomment_cont.focus();
		event.preventDefault();
	}
}



</script>
</html>