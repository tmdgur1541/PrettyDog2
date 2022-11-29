<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>이쁘개 아이디찾기</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		#AllPage{
			position: relative;
			top: 200px;
			left: 650px;
		}
	
		#idSearchSub{
			font-size: 30px;
			position: absolute;
			left: 65px;
		}
		#idSearchInput{
			position: absolute;
			top: 120px;
			left: 60px;
		}
		input[type="button"]{
			border-radius: 5px / 5px;
			background-color: #F8E0F1;
			color: black;
			width: 250px;
			height: 40px;
			border: 0;
			font-size: 15px;
		}
		input[name="nameInput"],input[name="emailInput"]{
			width: 250px;
			height: 40px;
		}
		#result{
			position: absolute;
			top: 150px;
			text-align: center;
			left: 60px;
		}
	</style>
</head>
<body>
<%@ include file="Header.jsp"%>
	<div>
		<a href="./"><img src="/photo/LOGO.PNG"/></a>
	</div>
	<div id="AllPage">
		<div id="idSearchSub">
			<h2 style="color: pink;">아이디 찾기</h2>
		</div>
		<div id="idSearchInput">
			<table>
				<thead>
					<tr>
						<td><input type="text" placeholder="이름을 입력해주세요" name="nameInput"/></td>
					</tr>
					<tr>
						<td><input type="email" placeholder="E-MAIL을 입력해주세요" name="emailInput"/></td>
					</tr>
					<tr>
						<td><input type="button" value="확인" id="IdSearchBtn"/></td>
					</tr>
				</thead>
				<tbody id="result">
					
				</tbody>
			</table>
		</div>
	</div>
</body>
<script>

 $('#IdSearchBtn').click(function() {
	
	 var $name = $('input[name="nameInput"]').val();
	 var $email = $('input[name="emailInput"]').val();
	 
	 if ($name == '') {
		alert("이름을 입력하랑개~");
	}else if ($email == '') {
		alert("이메일을 입력하랑개~");
	}else {
		
		 $.ajax({
				type:'post',
				url:'idSearch',
				data:{"name":$name,"email":$email},
				dataType:'json',
				success:function(data) {
					console.log(data);
					drawList(data.list);
				},
				error:function(e) {
					console.log(e);
				}
			});
	}
	 
})

function drawList(list) {
	
	var content = '';
	
	content = '<tr>'+'<td>'+'<b>'+"검색 결과입니다."+'<b>'+'</td>'+'<tr>'
	list.forEach(function(item,mem_id) {
		content += '<tr>';
		content += '<td>'+item.mem_id+'</td>';
		content += '</tr>';
	
	})
	
	$('tbody').empty();
	$('tbody').append(content);
 }

</script>
</html>