<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>매장 상세보기</title>
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

		/* table {
			border-collapse: collapse;
			
			line-height: 1.5;
			border: 1px solid #ccc;
			margin: 20px 10px;
			
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
			
		} */
 
   </style>

<body id="body">
    <!-- 상단 바 고정 -->
    <section style="width: 100%; height: 54px; display: flex; background-color: white;">
        <%@ include file="APHeader.jsp"%>
    </section>


    <!-- 중간 영역(내용, 사이드 바) -->
    <section style="width: 100%; height: 914px; display: flex;">
        
        <!-- 사이드 바 고정 -->
        <div style="width: 13%; height: 100%; background-color: rgb(75 70 70);"> 

            <div style="width: 100%; height: 9%;;"></div>

            
            <div style="width: 100%; height: 79%;">
                <a href="apuserlist2" style="text-decoration:none;"><div class= "sidebar" >회원조회 및 관리</div></a>
                <a href="apshoplist2" style="text-decoration:none;"><div class= "sidebar"  style="background-color: rgb(167, 167, 167); color: #020202; font-weight: bold;">매장조회 및 관리</div></a>
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
                <div style="width: 90%; height: 100%; background-color:rgb(255, 255, 255); border : 1px solid transparent; border-radius: 20px 20px 20px 20px; display: flex;">
					    <div style="width: 2.5%; height: 100%;"></div>
					    <div style="width: 30%; height: 100%;">
						    <form style="width: 100%; height: 100%;">
							    <div style="width: 100%;  height: 100%;">
									<div style="width: 100%;  height: 10%;"></div>
									<div style="width: 100%;  height: 80%;background-color: #dbdbdb3d;  border: 0px solid transparent; border-radius: 20px 20px 20px 20px; box-shadow: 5px 5px 5px;" >
									
										<div style="width: 100%;  height: 10%; background-color: #9f8ac1; border : 0px solid transparent; border-radius: 20px 20px 0px 0px;
										display: flex; justify-content: center; align-items: center;">
											<b  style="color: white; text-align: center; font-size: 22px;">매장정보</b>
										</div>
										<div style="width: 100%;  height: 18%; border : 0px solid transparent;
										display: flex; justify-content: center; align-items: center;">
											<a style="width: 23%; height: 60%; font-size: 20px;">매장명</a>
											<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
											<a style="width: 52%; height: 60%; font-size: 20px;">${shopinfo.busin_name}</a>
										</div>
										<div style="width: 100%;  height: 18%; border : 0px solid transparent;
										display: flex; justify-content: center; align-items: center;">
											<a style="width: 23%; height: 60%; font-size: 20px;">업주 아이디</a>
											<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
							                <a style="width: 52%; height: 60%; font-size: 20px;">${shopinfo.mem_id}</a>
										</div>
										<div style="width: 100%;  height: 18%; border : 0px solid transparent;
										display: flex; justify-content: center; align-items: center;">
											<a style="width: 23%; height: 60%; font-size: 20px;">매장상태</a>
											<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
							                <a style="width: 52%; height: 60%; font-size: 20px;"><input type="text" name="shrank"  value="${shopinfo.busin_calss}" disabled/></a>
										</div>
										<div style="width: 100%;  height: 18%; border : 0px solid transparent;
										display: flex; justify-content: center; align-items: center;">
											<a style="width: 23%; height: 60%; font-size: 20px;">매장지역</a>
											<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
											<a style="width: 52%; height: 60%; font-size: 20px;">${shopinfo.busin_area}</a>
										</div>
										<div style="width: 100%;  height: 18%; border : 0px solid transparent;
										display: flex; justify-content: center; align-items: center;">
											<a style="width: 23%; height: 60%; font-size: 20px;">사업자 번호</a>
											<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
							                <a style="width: 52%; height: 60%; font-size: 20px;">${shopinfo.busin_num}</a>
										</div>
									</div>
									<div style="width: 100%;  height: 10%;"></div>
							        
								</div>
								
						    </form>
					    </div>
					    
					    
					    
					    <div style="width: 2.5%; height: 100%;"></div>
					    
					    <div style="width: 30%; height: 100%;">
					    	<div style="width: 100%;  height: 10%;"></div>
					    	
					    	<div style="width: 100%; height: 38%;">
							    <form style="width: 100%; height: 100%;">
								    <div style="width: 100%;  height: 100%;">
										<div id="apstate" style="width: 100%;  height: 100%;background-color: #dbdbdb3d;  border: 0px solid transparent; border-radius: 20px 20px 20px 20px; box-shadow: 5px 5px 5px;" >
										
											<div style="width: 100%;  height: 20%; background-color: #9f8ac1; border : 0px solid transparent; border-radius: 20px 20px 0px 0px;
											display: flex; justify-content: center; align-items: center;">
												<b  style="color: white; text-align: center; font-size: 22px;">매장이용 현황</b>
											</div>
											<div style="width: 100%;  height: 40%; border : 0px solid transparent;
											display: flex; justify-content: center; align-items: center;">
												<a style="width: 23%; height: 60%; font-size: 20px;">이용 횟수</a>
												<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
								                <a style="width: 52%; height: 60%; font-size: 20px; text-align: center;">${shopinfo2}</a>
											</div>
											<div style="width: 100%;  height: 40%; border : 0px solid transparent;
											display: flex; justify-content: center; align-items: center;">
												<a style="width: 23%; height: 60%; font-size: 20px;">취소 횟수</a>
												<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
								                <a style="width: 52%; height: 60%; font-size: 20px; text-align: center;">${shopinfo3}</a>
											</div>
										</div>
							        </div>
							    </form>
						    </div>
						    
							<div style="width: 100%;  height: 4%;"></div>
						    
					    	<div style="width: 100%; height: 38%;">
							     <form style="width: 100%; height: 100%;">
							        <div style="width: 100%;  height: 100%;">
										<div id="apstate" style="width: 100%;  height: 100%;background-color: #dbdbdb3d;  border: 0px solid transparent; border-radius: 20px 20px 20px 20px; box-shadow: 5px 5px 5px;" >
											<div style="width: 100%;  height: 20%; background-color: #9f8ac1; border : 0px solid transparent; border-radius: 20px 20px 0px 0px;
											display: flex; justify-content: center; align-items: center;">
												<b  style="color: white; text-align: center; font-size: 22px;">매장 매출 및 환급 현황</b>
											</div>
											<div style="width: 100%;  height: 40%; border : 0px solid transparent;
											display: flex; justify-content: center; align-items: center;">
												<a style="width: 23%; height: 60%; font-size: 20px;">매출금액</a>
												<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
								                <a style="width: 52%; height: 60%; font-size: 20px; text-align: center;">${shopmoney}</a>
											</div>
											<div style="width: 100%;  height: 40%; border : 0px solid transparent;
											display: flex; justify-content: center; align-items: center;">
												<a style="width: 23%; height: 60%; font-size: 20px;">환급금액</a>
												<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
								                <a style="width: 52%; height: 60%; font-size: 20px; text-align: center;">${shopmoney2}</a>
											</div>
										</div>
							        </div>
							    </form>
						    </div>
						    
						    <div style="width: 100%;  height: 10%;"></div>
						    
					    </div>
					    
					    <div style="width: 2.5%; height: 100%;"></div>
					    
					    <div style="width: 30%; height: 100%;">
					    
					    
						     <%-- <form style="width: 100%; height: 50%;">
						        <table border="1" width="400px">
						        	<tr>
						        		<td colspan="2" align="center">매장 결제금액 및 취소금액</td>
						        	</tr>
						            <tr>
						                <td>결제금액</td>
						                <td>${shopmoney3}</td>
						            </tr>
						            <tr>
						                <td>취소금액</td>
						                <td>${shopmoney4}</td>
						            </tr>
						        </table>
						    </form> --%>

							<%-- <form style="width: 100%; height: 50%;" id="shrank" action="apshopupdate" method="post">
								
						        <input style="display: none;" type="text" name="name" value="${shopinfo.busin_name}" readonly/>
						        <input style="display: none;" type="text" name="shop" value="${shopinfo.busin_num}" readonly/>
						        	
						        <table border="1" width="400px">
						        	<tr>
						        		<td colspan="2" align="center">매장 상태변경</td>
						        	</tr>
						            <tr>
										<td colspan="2" align="center">
											<input type="radio" name="calss" value="1" 
											<c:if test="${shopinfo.busin_calss eq '1'}"> checked</c:if>
											/> 영업중
											&nbsp;&nbsp;&nbsp;&nbsp;
											<input style="display: none;" type="radio" name="calss" value="2" 
											<c:if test="${shopinfo.busin_calss eq '2'}"> checked</c:if>
											/>
											<input type="radio" name="calss" value="3" 
											<c:if test="${shopinfo.busin_calss eq '3'}"> checked</c:if>
											/> 블랙
										</td>
									</tr>
						        </table>
						        &nbsp;&nbsp;&nbsp;&nbsp;
						        <table>
						            <tr>
						                <td colspan="2" align="center">
						                    <input type="submit" value="수정" >
						                </td>
						            </tr>
						        </table>
						    </form> --%>
						    
						    <div style="width: 100%;  height: 10%;"></div>
					    	
					    	<div style="width: 100%; height: 38%;">
							    <form style="width: 100%; height: 100%;">
								    <div style="width: 100%;  height: 100%;">
										<div id="apstate" style="width: 100%;  height: 100%;background-color: #dbdbdb3d;  border: 0px solid transparent; border-radius: 20px 20px 20px 20px; box-shadow: 5px 5px 5px;" >
										
											<div style="width: 100%;  height: 20%; background-color: #9f8ac1; border : 0px solid transparent; border-radius: 20px 20px 0px 0px;
											display: flex; justify-content: center; align-items: center;">
												<b  style="color: white; text-align: center; font-size: 22px;">매장 결제금액 및 취소 금액</b>
											</div>
											<div style="width: 100%;  height: 40%; border : 0px solid transparent;
											display: flex; justify-content: center; align-items: center;">
												<a style="width: 23%; height: 60%; font-size: 20px;">결제금액</a>
												<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
								                <a style="width: 52%; height: 60%; font-size: 20px; text-align: center;">${shopmoney3}</a>
											</div>
											<div style="width: 100%;  height: 40%; border : 0px solid transparent;
											display: flex; justify-content: center; align-items: center;">
												<a style="width: 23%; height: 60%; font-size: 20px;">취소 금액</a>
												<a style="width: 5%; height: 60%; font-size: 20px;"> : </a>
								                <a style="width: 52%; height: 60%; font-size: 20px; text-align: center;">${shopmoney4}</a>
											</div>
										</div>
							        </div>
							    </form>
						    </div>
						    
							<div style="width: 100%;  height: 4%;"></div>
						    
					    	<div style="width: 100%; height: 38%;">
							     <form style="width: 100%; height: 100%;" id="shrank" action="apshopupdate" method="post">
							     	<input style="display: none;" type="text" name="name" value="${shopinfo.busin_name}" readonly/>
						        	<input style="display: none;" type="text" name="shop" value="${shopinfo.busin_num}" readonly/>
							        <div style="width: 100%;  height: 70%;">
										<div id="apstate" style="width: 100%;  height: 100%;background-color: #dbdbdb3d;  border: 0px solid transparent; border-radius: 20px 20px 20px 20px; box-shadow: 5px 5px 5px;" >
											<div style="width: 100%;  height: 25%; background-color: #9f8ac1; border : 0px solid transparent; border-radius: 20px 20px 0px 0px;
											display: flex; justify-content: center; align-items: center;">
												<b  style="color: white; text-align: center; font-size: 22px;">매장 상태변경</b>
											</div>
											<div style="width: 100%;  height: 75%; border : 0px solid transparent;
											display: flex; justify-content: center; align-items: center;">
								                <a style="font-size: 20px;">
								                	<input type="radio" name="calss" value="1" 
													<c:if test="${shopinfo.busin_calss eq '1'}"> checked</c:if>
													/> 영업중
													&nbsp;&nbsp;&nbsp;&nbsp;
													<input style="display: none;" type="radio" name="calss" value="2" 
													<c:if test="${shopinfo.busin_calss eq '2'}"> checked</c:if>
													/>
													<input type="radio" name="calss" value="3" 
													<c:if test="${shopinfo.busin_calss eq '3'}"> checked</c:if>
													/> 블랙
							    				</a>
											</div>
										</div>
							        </div>
							    
								    <div style="width: 100%;  height: 10%;"></div>
								
									<div  style="width: 100%;  height: 20%; ">
										<div style="width: 100%;  height: 100%;
										display: flex; justify-content: center; align-items: center;">
											<input style="width: 25%; height: 100%; box-shadow: 2px 2px 2px;" type="submit" class="btn btn-outline-secondary" value="수정" >	
										</div>
									</div>
							    </form>
							    
								
						    </div>
						    
						    
						    <div style="width: 100%;  height: 10%;"></div>
						    
						    
						    
						    
						    
						    
						    
						    
						    
						    
						    
						    
					    </div>	
					    
                </div>
                
            </div>

            
            
            
        </div>

    </section>



    
				
</body>
<script>
var valueshrank = $('[name=shrank]').val();

$(document).ready(function() {
	
	if (valueshrank == 1) {
		$('[name=shrank]').val('영업중');
	}else if (valueshrank == 2) {
		$('[name=shrank]').val('폐업');
		$('#shrank').css({'display':'none'});
	}else if (valueshrank == 3) {
		$('[name=shrank]').val('블랙');
	}

});




</script>
</html>