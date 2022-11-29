<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <style></style>
</head>
<body>
	<table>
		<tr>
			<th>매장 번호</th>
			<th>매장 이름</th>
		</tr>
		<c:forEach items="${sshShopList }" var="sshShopList">
		<tr>
		<%-- <a href="beautyTrendDetail?idx=${TrendListInfo.community_boardnum }"> --%>
		<td><a href="sshShopDetail?idx=${sshShopList.busin_num }&memId=a1">${sshShopList.busin_num }</a></td>
		<td>${sshShopList.busin_name }</td>
		</tr>
		</c:forEach>
		
	</table>
</body>
<script>

   
</script>
</html>














































































































































