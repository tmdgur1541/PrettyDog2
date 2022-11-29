<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
		table,td,th{
			border:1px solid black;
			border-collapse: collapse;
		}
		
		

	</style>
</head>
<body>
	<div class="container">
        <form action="ShopPrifo" method="post">
          	<table>
          		<tr>
          			<th colspan="2">대형견</th>
          		</tr>
          		<tr>
          			<td name="CateMiyong">미용</td>
          			<td><input type="text" name="Miyong" value=""></td>
          		</tr>
          	</table>
          	<table>
          		<tr>
          			<th colspan="2">중형견</th>
          		</tr>
          		<tr>
          			<td name="미용">미용</td>
          			<td><input type="text" name="Miyong" value=""></td>
          		</tr>
          	</table> 
          	<table>
          		<tr>
          			<th colspan="2">소형견</th>
          		</tr>
          		<tr>
          			<td name="미용">미용</td>
          			<td><input type="text" name="Miyong" value=""></td>
          		</tr>
          	</table>      
        </form>
	</div>
</body>
<script>

	

</script>
</html>