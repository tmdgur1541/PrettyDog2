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
			width: 100%;
			border-collapse: collapse;
			/* text-align: left; */
			line-height: 1.5;
			border: 1px solid #ccc;
			margin: 15px 0px;
			/* width: 600px; */
		}
		table thead {
			border-right: 1px solid #ccc;
			border-left: 1px solid #ccc;
			background: #7092b0;
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
			width: auto;
			height: 50px;
			padding: 10px; 
			vertical-align: top;
			border-bottom: 1px solid #ccc;
		}
		
		/* #HangmokList{
			position: absolute;
			top: 120px;
			/* left: 10px; */
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
                <a href="apshoplist2" style="text-decoration:none;"><div class= "sidebar" >매장조회 및 관리</div></a>
                <a href="appointlist2" style="text-decoration:none;"><div class= "sidebar" >포인트 내역 조회</div></a>
                <a href="apreservelist2" style="text-decoration:none;"><div class= "sidebar" style="background-color: rgb(167, 167, 167); color: #020202; font-weight: bold;"  >예약 조회</div></a>
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
            <div style="width: 100%; height: 11%;">
                <div style="width: 100%; height: 30%;"></div> 
                <div style="width: 100%; height: 55%; display: flex;">
                    <div style="width: 5%; height: 100%;"></div>
                    <div style="width: 90%; height: 100%; display: flex; border : 1px solid transparent; border-radius: 20px 20px 20px 20px;">
                        <div style="width: 50%; height: 100%;">
                           
                        </div>

                        <div style="width: 1%; height: 100%;"></div>
                        <div style="width: 10%; height: 100%;">
                            
                        </div>
                        <div style="width: 1%; height: 100%;"></div>

                        <div style="width: 10%; height: 100%;">
                            
                        </div>

                        <div style="width: 1%; height: 100%;"></div>
                        <div style="width: 10%; height: 100%;">
                            
                        </div>
                        <div style="width: 1%; height: 100%;"></div>
                        
                    </div>
                    <div style="width: 5%; height: 100%;"></div>
                </div> 
                <div style="width: 100%; height: 15%;"></div> 
            </div>

            <div style="width: 100%; height: 75%; display: flex;">
                <div style="width: 5%; height: 100%;"></div>
                <!-- 내용 -->
                <div style="width: 90%; height: 100%; background-color:rgb(255, 255, 255); border : 1px solid transparent; border-radius: 20px 20px 20px 20px;">
					<table border="1" width="700px">
				        <div id="HangmokList">
							<table class="table1">
								<thead>
									<tr>
										<th>예약 번호</th>
							            <th>매장명</th>
							            <th>예약자 아이디</th>
							            <th>예약 신청 시간</th>
							            <th>예약 방문 시간</th>
							            <th>얘견정보</th>
							            <th>상태 변경일</th>
							            <th>예약금액</th>
							            <th>상태</th>
									</tr>
								</thead>
								<tbody id="list">
			
								</tbody>
								<tbody>
									<td colspan="3" id="paging">
										<div class="container">                           
					               			<nav aria-label="Page navigation" style="text-align:center; width: 600px;">
					                  			<ul class="pagination" id="pagination"></ul>
					              			</nav>               
					            		</div>
									</td>
								</tbody>
							</table>
								
								
						</div>
				    </table>
                </div>
                
            </div>

            
            
            
        </div>

    </section>



    
				
</body>
<script>
var currPage = 1;
var totalPage = 2;

apreservelist3(currPage,10);


function apreservelist3(page,cnt) {
	
	// 페이지 도착하자마자 ajax 실행
	$.ajax({
		type:'POST',
		url:'apreservelist3',
		data:{'page':page,'cnt':cnt}, 
		dataType:'JSON',
		success:function(data) {

			totalPage = data.pages;
			listDraw(data.list);
			console.log(data.list);
			
			if (data.list.length > 0) {
				$('#pagination').twbsPagination({
					startPage:currPage, // 현재 페이지
					totalPages:totalPage, // 만들수 있는 총 페이지 수
					visiblePages:5, // [1][2][3]... 이걸 몇개까지 보여줄 것인가? 밑에 페이지클릭숫자
					onPageClick:function(event,page) { // 해당 페이지 번호를 클릭 했을때 일어날 일들
						console.log(event); // 현재 일어나는 클릭 이벤트 관련 정보들
						console.log(page); // 몇 페이지를 클릭 했는지에 대한 정보
						apreservelist3(page,10);
					}
				});
			}
			
		},
		error:function(e) {
			console.log(e);
		}
	});
}


function listDraw(list) {
    var content = '';

    list.forEach(function(item,reser_num) {
	    var date = new Date(item.reser_askdate);
	    var time = new Date(item.reser_visitday);
	    var dateup = new Date(item.reser_updateday);
	    	    
	    if (item.reser_dog == 1) {
    		mestate = "소형견";
		}else if (item.reser_dog == 2) {
			mestate = "중형견";
		}else if (item.reser_dog == 3) {
			mestate = "대형견";
		}
	    
	    if (item.reser_state == 0) {
    		mestate2 = "예약완료";
		}else if (item.reser_state == 1) {
    		mestate2 = "노쇼";
		}else if (item.reser_state == 2) {
			mestate2 = "예약취소";
		}else if (item.reser_state == 3) {
			mestate2 = "이용완료";
		}else if (item.reser_state == 4) {
			mestate2 = "리뷰작성완료";
		}
	    

    	content += '<tr>';
    	content += '<td>'+item.reser_num+'</td>';
   		content += '<td>'+item.busin_name+'</td>';
    	content += '<td>'+item.mem_id+'</td>';
    	content += '<td>'+date.getFullYear()+"-"
	      +("0"+(date.getMonth()+1)).slice(-2)+"-"
	      +("0" + date.getDate()).slice(-2)+"  /  "
	      +("0" + date.getHours()).slice(-2)+" : "
	      +("0" + date.getMinutes()).slice(-2)+" : "
	      +("0" + date.getSeconds()).slice(-2)+'</td>'
	      content += '<td>'+time.getFullYear()+"-"
	      +("0"+(time.getMonth()+1)).slice(-2)+"-"
	      +("0" + time.getDate()).slice(-2)+"  /  "
	      +("0" + time.getHours()).slice(-2)+"시 "+'</td>'
    	content += '<td>'+mestate+'</td>';
    	content += '<td>'+dateup.getFullYear()+"-"
	      +("0"+(dateup.getMonth()+1)).slice(-2)+"-"
	      +("0" + dateup.getDate()).slice(-2)+"  /  "
	      +("0" + dateup.getHours()).slice(-2)+" : "
	      +("0" + dateup.getMinutes()).slice(-2)+" : "
	      +("0" + dateup.getSeconds()).slice(-2)+'</td>'
    	content += '<td>'+item.reser_money+'</td>';
    	content += '<td>'+mestate2+'</td>';
    	content += '</tr>';

    });
    $('#list').empty();
    $('#list').append(content);
}


</script>
</html>