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

    <!-- 관리자 페이지 헤더-->
    <section style="width: 100%; height: auto; display: flex; background-color: white;">
       <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" >
                            <ul class="navbar-nav ml-md-auto">
                                <li class="nav-item active">
                                    <a href="./" type="button" class="btn btn-outline-primary">Main</a>
                                </li>
                                <div style="width: 10px; height: 5px;"></div>
                                <li class="nav-item active">
                                    <a href="./logout" type="button" class="btn btn-outline-danger">로그아웃</a>
                                </li>
                            </ul>
                            <div style="width: 66px; height: 30px;"></div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    

				
</body>
<script>

</script>
</html>