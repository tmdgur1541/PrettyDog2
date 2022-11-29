<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
   <head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <link rel="stylesheet" href="resources/css/common.css">
</head>
<body>
   <form action="write" method="POST" enctype="multipart/form-data"><!-- 여러가지~ -->
      <table>
         <tr>
            <th>제목</th>
            <td><input type="text" name="subject"/></td>
         </tr>
         <tr>
            <th>작성자</th>
            <td><input type="text" name="user_name"/></td>
         </tr>
         <tr>
            <th>내용</th>
            <td><textarea name="content"></textarea></td>
         </tr>
         <tr>
            <th>사진</th>
            <td>
            	업로드칸
            	<input type="file" name="photos" multiple="multiple"/>
            </td>
         </tr>
         <tr>
            <th colspan="2">
               <input type="button" onclick="location.href='./freeList'" value="리스트"/>
               <button>저장</button>
            </th>
         </tr>
      </table>
   </form>
</body>
<script></script>
</html>