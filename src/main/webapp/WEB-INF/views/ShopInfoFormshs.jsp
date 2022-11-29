<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		*{margin:0 auto;}
		
		.container{
			margin-top:7%;
			padding: 50px 100px;
			border:1px solid #DBDBDB;
			border-collapse: collapse;
			width: 900px;
			height: 450px;
			background-color: white;
			border-radius: 8px;
		}
		.titleTxt {
			margin-right:40px; 
			margin-left:20px; 
			color: #5c5c5c;
			font-weight:500;
		}
		
		.inpSt{
			border:1px solid #c8c8c8;
			border-radius: 3px;
			
		}

		#btn-join{
			padding: 7px 20px;
			background-color: #21aeb7;
			border-radius: 5px;
			color: white;
			float: right;
			border: 1px solid white;
			cursor: pointer;
		}
		
		.Txtdiv{
			margin: 20px 0;
		}
		

		
		
	</style>
</head>
<body bgcolor="#EAEAEA">
	<a href="./"><img alt="logo" src="/photo/LOGO02.png"></a>
<div class="container">
<div class="formDiv">
        <form action="ShopInfo" method="post" enctype="multipart/form-data">
              
                	<div style="font-size: 26px; font-weight: bold; color:#525252; margin-bottom: 30px;">매장 정보</div>
                	<input type="hidden" name="shopid" value="${id}" />
                	
                	<div class="Txtdiv"><span class="titleTxt">매 장 명</span>
                   		<input type="text" name="shopname" class="inpSt" style="width: 300px;height: 30px;"/>
                   	</div>
                	
                    <div class="Txtdiv"><span class="titleTxt" >매장소개</span><textarea rows="5"  style="width:700px;" name="shopSogae" class="inpSt"></textarea></div>
                   	<div class="Txtdiv"><span class="titleTxt">사업번호</span>
                   		<input type="text" name="shopSaup" class="inpSt"  id="saupNum" style="width: 300px;height: 30px;" placeholder=" '-' 포함하여 입력해 주세요"/>
                   	</div>
                    
                    
                   	<div class="Txtdiv"><span class="titleTxt">미용대상</span>
                   	<input type="checkbox" name="smallD" value="1" class="inpSt" checked>소형견
                    <input type="checkbox" name="middleD" value="1" class="inpSt" checked>중형견
                     <input type="checkbox" name="bigD" value="1" class="inpSt" checked>대형견	
                    </div>
                    
                    <div class="Txtdiv"><span class="titleTxt">매장사진</span>
                    	<input type="file" id="file" name="shopPhoto" class="inpSt"/></div>  
					
					<div class="Txtdiv" >
	                        <span style="margin-right: 160px;"><span class="titleTxt">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</span>
	                        <select name="addr" class="inpSt" style="width: 100px;height: 30px;">
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
                    		</span>   
							<span  class="titleTxt">상세주소 <input type="text" name="shopAddr" class="inpSt"  style="width: 300px;height: 30px;margin-left: 40px;"/></span>
						</div>
                       <input type="submit" value="다음" id="btn-join"/>

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
var  shopSaupCk = false;



//매장 정보등록 버튼 클릭
$("#btn-join").on("click", function(e) {
   e.preventDefault();
   var shopSogae = $("textarea[name='shopSogae']").val();
   var shopSaup = $("input[name='shopSaup']").val();
   var smallD = $("input[name='smallD']").val();
   var middleD = $("input[name='middleD']").val();
   var bigD = $("input[name='bigD']").val();
   var shopPhoto = $("input[name='shopPhoto']").val();
   var addr = $("input[name='addr']").val();
   var shopAddr = $("input[name='shopAddr']").val();
   
   //유효성검사
   if (shopSogae == null || shopSogae == "") { 
      alert("매장소개를 입력해주세요");
      return false;
   } 
   if (shopSaup == null || shopSaup == "") { 
      alert("사업자번호를 입력해주세요");
      return false;
   } 
   
   if (!shopSaup.match("-")) { 
	      alert("사업자번호에 '-' 를 입력해주세요");
	      return false;
	   } 
   
   if (shopPhoto == null || shopPhoto == "") { 
      alert("매장사진을 입력해주세요");
      return false;
   } 

   if (shopAddr == null || shopAddr == "") { 
      alert("상세주소를 입력해주세요");
      return false;
   } 
  
   if (shopSaupCk == false) { 
	      alert("이미 사용중인 사업자 번호 입니다.");
	      return false;
	   }
   
   


   alert('매장정보 등록이 완료되었습니다');
   $("form").submit();


});



//사업자 중복 체크
$('#saupNum').keyup(function(){
  	console.log('사업자 중복 체크 시작!');
  	
  	var shopSaup = $('input[name="shopSaup"]').val();
  	console.log('check shopSaup : ',shopSaup);
  			
  	$.ajax({
  		type:'get',
  		url:'shopSaupCk',
  		data:{'shopSaup':shopSaup},
  		dataType:'json',
  		success:function(data){
  			console.log(data);
  			
  			if(data.shopSaup){
  				shopSaupCk = false;
  				
  			}else{
  				shopSaupCk = true;
  			}	
  			
  		},
  		error:function(e){
  			console.log(e);
  			}

  		
  	});
  	
  	
    
});






  
	

</script>
</html>