<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  -->
    <script src="resources/js/jquery.twbsPagination.js"></script>
    
    <script src="resources/js/jquery.twbsPagination.js"></script>
	
    <style>
        #body{
            width: 100%;
            height: auto;
            background-color: rgb(167, 167, 167);
        } 
      
        .sidebar{
            border-top: 1px solid #d5d5d5;
            height: 70px;
            line-height: 70px;
            cursor: pointer;       
        }

        .sidebar:last-child{
            border-bottom: 1px solid #d5d5d5;
        }
        
        a .sidebar{
            text-align: center;
            color: white;
        }
        
        .sidebar:hover{
            font-weight: bold;
            color: #020202;
            background-color: rgb(167, 167, 167);
        }

		table {
			border-collapse: collapse;
			/* text-align: left; */
			line-height: 1.5;
			border: 1px solid #ccc;
			margin: 20px 10px;
			/* width: 600px; */
		}
		table thead {
			border-right: 1px solid #ccc;
			border-left: 1px solid #ccc;
			background: #e7708d;
		}
		table thead th {
			padding: 10px;
			font-weight: bold;
			vertical-align: top;
			color: #fff;
		}
		table tbody th {
			width: 150px;
			padding: 10px;
			font-weight: bold;
			vertical-align: top;
			border-bottom: 1px solid #ccc;
			background: #fcf1f4;
		}
		table td {
			width: 350px;
			padding: 10px; 
			vertical-align: top;
			border-bottom: 1px solid #ccc;
		}
		
		#HangmokList{
			position: absolute;
			top: 120px;
			/* left: 10px; */
		}
 
   </style>

<body id="body">
    <!-- 상단 바 고정 -->
    <section style="width: 100%; height: 54px; display: flex; background-color: white;">
        <%@ include file="APHeader.jsp"%>
    </section>


    <!-- 중간 영역(내용, 사이드 바) -->
    <section style="width: 100%; height: 914px; display: flex;">
        
        <!-- 사이드 바 고정 -->
        <div style="width: 13%; height: 100%; background-color:rgb(75 70 70);"> 

            <div style="width: 100%; height: 9%;;"></div>

            
            <div style="width: 100%; height: 79%;">
                <a href="apuserlist2" style="text-decoration:none;"><div class= "sidebar" style="background-color: rgb(167, 167, 167); color: #020202; font-weight: bold;">회원조회 및 관리</div></a>
                <a href="apshoplist2" style="text-decoration:none;"><div class= "sidebar" >매장조회 및 관리</div></a>
                <a href="appointlist2" style="text-decoration:none;"><div class= "sidebar" >포인트 내역 조회</div></a>
                <a href="apreservelist2" style="text-decoration:none;"><div class= "sidebar" >예약 조회</div></a>
                <a href="SingoListPage" style="text-decoration:none;"><div class= "sidebar" >신고 관리</div></a>
                <a href="SingoHangmokPage" style="text-decoration:none;"><div class= "sidebar" >신고 항목 관리</div></a>
                <a href="AdminServicePage" style="text-decoration:none;"><div class= "sidebar" >추가서비스 관리</div></a>
                <a href="categoryPage" style="text-decoration:none;"><div class= "sidebar" >카테고리 관리</div></a>
                <a href="ChangeListPage" style="text-decoration:none;"><div class= "sidebar" >환전 신청 관리</div></a>
            </div>

        </div>
        <!-- 내용 -->
        <div style="width: 87%; height: 100%;">
            <!-- 검색 바 -->
            <div style="width: 100%; height: 5%;">
                
            </div>

            <div style="width: 100%; height: 85%; display: flex;">
                <div style="width: 5%; height: 100%;"></div>
                <!-- 내용 -->
                <div style="display: flex; width: 90%; height: 100%; background-color:rgb(255, 255, 255); border : 1px solid transparent; border-radius: 20px 20px 20px 20px;">
                	<div style="width: 2.5%; height: 100%;"></div>
					<form style="width: 30%; height: 100%;">
						<div style="width: 100%;  height: 100%;">
							<div style="width: 100%;  height: 5%;"></div>
							<div style="width: 100%;  height: 90%;background-color: #dbdbdb3d;  border: 0px solid transparent; border-radius: 20px 20px 20px 20px; box-shadow: 5px 5px 5px;" >
							
								<div style="width: 100%;  height: 10.4%; background-color: #9f8ac1; border : 0px solid transparent; border-radius: 20px 20px 0px 0px;
								display: flex; justify-content: center; align-items: center;">
									<b  style="color: white; text-align: center; font-size: 22px;">회원정보</b>
								</div>
								<div style="width: 100%;  height: 12.8%; border : 0px solid transparent;
								display: flex; justify-content: center; align-items: center;">
									<a style="width: 23%; height: 60%; font-size: 20px;">아이디</a>
									<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
									<a style="width: 52%; height: 60%; font-size: 20px;">${info.mem_id}</a>
								</div>
								<div style="width: 100%;  height: 12.8%; border : 0px solid transparent;
								display: flex; justify-content: center; align-items: center;">
									<a style="width: 23%; height: 60%; font-size: 20px;">이름</a>
									<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
					                <a style="width: 52%; height: 60%; font-size: 20px;">${info.mem_name}</a>
								</div>
								<div style="width: 100%;  height: 12.8%; border : 0px solid transparent;
								display: flex; justify-content: center; align-items: center;">
									<a style="width: 23%; height: 60%; font-size: 20px;">회원상태</a>
									<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
					                <a style="width: 52%; height: 60%; font-size: 20px;"><input type="text" name="mstate"  value="${info.mem_state}" disabled/></a>
								</div>
								<div style="width: 100%;  height: 12.8%; border : 0px solid transparent;
								display: flex; justify-content: center; align-items: center;">
									<a style="width: 23%; height: 60%; font-size: 20px;">가입일</a>
									<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
									<a style="width: 52%; height: 60%; font-size: 20px;">${info.mem_date} </a>
								</div>
								<div style="width: 100%;  height: 12.8%; border : 0px solid transparent;
								display: flex; justify-content: center; align-items: center;">
									<a style="width: 23%; height: 60%; font-size: 20px;">회원등급</a>
									<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
					                <a style="width: 52%; height: 60%; font-size: 20px;"><input type="text" name="mrank"  value="${info.mem_rank}" disabled/></a>
								</div>
								<div style="width: 100%;  height: 12.8%; border : 0px solid transparent;
								display: flex; justify-content: center; align-items: center;">
									<a style="width: 23%; height: 60%; font-size: 20px;">이메일</a>
									<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
					                <a style="width: 52%; height: 60%; font-size: 20px;">${info.mem_email}</a>
								</div>
								<div style="width: 100%;  height: 12.8%; border : 0px solid transparent; border-radius: 0px 0px 20px 20px; 
								display: flex; justify-content: center; align-items: center;">
									<a style="width: 23%; height: 60%; font-size: 20px;">전화번호</a>
									<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
					                <a style="width: 52%; height: 60%; font-size: 20px;">${info.mem_tel}</a>
								</div>
							</div>
							<div style="width: 100%;  height: 5%;"></div>
					        
						</div>
				    </form>
				    
					
					<div style="width: 2.5%; height: 100%;"></div>
				    <form style="width: 30%; height: 100%;" id="apadmin" action="appointupdate" method="post">
				    
				    	<div style="width: 100%;  height: 100%;">
							<div style="width: 100%;  height: 20%;"><input style="display: none" type="text" name="id" value="${info.mem_id}" readonly/></div>
							<div style="width: 100%;  height: 45%;background-color: #dbdbdb3d;  border: 0px solid transparent; border-radius: 20px 20px 20px 20px; box-shadow: 5px 5px 5px;" >
							
								<div style="width: 100%;  height: 20%; background-color: #9f8ac1; border : 0px solid transparent; border-radius: 20px 20px 0px 0px;
								display: flex; justify-content: center; align-items: center;">
									<b  style="color: white; text-align: center; font-size: 22px;">포인트 수정</b>
								</div>
								<div style="width: 100%;  height: 20%; border : 0px solid transparent;
								display: flex; justify-content: center; align-items: center;">
									<a style="width: 25%; height: 60%; font-size: 20px;">보유 포인트</a>
									<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
									<a style="width: 50%; height: 60%; font-size: 20px;">${info.mem_point}</a>
								</div>
								<div style="width: 100%;  height: 20%; border : 0px solid transparent;
								display: flex; justify-content: center; align-items: center;">
					                <a style="width: 25%; height: 60%; font-size: 20px;">처리 내용</a>
					                <a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
					                <a style="width: 50%; height: 60%; font-size: 20px;">관리자 임의 수정</a>
								</div>
								<div style="width: 100%;  height: 20%; border : 0px solid transparent;
								display: flex; justify-content: center; align-items: center;">
					                <a style=" height: 60%; font-size: 20px;">
					                <input type="radio" id="bbb" name="pointstate" value="0" onchange="setDisplay()" checked="checked"> 적립
				    				<input type="radio" id="aaa" name="pointstate" value="1" onchange="setDisplay()"> 차감
				    				</a>
								</div>
								<div style="width: 100%;  height: 20%; border : 0px solid transparent;
								display: flex; justify-content: center; align-items: center;">
					                <a style=" height: 60%; font-size: 20px;"><input type="text" name="CHpoint" value="${info.point_cdc}" placeholder="ex) 100(적립), -100(차감)"/></a>
								</div>
							</div>
							<div style="width: 100%;  height: 1%;"></div>
							<div style="width: 100%;  height: 10%; ">
								<div style="width: 100%;  height: 100%;
								display: flex; justify-content: center; align-items: center;">
									<input style="width: 25%; height: 65%; box-shadow: 2px 2px 2px;" type="submit" class="btn btn-outline-secondary" value="수정" >	
								</div>
							</div>
							<div style="width: 100%;  height: 20%;"></div>
						</div>

				        
				    </form> 
				    
				    
				    
				    
				    
				    
					
					<div style="width: 2.5%; height: 100%;"></div>
					<form style="width: 30%; height: 100%;" action="apuserupdate" method="post">
					
						<div style="width: 100%;  height: 100%;">
						
							<div style="width: 100%;  height: 10%;"> <input style="display: none" type="text" name="id" value="${info.mem_id}" readonly/></div>
							
							<div id="apstate" style="width: 100%;  height: 30%;background-color: #dbdbdb3d;  border: 0px solid transparent; border-radius: 20px 20px 20px 20px; box-shadow: 5px 5px 5px;" >
							
								<div style="width: 100%;  height: 30%; background-color: #9f8ac1; border : 0px solid transparent; border-radius: 20px 20px 0px 0px;
								display: flex; justify-content: center; align-items: center;">
									<b  style="color: white; text-align: center; font-size: 22px;">회원상태</b>
								</div>
								<div style="width: 100%;  height: 70%; border : 0px solid transparent;
								display: flex; justify-content: center; align-items: center;">
					                <a style="font-size: 20px;">
					                	<input type="radio" name="state" value="0" 
										<c:if test="${info.mem_state eq '0'}"> checked</c:if>/> 일반
										&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="state" value="1" 
										<c:if test="${info.mem_state eq '1'}"> checked</c:if>/> 제재
										<input style="display: none;" type="radio" name="state" value="2" 
										<c:if test="${info.mem_state eq '2'}"> checked</c:if>/>
										<input style="display: none;" type="radio" name="state" value="3" 
										<c:if test="${info.mem_state eq '3'}"> checked</c:if>/>
				    				</a>
								</div>
							</div>
							
							<div style="width: 100%;  height: 2%;"></div>
							
							<div id="apbt" style="width: 100%;  height: 5%; ">
								<div style="width: 100%;  height: 100%;
								display: flex; justify-content: center; align-items: center;">
									<input style="width: 25%; height: 100%; box-shadow: 2px 2px 2px;" type="submit" class="btn btn-outline-secondary" value="수정" >	
								</div>
							</div>
							
							
							<div style="width: 100%;  height: 4%;"></div>
							
							<div id="aprank" style="width: 100%;  height: 30%;background-color: #dbdbdb3d;  border: 0px solid transparent; border-radius: 20px 20px 20px 20px; box-shadow: 5px 5px 5px;" >
							
								<div style="width: 100%;  height: 30%; background-color: #9f8ac1; border : 0px solid transparent; border-radius: 20px 20px 0px 0px;
								display: flex; justify-content: center; align-items: center;">
									<b  style="color: white; text-align: center; font-size: 22px;">회원등급</b>
								</div>
								<div style="width: 100%;  height: 70%; border : 0px solid transparent;
								display: flex; justify-content: center; align-items: center;">
					                <a style="font-size: 20px;">
					                
										<input type="radio" name="rank" value="0" 
										<c:if test="${info.mem_rank eq '0'}"> checked</c:if>
										/> 일반회원
										&nbsp;&nbsp;&nbsp;&nbsp;
										<input style="display: none;" type="radio" name="rank" value="1" 
										<c:if test="${info.mem_rank eq '1'}"> checked</c:if>
										/>
										<input style="display: none;" type="radio" name="rank" value="2" 
										<c:if test="${info.mem_rank eq '2'}"> checked</c:if>
										/>
										<input type="radio" name="rank" value="3" 
										<c:if test="${info.mem_rank eq '3'}"> checked</c:if>
										/> 일반관리자
				    				</a>
								</div>
							</div>
							
							<div style="width: 100%;  height: 2%;"></div>
							
							<div id="apbt2" style="width: 100%;  height: 5%; ">
								<div style="width: 100%;  height: 100%;
								display: flex; justify-content: center; align-items: center;">
									<input style="width: 25%; height: 100%; box-shadow: 2px 2px 2px;" type="submit" class="btn btn-outline-secondary" value="수정" >	
								</div>
							</div>
							
							<div style="width: 100%;  height: 10%;"></div>
							
						</div>
					
					
					
					
					
					
						<%-- <div id="apstate" >
							<table border="1" width="400px">
					        	
					        	<input style="display: none" type="text" name="id" value="${info.mem_id}" readonly/>
					        	
					        	<tr>
					        		<td colspan="2" align="center">회원상태</td>
					        	</tr>
					        	
					        	
					            <tr>
									<td colspan="2" align="center">
										<input type="radio" name="state" value="0" 
										<c:if test="${info.mem_state eq '0'}"> checked</c:if>
										/> 일반
										&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="state" value="1" 
										<c:if test="${info.mem_state eq '1'}"> checked</c:if>
										/> 제재
										<input style="display: none;" type="radio" name="state" value="2" 
										<c:if test="${info.mem_state eq '2'}"> checked</c:if>
										/>
										<input style="display: none;" type="radio" name="state" value="3" 
										<c:if test="${info.mem_state eq '3'}"> checked</c:if>
										/>
									</td>
								</tr>
					        </table>
						</div>	
						
				        <div id="apbt">
					        <table>
					            <tr>
					                <td colspan="2" align="center">
					                    <input type="submit" value="수정" >
					                </td>
					            </tr>
					        </table>
				        </div>
				        &nbsp;&nbsp;&nbsp;&nbsp;
				        <div id="aprank" >
					        <table id="aprank" border="1" width="400px">
					        	<tr>
					        		<td colspan="2" align="center">회원등급</td>
					        	</tr>
					            <tr>
									<td colspan="2" align="center">
										<input type="radio" name="rank" value="0" 
										<c:if test="${info.mem_rank eq '0'}"> checked</c:if>
										/> 일반회원
										&nbsp;&nbsp;&nbsp;&nbsp;
										<input style="display: none;" type="radio" name="rank" value="1" 
										<c:if test="${info.mem_rank eq '1'}"> checked</c:if>
										/>
										<input style="display: none;" type="radio" name="rank" value="2" 
										<c:if test="${info.mem_rank eq '2'}"> checked</c:if>
										/>
										<input type="radio" name="rank" value="3" 
										<c:if test="${info.mem_rank eq '3'}"> checked</c:if>
										/> 일반관리자
									</td>
								</tr>
					        </table>
				        
				        </div>
				        
				        <div id="apbt2">
					        <table>
					            <tr>
					                <td colspan="2" align="center">
					                    <input type="submit" value="수정" >
					                </td>
					            </tr>
					        </table>
				        </div>
 --%>				    
				    
				    
				    </form>
				    <div style="width: 2.5%; height: 100%;"></div>
				
                </div>
                
            </div>

            
            
            
        </div>

    </section>



    
				
</body>
<script>
var valuemstate = $('[name=mstate]').val();
var valuemrank = $('[name=mrank]').val();

$(document).ready(function() {
	
	if (valuemstate == 0) {
		$('[name=mstate]').val('일반');
	}else if (valuemstate == 1) {
		$('[name=mstate]').val('제재');
	}else if (valuemstate == 2) {
		$('[name=mstate]').val('휴먼');
		$('#apstate').css({'display':'none'});
		$('#apbt').css({'display':'none'});
	}else if (valuemstate == 3) {
		$('[name=mstate]').val('탈퇴');
		$('#apstate').css({'display':'none'});
		$('#apbt').css({'display':'none'});
	}
	
	
	if (valuemrank == 0) {
		$('[name=mrank]').val('일반회원');
	}else if (valuemrank == 1) {
		$('[name=mrank]').val('업주회원');
		$('#aprank').css({'display':'none'});
		$('#apbt2').css({'display':'none'});
	}else if (valuemrank == 2) {
		$('[name=mrank]').val('관리자');
		$('[name=mstate]').val('관리자');
		$('#aprank').css({'display':'none'});
		$('#apbt2').css({'display':'none'});
		$('#apstate').css({'display':'none'});
		$('#apbt').css({'display':'none'});
		$('#apadmin').css({'display':'none'});
	}else if (valuemrank == 3) {
		$('[name=mrank]').val('일반관리자');
	}
	

	
	
	
});





</script>
</html>