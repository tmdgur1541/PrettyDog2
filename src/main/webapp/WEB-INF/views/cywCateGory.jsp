<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>카테고리 항목관리</title>
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



		/* #AllPage{
		position: relative;
		top: 50px;
		left: 50px;
		}
		#CateGoryAdd{
			position: absolute;
			top: 30px;
			left: 20px;
			font-size: 20px;
		}
		 #categoryListDiv{
			position: absolute;
			top: 70px;
			left: 10px;
		} */
		
		
		table {
			width: 100%;
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
		
		
		
		
		/* input[name="categoryName"]{
			width: 300px;
			height: 50px;
		}
		input[name="categoryBtn"]{
			width: 100px;
			height: 50px;
			background-color: pink;
			color: white;
			border: 0;
		}
		input[name="categoryBtn"]:hover {
			background-color: black;
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
                <a href="apuserlist2" style="text-decoration:none;"><div class= "sidebar">회원조회 및 관리</div></a>
                <a href="apshoplist2" style="text-decoration:none;"><div class= "sidebar" >매장조회 및 관리</div></a>
                <a href="appointlist2" style="text-decoration:none;"><div class= "sidebar" >포인트 내역 조회</div></a>
                <a href="apreservelist2" style="text-decoration:none;"><div class= "sidebar" >예약 조회</div></a>
                <a href="SingoListPage" style="text-decoration:none;"><div class= "sidebar" >신고 관리</div></a>
                <a href="SingoHangmokPage" style="text-decoration:none;"><div class= "sidebar">신고 항목 관리</div></a>
                <a href="AdminServicePage" style="text-decoration:none;"><div class= "sidebar">추가서비스 관리</div></a>
                <a href="categoryPage" style="text-decoration:none;"><div class= "sidebar" style="background-color: rgb(167, 167, 167); color: #020202; font-weight: bold;">카테고리 관리</div></a>
            	<a href="ChangeListPage" style="text-decoration:none;"><div class= "sidebar" >환전 신청 관리</div></a>
            </div>

        </div>
        <!-- 내용 -->
        <div style="width: 87%; height: 100%;">
            <!-- 검색 바 -->
            <div style="width: 100%; height: 11%;">
                
            </div>

            <div style="width: 100%; height: 75%; display: flex;">
                <div style="width: 5%; height: 100%;"></div>
                <!-- 내용 -->
                <div style="width: 90%; height: 100%; background-color:rgb(255, 255, 255); border : 1px solid transparent; border-radius: 20px 20px 20px 20px;">
					<div id="AllPage">
						<div id="CateGoryAdd">
							<div style="width: 20px; height: 20px;"></div>
							<form action="cateGoryAdd" id="addForm" style="display: flex;">
								<div style="width: 20px;"></div>
								<input class="form-control border-0.5 shadow-0" type="text" placeholder="내용을 입력해주세요." name="categoryName" style="width: 300px; height: 50px;"/>
								<div style="width: 5px;"></div>
								<div style="display: flex; justify-content: center; align-items: center; ">
									<input type="radio" value="0" name="categoryClass"/>&nbsp;일반회원용&nbsp;&nbsp;
									<input type="radio" value="1" name="categoryClass"/>&nbsp;관리자용&nbsp;&nbsp;
								</div>
								<input class="btn btn-outline-primary" type="button" value="추가" id="categoryBtn" name="categoryBtn" style="width: 80px; height: 50px;"/>
							</form>
						</div>
						<div id="categoryListDiv">
							<table>
								<thead>
									<tr>
										<th>카테고리명</th>
										<th>구분</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody id="cateGoryList">
									<%-- <c:forEach items="${list }" var="list">
										<tr>
											<td>${list.category_name}<td>
											<c:if test="${list.category_admin eq 0}">
												<td>일반회원용</td>
											</c:if>
											<c:if test="${list.category_admin eq 1}">
												<td>관리자용</td>
											</c:if>
											<td><a href="#">삭제</a></td>
										</tr>
									</c:forEach> --%>
								</tbody>
								<tr>
									<td colspan="3" id="paging">
										<div class="container">                           
					               			<nav aria-label="Page navigation" style="text-align:center">
					                  			<ul class="pagination" id="pagination"></ul>
					              			</nav>               
					            		</div>
									</td>
								</tr>
							</table>
						</div>
					</div>														

                </div>
                
            </div>

            
            
            
        </div>

    </section>



    
				
</body>
<script>
var currPage = 1;
var totalPage = 2;

listCall(currPage,8);


function listCall(page,cnt) {
	
	// 페이지 도착하자마자 ajax 실행
	$.ajax({
		type:'GET',
		url:'categoryListCall',
		data:{'page':page,'cnt':cnt}, // {}안에 아무것도 안넣으면 다보여줘라 라는 뜻
		dataType:'JSON',
		success:function(data) {
			
			totalPage = data.pages;
			listDraw(data.list);
			
			$('#pagination').twbsPagination({
				startPage:currPage, // 현재 페이지
				totalPages:totalPage, // 만들수 있는 총 페이지 수
				visiblePages:5, // [1][2][3]... 이걸 몇개까지 보여줄 것인가? 밑에 페이지클릭숫자
				onPageClick:function(event,page) { // 해당 페이지 번호를 클릭 했을때 일어날 일들
					console.log(event); // 현재 일어나는 클릭 이벤트 관련 정보들
					console.log(page); // 몇 페이지를 클릭 했는지에 대한 정보
					listCall(page,8);
				}
			});
			
		},
		error:function(e) {
			console.log(e);
		}
	});
}

function listDraw(list) {
    var content = '';
    var admin = "";
    
    list.forEach(function(item,category_num) {
    	
    	if (item.category_admin == 0) {
			admin = '<td>'+"일반회원용"+'</td>';
		}else {
			admin = '<td>'+"관리자용"+'</td>';
		}
    	
    	content += '<tr>'
    	content += '<td>'+item.category_name+'</td>';
    	content += admin
    	content += '<td>'+'<a href="./categoryDel?category_num='+item.category_num+'">'+"삭제"+'</a>'+'</td>';
    });
    $('#cateGoryList').empty();
    $('#cateGoryList').append(content);
}

$('#categoryBtn').click(function() {
	
	var $categoryName = $('input[name="categoryName"]');
	var $categoryClass = $('input[name="categoryClass"]:checked');
	
	console.log($categoryName.val());
	console.log($categoryClass.val());
	
	if ($categoryName.val() == '') {
		alert("카테고리 이름을 입력해주세요.");
	}else if ($categoryClass.val() == null) {
		alert("카테고리 구분을 선택해주세요.")
	}else {
		$('#addForm').submit();
	}
	
})

var msg = "${msg}"; 

if (msg != "") {
	alert(msg);
}

var msg1 = "${msg1}"; 

if (msg1 != "") {
	alert(msg1);
}

</script>
</html>