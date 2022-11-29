<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
   <script src="resources/js/jquery.twbsPagination.js"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> -->
    <script src="resources/js/jquery.twbsPagination.js"></script>
   <style>
   		a:link { color: black; text-decoration: none;}
		 a:visited { color: black; text-decoration: none;}
		 a:hover { color: red; text-decoration: none;}
   </style>
</head>
<body>

<section style="width: 100%; height: 84px; display: flex; background-color: rgb(66, 52, 52);">
        <%@ include file="Header.jsp"%>
</section>


   <h2 style="margin-left: 210px;font-size: 30px;margin-top: 40px;">애견 미용 트렌드</h2>
   <select id="koMap" style="margin-left: 1170px;width: 150px;height: 40px;">
      <option>지역전체</option>
      <option value="서울특별시">서울특별시</option>
      <option value="경기도">경기도</option>
      <option value="인천광역시">인천광역시</option>
      <option value="대전광역시">대전광역시</option>
      <option value="광주광역시">광주광역시</option>
      <option value="대구광역시">대구광역시</option>
      <option value="울산광역시">울산광역시</option>
      <option value="부산광역시">부산광역시</option>
      <option value="경기도">경기도</option>
      <option value="강원도">강원도</option>
      <option value="충청북도">충청북도</option>
      <option value="충청남도">충청남도</option>
      <option value="전라북도">전라북도</option>
      <option value="전라남도">전라남도</option>
      <option value="경상북도">경상북도</option>
      <option value="경상남도">경상남도</option>
      <option value="제주도">제주도</option>
   </select>
   <div id="divA" style="width: 60%;margin-left: 150px;margin-top: 20px;">
   <c:forEach items="${beautyTrendList }" var="TrendListInfo">
   <div class="orgDiv" style="float: left; width: 33%;">
      <a href="beautyTrendDetail?idx=${TrendListInfo.community_boardnum }">
      <%-- "C:/STUDY/PrettyDog/PrettyDog/src/main/webapp/resources/trend/${beautyTrendDetail.bphoto_newname }" --%>
      <img alt="" src="/photo/${TrendListInfo.bphoto_newname }" width="300px" height="300px" style="padding-left: 70px"/>
      <p style="margin-left: 70px;font-size: 17px;">${TrendListInfo.busin_name }</p><p style="margin-left: 70px; margin-top: -15px;"><fmt:formatDate value="${TrendListInfo.community_date }" pattern="yyyy-MM-dd"/></p>
      <p style="margin-left: 70px; margin-top: -15px; font-size: 15px;">${TrendListInfo.community_sub }</p>
      </a>
   </div>
   </c:forEach>
   </div>
   <div id="memberRankDiv" style="position: absolute; top:970px; left: 70px;">
      <a href="#" id="memberRank" style="font-size: 20px;"></a>
   </div>
</body>
<script>

   idChk();
   function idChk() {
      var memberId = '<%=(String)session.getAttribute("loginId")%>';
      //var memberId = 'a1';
      
      var memberRank = 0;
      
      var urlIdx = 0;
      $.ajax({
         type:'get',
         url:'idChk',
         data:{'memberId':memberId},
         dataType:'JSON',
         success:function(data){
            console.log("여기까지옴?");
            console.log(data.memberInfo[0].mem_rank);
            memberRank = data.memberInfo[0].mem_rank;
            console.log(memberRank);
            if(memberRank > 0){
               $.ajax({
                  type:'get',
                  url:'memberRank1',
                  data:{'memberId':memberId},
                  dataType:'JSON',
                  success:function(data){
                     console.log(data.community_boardnum);
                     console.log("여기까지옴? memberRank1");
                     if(data.community_boardnum == 0){
                        $("#memberRank").text('등록').attr('href',"beautyTrendWriteForm?mem_id="+memberId);
                     }else{
                        urlIdx = data.memberRank[0].community_boardnum;
                        $("#memberRank").text('수정').attr('href', "beautyTrendUpdate?idx="+urlIdx);
                     }
                  },
                  error:function(e){
                     console.log(e);
                  }
               })
            }else{
               $("#memberRank").empty();
            }
         },
         error:function(e){
            console.log(e);
         }
      })
   }
   
   $("#koMap").on('change',function () {
      //alert('koMap 변경');
      $("#divA").empty();
      koMap = $(this).val();
      console.log(koMap);
      $.ajax({
         type:'get',
         url:'changeKoMap',
         data:{'changeKoMap':koMap},
         dataType:'JSON',
         success:function(data){
            console.log(data);
            //console.log(data.beautyTrendList);
            searchKoMap(data.beautyTrendList);
            //console.log("확인아아아아아아"+data.beautyTrendList[0].community_boardnum);
         },
         error:function(e){
            
         }
      })
   })
   /* contentImg += "<img alt='' src='"+imgChk[i].replyphoto_path+imgChk[i].replyphoto_newname+"' style='width: 150px; height: 150px;'/>" */
   function searchKoMap(list) {
      var content = "";
      console.log("여기까지는 옴?");
      console.log(list);
      for(var i = 0; i < list.length; i++){
         var date = new Date(list[i].community_date);
         console.log(list[i].community_boardnum);
         var idx = list[i].community_boardnum;
         //<a href="beautyTrendDetail?idx=${TrendListInfo.community_boardnum }">
         content += '<a href="beautyTrendDetail?idx='+idx+'">';
         content += '<div style="float: left; width: 33%;">';
         content += '<img src="resources/trend/'+list[i].bphoto_newname+'" width="350px" height="350px" style="padding-left: 70px"/>';
         content += '<p style="margin-left: 70px; font-size: 17px;">'+list[i].busin_name+'</p><p style="margin-left: 70px; margin-top: -15px;">'+date.getFullYear()+"-"
            +("0"+(date.getMonth()+1)).slice(-2)+"-"
            +("0" + date.getDate()).slice(-2)+'</p>';
         content += '<p style="margin-left: 70px; margin-top: -15px; font-size: 15px;">'+list[i].community_sub+'</p>';
         content += '</div>';
         content +="</a>";
      }
      //$(".orgDiv").empty();
      $("#divA").append(content);
   }
</script>
</html>













































































































































