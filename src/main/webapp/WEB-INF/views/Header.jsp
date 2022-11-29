<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>헤더</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> -->
    <script src="resources/js/jquery.twbsPagination.js"></script>
    
	
    <style>
        
        #headicon:hover{
            color: #f3a8d4;
        }
    
   </style>

<body id="body">


    <!-- 헤더 로그인-->
	<section style="width: 100%; height: auto; display: flex; background-color: white;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-white bg-white fixed-top" style="border-bottom: 1px; border-bottom-style: solid; border-width: 1px; border-bottom-color: black;">
                        <div>
                            <a href="./"><img src="/photo/LOGO.PNG"/></a>
                        </div>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                     <a class="nav-link" id="hn" style="font-size: 20px; font-weight: bold;" href="./ShopList">미용예약</a>
                                </li>
                                <li class="nav-item">
                                     <a class="nav-link" id="hn" style="font-size: 20px; font-weight: bold;" href="./freeList">자유게시판</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="hn" style="font-size: 20px; font-weight: bold;" href="./beautyTrendList">트렌드</a>
                               </li>
                            </ul>
                            
                            <ul class="navbar-nav ml-md-auto">
                                <div style="width: 150px;">
                                    <div style="width: 150px; height: 15px;"></div>
                                    <div style="width: 150px; font-size: 15px;">
                                    	<!-- 로그인 후 관리자-->
                                        <a id="afterloginadmin" href="./apuserlist2" style="color: rgb(80, 80, 80); display: none;">관리자 페이지</a>
                                        <!-- 로그인 후 일반-->
                                        <a id="afterlogin2" style="display: none;" >포인트 : <b id="dddd"></b> </a>
                                    </div>
                                </div>
                                
                                <!-- 로그인 전 아이콘 -->
                            	<div id="berforelogin" >
                            	<div style="display: flex;">
	                                <!-- <li class="nav-item active">
	                                    <a href="./loginPage" style="color: rgb(80, 80, 80);">
	                                        <svg id="headicon" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
	                                            <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
	                                            <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
	                                        </svg>
	                                    </a>
	                                </li> -->
	                                <div style="width: 20px;"></div>
	                                <li class="nav-item active">
	                                    <a href="./loginPage" style="color: rgb(80, 80, 80);" id="headicon">
	                                        <svg id="headicon" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
	                                            <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
	                                            <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
	                                        </svg>
	                                    </a>
	                                </li>
                            	</div>
                            	</div>

                                <!-- 로그인 후 아이콘 -->
                                <div id="afterlogin" style="display: none;">
                                	<div style="display: flex;">
		                                <li class="nav-item active">
		                                    <a href="./memberPassCk" style="color: rgb(80, 80, 80);">
		                                        <svg id="headicon" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
		                                            <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
		                                        </svg>   
		                                    </a>
		                                </li>
		                                <div style="width: 20px;"></div>
		                                <li class="nav-item active">
		                                    <a href="./logout" style="color: rgb(80, 80, 80);" id="headicon">
		                                        <svg id="headicon" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
		                                            <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
		                                            <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
		                                        </svg>  
		                                    </a>
		                                </li>
                                	</div>
                                </div>
                                
                                <div style="width: 20px;"></div>
                                <div style="width: 20px;"></div>
                                
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
	</section>

    
				
</body>
<script>

		var loginId = '<%=(String)session.getAttribute("loginId")%>';
		
		console.log(loginId);
		
		idRankChk(loginId);
		
		function idRankChk(loginId){
			
			var contents = "";
			
			if(loginId != 'null'){
				
				$.ajax({
					url:"/dog/idRankChk",
					type:"POST",
					dataType:"JSON",
					data:{
						"loginId" : loginId
						},
					success : function(data){
						//console.log(data.mem_point);
						
						if(data.loginId == "null"){
							
						}else if(data.loginId != "null"){
							
							let q = data.mem_point;
							
							if(data.mem_rank == 0){
								//로그인이 되면 afterlogin 이 노출
								//berforelogin이 사라져야 함
								$('#afterlogin').css({'display':'block'});
								$('#afterlogin2').css({'display':'block'});
								$('#berforelogin').css({'display':'none'});
								$('#afterloginadmin').css({'display':'none'});
								contents += q;
								$('#dddd').append(contents);
							}else if(data.mem_rank == 1){
								$('#afterlogin').css({'display':'block'});
								$('#afterlogin2').css({'display':'block'});
								$('#berforelogin').css({'display':'none'});
								$('#afterloginadmin').css({'display':'none'});
								contents += q;
								$('#dddd').append(contents);
							}else if(data.mem_rank >=2){
								$('#afterlogin').css({'display':'block'});
								$('#afterlogin2').css({'display':'none'});
								$('#berforelogin').css({'display':'none'});
								$('#afterloginadmin').css({'display':'block'});
							}
						}
						
					},error : function(e){
						console.log(e);
					}
					
				});
			}else{
				
			}
			
			
			
			
			
		}

		
		function aaaa() {
			
		}


</script>
</html>