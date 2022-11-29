<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
   <head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <style>
   
	   	table, th, td{
			border-collapse: collapse;
			}
   </style>
</head>
<body>
	<h1>게시물  신고</h1>
   <form method="POST" id="declaForm">
      <table>
         <tr>
            <th style="width: 150;">게시물 작성자</th>
            <td>
            <input type="hidden" name="dec_targetNum" value = "${dto.community_boardnum}">
            <input type="text" id="dec_id" name="dec_id" value="${dto.mem_id}" readonly="readonly" style="border: 0;">
           </td>
         </tr>
         <tr>
            <th>게시물 내용</th><!-- 게시글, 댓글 어떻게 구분해야 할까 --> <!-- 댓글번호가  0이면? 글번호 출력  -->
            <td style="padding: 50px 0;/* width: 184px; */">${dto.community_cont}</td>
         </tr>
         <tr>
            <th>유형</th>
            <td>
            	<select name="decO_num" id="decOP_selecter" style="width: 100px;height: 45px;"> 
						<c:forEach items="${list}" var="declaOP"> 																				
							<option value="${declaOP.decO_num}">${declaOP.decO_cont}</option>												
						</c:forEach> 
				</select>	
            </td>
         </tr>
         <tr>
            <th colspan="2">
            	<input type="hidden" name="mem_id" id="reporter">
              	<button onclick = "declaMsg(); return false" style="width: 150px;height: 50px;background-color: black;color: white;border: 0;margin-top: 50px;">제출</button>
            </th>
         </tr>
      </table>
   </form>
</body>
<script>
var memberId = '<%=(String)session.getAttribute("loginId")%>';
document.getElementById("reporter").value = memberId;


var decId = document.getElementById("dec_id").value;
var reporter = document.getElementById("reporter").value;


if(decId==reporter){
	autoClose();
}

function autoClose(){
	alert("권한이 없습니다.");
	self.close();
}





function declaMsg(){// 신고뒤 창닫음
	
	var declaData = $('#declaForm').serialize();
	
	$.ajax({
	    url: '/dog/DeclaSend_post',
	    type: 'POST',
	    data : declaData,
	    cache: false,
	    success: function(data){
	    	console.log(data);
	      	alert('신고가 접수 되었습니다.');
	      	self.close(); 
	    },
	    error:function(e){
	        console.log(e);
	     }
	  });
	 
}

</script>
</html>