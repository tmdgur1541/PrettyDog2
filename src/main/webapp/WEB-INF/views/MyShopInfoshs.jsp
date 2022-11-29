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
   .pw{
      padding:5px;
      margin:5px;
      margin-bottom: 5px;
   }
	#headTxt{
	  font-size: 28px;
 	 font-style: bold;
	}
		
		

	</style>
</head>
<body>
<%@ include file="Header.jsp"%>
<%@ include file="cywMyPageMenuBarOwner.jsp"%>	
<div id="con_memberDe">

<div id="sujung_txt">
<p id="headTxt">매장정보</p>
<hr>

   <div id="formCs">
   
     	 <form action="shopUp" method="POST">
     	 
     	 	<table>
     	 		<tr>
	            	<th>아이디</th>
	            	<td><input style="border:1px solid white;" type="text" name="id"  value="${loginId}" class="formSt" readonly="readonly" /></td>
	            </tr>
	            <tr>
	            	<th>매장명</th>
	            	<td ><input type="text"  style="border:1px solid #ccc;" value="${shopinfo.busin_name}" name="busin_name" class="formSt"></td>
	            	<th>사업자번호</th>
	            	<td><input type="text" style="border:1px solid #ccc;"  value="${shopinfo.busin_num}" name="busin_num" class="formSt"  readonly="readonly"></td>
	            	<th>취급강아지</th>
	            		<td>
                        	<input type="checkbox" name="smallD"  value="1" checked>소형견
                        	<input type="checkbox" name="middleD" value="1" checked>중형견
                        	<input type="checkbox" name="bigD" value="1" checked>대형견
                        </td>    
	            </tr>
	           <tr>
	           		<th>지  &nbsp;&nbsp;&nbsp;역</th>
	           		<td colspan="3"  >
		           			<select name="addr" style="border:1px solid #ccc;" >
		           				<option value="${shopinfo.busin_area}">${shopinfo.busin_area}</option>
		                         <option value="서울특별시">서울특별시</option>
		                         <option value="인천광역시">인천광역시</option>
		                         <option value="대전광역시">대전광역시</option>
		                         <option value="광주광역시">광주광역시</option>
		                         <option value="대구광역시">대구광역시</option>
		                         <option value="울산광역시">울산광역시</option>
		                         <option value="부산광역시">부산광역시</option>
		                         <option value="경기도">경기도</option>
		                         <option value="강원도">강원도</option>
		                         <option value="충청북도">충청북도</option>
		                         <option value="충청남도">충청남도</option>
		                         <option value="전라북도">전라북도</option>
		                         <option value="전라남도">전라남도</option>
		                         <option value="경상북도">경상북도</option>
		                         <option value="경상남도">경상남도</option>
		                         <option value="제주도">제주도</option>
	                    	 </select>
	           		<th>상세주소</th>
	           		<td><input type="text" value="${shopinfo.busin_juso}" name="shopAddr"  class="formSt"   style="border:1px solid #ccc;"></td>
	           		</tr>
	           <tr>
	           		<th>매장소개</th>
	           		<td colspan="5"><textarea name="shopSogae"  class="formSt" style="width:100%; height: 200px; border:1px solid #ccc;" >${shopinfo.busin_info}</textarea></td>
	           	</tr>
	            <tr><td colspan="6" style="border:0px; text-align: center; border-bottom:1px solid #dedede;">
	            <button id="btn-join"  style="border:1px solid #fff; font-size: 15px; font-weight: bold; border-radius: 10px; cursor: pointer;" >저장</button></td></tr>
			</table>
	      </form>
	   </div>
	</div>

</div>
</body>
<script>

$("#btn-join").click(function() {
	   var shopSogae = $("textarea[name='shopSogae']").val();
	   var shopSaup = $("input[name='shopSaup']").val();
	   var addr = $("select[name='addr']").val();
	   var shopAddr = $("input[name='shopAddr']").val();
	   var smallD = $("input[name='smallD']").val();
	   var middleD = $("input[name='middleD']").val();
	   var bigD = $("input[name='bigD']").val();
	   var shopName = $("input[name='busin_name']").val();
	   var shopNum = $("input[name='busin_num']").val();
	   
	 //유효성검사
	 
	  if (shopName == null || shopName == "") { 
	      alert("매장명을 입력해주세요");
	      return false;
	   } 
	   
	  if (shopNum == null || shopNum == "") { 
		      alert("사업자번호를 입력해주세요");
		      return false;
		   } 
	 
	  if (addr == null || addr == "") { 
		     alert("지역을 선택해주세요");
		     return false;
	   }
	  
	  if (shopAddr == null || shopAddr == "") { 
	      alert("상세주소를 입력해주세요");
	      return false;
	   } 
	  
	  if (shopSogae == null || shopSogae == "") { 
	      alert("매장소개를 입력해주세요");
	      return false;
	   }
	 
	  
	   
	  
	   
	   
	   
	 
	   
	  
	   

	
	
	alert('저장이 완료되었습니다.');
	$("form").submit();
});	





</script>
</html>