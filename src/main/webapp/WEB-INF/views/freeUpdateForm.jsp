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
   	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  
   	<script src="resources/js/jquery.twbsPagination.js"></script>
	<style>
		table{
			border : 0;
			border-collapse: collapse;
			width: 1000px;
			height: 500px;
			}
		
			
		
	</style>
</head>
<body>
 <section style="width: 100%; height: 84px; display: flex; background-color: rgb(66, 52, 52);">
        <%@ include file="Header.jsp"%>
    </section>



	<h1 style="position: relative;top: 50px;font-size: 30px;left: 300px;">자유게시판 게시물 수정</h1>
	<form action="freeUpdate" name="freeForm" method="POST" enctype="multipart/form-data" onsubmit="submit_chk(event);"><!-- 여러가지~ -->
      	<table  style="position: absolute;top: 200px;left: 300px;">
         <tr style="height: 5%">
            <td>
            	<input type="text" name="community_sub" id="subject" style="width: 70%" value = "${dto.community_sub}"  maxlength='20'>
            	
            	
            	
	            	<select name="category_num" id="category" style="width: 150px;height: 27px;" > 
	            	
						<option value="${dto.category_num}"  selected="selected">${dto.category_name}</option> 
						
							<c:forEach items="${category}" var="sel"> 
								<!-- 트렌드 게시판 , 블라인드된 카테고리, 관리자용 카테고리 필터링-->
								<c:if test="${sel.category_num != 3 && sel.category_blind != 1  && sel.category_admin != 1}">			
									<!-- 카테고리 번호, 블라인드된 카테고리 여부, 관리자용 카테고리 여부, 카테고리 이름 -->			
									<option value="${sel.category_num}">${sel.category_name}</option>							
								</c:if>	
							</c:forEach> 
					</select>	
            	
            	
            </td>
         </tr>
         <tr style="height: 5%">      
            <td>
            	<input type="hidden" name="mem_id"  id="writer" value="${dto.mem_id}"/>
            	<input type="hidden" name="community_boardnum"  value="${dto.community_boardnum}"/>
            </td>
         </tr>
         <tr style="height: 60%">     
            <td>
            	<textarea name="community_cont" id="content" style="width: 100%; height: 100%"  maxlength='1000'>${dto.community_cont}</textarea>
           	</td>
         </tr>
        
         
       <tr style="height: 20%">
            <td>
            	<div id="image_container" style="width: 130px; height: 130px; margin: 20px">
            	          	
	            	<img width="120px" height="120px" id="oldImg" src="/photo/${imgs[0].bphoto_newname}" onerror="this.src='/photo/photoerror.PNG';"/>
   
            	</div>
            		
            		<input type="file" name="imgs" onchange="setThumbnail(event);" accept ="image/*"  style="margin-top: 10px;"/>
            		
            		
            </td>
         </tr>
         <tr style="height: 10%">
            <th colspan="2">
               <input type="button" onclick="listChk();" value="목록"  style="width: 150px;height: 30px;position: absolute;top: -60px;left: 600px;border: 0;background: pink;"/>
             	<button  style="border: 0;background-color: pink;width: 200px;height: 50px;margin-top: 10px;">제출</button>
            </th>
         </tr>
      </table>
   </form>

	
</body>



<script>
var memberId = '<%=(String)session.getAttribute("loginId")%>';
document.getElementById("writer").value = memberId;
memRankChk();


function memRankChk(){
	$.ajax({
		type:'get',
		url:'idChk',
		data:{'memberId':memberId},
		dataType:'JSON',
		success:function(data){
			console.log("memberIdRank" + data.memberInfo[0].mem_rank);
			if(data.memberInfo[0].mem_rank == 2){
				$('#category').append('<option value=1>공지사항</option>');	
			}
		},
		error:function(e){
			console.log(e);
		}
	});
}


function submit_chk(event){
	var sub = document.getElementById('subject').value;
	var cat = document.getElementById('category_selecter').value;
	var con = document.getElementById('content').value;
	
	if(sub == ""){
		alert("제목을 기입하세요")
		document.freeForm.community_sub.focus();
		event.preventDefault();
	} else if(cat == ""){
		alert("카테고리를 선택하세요")
		document.freeForm.category_num.focus();
		event.preventDefault();
	} else if(con == ""){
		alert("내용을 기입하세요")
		document.freeForm.community_cont.focus();
		event.preventDefault();
	} else{
		alert("게시물을 수정하였습니다.");
	}
	
	
}


var container = document.getElementById("image_container");
var oldImage = document.getElementById("oldImg");
	
function setThumbnail(event) { 
	var reader = new FileReader(); 

	container.removeChild(oldImage);
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		img.setAttribute('height', '120px');
		img.setAttribute('width', '120px');
		img.setAttribute("id", "oldImg");
		document.querySelector("div#image_container").appendChild(img); 
	}; 
	reader.readAsDataURL(event.target.files[0]); 
	}

function listChk(){
	if(confirm("저장하지 않은 내용은 지워집니다. 이동하시겠습니까?") == true){
		location = './freeList';
	}else{
		 return;
	}
		
}


	
	
	
</script>
</html>