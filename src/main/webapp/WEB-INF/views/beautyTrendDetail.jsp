<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> -->
    <script src="resources/js/jquery.twbsPagination.js"></script>
	<style></style>
</head>
<body>
	<section style="width: 100%; height: 84px; display: flex; background-color: rgb(66, 52, 52);">
        <%@ include file="Header.jsp"%>
	</section>
	<div id="div" style="
    position: relative;
    top: 50px;
    left: 150px;
">
		<h2 style="margin-left: 70px;margin-bottom: 40px;">미용 트렌드</h2>
		<h4 style="margin-left: 70px;margin-bottom: 10px;">제목</h4>
		<p style="margin-left: 70px ;">${beautyTrendDetail.community_sub }</p>
		<h4 style="margin-left: 70px; margin-bottom: 10px;">내용</h4>
		<p style="margin-left: 70px;">${beautyTrendDetail.community_cont }</p>
		<%-- <img src="resources/trend/${beautyTrendDetail.bphoto_newname }" width="350px" height="350px" style="padding-left: 70px; display: block;"/> --%>
		<img src="/photo/${beautyTrendDetail.bphoto_newname }" width="350px" height="350px" style="padding-left: 70px; display: block;"/>
		<button style="position: absolute;top: 10px;left: 410px;width: 100px;border: 0;background-color: black;color: white;" onclick="location.href='beautyTrendList'">뒤로가기</button>
		<button style="margin-left: 30px;position: absolute;top: 10px;left: 500px;background-color: black;color: white;width: 100px;border: 0;" onclick="goToDetail()">매장이동</button>
		<%-- <button onclick="location.href='beautyTrendUpdate?idx=${beautyTrendDetail.community_boardnum}'">수정</button> --%>
	</div>
</body>
<script>

function goToDetail(){
	//location.href='sshShopDetail?idx=${beautyTrendDetail.busin_num}&memId='+loginId;
	location.href='sshShopDetail?idx='+'${beautyTrendDetail.busin_num}';
}

</script>
</html>

























































































